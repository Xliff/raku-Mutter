use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role Mutter::COGL::Roles::Scanout {
  has MutterCoglScanout $!mcs is implementor;

  method blit_to_framebuffer (
    MutterCoglFramebuffer() $framebuffer,
    Int()                   $x,
    Int()                   $y,
    CArray[Pointer[GError]] $error        = gerror
  ) {
    my gint ($xx, $yy) = ($x, $y);

    clear_error;
    my $rv = cogl_scanout_blit_to_framebuffer(
      $!mcs,
      $framebuffer,
      $x,
      $y,
      $error
    );
    set_error($error);
    $rv;
  }

}

our subset MutterCoglScanoutAncestry is export of Mu
  where MutterCoglScanout | GObject;

class Mutter::COGL::Scanout {
  also does GLib::Roles::Object;
  also does Mutter::COGL::Roles::Scanout;

  submethod BUILD ( :$mutter-cogl-scanout ) {
    self.setMutterCoglScanout($mutter-cogl-scanout)
      if $mutter-cogl-scanout
  }

  method setMutterCoglScanout (MutterCoglScanoutAncestry $_) {
    my $to-parent;

    $!mcs = do {
      when MutterCoglScanout {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglScanout, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglScanout
  { $!mcs }

  multi method new (
    MutterCoglScanoutAncestry  $mutter-cogl-scanout,
                              :$ref                  = True
  ) {
    return unless $mutter-cogl-scanout;

    my $o = self.bless( :$mutter-cogl-scanout );
    $o.ref if $ref;
    $o;
  }

}

### /usr/src/mutter-42.1/cogl/cogl/cogl-scanout.h

sub cogl_scanout_blit_to_framebuffer (
  MutterCoglScanout       $scanout,
  MutterCoglFramebuffer   $framebuffer,
  gint                    $x,
  gint                    $y,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }
