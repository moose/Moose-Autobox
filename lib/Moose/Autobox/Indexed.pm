package Moose::Autobox::Indexed;
# ABSTRACT: the Indexed role
use Moose::Role 'requires';
use namespace::autoclean;

our $VERSION = '0.17';

requires 'at';
requires 'put';
requires 'exists';
requires 'keys';
requires 'values';
requires 'kv';
requires 'slice';
requires qw(each each_key each_value each_n_values);

1;
__END__

=pod

=head1 DESCRIPTION

This is a role to describes an collection whose values can be
accessed by a key of some kind.

The role is entirely abstract, those which implement it must
supply all it's methods. Currently both L<Moose::Autobox::Array>
and L<Moose::Autobox::Hash> implement this role.

=head1 METHODS

=over 4

=item C<meta>

=back

=head1 REQUIRED METHODS

=over 4

=item C<at>

=item C<put>

=item C<exists>

=item C<keys>

=item C<values>

=item C<kv>

=item C<slice>

=item C<each>

=item C<each_key>

=item C<each_value>

=back

=cut
