use 5.14.0;
use Test::Most tests => 3;

use Mouse::Meta::Attribute;
use Mouse::Meta::Class;
use Plann::Matrix;
use Plann::Subtypes;

my $anon_class = Mouse::Meta::Class->create_anon_class;
$anon_class->add_attribute(
    matrix => (
        is     => 'rw',
        isa    => 'Matrix',
        coerce => 1,
    ),
);

my $anon = $anon_class->new_object;

$anon->matrix([1,2,3]);
is($anon->matrix, Plann::Matrix->new_from_rows([[1,2,3]]));

$anon->matrix([[1,2], [3,4]]);
is($anon->matrix, Plann::Matrix->new_from_rows([[1,2], [3,4]]));

my $matrix = Plann::Matrix->new_from_rows([[1,1,1], [2,2,2]]);
$anon->matrix($matrix);
is($anon->matrix, $matrix);
