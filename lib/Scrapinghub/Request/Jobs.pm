package Scrapinghub::Request::Jobs;

use Moo::Role;

requires 'type';

has 'endpoint' => (
    is      => 'ro',
    default => sub {'jobs/list.json'},
);

sub do {
    # Stub function
    return 1;
}

__PACKAGE__->meta->make_immutable;