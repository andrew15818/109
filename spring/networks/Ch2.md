# Network Address Translation, Port Forwarding, Hole Punching
There are not nearly as many IP addresses as we might need,
so how can we manage with lower amount of them? 

In the olden days, there were classes of IP addresses based on the 
length of the Network ID. 
However, this would lead to great waste in the number of addresses
since they could only be allocated wholesale, meaning that if you 
needed >256 network addresses, the next amount you could get would
be 65,000+.
This lead to wasteful addresses that maybe did not need that much.
**Classless Inter Domain Routing** (CIDR) could assign variable 
length network IDs and subnet masks.

The long-term solution to IP address shortage is to use IPV6, 
since it has 128 bit addresses.

## Private IP addresses

Within a small local network, when a global address is not required,
**private addresses** are usually used. These addresses are not 
unique.
Some of the common ones are:
1. 10.0.0.0 - 10.255.255.255,  8 bits NWID
2. 172.16.0.0 - 172.31.0.0,  12 bits NWID
3. 192.160.0.0 - 192.168.255.255, 16 bits NWID
Since these addresses are not globally unique, they cannot be
transmitted over the global internet, instead they need to be
translated into a global address.

## Network Address Translation
The reason why this is even possible is **Network Address Translation**,
or when the router will assign every connected host a **local address**,
and route all the incoming information using its own IP.

So when the packets reach the router, it can look up its local 
table which host needs to receive the packet.
There is a mapping going on in the router between the private 
address used by a host on the network and the address with which 
the packet is sent out to the global internet.
This means that a single address on the router can service multiple
addresses of the hosts inside.


Devices on this network are not directly addressable.
The router will rewrite the destination IP address in the 
outgoing packet, and keep a table recording which address belongs to whom.

This helps mitigate the effects of the IP address shortage, since there's
a one-to-many mapping, and can help with load-balancing for reliability.
**Dynamic NAT** can provide a static one-to-one translation between
router and hosts.

## NAT Overloading
This is usually the thing we want, where we can map multiple
addresses to each other.
The router also has to keep track of the port number of each packet
in its routing table.
From what I understand, the port number is usually left alone, 
but when there is a name clash the source port number also has to 
be translated by the router.
Although I don't understand how a private IP is mapped to a global one
"via its port number"?
The NAT device (e.g. router) also overwrites the port number in the 
original packet before sending it out.

When we have an incoming packet, just replace the NAT address and 
the NAT port number with the original ones by looking in the 
NAT devices' translation table.

## Source NAT and Destination NAT
There are two approaches to letting a packet on the inside communicate
directly with a packet on the outside. 

**Source NAT**(SNAT) will change the address of the source port 
but keep the destination port the same.
This allows a host on the inside of a network to communicate with a
host outside.

**Destination NAT**(DNAT) changes the destination port changes.
This allows a host on the outside to directly communicate with a host
on the inside. 
Port forwarding refers mapping the IP and port number of a host on the 
network to only the port on the router.

Say an incoming packet has the destination address 140.113.86.92:25561,
then the router would look up which combination of IP and port number 
corresponds to port 25561 in *its own*(router's) mapping table.
This is commonly called **port forwarding**.

NAT allows up to 60,000 plus addresses in a single address by using
16 bit port number.
(Does this mean that each entry in the routers table has a unique 
IP adress, and the decision of which host to send it is based on port
number first?)

Although NAT can save many addresses (will somebody think of the addresses!)
there are still some issues:
- External hosts can't communicate directly to one behind a NAT (so use port forwarding?)

How does a host behind a NAT know the address of a host in another NAT?

**NAT Traversal Problem**
When the two hosts are behind NATs, how do they know each other's address?
NATs might sometimes be picky about which packets are allowed in the network,
which might make it hard for two hidden hosts to talk.

We can use port forwarding so that the same port number shows up in the router
as it does in the incoming packet. Otherwise TCP could not discern which 
internal host the packet really needed to reach.

We might wish to reuse the same address for multiple sessions to the same
destination IP. Or, we might wish to use a unique address for each different address.

## NAT Filtering
This refers to the types of packets that are let into the network.
Three types:
1. Endpoint-Independent: Let packets from any transport address 
into the network.
2. Address Dependent: Only allow packets from addresses the host has communicated
to before(how to add new ones? Does the internal host have to initiate with that external host?)
3. Address and Port Independent: Only allow the specific combination of address
and port that we've communicated with. (similar to 2)

## Types of NAT
### Cone
In a cone nat, the internal address and port number are mapped to an external
address and port number on the router. 
Then, for any outgoing connection, the same eAddr and ePort combination will be used.
Can also have the types of filtering described above: endpoint independent, address dependent
(internal client has to first start conversation), and address and router dependent.

### Symmetric NAT
This type of NAT creates a unique eAddr:ePort combination for every outgoing
connection from the same iAddr:iPort.
This is typically used with address and port restricting.

## Hairpin (Loopback) Translation
This refers to having two hosts on the same network communicate using their
external addresses.
The steps go as follows:
H1 will send a message using rAddr:rPort to the router, and the router will look
through its own devices for the mapped iAddr corresponding to iPort.
Basically use an eAddr:ePort but instead of sending out to the greater
internet, we send it to another of the NAT's iAddr:iPort.

What if we have multiple layers of NAT servers on a local network?
We could still perform hairpin translation, but we would need the **outermost NAT**
router to forward the packet between two hosts.

## Hole Punching
Hole punching, similar to port forwarding, is intended to allow two hosts 
to communicate directly, such as in P2P communications.
There are several methods:

## STUN
This is a protocol used to find the address of the closest NAT server.
From what I remember, we require an external server to locate for our NAT address.
We send a *binding request* to the STUN server, and it responds with the 
IP address and port number that the server knows. 
This means that we can quickly know the address that was assigned to us
by the NAT server.
However, this does not work when using symmetric NAT.
## Traversal Using Relays around NAT
This uses another **relay server** to allow two hosts to communicate with 
each other.
We have to send the request for resource allocation to a TURN server whenever
we don't have access to STUN.
The server will allocate resources and create a tunnel to allow us to
communicate with another peer.
## Interactive Connectivity Establishment
This is the general protocol for hosts to communicate with other hosts behind
a NAT.
This protocol makes use of TURN and STUN, as well as a signaling server.
It assumes that we can connect to the TURN and signaling server.
The idea is to have hosts discover more about hte network topology in order
to directly send packets to hosts on the other side of the Internet.

First, we attempt to use STUN to discover our public IP address.
If one of the other hosts is using Symmetric NAT, we would have to 
use TURN, and use that server as an in-between point to communicate with the 
other host.

## TCP NAT Traversal
Traversing TCP is more difficult than with UDP, since TCP requires maintaining
a state for opening connections.
Because of this, TCP NAT traversal might result in silently dropped packages,
or reset or ICMP Host Unreachable message.

If we send a SYNC message with a certain TTL, we would need to make sure that 
we would need to avoid receiving a RST message before receiving a positive ack.

## IP Spoofing
If we set a SYNC with low TTL, and it arrives at an intermediate server, 
we can change the address of the packet to the destination server.
