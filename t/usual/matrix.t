use 5.14.0;
use Test::Most tests => 5;

use Plann::Matrix;

my $vector_row = Plann::Matrix->new_from_rows([[1,2,3,4]]);
my $vector_col = Plann::Matrix->new_from_cols([[1,2,3,4]]);
my $matrix = Plann::Matrix->new_from_rows([[1,2],[3,4]]);

is($vector_row->dimension_rows, 1);
is($vector_row->dimension_cols, 4);

is_deeply($vector_row->array_ref, [1,2,3,4]);
is_deeply($vector_col->array_ref, [[1],[2],[3],[4]]);
is_deeply($matrix->array_ref, [[1,2],[3,4]]);
