use WWW::Mechanize;
use WWW::Mechanize::Image;
print "Starting up...\n";
use strict;
my ($NUM,$URL,$m,$dir,$image,$undefcount);
my $dir = $ENV{HOME};
my $undefcount = 0;
mkdir "$dir/Cah/";
my $m = WWW::Mechanize->new();
foreach my $NUM (1..49,51..100000) {
	my $URL="http://explosm.com/comics/$NUM/";
	print "Loading #$NUM\n";
	unless($m->get($URL)){
		warn "Error...\n";
	}
	my $image = $m->find_image( url_regex => qr/comics/i);
	if (defined $image){
		$m->get( $image->url() );
		print "Saving...\n";
		$m->save_content("$dir/CaH/$NUM.png");
		my $undefcount = 0;
	}
	else {
		print "Skipping...\n";
		my $undefcount = $undefcount + 1;
		if ($undefcount gt 10){
			print "Looks like the archive is over... you may want to check anyways though.....\n";
			exit;
		}
	}
}
