#!/usr/bin/perl

use strict;
use warnings;

use Moose::Autobox;
use Moose::Autobox::Undef;

use autobox UNDEF => 'Moose::Autobox::Undef';

sub ARRAY::print_board {
    my ($b) = @_;
    my $count = 0;
    $b->map(sub {
        print("$_ \t");
        print("\n") unless ((++$count) % 3);
    });
}

my $g = [ ('.') x 9 ];

$g->print_board();

my $players = { 'X' => 'Player 1', 'O' => 'Player 2' };

my $player_character = [ 'X', 'O' ]->any;

my $entered = {};
my $choice = [ 1 .. 9 ]->any;

my $player = 'X';
while ($g->all == '.') {
    
    INPUT: {
        print($players->{$player} . " Enter the Position [1-9]: ");
        my $in = <>;

        unless ($in == $choice) {
            print "\n\tPlease enter a value within 1-9\n\n";  
            redo INPUT;  
        }

        my $idx = $in - 1;
        if ($entered->exists($idx)) {
            print "\n\tElement already entered at $in\n";
            redo INPUT;
        }

        $g->[$idx] = $player;
        $entered->{$idx}++;
    }

    $g->print_board;
    
    [
        [ 0, 1, 2 ], [ 3, 4, 5 ], [ 6, 7, 8 ],
        [ 0, 3, 6 ], [ 1, 4, 7 ], [ 2, 5, 8 ],
        [ 0, 4, 8 ], [ 2, 4, 6 ],
    ]->map(sub {
        
        #my @row = @{$g}[$_->[0], $_->[1], $_->[2]];
        #my $row = \@row;
        #warn $row->dump;
        # FIX ME
        #(($row->all == 'X') || ($row->all == 'O'))&& warn "Wow, this worked";
        
        if ( ( $players->exists($g->[$_->[0]]) &&
               $players->exists($g->[$_->[1]]) &&
               $players->exists($g->[$_->[2]]) ) 
             &&
             ( ( $g->[$_->[0]] eq $g->[$_->[1]] ) && 
               ( $g->[$_->[1]] eq $g->[$_->[2]] ) ) ) 
        {
            print("\n\t$players->{$player} Wins\n");
            exit;
        }
    });

    $player = $player eq 'X' ? 'O' : 'X';
}


=pod

=head1 NAME

tic_tac_toe.p6 - Tic-Tac-Toe

=head1 DESCRIPTION

This is a Moose::Autobox port of a perl6 implementation 
of the classic Tic-Tac-Toe game.

This uses a modified version of the one Rob Kinyon created
L<http://www.perlmonks.org/index.pl?node_id=451302>. 

=head1 AUTHORS

mkirank L<http://www.perlmonks.org/index.pl?node_id=451261>

Rob Kinyon L<http://www.perlmonks.org/index.pl?node_id=451302>

Stevan Little, E<lt>stevan@iinteractive.comE<gt>

Audrey Tang

=cut

