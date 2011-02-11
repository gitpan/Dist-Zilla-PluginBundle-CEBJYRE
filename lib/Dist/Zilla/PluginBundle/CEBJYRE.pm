use strict;
use warnings;
package Dist::Zilla::PluginBundle::CEBJYRE;
BEGIN {
  $Dist::Zilla::PluginBundle::CEBJYRE::VERSION = '0.0.1';
}

# ABSTRACT: My default dzil plugins

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';


sub configure {
  my $self = shift;

  $self->add_plugins(qw(
    PkgVersion
    AutoPrereqs
    PodWeaver
    PodCoverageTests
    PodSyntaxTests
    NextRelease
    CheckPrereqsIndexed
  ));

  $self->add_bundle(
    'Basic',
    'Git',
  );
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__
=pod

=head1 NAME

Dist::Zilla::PluginBundle::CEBJYRE - My default dzil plugins

=head1 VERSION

version 0.0.1

=head1 DESCRIPTION

Using this bundle is equivalent to:

  [PkgVersion]
  [AutoPrereqs]
  [PodWeaver]
  [PodCoverageTests]
  [PodSyntaxTests]
  [NextRelease]
  [CheckPrereqsIndexed]
  [@Basic]
  [@Git]

=head1 METHODS

=head2 configure

See L<Dist::Zilla::Role::PluginBundle::Easy>.

=head1 AUTHOR

Glenn Fowler <cebjyre@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Glenn Fowler.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

