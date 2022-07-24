use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use GLib::Roles::Object;
use GLib::Roles::Implementor;
use Mutter::Clutter::Roles::Content;

class Mutter::Clutter::TextureContent {
  also does GLib::Roles::Object;
  also does Mutter::Clutter::Roles::Content;

  has MutterClutterTextureContent $!mctc is implementor;

  method new_from_texture (
    MutterCoglTexture()     $texture,
    cairo_rectangle_int_t() $clip
  ) {
    my $mutter-clutter-texture = clutter_texture_content_new_from_texture(
      $texture,
      $clip
    );

    $mutter-clutter-texture ?? self.bless( :$mutter-clutter-texture )
                            !! Nil;
  }

  method get_texture ( :$raw = False ) {
    propReturnObject(
      clutter_texture_content_get_texture($!mctc),
      $raw,
      |Mutter::COGL::Texture.getTypePair
    );
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-texture-content.h

sub clutter_texture_content_get_texture (
  MutterClutterTextureContent $texture_content
)
  returns MutterCoglTexture
  is native(mutter-clutter)
  is export
{ * }

sub clutter_texture_content_new_from_texture (
  MutterCoglTexture     $texture,
  cairo_rectangle_int_t $clip
)
  returns MutterClutterContent
  is native(mutter-clutter)
  is export
{ * }
