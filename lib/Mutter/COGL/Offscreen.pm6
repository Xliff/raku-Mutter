use v6.c;

use Method::Also;
use NativeCall;

use Mutter::Raw::Types;

use Mutter::COGL::Framebuffer;

use GLib::Roles::Implementor;
use Mutter::COGL::Roles::Texture;

our subset MutterCoglOffscreenAncestry is export of Mu
  where MutterCoglOffscreen | MutterCoglFramebufferAncestry;

class Mutter::COGL::Offscreen is Mutter::COGL::Framebuffer {
  has MutterCoglOffscreen $!mco is implementor;

  submethod BUILD ( :$mutter-cogl-off ) {
    self.setMutterCoglOffscreen($mutter-cogl-off)
      if $mutter-cogl-off
  }

  method setMutterCoglOffscreen (MutterCoglOffscreenAncestry $_) {
    my $to-parent;

    $!mco = do {
      when MutterCoglOffscreen {
        $to-parent = cast(MutterCoglFramebuffer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglOffscreen, $_);
      }
    }
    self.setMutterCoglFramebuffer($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglOffscreen
    is also<MutterCoglOffscreen>
  { $!mco }

  multi method new (
    MutterCoglOffscreenAncestry  $mutter-cogl-off,
                                :$ref              = True
  ) {
    return unless $mutter-cogl-off;

    my $o = self.bless( :$mutter-cogl-off );
    $o.ref if $ref;
    $o;
  }

  method new_with_texture (MutterCoglTexture() $texture)
    is also<new-with-texture>
  {
    my $mutter-cogl-off = cogl_offscreen_new_with_texture($texture);

    $mutter-cogl-off ?? self.bless( :$mutter-cogl-off ) !! Nil;
  }

  method get_texture ( :$raw = False ) is also<get-texture> {
    propReturnObject(
      cogl_offscreen_get_texture($!mco),
      $raw,
      |Mutter::COGL::Texture.getTypePair
    )
  }

}

### /usr/src/mutter-42.1/cogl/cogl/cogl-offscreen.h

sub cogl_offscreen_get_texture (MutterCoglOffscreen $offscreen)
  returns MutterCoglTexture
  is native(mutter-clutter)
  is export
{ * }

sub cogl_offscreen_new_with_texture (MutterCoglTexture $texture)
  returns MutterCoglOffscreen
  is native(mutter-clutter)
  is export
{ * }
