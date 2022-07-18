use v6.c;

use NativeCall;
use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Image;

use GLib::Roles::Object;
use GLib::Roles::Implementor;
use Mutter::Clutter::Roles::Content;

our subset MutterClutterImageAncestry is export of Mu
  where MutterClutterImage | GObject;

class Mutter::Clutter::Image {
  also does GLib::Roles::Object;
  also does Mutter::Clutter::Roles::Content;

  has MutterClutterImage $!mci is implementor;

  submethod BUILD ( :$mutter-clutter-image ) {
    self.setBindingPool($mutter-clutter-image)
      if $mutter-clutter-image;
  }

  method setBindingPool(MutterClutterImageAncestry $_) {
    my $to-parent;

    $!mci = do {
      when MutterClutterImage {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterImage, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterImage
    is also<MutterClutterImage>
  { $!mci }

  multi method new (
    MutterClutterImageAncestry  $mutter-binding-pool,
                                     :$ref                  = True
  ) {
    return unless $mutter-binding-pool;

    my $o = self.bless( :$mutter-binding-pool );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-image = clutter_image_new();

    $mutter-clutter-image ?? self.bless( :$mutter-clutter-image ) !! Nil;
  }

  method error_quark is static is also<error-quark> {
    clutter_image_error_quark();
  }

  method get_texture ( :$raw = False ) is also<get-texture> {
    propReturnObject(
      clutter_image_get_texture($!mci),
      $raw,
      |Mutter::COGL::Texture.getTypePath
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_image_get_type, $n, $t );
  }

  method set_area (
    CArray[guint8]          $data,
    Int()                   $pixel_format,
    cairo_rectangle_int_t() $rect,
    Int()                   $row_stride,
    CArray[Pointer[GError]] $error          = gerror
  )
    is also<set-area>
  {
    my MutterCoglPixelFormat $p = $pixel_format;
    my guint                 $r = $row_stride;

    clear_error;
    clutter_image_set_area(
      $!mci,
      $data,
      $p,
      $rect,
      $r,
      $error
    );
    set_error($error);
  }

  subset GBytesOrObject is export of Mu where GBytes | *.^can('GBytes');

  proto method set (|c) {
    c<height> //= c<width>;
    c<width>  //= c<height>;

    die ':$width and/or :height must be specified!'
      unless c<height> && c<width>;

    {*}
  }

  multi method set (
    Int()                   $pixel_format,
    CArray[guint8]          $data,
    Int()                   $row_stride,
    cairo_rectangle_int_t() $rect,
    CArray[Pointer[GError]] $error          = gerror
  ) {
    samewith($data, $pixel_format, $rect, $row_stride, $error);
  }
  multi method set (
    Int()                    $pixel_format,
    GBytesOrObject           $data           is copy,
    Int()                    $row_stride,
    CArray[Pointer[GError]]  $error                   = gerror,
    Int()                   :$width          is copy,
    Int()                   :$height         is copy
  ) {
    $data .= GBytes unless $data ~~ GBytes;

    self.set_bytes(
       $data,
       $pixel_format,
       $width,
       $height,
       $row_stride,
      :$error
    );
  }
  multi method set (
    Int()                    $pixel_format,
    CArray[guint8]           $data,
    Int()                    $row_stride,
    CArray[Pointer[GError]]  $error         = gerror,
    Int()                   :$width,
    Int()                   :$height
  ) {
    self.set_data($data, $pixel_format, $width, $height, $row_stride, :$error);
  }

  method set_bytes (
    GBytes()                $data,
    Int()                   $pixel_format,
    Int()                   $width,
    Int()                   $height,
    Int()                   $row_stride,
    CArray[Pointer[GError]] $error         = gerror
  )
    is also<set-bytes>
  {
    my MutterCoglPixelFormat  $p          =  $pixel_format;
    my guint                 ($w, $h, $r) = ($width, $height, $row_stride);

    clutter_image_set_bytes(
      $!mci,
      $data,
      $p,
      $w,
      $h,
      $r,
      $error
    );
  }

  method set_data (
    CArray[guint8]          $data,
    Int()                   $pixel_format,
    Int()                   $width,
    Int()                   $height,
    Int()                   $row_stride,
    CArray[Pointer[GError]] $error         = gerror
  )
    is also<set-data>
  {
    my MutterCoglPixelFormat  $p          =  $pixel_format;
    my guint                 ($w, $h, $r) = ($width, $height, $row_stride);

    clear_error;
    clutter_image_set_data(
      $!mci,
      $data,
      $p,
      $w,
      $h,
      $r,
      $error
    );
    set_error($error);
  }

}
