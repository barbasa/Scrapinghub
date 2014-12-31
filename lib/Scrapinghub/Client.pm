package Scrapinghub::Client;

use Moo;

use Encode qw(encode);
use URI;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Headers;

# use Scrapinghub::Request;

our $VERSION = '0.01';

has 'url' => (
    is      => 'ro',
    default => sub { URI->new( 'https://storage.scrapinghub.com/items' ) }
);

has 'agent' => (
    is => 'ro',
    default => sub { LWP::UserAgent->new }
);

has 'api_key' => (
    is      => 'ro',
    default => sub { $ENV{SH_APIKEY} },
);

has 'project_id' => (
    is          => 'ro',
    required    => 1,
);

has 'request' => (
    is          => 'rw',
);

sub BUILD {
      my $self = shift;

      unless ( $self->api_key ) {
          die 'No API key set in the constructor or in the environment variable SH_APIKEY';
      }
 }

sub do {
    my $self = shift;

    $self->request->do();
};

 __PACKAGE__->meta->make_immutable;

=head1 NAME

Scrapinghub - Module to interface with the ScrapingHub webservice

=head1 SYNOPSIS

    my $sh = Scrapinghub::Client->new;


=head1 DESCRIPTION

=cut