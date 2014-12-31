package Scrapinghub::Request;

use Moo;

has 'type' => (
    is          => 'ro',
    required    => 1,
);

sub BUILD {
   my $self = shift;

   require Moo::Role;
   my $role = __PACKAGE__ . '::' . ucfirst($self->type);
   Moo::Role->apply_roles_to_object($self, $role );
};

__PACKAGE__->meta->make_immutable;