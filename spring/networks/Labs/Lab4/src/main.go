package main
import (
	"github.com/google/gopacket"
	"github.com/google/gopacket/pcap"
	"fmt"
)
func main(){
	devices, err := pcap.FindAllDevs()
	fmt.Printf("Hello World")
}
