#!/usr/bin/perl
use warnings;


my $choice = $ARGV[0];

system("clear");
system("cat ./header");

if($choice eq "-r"){

	print "\nUsing IP List in minesweeper.cfg file\n";
	open(IP, "<minesweeper.cfg") or die("Could not open minesweeper.cfg");
	while(<IP>){
		chomp($_);
		if(isValidIP($_)){
			print "\n-----------------------------------------------------------------\n";
			print "Performing Pingsweep on $_ \n";
			print "-----------------------------------------------------------------\n";
			pingsweep($_);
		}
		else{
			print "Invalid IP detected : $_ skipping...\n";
		}
	}
	close(IP);
}
else{
		
	if(isValidIP($choice)){
			print "\n-----------------------------------------------------------------\n";
			print "Performing Pingsweep on $choice \n";
			print "-----------------------------------------------------------------\n";
			pingsweep($choice);
		}

	else{
			system("clear");
			system("cat ./header");
			print "\n-----------------------------------------------------------------\n";
			print "Minesweeper Usage Insructions.\n";
			print "-----------------------------------------------------------------\n\n";
			print "Invalid IP Address specified.\n\n";
			print "You can use Minesweeper in one of the following ways : \n\n";
			print "Method 1 : \n";
			print "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
			print "./minesweeper <IP address of network/host to be scanned> \n";
			print "Example: ./minesweeper.pl 192.168.10.0\n\n";
	
			print "Method 2 : \n";
			print "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
			print "List all required network addresses/ host IP addresses required\n";	
			print "in the minesweeper.cfg file seperated by a new line and run the\n";
			print "script with the -r flag\n";
			print "Example : ./minesweeper.pl -r\n\n";
		}


}

sub isValidIP(){

	my $target = $_[0];
	if(!($target)){
		return 0;
	}
	my @octet = split(/\./,$target);

	if(!($octet[0] =~ /^\d+$/ || $octet[1] =~ /^\d+$/ || $octet[2] =~ /^\d+$/ || $octet[3] =~ /^\d+$/)){
		return 0;
	}

	return (($octet[0] >= 0 && $octet[0] < 255) && ($octet[1] >= 0 && $octet[1] < 255) && ($octet[2] >= 0 && $octet[2] < 255) && ($octet[3] >= 0 && $octet[3] < 255));
}

sub pingsweep(){
	
	my $target = $_[0];
	my @octet = split(/\./,$target);

	if($octet[3]!=0){

		system("sh pac $target");
	}
	else{

		if($octet[0] < 127){
			for($i = 0; $i < 256; $i = $i + 1){
				for($j = 0; $j < 256; $j = $j + 1){
					for($k =1; $k < 256; $k = $k + 1){
						$temp_a = $octet[0].".".$i.".".$j.".".$k;
						system("sh pac $temp_a");
					}
				}
			}
		}
		elsif($octet[0] < 192){
			for($p = 0; $p < 256; $p = $p + 1){
				for($q = 1; $q < 256; $q = $q + 1){
					$temp_b = $octet[0].".".$octet[1].".".$p.".".$q;
					system("sh pac $temp_b");
				}
			}
		}
		elsif($octet[0] < 224){
			for($x = 1; $x < 224; $x = $x + 1){
				$temp_c = $octet[0].".".$octet[1].".".$octet[2].".".$x;
				system("sh pac $temp_c");
			}
		}
		else{
			for($y = 224; $y < 240; $y = $y + 1){
				$temp_d = $octet[0].".".$octet[1].".".$octet[2].".".$y;
				system("sh pac $temp_d");
			}
		}
	}

}