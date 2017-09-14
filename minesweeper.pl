#!/usr/bin/perl
use warnings;

my $choice = $ARGV[0];


if($choice eq "-r"){
	print "Using IP List in minesweeper.cfg file\n";
}
elsif($choice eq "hello"){
	print "Performing Pingsweep on $choice \n";
}
else{
	#Insert ASCII art at beginning.
	system(clear);
	print "-----------------------------------------------------------------\n";
	print "Minesweeper Usage Insructions.\n";
	print "-----------------------------------------------------------------\n\n";
	
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


sub pingsweep(){
	#Insert ASCII art at beginning.
	my $target = $_;
	my @octet = split(/./,$target);

	

	if($octet[3]!=0){

		system(./pac, $target);
	}
	else{

	}

}