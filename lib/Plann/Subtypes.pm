use 5.14.0;
package Plann::Subtypes;
use true;

use Any::Moose '::Util::TypeConstraints';
use Math::MatrixReal;

=head1 Subtypes

=head2 Matrix
A subtype of Math::MatrixReal.

=head3 coerce

=head4 from ArrayRef[ArrayRef]
[[0,0,0], [1,1,1]] => C<<Math::MatrixReal->new_from_rows([[0,0,0], [1,1,1]])>>

=head4 from ArrayRef
[0,0,0] => C<<Math::MatrixReal->new_from_rows([0,0,0])>>

=cut

subtype 'Matrix'
    => as 'Object'
    => where { $_->isa('Math::MatrixReal') };

coerce 'Matrix'
    => from 'ArrayRef[ArrayRef]'
        => via { Math::MatrixReal->new_from_rows( $_ ) }
    => from 'ArrayRef'
        => via { Math::MatrixReal->new_from_rows( [$_] ) }
