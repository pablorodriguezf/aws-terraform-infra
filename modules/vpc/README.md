# terraform-aws-vpc 

This module creates all the resources of Amazon VPC.


### Description
The VPC module allows us to launch AWS resources in a virtual network, elements that make it up:
    - Private and public subnet
    - Internet gateway
    - Nat
	- Tables of routes associated with private and public subnets
	- Acls
	- Elastic IPs associated with NAT

**When this module is executed, the following resources will be created:**

    1 VPC
    9 Subnets
    9 NAT
	9 Route tables
	9 Internet gateway
	9 NAT
	9 Acls
	9 Elastic IPs
    
**Resource dependency:**

    Subnets privates and publics IDs with Route tables, Internet gateway
    Elastic IP with NAT  
 

