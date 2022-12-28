####
Powershell script to compare a local list of IP addresses with private ip addresses of aws account

I incountered a problem by working with AWS that its not easy and also time consuming to finde out all Private Ip addresses,
as matter of fact even worse if u get a list of Ip addresses from example CISo or some other security governing body in your company, 
and you need to compare it with a list that was given to you.

It happend to me, I received a list of ip addresses which were detected by our security which needs to be added as ressources to our assets tool,
and not all ips are attached to ec2 instances and thats why they are not easy to finde out.

This script will compare your liost of private ips and spit out a csv file with match or not match.

####
Use

in the ip_address_list.tx add all ip addresse that you need to compare with.

Powershell script add the name of you aws local profile 

Mkae sure all powershell aws and ec2 module are installed 