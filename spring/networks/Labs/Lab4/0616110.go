package main
import (
	"fmt"
	//"bufio"
	//"os"
	"github.com/google/gopacket"
	"github.com/google/gopacket/pcap"
	"github.com/google/gopacket/layers"
	"time"
	"log"
)
var (
	device string = "BRGr-eth1"
	err error
	snapshot_len int32 = 1024
	promiscuous	bool = false
	timeout time.Duration = 30 * time.Second
	handle *pcap.Handle
)
func main(){
	devices, err := pcap.FindAllDevs()
	if err != nil {
		log.Fatal(err)
	}
	BPFRule := "ip proto gre"
	fmt.Printf("BPF fitler to use: \n")

	var i,index int
	fmt.Println("Devices found:")

	for _, device := range devices{
		fmt.Printf("\t%d: %s\n", i, device.Name)
		i += 1

	}
	fmt.Printf("Number of interface to use(e.g. 2): ")
	fmt.Scanf("%d", &index)
	intName := devices[index].Name

	pcapHandle, err := pcap.OpenLive(intName, 1600, true, pcap.BlockForever)
	pcapHandle.SetBPFFilter(BPFRule)

	fmt.Printf("Listening on %s with rule \"%s\"...\n", intName, BPFRule)
	if err != nil{
		panic(err)
	}
	//err = pcapHandle.SetBPFFilter("gre")
	if err != nil{
		log.Fatal(err)
	}
	packetSource := gopacket.NewPacketSource(pcapHandle, pcapHandle.LinkType())
	var outgoing []byte
	//Loop through layers in packet
	for packet := range packetSource.Packets(){
			fmt.Println(packet)
			PrintPacketInfo(packet)
			if len(packet.Layers()) > 2{
				outgoing = Decapsulate(packet)
			}
			fmt.Printf("%x\n", packet)
	}
	outHandleName := "BRGr-eth1"
	outHandle, err := pcap.OpenLive(outHandleName, 1600, true, pcap.BlockForever)
	if err != nil{
		panic(err)
	}
	err = outHandle.WritePacketData(outgoing)
	if err != nil{
		fmt.Printf("Error Sending to %s\n", outHandleName)
	}

}
func PrintPacketInfo(packet gopacket.Packet){
	OuterEth := packet.Layer(layers.LayerTypeEthernet).(*layers.Ethernet)
	fmt.Printf("Outer Ethernet:")
	fmt.Printf("\tSrcMac: %x \t DstMAC: %x\n", OuterEth.SrcMAC, OuterEth.DstMAC)
	fmt.Printf("\tType: %x\n", OuterEth.EthernetType)

	IP:= packet.Layer(layers.LayerTypeIPv4).(*layers.IPv4)
	/*
	if err == true{
		fmt.Printf("No IP Layer\n")
		return
	}
	*/
	fmt.Printf("IPv4:")
	fmt.Printf("\tSrcIP: %x\t DstIP: %s\n", IP.SrcIP, IP.DstIP)
	
	Gre := packet.Layer(layers.LayerTypeGRE).(*layers.GRE)
	fmt.Printf("GRE: \n")
	/*
	if err != nil{
		fmt.Printf("No GRE, returning\n")
	}
	*/
	fmt.Println(Gre.Protocol)
	
	i := len(packet.Layers()) - 1
	var InnerEth *layers.Ethernet
	for i > 0{
		if(packet.Layers()[i].LayerType() == layers.LayerTypeEthernet){
			InnerEth= packet.Layers()[i].(*layers.Ethernet)
			/*
			if err != nil{
				fmt.Printf("No inner Ethernet\n")
				return
			}
			*/
			break
		}
		i--;
	}
	fmt.Printf("Inner Ethernet:\n")
	fmt.Printf("\tSrcMAC: %x\t DstMAC: %x\n", InnerEth.SrcMAC, InnerEth.DstMAC)

}
// Print the info for each layer of the packet
func Decapsulate(packet gopacket.Packet)[]byte{
	i := len(packet.Layers())
	ethPacket := packet.Layers()[i-2].(*layers.Ethernet)
	ArpPacket := packet.Layer(layers.LayerTypeARP).(*layers.ARP)
	IpPacket := packet.Layer(layers.LayerTypeIPv4).(*layers.IPv4)
	// Try and make the packet
	options := gopacket.SerializeOptions{}
	buffer := gopacket.NewSerializeBuffer()
	gopacket.SerializeLayers(buffer, options,
		ethPacket,
		IpPacket,
		ArpPacket,
	)
	//fmt.Println(ArpPacket)
	rawOut := buffer.Bytes()
	return rawOut
	/*
	for layer := range packet.Layers(){
		fmt.Printf("Layer %d: ", layer)
		CurrLayer := packet.Layers()[layer]
		if CurrLayer.LayerType() == layers.LayerTypeIPv4{
			//fmt.Printf("IP Layer\n")
			IpPacket := CurrLayer.(*layers.IPv4)
			fmt.Printf("\tIP Src: %s\n", IpPacket.SrcIP)
			//fmt.Printf("\tIP Dst: %s\n", IpPacket.DstIP)
		}
		if CurrLayer.LayerType() == layers.LayerTypeGRE{
			fmt.Printf("GRE Layer\n")
			GREPacket := CurrLayer.(*layers.GRE)
			fmt.Printf("\t%d\n", GREPacket.Flags)
		}
		if CurrLayer.LayerType() == layers.LayerTypeEthernet{
			fmt.Printf("Eth Layer\n")
			//EthPacket := CurrLayer.(*layers.Ethernet)
			//fmt.Printf()
		}
	
	}
	*/
}

