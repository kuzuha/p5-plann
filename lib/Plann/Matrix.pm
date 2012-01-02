use 5.14.0;
#ABSTRACT: A wrapper of Math::MatrixReal
package Plann::Matrix;
use true;

use parent 'Math::MatrixReal';

=head1 Interface

=head2 Instance Methods

=head3 dimension_rows

Return dimension of the row space.

C<< $matrix->dimension_rows >>: Int

=cut

sub dimension_rows { shift->[1] }

=head3 dimension_cols

Return dimension of the column space.

C<< $matrix->dimension_cols >>: Int

=cut

sub dimension_cols { shift->[2] }

=head3 array_ref

Convert Plann::Matrix to ArrayRef.

C<< $matrix->array_ref() >>: ArrayRef

=cut

sub array_ref {
   my $self = shift;
   $self->is_row_vector ? $self->[0]->[0] : $self->[0];
}
