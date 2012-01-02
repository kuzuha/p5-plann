use 5.14.0;
package Plann::ANN::BruteForce;
use true;
use Mouse;

use Plann::ANN::Utils;

with 'Plann::Role::ANN';

=head1 Interface

=head2 Constructors

=head3 new

Create a new Plann::ANN::BruteForce object.

=head4 Parameters

...

=cut

has 'entries' => (
    traits   => ['Array'],
    is       => 'ro',
    isa      => 'ArrayRef[Plann::ANN::Entry]',
    default  => sub { [] },
    handles => { _train => 'push' },
);

=head2 Instance Methods

=head3 train

...

=cut

sub train { shift->_train(@_) }

=head3 search

...

=cut

sub search {
    my $self = shift;
    my ($matrix, $options) = @_;

    my $res = [];
    for my $entry (values $self->entries) {
        my $distance = euclidean_distance($entry->vector->array_ref, $matrix->array_ref);

        next if $options->{threshold} && $distance > $options->{threshold};
        push $res, {
            distance => $distance,
            entry    => $entry,
        };
    }
    [sort { $a->{distance} <=> $b->{distance} } @$res];
}
