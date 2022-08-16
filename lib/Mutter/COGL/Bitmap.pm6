use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::COGL::Bitmap;

use Mutter::COGL::Object;
use Mutter::COGL::Buffer;

use GLib::Roles::Implementor;

our subset MutterCoglBitmapAncestry is export of Mu
  where MutterCoglBitmap | MutterCoglObjectAncestry;

class Mutter::COGL::Bitmap {
  has MutterCoglBitmap $!mcb is implementor;

  submethod BUILD ( :$mutter-cogl-bitmap ) {
    self.setMutterCoglBitmap($mutter-cogl-bitmap)
      if $mutter-cogl-bitmap
  }

  method setMutterCoglBitmap (MutterCoglBitmapAncestry $_) {
    my $to-parent;

    $!mcb = do {
      when MutterCoglBitmap {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglBitmap, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglBitmap
    is also<MutterCoglBitmap>
  { $!mcb }

  multi method new (
    MutterCoglBitmapAncestry  $mutter-cogl-bitmap,
                             :$ref                 = True
  ) {
    return unless $mutter-cogl-bitmap;

    my $o = self.bless( :$mutter-cogl-bitmap );
    $o.ref if $ref;
    $o;
  }

  proto method new_for_data (|)
    is also<new-for-data>
  { * }

  multi method new_for_data (
    MutterCoglContext() $context,
    Int()               $width,
    Int()               $height,
    Int()               $format,
    Int()               $rowstride,
                        @data
  ) {
    samewith(
      $context,
      $height,
      $format,
      $rowstride,
      ArrayToCArray(uint8_t, @data)
    );
  }
  multi method new_for_data (
    MutterCoglContext() $context,
    Int()               $width,
    Int()               $height,
    Int()               $format,
    Int()               $rowstride,
    Buf()               $data
  ) {
    samewith(
      $context,
      $width,
      $height,
      $format,
      $rowstride,
      CArray[uint8_t].new($data)
    );
  }
  multi method new_for_data (
    MutterCoglContext() $context,
    Int()               $width,
    Int()               $height,
    Int()               $format,
    Int()               $rowstride,
    CArray[uint8_t]     $data
  ) {
    my gint                  ($w, $h, $r) = ($width, $height, $rowstride);
    my MutterCoglPixelFormat  $f          = $format;

    my $mutter-cogl-bitmap = cogl_bitmap_new_for_data(
      $context,
      $w,
      $h,
      $f,
      $r,
      $data
    );

    $mutter-cogl-bitmap ?? self.bless( :$mutter-cogl-bitmap ) !! Nil;
  }

  method new_from_buffer (
    MutterCoglBuffer() $buffer,
    Int()              $format,
    Int()              $width,
    Int()              $height,
    Int()              $rowstride,
    Int()              $offset
  )
    is also<new-from-buffer>
  {
    my gint ($w, $h, $r, $o) = ($width, $height, $rowstride, $offset);

    my MutterCoglPixelFormat $f = $format;

    my $mutter-cogl-bitmap = cogl_bitmap_new_from_buffer(
      $buffer,
      $f,
      $w,
      $h,
      $r,
      $o
    );

    $mutter-cogl-bitmap ?? self.bless( :$mutter-cogl-bitmap ) !! Nil;
  }

  method new_from_file (Str() $filename, CArray[Pointer[GError]] $error)
    is also<new-from-file>
  {
    clear_error;
    my $mutter-cogl-bitmap = cogl_bitmap_new_from_file(
      $!mcb,
      $filename,
      $error
    );
    set_error($error);

    $mutter-cogl-bitmap ?? self.bless( :$mutter-cogl-bitmap ) !! Nil;
  }

  method new_with_size (
    MutterCoglContext() $context,
    Int()               $width,
    Int()               $height,
    Int()               $format
  )
    is also<new-with-size>
  {
    my gint                  ($w, $h) = ($width, $height);
    my MutterCoglPixelFormat  $f      = $format;

    my $mutter-cogl-bitmap = cogl_bitmap_new_with_size($context, $w, $h, $f);

    $mutter-cogl-bitmap ?? self.bless( :$mutter-cogl-bitmap ) !! Nil;
  }

  method cogl_is_bitmap is also<cogl-is-bitmap> {
    so cogl_is_bitmap($!mcb);
  }

  method error_quark is also<error-quark> {
    so cogl_bitmap_error_quark();
  }

  method get_buffer ( :$raw = False ) is also<get-buffer> {
    propReturnObject(
      cogl_bitmap_get_buffer($!mcb),
      $raw,
      |Mutter::COGL::Buffer.getTypePair
    );
  }

  method get_format is also<get-format> {
    MutterCoglPixelFormat( cogl_bitmap_get_format($!mcb) );
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_bitmap_get_gtype, $n, $t );
  }

  method get_height is also<get-height> {
    cogl_bitmap_get_height($!mcb);
  }

  method get_rowstride is also<get-rowstride> {
    cogl_bitmap_get_rowstride($!mcb);
  }

  proto method get_size_from_file (|)
    is also<get-size-from-file>
    is static
  { * }

  multi method get_size_from_file (Str() $file) {
    samewith($file, $, $);
  }
  multi method get_size_from_file (
    Str() $file,
          $width     is rw,
          $height    is rw
  ) {
    my gint ($w, $h) = 0 xx 2;

    cogl_bitmap_get_size_from_file($file, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_width is also<get-width> {
    cogl_bitmap_get_width($!mcb);
  }

}
