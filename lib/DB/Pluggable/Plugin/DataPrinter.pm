use 5.010;
use strict;
use warnings;

package DB::Pluggable::Plugin::DataPrinter;

# ABSTRACT: Debugger plugin to use Data::Printer
use Role::Basic;
use Data::Printer; # to make it a requirement
with qw(DB::Pluggable::Role::Initializer);

sub initialize {
    no warnings 'once';
    $DB::alias{p} = 's/^/use Data::Printer; /; eval $cmd';
}
1;

=begin :prelude

=for test_synopsis
1;
__END__

=end :prelude

=head1 SYNOPSIS

    $ cat ~/.perldb

    use DB::Pluggable;
    DB::Pluggable->run_with_config(\<<EOINI)
    [BreakOnTestNumber]
    EOINI

    $ perl -d foo.pl

    Loading DB routines from perl5db.pl version 1.28
    Editor support available.

    Enter h or `h h' for help, or `man perldebug' for more help.

    1..9
    ...
      DB<1> c
      ...
      DB<2> p %foo

=head1 DESCRIPTION

This debugger plugin exposes L<Data::Printer>'s C<p> command to the
debugger. Use the C<~/.dataprinter> file to control the output - see
L<Data::Printer> for details.

=method initialize

Defines a debugger alias for the C<p> command.
