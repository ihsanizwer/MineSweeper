#!/usr/bin/perl
use warnings;

my $choice = $ARGV[0];


if($choice eq "-r"){
	print "Using IP List in minesweeper.cfg file\n";
}
else{
	
	system("clear");
	system("cat ./header");
	print "\n-----------------------------------------------------------------\n";
	print "Minesweeper Usage Insructions.\n";
	print "-----------------------------------------------------------------\n\n";
	
		if(isValidIP($choice)){
			print "\n-----------------------------------------------------------------\n";
			print "Performing Pingsweep on $choice \n";
			print "-----------------------------------------------------------------\n";
			pingsweep($choice);
		}
	else{
			system("clear");
			print "Invalid IP Address specified.\n";
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
	my $target = $_;
	my @octet = split(/./,$target);	

	return (($octet[0] >= 0 && $octet[0] < 255) && ($octet[1] >= 0 && $octet[1] < 255) && ($octet[2] >= 0 && $octet[2] < 255) && ($octet[3] >= 0 && $octet[3] < 255));
}

sub pingsweep(){
	
	my $target = $_;
	my @octet = split(/./,$target);

	if($octet[3]!=0){

		system("sh pac $target");
	}
	else{

		if($octet[0] < 127){

		}
		elsif($octet[0] < 192){

		}
		elsif($octet[0] < 224){

		}
		else{

		}
	}

}