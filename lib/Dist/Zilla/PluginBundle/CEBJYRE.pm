use strict;
use warnings;
package Dist::Zilla::PluginBundle::CEBJYRE;
{
  $Dist::Zilla::PluginBundle::CEBJYRE::VERSION = '0.2.0';
}

# ABSTRACT: My default dzil plugins

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';


use Dist::Zilla::Plugin::PkgVersion;
use Dist::Zilla::Plugin::AutoPrereqs;
use Dist::Zilla::Plugin::PodWeaver;
use Dist::Zilla::Plugin::PodCoverageTests;
use Dist::Zilla::Plugin::PodSyntaxTests;
use Dist::Zilla::Plugin::NextRelease;
use Dist::Zilla::Plugin::CheckPrereqsIndexed;
use Dist::Zilla::PluginBundle::Basic;
use Dist::Zilla::PluginBundle::Git;

sub configure {
  my $self = shift;
  my $payload = $self->payload;

  $self->add_plugins(qw(
    PkgVersion
    AutoPrereqs
    PodWeaver
    PodCoverageTests
    PodSyntaxTests
    NextRelease
    CheckPrereqsIndexed
  ));

  $self->add_bundle('Basic');
  my %git_config = map {substr($_, 4) => $payload->{$_}} grep {/^git_/} keys %$payload;
  $self->add_bundle(Git => \%git_config);
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__
=pod

=head1 NAME

Dist::Zilla::PluginBundle::CEBJYRE - My default dzil plugins

=head1 VERSION

version 0.2.0

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

Configurations options may be passed into the Git bundle
(currently this is the only one supported) by prefacing
the usual option names with C<git_>.

For example:

  [@CEBJYRE]
  git_push_to = github

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

