# IPtables and Netfilter
`iptables` is a program that allows configuration of the 
routing tables managed by the kernel.

`netfilter` allows us to set callback functions to be called whenever
a packet passes through the respective hook in the network stack.

iptables have some elements in common:
1. **Tables**, which join similar actions together.
2. **Chains**, which are rules for joining together similar packets.
3. **Rules**, Once the packet is matched, specifies something to do (block the packet or forward...)
4. **Targets**, which are a decision regarding what to do with the packet.

Tables allow us to implement NAT functionality or add some other tag on the 
packets for load balancing.

An example of a callback function could look like:
```shell
iptables -A INPUT -t filter -s 140.114.0.0/16 -j DROP
```
Any packet coming in from the IP address above will be dropped.
Since we can perform source NAT on any outgoing packet using the 
iptables utility, we can put our router's IP on every outgoing
packet.

There are two ways:
1. **SNAT**: The router changes the IP in the packet with its own static IP.
This can be done quite quickly.
2. **MASQUERADE**: This method will instead be assigned an interface, 
and every IP address that goes out that interface will be assigned that 
interface's IP address.
For example, every packet going out of `r1-eth0` will be assigned `eth0`'s 
IP address.

MASQUERADE is slower than SNAT because it has to consult the IP address it will
use every time a packet comes in.
**Netfilter** allows us to introduce handlers in the code.
This can extend the functionality of the iptables software.

## Hooking
Hooking refers to extending the original code via function calls, 
however we do not alter the original code.
We can set functions to execute every time, or pass messages between 
the hook points.

In netfilter, there are a couple of default hooks, such as when the packet
comes in, or whether the packet will be used for a local process or 
just forwarded out.

In Linux, incoming packets will be put in the **ring buffer**(sk\_buff),
and then will be sent up the kernel network stack up to the local 
process which will use the packet. 
