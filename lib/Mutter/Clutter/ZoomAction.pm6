use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use Graphene::Point;
use Mutter::Clutter::Action;

use GLib::Roles::Implementor;

class Mutter::Clutter::Zoom::Action {
  has MutterClutterZoomAction $!mcza is implementor;

  method new {
    my $mutter-clutter-zoom-action = clutter_zoom_action_new();

    $mutter-clutter-zoom-action ?? self.bless( :$mutter-clutter-zoom-action )
                                !! Nil;
  }

  method zoom {
    self.connect-zoom;
  }

  proto method get_focal_point (|)
  { * }

  multi method get_focal_point {
    samewith(Graphene::Point.alloc);
  }
  multi method get_focal_point (graphene_point_t() $point) {
    clutter_zoom_action_get_focal_point($!mcza, $point);
  }

  proto method get_transformed_focal_point (|)
  { * }

  multi method get_transformed_focal_point {
    samewith(Graphene::Point.alloc);
  }
  multi method get_transformed_focal_point (
    graphene_point_t()  $point,
                       :$raw = False
  ) {
    clutter_zoom_action_get_transformed_focal_point($!mcza, $point);
    propReturnObject(
      $point,
      $raw,
      |Graphene::Point.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_zoom_action_get_type, $n, $t );
  }

}


### /usr/src/mutter-42.1/clutter/clutter/clutter-zoom-action.h

sub clutter_zoom_action_get_focal_point (
  MutterClutterZoomAction $action,
  graphene_point_t        $point
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_zoom_action_get_transformed_focal_point (
  MutterClutterZoomAction $action,
  graphene_point_t        $point
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_zoom_action_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_zoom_action_new ()
  returns MutterClutterAction
  is native(mutter-clutter)
  is export
{ * }
