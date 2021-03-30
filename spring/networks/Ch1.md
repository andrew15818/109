## Incoming Packet Demultiplexing
Refers to peeling one packet frame at a time
unitl we reach the application it was inteded to.
Comes from the ethernet driver and moves up the network stack.

**Routers** operate in the network layer, where **switches** operate 
on the link layer. These are both store and forward, which means that they
will first receive the entire packet and then forward the result to the 
next hop in the sequence. Switches will learn the forwarding 
via algorihtms and flooding.

## Layer 2 Switching
Two hosts on the same LAN can communicate directly.
For WANs, need to send through routers and switches.

## MAC Addresses
On the same physical network, the MAC protocol ensures the delivery of frames.
48 bits per address.
These addresses are all unique on a LAN, since the router would have to forward
frames to that specific device from the network.
The address is also static, burned in to the system ROM.


## Ethernet 
Switches operate on the Link layer, which connects devices on a local network.
These will only use the MAC address to send the ehternet frame to the 
appropriate outgoing interface.

How does the forwarding table get created? **MAC Learning**
At first the list is empty since we have not sent any packets.
If we receive a destination address that we have not seen before, we have to 
update the table with the information we have just found.
First, we have to flood if we have not seen the interface we want to send the 
packet to,  every time we have an address that is not in the table.

If the entry is found for the destination, check that the desitnation is still
on the same segment (?).
Layer 2 forwarding has some pros, for example the physical redundancy provided
by having multiple paths that lead to the destination. 
However, there are also some drawbacks in that some broadcast messages may end up 
being repeated endlessly. 
The end station may end up receiving multiple copies of the unicast frames.

## IP forwarding
The IP layer has as its main function **routing** and **forwarding**.
Routing means finding the best path from the current stop to the destination.
Forwarding means moving the packet from the input of the router/switch to the
output.

We use the **longest prefix matching** approach to select an interface to send the 
packet.
This lets us know that we are getting closer to the destination, we look at this
in the forwarding table.

The Internet Protocol is a connectionless protocol in charge of sending 
packets to the appropriate destination.
The **interface** refers to the connection between an output of a certain 
machine and the input of another machine.
*Hosts* usually have a small number of interfaces, whereas routers typically 
have many more interfaces.
This means that a host (e.g. a PC) typically only has one output for internet
data, and thus is likely to have only one IP address.

## Sub-Networks (subnets)
The IP address uniquely identifies a user of the internet. 
An IP address consists of two parts, the **network ID** and the 
**host ID**. The network ID consists of the network in which the host is
physically found, whereas the host ID refers to the device within that network.

Two devices with the same subnet (network ID) can reach each other without 
first going through a router (since they can just use MAC addresses?)
Consider the address 
```
140.113.1.0/24
```
The first *24* bits indicates the network address, and the remaining 8 bits 
in this example represent the host ID of the device on that network.
Thus there are 255 possible devices on that specific network.

## IP Classes
The entire range of possible IP addresses (255^4), are divided into five 
classes depnding on their network/host ID config.
Class A refers to the addresses with 8 bits of network ID. This means that there
are only 224 - 2 possible networks of this type.

Class B are used for addresses with 16 bits of network ID. These are typically
used for large-area-networks, since they contain a large possible number of 
hosts connected.

Class C is used mostly for Local-Area-Networks, where the number of hosts are
limited, and there are 24 bits in the network ID.

The subnet can then be of an arbitrary length really, and we can continue to 
split the network into many smaller subnets.
How do we determine the network ID? We use the subnet mask, which we bitwise
AND with the IP address.

## Routing Table Techniques
Each host or router has a routing table, which tells it how to where to 
send incoming packets depending on the destination address.

To minimize the size of the routing table, we can use only **next-hop routing**,
where the router only knows the address of the other routers it's 
connected to rather than the entire route.(this would require knowing the 
entire network topology right?)

We could also use **Network-Specific routing**, in which we only keep 
the network ID part and not the host ID.

The **default gateway** or **default route** is the address of the router
that we use when we cannot find a suitable address from the routing table.

**Longest Prefix Matching** involves sending the message to the next
router based on how many values of the destination address match with those 
entries we have in our table.
Sometimes we would just have to look at the bit values to know what's really
going on. The dotted decimal notation is sometimes confusing as to why
they're longest matching.

As we saw in lab 1, for forwarding on the same local network, we would just need
the MAC address of the destination device which we can obtain with 
an ARP message.

When we send a message, as we move down the protocol stack, we **encapsulate** the
packet by wrapping it up in many layers of information for each layer. 
- Application Layer: Data
- TCP: Segment
- IP: Datagram
- Ethernet: Frame

The **Address Resolution Protocol** or ARP matches an IP address to a MAC address
on the same network. So if we know the IP address of the destination we can send
an ARP broadcast message to find the MAC address of the destination. 

Suppose the command
```shell
ftp b
```
what happens could go something like:
1. Find the IP address  of b, maybe with the help of a *resolver*(Where is that?)
2. Then pass it to the Transport layer for TCP to handle.
3. In the Internet layer, we send an ARP request message (or broadcast?). 
When the message reaches b, it will reply with its MAC address.
4. Profit.

A's ARP request contains A's IP and MAC address, and B  returns its MAC Address.

## Dynamic Host Configuration Protocol
Protocol to dynamically assign IP addresses to hosts.
We have to send a request message to request an available address.
We use ports 67 and 68(noice).

The **Internet Control Message Protocol** is an error-diagnosing protocol
designed to indicate whether a message was delivered correctly or not.

The `traceroute` program will attempt and send a message with a TTL of 1,
and increase it while it cannot reach the end destination.
