use v6.c;

use Method::Also;
use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::AtlasTexture;

use GLib::Roles::Implementor;
use Mutter::COGL::Roles::Texture;

our subset MutterCoglAtlasTextureAncestry is export of Mu
  where MutterCoglAtlasTexture | MutterCoglTextureAncestry;

class Mutter::COGL::AtlasTexture is Mutter::COGL::Texture {
  has MutterCoglAtlasTexture $!mcat is implementor;

  submethod BUILD ( :$mutter-atlas-texture ) {
    self.setMutterCoglAtlasTexture($mutter-atlas-texture)
      if $mutter-atlas-texture;
  }

  method setMutterCoglAtlasTexture (MutterCoglAtlasTextureAncestry $_) {
    my $to-parent;

    $!mcat = do {
      when MutterCoglAtlasTexture {
        $to-parent = cast(MutterCoglTexture, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglAtlasTexture, $_);
      }
    }
    self.setMutterCoglTexture($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglAtlasTexture
    is also<MutterCoglAtlasTexture>
  { $!mcat }

  multi method new (
    MutterCoglAtlasTextureAncestry  $mutter-atlas-texture,
                                   :$ref                   = True
  ) {
    return unless $mutter-atlas-texture;

    my $o = self.bless( :$mutter-atlas-texture );
    $o.ref if $ref;
    $o;
  }

  method new_from_bitmap (MutterCoglBitmap() $bmp) is also<new-from-bitmap> {
    my $mutter-atlas-texture = cogl_atlas_texture_new_from_bitmap($bmp);

    $mutter-atlas-texture ?? self.bless( :$mutter-atlas-texture ) !! Nil;
  }

  sub bpp ($f)  {
    Mutter::Cogl::PixelFormat.get_bytes_per_pixel($f);
  }

  proto method new_from_data (|)
    is also<new-from-data>
  { * }

  multi method new_from_data (
    MutterCoglContext()      $ctx,
    Int()                    $width,
    Int()                    $height,
    Int()                    $format,
                             @data,
    CArray[Pointer[GError]]  $error      = gerror,
    Int()                   :$rowstride  = $width * bpp($format)
  ) {
    my $size = $height * $rowstride;

    die 'Not enough items in data for image size!'
      unless @data.elems <= $size;

    $*ERR.say: q:to/ERR/.chomp if @data.elems > $size;
      Too many elems in data for image size in call to .new_from_data!
      Truncating...
      ERR

    samewith(
      $ctx,
      $width,
      $height,
      $format,
      $rowstride,
      ArrayToCArray(uint8, @data, :$size),
      $error
    );
  }
  multi method new_from_data (
    MutterCoglContext()      $ctx,
    Int()                    $width,
    Int()                    $height,
    Int()                    $format,
    Buf()                    $data,
    CArray[Pointer[GError]]  $error      = gerror,
    Int()                   :$rowstride  = 0
  ) {
    samewith(
      $ctx,
      $width,
      $height,
      $format,
      $rowstride,
      $data.&ba,
      $error
    )
  }
  multi method new_from_data (
    MutterCoglContext()     $ctx,
    Int()                   $width,
    Int()                   $height,
    Int()                   $format,
    Int()                   $rowstride,
    CArray[uint8_t]         $data,
    CArray[Pointer[GError]] $error
  ) {
    my gint                  ($w, $h, $r) = ($width, $height, $rowstride);
    my MutterCoglPixelFormat  $f          =  $format;

    clear_error;
    my $mutter-atlas-texture = cogl_atlas_texture_new_from_data(
      $ctx,
      $w,
      $h,
      $f,
      $r,
      $data,
      $error
    );
    set_error($error);

    $mutter-atlas-texture ?? self.bless( :$mutter-atlas-texture ) !! Nil;
  }

  method new_from_file (
    MutterCoglContext()     $ctx,
    Str()                   $filename,
    CArray[Pointer[GError]] $error
  )
    is also<new-from-file>
  {
    clear_error;
    my $mutter-atlas-texture = cogl_atlas_texture_new_from_file(
      $ctx,
      $filename,
      $error
    );
    set_error($error);

    $mutter-atlas-texture ?? self.bless( :$mutter-atlas-texture ) !! Nil;
  }

  method new_with_size (
    MutterCoglContext() $ctx,
    Int()               $width,
    Int()               $height
  )
    is also<new-with-size>
  {
    my gint ($w, $h) = ($width, $height);

    my $mutter-atlas-texture = cogl_atlas_texture_new_with_size(
      $ctx,
      $w,
      $h
    );

    $mutter-atlas-texture ?? self.bless( :$mutter-atlas-texture ) !! Nil;
  }

  method is_atlas_texture is also<is-atlas-texture> {
    so cogl_is_atlas_texture($!mcat);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_atlas_texture_get_gtype, $n, $t );
  }

}
