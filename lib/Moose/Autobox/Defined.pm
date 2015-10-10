package Moose::Autobox::Defined;
# ABSTRACT: the Defined role
use Moo::Role 'with';
use namespace::autoclean;

our $VERSION = '0.16';

with 'Moose::Autobox::Item';

sub defined { 1 }

1;
__END__

=pod

=head1 SYNOPSIS

  use Moose::Autobox;

  my $x;
  $x->defined; # false

  $x = 10;
  $x->defined; # true

=head1 DESCRIPTION

This is a role to describes a defined value.

=head1 METHODS

=over 4

=item C<defined>

=back

=over 4

=item C<meta>

=back

=cut
