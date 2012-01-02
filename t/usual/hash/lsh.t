use 5.14.0;
use Test::Most tests => 8;

use Plann::Hash::LSH;

#
# random_matrix
#
my $matrix = Plann::Hash::LSH->random_matrix(10, 5);
isa_ok($matrix, 'Math::MatrixReal');
is(10, $matrix->[1]);
is(5, $matrix->[2]);

#
# constructors and accessors
#
my $lsh = Plann::Hash::LSH->new(matrix => $matrix);
is($matrix, $lsh->matrix);

#
# hash
#
my $hash = $lsh->hash([1,2,3,4,5,6,7,8,9,10]);

isa_ok($hash, 'Math::MatrixReal');
ok($hash->is_row_vector());
is(5, $matrix->[2]);
ok($hash->is_binary);
