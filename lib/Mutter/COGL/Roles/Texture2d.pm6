use v6.c;

use NativeCall;
use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Texture2d;

use GLib::Roles::Implementor;
use Mutter::COGL::Roles::Texture;

role Mutter::COGL::Roles::Texture2d {
  also does Mutter::COGL::Roles::Texture;

  has MutterCoglTexture2d $!mct2 is implementor;

  method Mutter::Clutter::Raw::Definitions::MutterCoglTexture2d
    is also<MutterCoglTexture2d>
  { $!mct2 }

  method new_from_bitmap (MutterCoglBitmap() $bitmap)
    is also<new-from-bitmap>
  {
    my $mutter-cogl-t2d = cogl_texture_2d_new_from_bitmap($bitmap);

    $mutter-cogl-t2d ?? self.bless( :$mutter-cogl-t2d ) !! Nil
  }

  multi method new_from_data (
    MutterCoglContext()     $ctx,
    Int()                   $width,
    Int()                   $height,
    Int()                   $format,
    Int()                   $rowstride,
                            @data,
    CArray[Pointer[GError]] $error       = gerror
  )
    is also<new-from-data>
  {
    samewith(
      $ctx,
      $width,
      $height,
      $format,
      $rowstride,
      ArrayToCArray(uint8, @data),
      $error
    );
  }
  multi method new_from_data (
    MutterCoglContext()     $ctx,
    Int()                   $width,
    Int()                   $height,
    Int()                   $format,
    Int()                   $rowstride,
    Buf()                   $data,
    CArray[Pointer[GError]] $error       = gerror
  )
    is also<new-from-data>
  {
    samewith(
      $ctx,
      $width,
      $height,
      $format,
      $rowstride,
      CArray[uint8].new($data),
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
    CArray[Pointer[GError]] $error       = gerror
  )
    is also<new-from-data>
  {
    my gint                  ($w, $h, $r) = ($width, $height, $rowstride);
    my MutterCoglPixelFormat  $f          =  $format;

    clear_error;
    my $mutter-cogl-t2d = cogl_texture_2d_new_from_data(
      $ctx,
      $w,
      $h,
      $f,
      $r,
      $data,
      $error
    );
    set_error($error);

    $mutter-cogl-t2d ?? self.bless( :$mutter-cogl-t2d ) !! Nil
  }

  method new_from_egl_image_external (
    MutterCoglContext()     $ctx,
    Int()                   $width,
    Int()                   $height,
                            &alloc,
    gpointer                $user_data = gpointer,
                            &destroy   = %DEFAULT-CALLBACKS<GDestroyNotify>,
    CArray[Pointer[GError]] $error     = gerror
  )
    is also<new-from-egl-image-external>
  {
    my gint ($w, $h) = ($width, $height);

    my $mutter-cogl-t2d = cogl_texture_2d_new_from_egl_image_external(
      $ctx,
      $w,
      $h,
      &alloc,
      $user_data,
      &destroy,
      $error
    );

    $mutter-cogl-t2d ?? self.bless( :$mutter-cogl-t2d ) !! Nil
  }

  method new_from_file (
    MutterCoglContext()     $ctx,
    Str()                   $filename,
    CArray[Pointer[GError]] $error     = gerror
  )
    is also<new-from-file>
  {
    clear_error;
    my $mutter-cogl-t2d = cogl_texture_2d_new_from_file(
      $ctx,
      $filename,
      $error
    );
    set_error($error);

    $mutter-cogl-t2d ?? self.bless( :$mutter-cogl-t2d ) !! Nil
  }

  method new_with_size (
    MutterCoglContext() $ctx,
    Int()               $width,
    Int()               $height
  )
    is also<new-with-size>
  {
    my gint ($w, $h) = ($width, $height);

    my $mutter-cogl-t2d = cogl_texture_2d_new_with_size($!mct2, $ctx, $w, $h);

    $mutter-cogl-t2d ?? self.bless( :$mutter-cogl-t2d ) !! Nil
  }

  method egl_image_external_alloc_finish (
    gpointer $user_data = gpointer,
             &destroy   = %DEFAULT-CALLBACKS<GDestoryNotify>
  )
    is also<egl-image-external-alloc-finish>
  {
    cogl_texture_2d_egl_image_external_alloc_finish(
      $!mct2,
      $user_data,
      &destroy
    );
  }

  method egl_image_external_bind is also<egl-image-external-bind> {
    cogl_texture_2d_egl_image_external_bind($!mct2);
  }

  method is_texture_2d is also<is-texture-2d> {
    so cogl_is_texture_2d($!mct2);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_texture_2d_get_gtype, $n, $t );
  }
}

our subset MutterCoglTexture2dAncestry is export of Mu
  where MutterCoglTexture2d | MutterCoglTextureAncestry;

class Mutter::COGL::Texture2d {
  also does GLib::Roles::Object;
  also does Mutter::COGL::Roles::Texture2d;

  submethod BUILD ( :$mutter-cogl-t2d ) {
    self.setMutterCoglTexture2d($mutter-cogl-t2d)
      if $mutter-cogl-t2d
  }

  method setMutterCoglTexture2d (MutterCoglTexture2dAncestry $_) {
    my $to-parent;

    $!mct2 = do {
      when MutterCoglTexture2d {
        $to-parent = cast(MutterCoglTexture, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglTexture2d, $_);
      }
    }
    self.setMutterCoglTexture($to-parent);
  }

  multi method new (
    MutterCoglTexture2dAncestry  $mutter-cogl-t2d,
                                :$ref              = True
  ) {
    return unless $mutter-cogl-t2d;

    my $o = self.bless( :$mutter-cogl-t2d );
    $o.ref if $ref;
    $o;
  }

}

role Mutter::COGL::Roles::Texture2d::EGL {
  also does Mutter::COGL::Roles::Texture2d;

  method new_from_image (
    Int()                   $width,
    Int()                   $height,
    Int()                   $format,
    EGLImageKHR()           $image,
    Int()                   $flags,
    CArray[Pointer[GError]] $error   = gerror
  )
    is also<new-from-image>
  {
    my gint                    ($w, $h, $r) = ($width, $height);
    my MutterCoglPixelFormat    $f          =  $format;
    my MutterCoglEglImageFlags  $fg         =  $flags;

    clear_error;
    my $mutter-cogl-t2d = cogl_egl_texture_2d_new_from_image(
      $w,
      $h,
      $f,
      $image,
      $fg,
      $error
    );
    set_error($error);

    $mutter-cogl-t2d ?? self.bless( :$mutter-cogl-t2d ) !! Nil
  }

}

# cw: Simple pun. No further code necessary.

class Mutter::COGL::Texture::EGL {
  also does GLib::Roles::Object;
  also does Mutter::COGL::Roles::Texture2d;

}
