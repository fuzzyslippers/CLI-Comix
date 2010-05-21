use WWW::Mechanize;
use WWW::Mechanize::Image;
print "Starting up...\n";
use strict;
my ($NUM,$URL,$m,$dir,$image,$undefcount);
my $dir = $ENV{HOME};
my $undefcount = 0;
my $m = WWW::Mechanize->new();
foreach my $NUM (1..403,405..100000) { #Excludes 404 because of a joke. Try www.xkcd.com/404/
	my $URL="http://xkcd.com/$NUM";
	print "Loading #$NUM\n";
	$m->get($URL);
	my $image = $m->find_image( url_regex => qr/comics/i);
	if (defined $image){
		$m->get( $image->url() );
		print "Saving...\n";
		$m->save_content("$dir/XKCD/$NUM.png");
		my $undefcount = 0;
	}
	else {
		print "Skipping...\n";
		my $undefcount = my $undefcount + 1;
		if ($undefcount = 10){
			print "Looks like the archive is over... you may want to check anyways though.....\n";
			exit;
		}
	}
}
