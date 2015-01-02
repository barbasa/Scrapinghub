use strict;
use warnings;

use Test::More;
use Test::Exception;

use Scrapinghub::Request;

BEGIN { use_ok('Scrapinghub::Client') };

subtest 'basic' => sub {

    lives_ok( sub { Scrapinghub::Client->new( api_key => 'ANYKEY', project_id => 123 ) }, 'expecting to live' );
    dies_ok ( sub { Scrapinghub::Client->new() }, 'expecting to die' );
    #TODO: Need to check some more basic stuff

};

subtest 'request' => sub {
	my $sh = Scrapinghub::Client->new( api_key => 'ANYKEY', project_id => 123 );
	my $req = Scrapinghub::Request->new( type => 'jobs');
	ok(1);
};

done_testing();