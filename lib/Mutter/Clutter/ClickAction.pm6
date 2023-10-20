use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use Mutter::Clutter::Action;

use GLib::Roles::Implementor;
use Mutter::Clutter::Roles::Signals::Generic;
use Mutter::Clutter::Roles::Signals::ClickAction;

class Mutter::Clutter::ClickAction is Mutter::Clutter::Action {
  also does Mutter::Clutter::Roles::Signals::Generic;
  also does Mutter::Clutter::Roles::Signals::ClickAction;

  has MutterClutterClickAction $!mcca is implementor;

  method new (%a) {
    my $mutter-clutter-click = clutter_click_action_new();

    my $o = $mutter-clutter-click
      ?? self.bless( :$mutter-clutter-click )
      !! Nil;
    $o.setAttributes( |%a) if $o && +%a;
    $o;
  }

  # Type: boolean
  method pressed is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pressed', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'pressed does not allow writing'
      }
    );
  }

  # Type: boolean
  method held is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('held', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'held does not allow writing'
      }
    );
  }

  # Type: int
  method long-press-duration is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('long-press-duration', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('long-press-duration', $gv);
      }
    );
  }

  # Type: int
  method long-press-threshold is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('long-press-threshold', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('long-press-threshold', $gv);
      }
    );
  }

  # Is originally:
  # ClutterClickAction *action,  ClutterActor *actor,  ClutterLongPressState state --> gboolean
  method long-press {
    self.connect-long-press($!mcca);
  }

  # Is originally:
  # ClutterClickAction *action,  ClutterActor *actor --> void
  method clicked {
    self.connect-actor($!mcca);
  }

  method get_button {
    clutter_click_action_get_button($!mcca);
  }

  proto method get_coords (|)
  { * }

  multi method get_coords {
    samewith($, $);
  }
  multi method get_coords ($press_x is rw, $press_y is rw) {
    my gfloat ($px, $py) = 0e0 xx 2;

    clutter_click_action_get_coords($!mcca, $px, $py);
    ($press_x, $press_y) = ($px, $py);
  }

  method get_state {
    MutterClutterModifierTypeEnum( clutter_click_action_get_state($!mcca) );
  }

  method release {
    clutter_click_action_release($!mcca);
  }

}


### /usr/src/mutter-42.1/clutter/clutter/clutter-click-action.h

sub clutter_click_action_get_button (MutterClutterClickAction $action)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_click_action_get_coords (
  MutterClutterClickAction $action,
  gfloat                   $press_x is rw,
  gfloat                   $press_y is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_click_action_get_state (MutterClutterClickAction $action)
  returns MutterClutterModifierType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_click_action_new ()
  returns MutterClutterAction
  is native(mutter-clutter)
  is export
{ * }

sub clutter_click_action_release (MutterClutterClickAction $action)
  is native(mutter-clutter)
  is export
{ * }
