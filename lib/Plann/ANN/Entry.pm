use 5.14.0;
package Plann::ANN::Entry;
use true;
use Mouse;

use Plann::Subtypes;

has 'vector' => (
    is       => 'ro',
    isa      => 'Matrix',
    coerce   => 1,
    required => 1,
);

has 'parameters' => (
    is      => 'ro',
    isa     => 'HashRef',
    default => sub { {} },
);

sub BUILDARGS {
    my ($self, @args) = @_;
    if (ref $args[0]) {
        if (1 == scalar @args) {
            @args = (vector => $args[0]);
        } else {
            @args = (vector => $args[0], parameters => $args[1]);
        }
    }
    return {@args};
}
