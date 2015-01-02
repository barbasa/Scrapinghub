package Scrapinghub::Client;

use Moo;

use Encode qw(encode);
use URI;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Headers;

use Scrapinghub::Request;

our $VERSION = '0.01';

has 'url' => (
    is      => 'ro',
    default => sub { URI->new( 'https://storage.scrapinghub.com/' ) }
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

has 'last_request' => (
    is          => 'rw',
);

has 'last_response' => (
    is          => 'rw',
);

sub BUILD {
      my $self = shift;

      unless ( $self->api_key ) {
          die 'No API key set in the constructor or in the environment variable SH_APIKEY';
      }
 }

sub make_request {
    my ($self, $args) = @_;

    my $req  = Scrapinghub::Request->new( type => $args->{type} );
    $self->last_request($req);

    my $resp = $self->_send_request();
    $self->last_response($resp);
};

sub _send_request {
    my ($self, ) = @_;

    my $base_url = $self->url . $self->last_request->endpoint;
    my $url_params = $self->last_request->build_url();

    my $req = HTTP::Request->new(GET => $url );
    $req->authorization_basic( $self->api_key, "" );
    $req->header('Accept' => 'application/json');

    return $self->agent->request($req);
}

 __PACKAGE__->meta->make_immutable;

=head1 NAME

Scrapinghub - Module to interface with the ScrapingHub webservice

=head1 SYNOPSIS

    my $sh = Scrapinghub::Client->new;


=head1 DESCRIPTION

=cut