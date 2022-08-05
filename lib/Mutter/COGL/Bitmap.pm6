use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Bitmap;

use Mutter::COGL::Object;
use Mutter::COGL::Buffer;

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
  method new_for_data (
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
  ) {
    my gint ($w, $h, $r, $o) = ($width, $height, $rowstride, $offset);

    my MutterCoglPixelFormat $f = $format

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

  method new_from_file (Str() $filename, CArray[Pointer[GError]] $error) {
    clear_error;
    $mutter-cogl-bitmap = cogl_bitmap_new_from_file($!mcb, $filename, $error);
    set_error($error);

    $mutter-cogl-bitmap ?? self.bless( :$mutter-cogl-bitmap ) !! Nil;
  }

  method new_with_size (
    MutterCoglContext() $context,
    Int()               $width,
    Int()               $height,
    Int()               $format
  ) {
    my gint                  ($w, $h) = ($with, $height);
    my MutterCoglPixelFormat  $f      = $format

    my $mutter-cogl-bitmap = cogl_bitmap_new_with_size($context, $w, $h, $F);

    $mutter-cogl-bitmap ?? self.bless( :$mutter-cogl-bitmap ) !! Nil;
  }

  method cogl_is_bitmap {
    so cogl_is_bitmap($!mcb);
  }

  method error_quark {
    so cogl_bitmap_error_quark();
  }

  method get_buffer ( :$raw = False ) {
    propReturnObject(
      cogl_bitmap_get_buffer($!mcb),
      $raw,
      |Mutter::COGL::Buffer.getTypePair
    );
  }

  method get_format {
    MutterCoglPixelFormat( cogl_bitmap_get_format($!mcb) );
  }

  method get_gtype {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_bitmap_get_gtype, $n, $t );
  }

  method get_height {
    cogl_bitmap_get_height($!mcb);
  }

  method get_rowstride {
    cogl_bitmap_get_rowstride($!mcb);
  }

  proto method get_size_from_file (|)
  { * }

  multi method get_size_from_file {
    samewith($, $);
  }
  multi method get_size_from_file ($width is rw, $height is rw) {
    my gint ($w, $h) = 0 xx 2;

    cogl_bitmap_get_size_from_file($!mcb, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_width {
    cogl_bitmap_get_width($!mcb);
  }

}
