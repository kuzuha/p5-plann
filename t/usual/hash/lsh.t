use 5.14.0;
use Test::Most tests => 8;

use Plann::Hash::LSH;

#
# random_matrix
#
my $matrix = Plann::Hash::LSH->random_matrix(20, 10);
isa_ok($matrix, 'Math::MatrixReal');
is($matrix->[1], 20);
is($matrix->[2], 10);

#
# constructors and accessors
#
my $lsh = Plann::Hash::LSH->new(matrix => $matrix);
is($lsh->matrix, $matrix);

#
# hash
#
my $hash = $lsh->hash([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]);

isa_ok($hash, 'Math::MatrixReal');
ok($hash->is_row_vector());
is($matrix->[2], 10);
ok($hash->is_binary);
