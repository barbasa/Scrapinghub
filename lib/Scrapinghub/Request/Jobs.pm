package Scrapinghub::Request::Jobs;

use Moo::Role;

requires 'type';

has 'uri' => (
	is 		=> 'ro',
	default => sub {'jobs/list.json'},
);

__PACKAGE__->meta->make_immutable;