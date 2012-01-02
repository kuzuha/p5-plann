use 5.14.0;
package Plann::ANN::Utils;
use true;

use Sub::Exporter -setup => {
    exports => [ qw/euclidean_distance/ ],
    groups  => { default => [ qw/euclidean_distance/ ] },
};

=head1 Interface

=head2 Functions

=head3 euclidean_distance

Calculate Euclidean distance.

C<euclidean_distance($from, $to)>: Num

=head4 Parameters

=over

=item $from: ArrayRef[Num]

The vector.

=item $to: ArrayRef[Num]

The vector.

=back

=cut

sub euclidean_distance {
    my ($from, $to) = @_;

    my $distance = 0;
    for my $i (keys $from) {
        my $diff = $from->[$i] - $to->[$i];
        $distance += $diff * $diff;
    }
    sqrt $distance;
}
