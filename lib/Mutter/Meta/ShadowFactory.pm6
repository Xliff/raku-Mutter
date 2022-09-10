use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Meta::ShadowFactory;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

# Predeclaration
class Mutter::Meta::Shadow { ... }

our subset MutterMetaShadowFactoryAncestry is export of Mu
  where MutterMetaShadowFactory | GObject;

class Mutter::Meta::ShadowFactory {
  also does GLib::Roles::Object;

  has MutterMetaShadowFactory $!mms is implementor;

  submethod BUILD ( :$meta-shadow-factory ) {
    self.setMutterMetaShadowFactory($meta-shadow-factory)
      if $meta-shadow-factory
  }

  method setMutterMetaShadowFactory (MutterMetaShadowFactoryAncestry $_) {
    my $to-parent;

    $!mms = do {
      when MutterMetaShadowFactory {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaShadowFactory, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterMetaShadowFactory
    is also<MutterMetaShadowFactory>
  { $!mms }

  multi method new (
    MutterMetaShadowFactoryAncestry  $meta-shadow-factory,
                                    :$ref = True
  ) {
    return unless $meta-shadow-factory;

    my $o = self.bless( :$meta-shadow-factory );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $meta-shadow-factory = meta_shadow_factory_new();

    $meta-shadow-factory ?? self.bless( :$meta-shadow-factory ) !! Nil;
  }

  method get_default is also<get-default> is static {
    my $meta-shadow-factory = meta_shadow_factory_get_default();

    $meta-shadow-factory ?? self.bless( :$meta-shadow-factory ) !! Nil;
  }

  method get_params (
    Str()                    $class_name,
    Int()                    $focused,
    MutterMetaShadowParams() $params
  )
    is also<get-params>
  {
    my gboolean $f = $focused.so.Int;

    meta_shadow_factory_get_params($!mms, $class_name, $f, $params);
  }

  method get_shadow (
    MutterMetaWindowShape()  $shape,
    Int()                    $width,
    Int()                    $height,
    Str()                    $class_name,
    Int()                    $focused,
                            :$raw         = False
  )
    is also<get-shadow>
  {
    my gboolean  $f      =  $focused.so.Int;
    my gint     ($w, $h) = ($width, $height);

    propReturnObject(
      meta_shadow_factory_get_shadow($!mms, $shape, $w, $h, $class_name, $f),
      $raw,
      |Mutter::Meta::Shadow.getTypePair
    )
  }

  method set_params (
    Str()                    $class_name,
    Int()                    $focused,
    MutterMetaShadowParams() $params
  )
    is also<set-params>
  {
    my gboolean  $f = $focused.so.Int;

    meta_shadow_factory_set_params($!mms, $class_name, $f, $params);
  }
}

class Mutter::Meta::Shadow {
  also does GLib::Roles::Implementor;

  has MutterMetaShadow $!mms is implementor;

  submethod BUILD ( :$meta-shadow ) {
    $!mms = $meta-shadow;
  }

  method Mutter::Clutter::Raw::Definitions::MutterMetaShadow
  { $!mms }

  method new (MutterMetaShadow $meta-shadow, :$ref = True) {
    return unless $meta-shadow;

    my $o = self.bless( :$meta-shadow );
    $o.ref if $ref;
    $o;
  }

  method get_bounds (
    Int()                   $window_x,
    Int()                   $window_y,
    Int()                   $window_width,
    Int()                   $window_height,
    cairo_rectangle_int_t() $bounds
  )
    is also<get-bounds>
  {
    my gint ($x, $y, $w, $h) =
      ($window_x, $window_y, $window_width, $window_height);

    meta_shadow_get_bounds($!mms, $x, $y, $w, $h, $bounds);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &meta_shadow_get_type, $n, $t );
  }

  method paint (
    MutterCoglFramebuffer() $framebuffer,
    Int()                   $window_x,
    Int()                   $window_y,
    Int()                   $window_width,
    Int()                   $window_height,
    Int()                   $opacity,
    cairo_region_t()        $clip,
    Int()                   $clip_strictly
  ) {
    my gint8    $o = $opacity;
    my gboolean $c = $clip_strictly.so.Int;

    my gint  ($x, $y, $w, $h) =
      ($window_x, $window_y, $window_width, $window_height);

    meta_shadow_paint($!mms, $framebuffer, $x, $y, $w, $h, $o, $clip, $c);
  }

  method ref {
    meta_shadow_ref($!mms);
    self;
  }

  method unref {
    meta_shadow_unref($!mms);
  }

}
