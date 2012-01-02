use 5.14.0;
use Test::Most tests => 2;

use Plann::ANN::Entry;

my $entry;

is_deeply(
    Plann::ANN::Entry->new([1,2,3]),
    Plann::ANN::Entry->new(vector => [1,2,3])
);

is_deeply(
    Plann::ANN::Entry->new([1,2,3], { threshold => 10 }),
    Plann::ANN::Entry->new(vector => [1,2,3], parameters => { threshold => 10 })
);
