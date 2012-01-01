use 5.14.0;
use Test::Most tests => 3;
use Mouse::Meta::Class;
use Math::MatrixReal;
use Plann::Subtypes;

my $anon_class = Mouse::Meta::Class->create_anon_class;
$anon_class->add_attribute(matrix => (
    is     => 'rw',
    isa    => 'Matrix',
    coerce => 1,
));

my $anon = $anon_class->new_object;

$anon->matrix([1,2,3]);
is(Math::MatrixReal->new_from_rows([[1,2,3]]), $anon->matrix);

$anon->matrix([[1,2], [3,4]]);
is(Math::MatrixReal->new_from_rows([[1,2], [3,4]]), $anon->matrix);

my $matrix = Math::MatrixReal->new_from_rows([[1,1,1], [2,2,2]]);
$anon->matrix($matrix);
is($matrix, $anon->matrix);
