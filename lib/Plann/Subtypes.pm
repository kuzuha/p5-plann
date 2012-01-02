use 5.14.0;
package Plann::Subtypes;
use true;

use Mouse::Util::TypeConstraints;
use Plann::Matrix;

=head1 Subtypes

=head2 Matrix
A subtype of Plann::Matrix.

=head3 coerce

=head4 from ArrayRef[ArrayRef]
[[0,0,0], [1,1,1]] => C<<Plann::Matrix->new_from_rows([[0,0,0], [1,1,1]])>>

=head4 from ArrayRef
[0,0,0] => C<<Plann::Matrix->new_from_rows([0,0,0])>>

=cut

subtype 'Matrix'
    => as 'Object'
    => where { $_->isa('Plann::Matrix') };

coerce 'Matrix'
    => from 'ArrayRef[ArrayRef]'
        => via { Plann::Matrix->new_from_rows( $_ ) }
    => from 'ArrayRef'
        => via { Plann::Matrix->new_from_rows( [$_] ) }
