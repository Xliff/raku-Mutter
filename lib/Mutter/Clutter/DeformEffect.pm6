use v6.c;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::DeformEffect;

use Mutter::Clutter::Effect;

use GLib::Roles::Implementor;

class Mutter::Clutter::DeformEffect is Mutter::Clutter::Effect {
  has MutterClutterDeformEffect $!mcde is implementor;

  #  Type: uint
  method x-tiles is rw  is g-property {
   my $gv = GLib::Value.new( G_TYPE_UINT );
   Proxy.new(
     FETCH => sub ($) {
       self.prop_get('x-tiles', $gv);
       $gv.uint;
     },
     STORE => -> $, Int() $val is copy {
       $gv.uint = $val;
       self.prop_set('x-tiles', $gv);
     }
   );
  }

  # Type: uint
  method y-tiles is rw  is g-property {
   my $gv = GLib::Value.new( G_TYPE_UINT );
   Proxy.new(
     FETCH => sub ($) {
       self.prop_get('y-tiles', $gv);
       $gv.uint;
     },
     STORE => -> $, Int() $val is copy {
       $gv.uint = $val;
       self.prop_set('y-tiles', $gv);
     }
   );
  }

  # Type: MutterCoglHandle
  method back-material ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::COGL::Handle.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('back-material', $gv);
        propReturnObject(
         $gv.object,
         $raw,
         |Mutter::COGL::Handle.getTypePair
       );
      },
      STORE => -> $, MutterCoglHandle() $val is copy {
        $gv.object = $val;
        self.prop_set('back-material', $gv);
      }
    );
  }

  method get_back_material ( :$raw = False ) {
    propReturnObject(
      clutter_deform_effect_get_back_material($!mcde),
      $raw,
      |Mutter::COGL::Handle.getTypePair
    );
  }

  proto method get_n_tiles (|)
  { * }

  multi method get_n_tiles {
    samewith($, $);
  }
  multi method get_n_tiles ($x_tiles is rw, $y_tiles is rw) {
    my guint ($x, $y) = 0 xx 2;

    clutter_deform_effect_get_n_tiles($!mcde, $x, $y);
    ($x_tiles, $y_tiles) = ($x, $y)
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_deform_effect_get_type, $n, $t );
  }

  method invalidate {
    clutter_deform_effect_invalidate($!mcde);
  }

  method set_back_material (MutterCoglHandle() $material) {
    clutter_deform_effect_set_back_material($!mcde, $material);
  }

  method set_n_tiles (Int() $x_tiles, Int() $y_tiles) {
    my guint ($x, $y) = ($x_tiles, $y_tiles);

    clutter_deform_effect_set_n_tiles($!mcde, $x, $y);
  }

}
