use 5.14.0;
package Plann::Hash::LSH;
use true;
use Mouse;
use Smart::Args;

use Plann::Subtypes;
use Math::MatrixReal;
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

C<< $lsh->matrix() >>: L<Math::MatrixReal>

=cut

has 'matrix' => (
    is => 'ro',
    isa => 'Matrix',
    coerce => 1,
    required => 1,
);

=head2 Instance Methods

=head3 hash

Generate a hash matrix using Locality-Sensitive Hashing algorithm.

C<< $lsh->hash($matrix) >> :L<Math::MtrixReal>

=head4 Parameters

=over 4

=item $matrix: L<Matrix|Plann::Subype/Matrix>

The matrix. Column dimension must be equal to random matrix's row dimension.

=back

=cut

sub hash {
    args_pos my $self,
             my $matrix => {isa => 'Matrix', coerce => 1};

    ($matrix * $self->matrix)->each(sub{ $_[0] > 0 ? 1 : 0 });
}

=head2 Class Methods

=head3 random_matrix

Generate a new matrix that initialized by the normal distribution.

C<< Plann::Hash::LSH->random_matrix($rows, $cols) >>: L<Math::MatrixReal>

=head4 Parameters

=over

=item $rows: Int

The row dimension.

=item $cols: Int

The column dimension.

=back

=cut

sub random_matrix {
    args_pos my $class => 'ClassName', 
             my $rows => 'Int',
             my $cols => 'Int';

    my $matrix = [];
    for my $i (0..$rows-1) {
        push $matrix, [];
        for my $j (0..$cols-1) {
            $matrix->[$i]->[$j] = _random_normal();
        }
    }
    Math::MatrixReal->new_from_rows($matrix);
}

sub _random_normal {
    sqrt(-2.0*log(rand()))*cos(2*pi*rand());
}
