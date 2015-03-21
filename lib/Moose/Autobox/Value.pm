package Moose::Autobox::Value;
# ABSTRACT: Moose::Autobox::Value - the Value role
use Moose::Role 'with';
use namespace::autoclean;

our $VERSION = '0.16';

with 'Moose::Autobox::Defined';

sub do {
    my ($self, $block) = @_;
    local $_ = $self;
    $block->($self);
}

1;
__END__

=pod

=head1 SYNOPSIS

  use Moose::Autobox;

  # execute a sub on the value
  print 10->do(sub { $_ * $_ }); # prints 100

=head1 DESCRIPTION

This is a role to describes a defined (non-reference) Perl value.

=head1 METHODS

=over 4

=item C<meta>

=item C<do (\&block)>

=back

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=cut
