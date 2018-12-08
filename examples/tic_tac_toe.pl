#!/usr/bin/perl

use strict;
use warnings;

use Moose::Autobox;
use Moose::Autobox::Undef;

sub print_board {
    my ($b) = @_;
    my $count = 0;
    $b->map(sub {
        print("$_ \t");
        print("\n") unless ((++$count) % 3);
    });
}

my $board = [ ('.') x 9 ];

print_board($board);

my $choice = [ 1 .. 9 ]->any;

my $player = 'X';
while ($board->any eq '.') {

    INPUT: {
        print("Player ($player), enter the Position [1-9]: ");
        my $in = <>;

        unless ($in == $choice) {
            print "\n\tPlease enter a value within 1-9\n\n";
            redo INPUT;
        }

        my $idx = $in - 1;
        if ($board->[$idx] ne '.') {
            print "\n\tElement already entered at $in\n";
            redo INPUT;
        }

        $board->[$idx] = $player;
    }

    print_board($board);

    [
        [ 0, 1, 2 ], [ 3, 4, 5 ], [ 6, 7, 8 ],
        [ 0, 3, 6 ], [ 1, 4, 7 ], [ 2, 5, 8 ],
        [ 0, 4, 8 ], [ 2, 4, 6 ],
    ]->map(sub {

        my $row = $board->slice($_);

        if (($row->all eq 'X') || ($row->all eq 'O')) {
            print("\n\tPlayer ($player) Wins\n");
            exit;
        }

    });

    $player = $player eq 'X' ? 'O' : 'X';
}

# PODNAME: tic_tac_toe.pl
# ABSTRACT: Tic-Tac-Toe
__END__

=pod

=for :header
=for stopwords mkirank Tic Tac

=head1 DESCRIPTION

This is a Moose::Autobox port of a perl6 implementation
of the classic Tic-Tac-Toe game.

This uses a modified version of the one Rob Kinyon created
L<http://www.perlmonks.org/index.pl?node_id=451302>.

=head1 ACKNOWLEDGEMENTS

This code was ported from the version in the Pugs examples/
directory. The authors of that were:

:for list
* mkirank L<http://www.perlmonks.org/index.pl?node_id=451261>
* Rob Kinyon L<http://www.perlmonks.org/index.pl?node_id=451302>
* Stevan Little, E<lt>stevan@iinteractive.comE<gt>
* Audrey Tang

=cut
