use 5.14.0;
use Test::Most tests => 4;

use Plann::ANN::BruteForce;
use Plann::ANN::Entry;

my $ann = Plann::ANN::BruteForce->new;

my @entries = (
    Plann::ANN::Entry->new([1,2,3]),
    Plann::ANN::Entry->new([2,3,4]),
    Plann::ANN::Entry->new([100,200,300]),
);

my $expected = [
    { entry => $entries[1], distance => 0 },
    { entry => $entries[0], distance => 1.73205080756888 },
    { entry => $entries[2], distance => 368.821094841388 },
];

$ann->train($_) for @entries;

#
# search
#
is_deeply(
    $ann->search($entries[1]->vector),
    $expected
);

#
# search with threshold
#
pop $expected;
is_deeply(
    $ann->search($entries[1]->vector, { threshold => 2 }),
    $expected
);
is_deeply(
    $ann->search($entries[1]->vector, { threshold => 1.73205080756888 }),
    $expected
);

pop $expected;
is_deeply(
    $ann->search($entries[1]->vector, { threshold => 1.73205080756887 }),
    $expected
);
