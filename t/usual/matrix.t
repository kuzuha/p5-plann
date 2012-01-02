use 5.14.0;
use Test::Most tests => 3;

use Plann::Matrix;

is_deeply(Plann::Matrix->new_from_rows([[1,2,3,4]])->array_ref, [1,2,3,4]);
is_deeply(Plann::Matrix->new_from_cols([[1,2,3,4]])->array_ref, [[1],[2],[3],[4]]);
is_deeply(Plann::Matrix->new_from_rows([[1,2],[3,4]])->array_ref, [[1,2],[3,4]]);
