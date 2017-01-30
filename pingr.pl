# PingR - IP Scanner by Mark Beviz

use strict;
use Net::Ping;

my $usage = "Usage: perl $0 <ip/subnet mask> [timeout, protocol]\n";
print $usage and exit unless my $ip_data = shift;
my $timeout = shift || 2;
my $proto = shift || 'udp';
my @input_spl = split(/\//, $ip_data);
my $subnet_mask = $input_spl[1];
my @ip = split(/\./, $input_spl[0]);
my $subnet_bin = "hm";
sub calcBinary()
{
	my $subnet_bin = "";
	for (my $i = 1;	 $i < 33; $i++)
	{
		if ($subnet_mask >= $i)
		{
			$subnet_bin = $subnet_bin . "1";
		}
		else
		{
			$subnet_bin = $subnet_bin . "0";
		}

	}

	my $octet1 = sprintf("%08b",$ip[0]);
	my $octet2 = sprintf("%08b",$ip[1]);
	my $octet3 = sprintf("%08b",$ip[2]);
	my $octet4 = sprintf("%08b",$ip[3]);

	my $ip_bin = $octet1 . $octet2 . $octet3 . $octet4;

	return ($subnet_bin, $ip_bin);
}
(my $subnet_bin, my $ip_bin) = calcBinary();
sub calcRange()
{
	my $range_min = ($subnet_bin & $ip_bin);
	
}
print $subnet_bin . "\n" . $ip_bin . "\n";
#print("Running scan on $ip_data with $proto protocol and $timeout sec timeout...\n\n");


