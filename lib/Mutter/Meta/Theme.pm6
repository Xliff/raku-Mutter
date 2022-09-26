use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Implementor;

# BOXED - SINGLETON

class Mutter::Meta::Theme {
  also does GLib::Roles::Implementor;

  has MutterMetaTheme $!mmt is implementor;

  submethod BUILD ( :$mutter-meta-theme ) {
    $!mmt = $mutter-meta-theme if $mutter-meta-theme;
  }

  method Mutter::Raw::Definitions::MutterMetaTheme {
    $!mmt;
  }

  method new {
    my $mutter-meta-theme = meta_theme_new();

    self.bless( :$mutter-meta-theme ) !! Nil
  }

  method free {
    meta_theme_free($!mmt);
  }

  method get_default {
    my $mutter-meta-theme = meta_theme_get_default($!mmt);

    self.bless( :$mutter-meta-theme ) !! Nil
  }

}


### /usr/src/mutter-42.1/src/meta/theme.h

sub meta_theme_free (MutterMetaTheme $theme)
  is native(mutter-clutter)
  is export
{ * }

sub meta_theme_get_default ()
  returns MutterMetaTheme
  is native(mutter-clutter)
  is export
{ * }

sub meta_theme_new ()
  returns MutterMetaTheme
  is native(mutter-clutter)
  is export
{ * }
