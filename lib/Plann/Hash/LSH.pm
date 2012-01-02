use 5.14.0;
package Plann::Hash::LSH;
use true;
use Mouse;
use Smart::Args;

use Sub::Exporter -setup => {
    exports => [ qw/random_matrix/ ],
    groups  => { default => [ qw/random_matrix/ ] },
};

use Plann::Subtypes;
use Plann::Matrix;
use Math::Trig qw( pi );

=head1 Interface

=head2 Constructors

=head3 new

Create a new Plann::HASH::LSH object with random matrix.

C<< Plann::Hash::LSH->new(matrix => $random_matrix) :Plann::Hash::LSH >>

=head4 Parameters

=over

=item $random_matrix: L<Matrix|Plann::Subtype/Matrix>

The matrix that initialized by the normal distribution.

=back

=head2 Accessors

=head3 matrix

Get matrix that constructed.

C<< $lsh->matrix() >>: L<Plann::Matrix>

=cut

has 'matrix' => (
    is       => 'ro',
    isa      => 'Matrix',
    coerce   => 1,
    required => 1,
);

=head2 Instance Methods

=head3 hash

Generate a hash matrix using Locality-Sensitive Hashing algorithm.

C<< $lsh->hash($matrix) >> :L<Plann::Mtrix>

=head4 Parameters

=over 4

=item $matrix: L<Matrix|Plann::Subype/Matrix>

The matrix. Column dimension must be equal to random matrix's row dimension.

=back

=cut

sub hash {
    args_pos my $self,
             my $matrix => { isa => 'Matrix', coerce => 1 };

    ($matrix * $self->matrix)->each(sub{ $_[0] > 0 ? 1 : 0 });
}

=head2 Functions

=head3 random_matrix

Generate a new matrix that initialized by the normal distribution.

C<random_matrix($rows, $cols)>: L<Plann::Matrix>

=head4 Parameters

=over

=item $rows: Int

The row dimension.

=item $cols: Int

The column dimension.

=back

=cut

sub random_matrix {
    args_pos my $rows  => 'Int',
             my $cols  => 'Int';

    Plann::Matrix->new($rows, $cols)->each(sub { _random_normal() });
}

sub _random_normal {
    sqrt(-2.0*log(rand()))*cos(2*pi*rand());
}
