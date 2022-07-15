use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterClutterCanvasAncestry is export of Mu
  where MutterClutterCanvas | GObject;

class Mutter::Clutter::Canvas {
  also does GLib::Roles::Object;

  has MutterClutterCanvas $!mcc is implementor;

  submethod BUILD ( :$mutter-clutter-canvas ) {
    self.setMutterClutterCanvas($mutter-clutter-canvas)
      if $mutter-clutter-canvas;
  }

  method setMutterClutterCanvas(MutterClutterCanvasAncestry $_) {
    my $to-parent;

    $!mcc = do {
      when MutterClutterCanvas {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterCanvas, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Clutter::Definitions::MutterClutterCanvas
  { $!mcc }

  multi method new (
    MutterClutterCanvasAncestry  $mutter-clutter-canvas,
                                 :$ref                   = True
  ) {
    return Nil unless $mutter-clutter-canvas;

    my $o = self.bless( :$mutter-clutter-canvas );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-canvas = clutter_canvas_new();

    $mutter-clutter-canvas ?? self.bless( :$mutter-clutter-canvas ) !! Nil;
  }

  # Type: int
  method width is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('width', $gv);
      }
    );
  }

  # Type: int
  method height is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('height', $gv);
      }
    );
  }

  # Type: float
  method scale-factor is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('scale-factor', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('scale-factor', $gv);
      }
    );
  }

  method draw {
    self.connect-draw($!mcc);
  }

  method get_scale_factor {
    clutter_canvas_get_scale_factor($!mcc);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_canvas_get_type, $n, $t );
  }

  method set_scale_factor (Num() $scale) {
    my gfloat $s = $scale;

    clutter_canvas_set_scale_factor($!mcc, $s);
  }

  method set_size (Int() $width, Int() $height) {
    my gint ($w, $h) = ($width, $height);

    clutter_canvas_set_size($!mcc, $w, $h);
  }

}


### /usr/src/mutter-42.1/clutter/clutter/clutter-canvas.h

sub clutter_canvas_get_scale_factor (MutterClutterCanvas $canvas)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_canvas_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_canvas_new ()
  returns MutterClutterContent
  is native(mutter-clutter)
  is export
{ * }

sub clutter_canvas_set_scale_factor (
  MutterClutterCanvas $canvas,
  gfloat              $scale
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_canvas_set_size (
  MutterClutterCanvas $canvas,
  gint                $width,
  gint                $height
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }
