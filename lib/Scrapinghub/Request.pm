package Scrapinghub::Request;

use Moo;

with 'MooX::Traits';

has 'type' => (
	is 			=> 'ro',
	required 	=> 1,
);


has '+_trait_namespace' => ( default => 'Scrapinghub::Request' );

__PACKAGE__->meta->make_immutable;