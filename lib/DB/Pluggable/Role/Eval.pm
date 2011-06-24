use 5.010;
use strict;
use warnings;

package DB::Pluggable::Role::Eval;

# ABSTRACT: Do something in the debugger's eval() function
use Role::Basic;
with qw(Brickyard::Role::Plugin);
requires qw(eval);
1;

=head1 IMPLEMENTING

The C<Eval> role indicates that a plugin wants to do something during
the debugger's C<eval()> function. The plugin must provide the
C<eval()> method.
