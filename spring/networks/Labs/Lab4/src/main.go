package main
import (
	"fmt"
	//"github.com/google/gopacket"
	"github.com/google/gopacket/pcap"
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
	fmt.Println("Devices found:")
	var i,index int
	for _, device := range devices{
		fmt.Printf("\t%d: %s\n", i, device.Name)
		i += 1

	}
	fmt.Printf("Number of interface to use(e.g. 2): ")
	fmt.Scanf("%d", &index)
	fmt.Printf("\nScanning: %s\n", devices[index].Name)
}

