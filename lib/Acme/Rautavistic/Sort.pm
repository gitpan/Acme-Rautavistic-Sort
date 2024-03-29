package Acme::Rautavistic::Sort;

use warnings;
use strict;

use Scalar::Util 'reftype';
require Exporter;

use vars qw(@ISA @EXPORT_OK %EXPORT_TAGS);

@ISA = qw(Exporter);

@EXPORT_OK   = qw(dropsort);
%EXPORT_TAGS = (all => [qw(dropsort)]);

# choose the best one
# *{dropsort} = *{dropsort5};

sub dropsort {
    no warnings;
    my $last;
    map { $_ ge $last ? $last = $_ : () } @_;
}

# TODOs / Ideas:
#   Attribute : Rautavistic(dropsort)
#    an Arrays, beh�lt immer dropsort-Sortierung bei, nach jeder �nderung am Array


=head1 NAME

Acme::Rautavistic::Sort - Rautavistic sort functions

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

 use Acme::Rautavistic::Sort ':all';
 
 # default alphanumeric comparison
 @res = dropsort(qw(3 2 3 1 5));      # qw(3 3 5)
 @res = dropsort(qw(cc bb dd aa ee)); # qw(cc dd ee)
 
 # numeric comparison
 @res = dropsort sub { $_[0] <=> $_[1] }, 1, 11, 2;


=head1 DESCRIPTION

This module provides rautavistic sort functions. For more description
of the functions see below.

=head2 dropsort

From http://www.dangermouse.net/esoteric/dropsort.html:

Dropsort is a fast, one-pass sorting algorithm suitable for many
applications.

Algorithm Description Dropsort is run on an ordered list of numbers by
examining the numbers in sequence, beginning with the second number in
the list. If the number being examined is less than the number before
it, drop it from the list. Otherwise, it is in sorted order, so keep
it. Then move to the next number.

After a single pass of this algorithm, the list will only contain
numbers that are at least as large as the previous number in the
list. In other words, the list will be sorted!  Analysis Dropsort
requires exactly n-1 comparisons to sort a list of length n, making
this an O(n) algorithm, superior to the typical O(n logn) algorithms
commonly used in most applications.

Dropsort is what is known in the computer science field as a lossy
algorithm. It produces a fast result that is correct, but at the cost
of potentially losing some of the input data. Although to those not
versed in the arts of computer science this may seem undesirable,
lossy algorithms are actually a well-accepted part of computing. An
example is the popular JPEG image compression format, which enjoys
widespread use because of its versatility and usefulness. In similar
fashion, dropsort promises to revolutionise the sorting of data in
fields as diverse as commercial finance, government record-keeping,
and space exploration.

=head1 EXPORT

 dropsort

=head1 FUNCTIONS

=head2 dropsort

 @SORTED = dropsort @VALUES;
 @SORTED = dropsort sub { $_[0] <=> $_[1]}, @VALUES;

Does drop sort.

If the first argument is a sub reference, use that to do the
comparison of two values.

Please note, that due to the nature of the algorithm, just reversing
$_[0] and $_[1] does not reverse the order of the result. You can only
use it to modify the comparator, eg. to use number comparison instead
of the default string comparator.

Use

 @SORTED = reverse dropsort @VALUES;

to reverse the result.

=head1 AUTHOR

Steffen Schwigon, C<< <ss5@renormalist.net> >>

Felix Antonius Wilhelm Ostmann (benchmark, optimization and stunt
coordinator)

=head1 BUGS

dropsort currently only sorts by string comparison. This will
hopefully be fixed by being able to argument it with a comparison
function, similar to Perl's sort.


Please report any bugs or feature requests to
C<bug-acme-rautavistic-sort at rt.cpan.org>, or through the web
interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Acme-Rautavistic-Sort>.
I will be notified, and then you'll automatically be notified of
progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Acme::Rautavistic::Sort

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Acme-Rautavistic-Sort>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Acme-Rautavistic-Sort>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Acme-Rautavistic-Sort>

=item * Search CPAN

L<http://search.cpan.org/dist/Acme-Rautavistic-Sort>

=back

=head1 ACKNOWLEDGEMENTS

For more information about rautavistic sort and rautavistic in general
see

=over 4

=item * http://www.dangermouse.net/esoteric/dropsort.html

=item * http://www.rautavistik.de (in german)

=back

=head1 COPYRIGHT & LICENSE

Copyright 2008 Steffen Schwigon, all rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

# End of Acme::Rautavistic::Sort
