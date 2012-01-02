use 5.14.0;
use Test::Most tests => 2;

use Plann::ANN::Utils;

#
# euclidean_distance
#
is(0, euclidean_distance([1,2,3], [1,2,3]));
is(7.07106781186548, euclidean_distance([10,20], [15,15]));
