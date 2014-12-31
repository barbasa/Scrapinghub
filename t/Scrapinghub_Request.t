use strict;
use warnings;

use Test::More;

BEGIN { use_ok('Scrapinghub::Request') };

subtest 'basics' => sub {

	my $req = Scrapinghub::Request->new( type => 'jobs');
	isa_ok	( $req, 'Scrapinghub::Request');
	ok		( $req->does('Scrapinghub::Request::Jobs'), 'Does the role Jobs' );

};


done_testing();