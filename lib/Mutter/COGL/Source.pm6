use v6.c;

use NativeCall;
use Method::Also;

use Mutter::Raw::Types;

use GLib::Source;

use GLib::Roles::Implementor;

our subset MutterCoglSourceAncestry is export of Mu
  where MutterCoglSource | GSource;

class COGL::Source is GLib::Source {
  has MutterCoglSource $!mcgs is implementor;

  submethod BUILD ( :$mutter-cogl-source ) {
    self.setMutterCoglSource($mutter-cogl-source)
      if $mutter-cogl-source
  }

  method setMutterCoglSource (MutterCoglSourceAncestry $_) {
    my $to-parent;

    $!mcgs = do {
      when MutterCoglSource {
        $to-parent = cast(GSource, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglSource, $_);
      }
    }
    self.setGSource($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglSource
  { $!mcgs }

  multi method new (MutterCoglSourceAncestry $mutter-cogl-source, :$ref = True) {
    return unless $mutter-cogl-source;

    my $o = self.bless( :$mutter-cogl-source );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterCoglContext() $context, Int() $priority) {
    my gint $p = $priority;

    my $mutter-cogl-source = cogl_glib_source_new($context, $p);

    $mutter-cogl-source ?? self.bless( :$mutter-cogl-source ) !! Nil;
  }

}


our subset MutterCoglRendererSourceAncestry is export of Mu
  where MutterCoglRendererSource | GSource;

class COGL::Renderer::Source is GLib::Source {
  has MutterCoglRendererSource $!mcrs is implementor;

  submethod BUILD ( :$mutter-cogl-src-renderer ) {
    self.setMutterCoglRendererSource($mutter-cogl-src-renderer)
      if $mutter-cogl-src-renderer
  }

  method setMutterCoglRendererSource (MutterCoglRendererSourceAncestry $_) {
    my $to-parent;

    $!mcrs = do {
      when MutterCoglRendererSource {
        $to-parent = cast(GSource, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglRendererSource, $_);
      }
    }
    self.setGSource($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglRendererSource
    is also<MutterCoglRendererSource>
  { $!mcrs }

  multi method new (
    MutterCoglRendererSourceAncestry  $mutter-cogl-src-renderer,
                                     :$ref                       = True
  ) {
    return unless $mutter-cogl-src-renderer;

    my $o = self.bless( :$mutter-cogl-src-renderer );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterCoglRenderer() $renderer, Int() $priority) {
    my gint $p = $priority;

    my $mutter-cogl-src-renderer = cogl_glib_renderer_source_new(
      $renderer,
      $p
    );

    $mutter-cogl-src-renderer ?? self.bless( :$mutter-cogl-src-renderer )
                              !! Nil;
  }

}

### /usr/src/mutter-42.1/cogl/cogl/cogl-glib-source.h

sub cogl_glib_renderer_source_new (
  MutterCoglRenderer $renderer,
  gint               $priority
)
  returns MutterCoglRendererSource
  is native(mutter-clutter)
  is export
{ * }

sub cogl_glib_source_new (MutterCoglContext $context, gint $priority)
  returns MutterCoglSource
  is native(mutter-clutter)
  is export
{ * }
