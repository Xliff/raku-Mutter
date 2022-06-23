use v6.c;

use Method::Also;

use Cairo;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Actor;

use Mutter::Clutter::Action;
use Mutter::Clutter::ActorBox;
use Mutter::Clutter::Color;
use Mutter::Clutter::Constraint;
use Mutter::Clutter::Effect;
use Mutter::Clutter::LayoutManager;
use Mutter::Clutter::PaintVolume;
use Mutter::Clutter::Point;
use Mutter::Clutter::Rect;
use Mutter::Clutter::Size;
use Mutter::Clutter::Transition;
use Mutter::Clutter::Vertex;

use GLib::Roles::Object;

use Mutter::Clutter::Roles::Animatable;
use Mutter::Clutter::Roles::Container;
use Mutter::Clutter::Roles::Content;
use Mutter::Clutter::Roles::Scriptable;
use Mutter::Clutter::Roles::Signals::Actor;
use Mutter::Clutter::Roles::Signals::Generic;

our subset MutterClutterActorAncestry is export of Mu
  where MutterClutterAnimatable | MutterClutterContainer |
        MutterClutterScriptable | MutterClutterActor     | GObject;

class Mutter::Clutter::Actor {
  also does GLib::Roles::Object;
  also does Mutter::Clutter::Roles::Animatable;
  also does Mutter::Clutter::Roles::Container;
  also does Mutter::Clutter::Roles::Scriptable;
  also does Mutter::Clutter::Roles::Signals::Actor;
  also does Mutter::Clutter::Roles::Signals::Generic;

  has MutterClutterActor $!mca;

  submethod BUILD (:$mutter-clutter-actor) {
    self.setMutterClutterActor($mutter-clutter-actor)
      if $mutter-clutter-actor;
  }

  method Mutter::Raw::Definitions::MutterClutterActor
    is also<MutterClutterActor>
  { $!mca }

  method setMutterClutterActor (MutterClutterActorAncestry $actor) {
    my $to-parent;
    $!mca = do given $actor {
      when MutterClutterActor      {
        $to-parent = cast(GObject, $_);
        $_;
      }

      when MutterClutterAnimatable { $!mc-anim = $_; proceed; }
      when MutterClutterScriptable { $!mcs     = $_; proceed; }
      when MutterClutterContainer  { $!mc      = $_; proceed; }

      when MutterClutterAnimatable |
           MutterClutterContainer  |
           MutterClutterScriptable
      {
        $to-parent = cast(GObject, $_);
        cast(MutterClutterActor, $_);
      }

      default {
        $to-parent = $_;
        cast(MutterClutterActor, $_);
      }
    }

    self!setObject($to-parent);
    self.roleInit-MutterClutterAnimatable;
    self.roleInit-MutterClutterContainer;
    self.roleInit-MutterClutterScriptable;
  }

  multi method new (
    MutterClutterActorAncestry  $mutter-clutter-actor,
                               :$ref                   = True
  ) {
    return Nil unless $mutter-clutter-actor;

    my $o = self.bless( :$mutter-clutter-actor );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-actor = clutter_actor_new();

    $mutter-clutter-actor ?? self.bless( :$mutter-clutter-actor ) !! Nil;
  }

  # Is originally:
  #   MutterClutterActor,
  #   MutterClutterActorBox,
  #   MutterClutterAllocationFlags,
  #   gpointer
  #   --> void
  method allocation-changed is also<allocation_changed> {
    self.connect-allocation-changed($!mca);
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method button-press-event is also<button_press_event> {
    self.connect-clutter-event($!mca, 'button-press-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method button-release-event is also<button_release_event> {
    self.connect-clutter-event($!mca, 'button-release-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method captured-event is also<captured_event> {
    self.connect-clutter-event($!mca, 'captured-event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method destroy {
    self.connect($!mca, 'destroy');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method enter-event is also<enter_event> {
    self.connect-clutter-event($!mca, 'enter-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method event {
    self.connect-clutter-event($!mca, 'event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method hide {
    self.connect($!mca, 'hide');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method key-focus-in is also<key_focus_in> {
    self.connect($!mca, 'key-focus-in');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method key-focus-out is also<key_focus_out> {
    self.connect($!mca, 'key-focus-out');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method key-press-event is also<key_press_event> {
    self.connect-clutter-event($!mca, 'key-press-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method key-release-event is also<key_release_event> {
    self.connect-clutter-event($!mca, 'key-release-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method leave-event is also<leave_event> {
    self.connect-clutter-event($!mca, 'leave-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method motion-event is also<motion_event> {
    self.connect-clutter-event($!mca, 'motion-event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method paint {
    self.connect($!mca, 'paint');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterActor, gpointer --> void
  method parent-set is also<parent_set> {
    self.connect-parent-set($!mca);
  }

  # Is originally:
  # MutterClutterActor, MutterClutterColor, gpointer --> void
  method pick {
    self.connect-pick($!mca);
  }

  # Is originally:
  # void, void
  method queue-redraw {
    self.connect($!mca, 'queue-redraw');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method queue-relayout is also<queue_relayout> {
    self.connect($!mca, 'queue-relayout');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method realize {
    self.connect($!mca, 'realize');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method scroll-event is also<scroll_event> {
    self.connect-clutter-event($!mca, 'scroll-event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method show {
    self.connect($!mca, 'show');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method touch-event is also<touch_event> {
    self.connect-clutter-event($!mca, 'touch-event');
  }

  # Is originally:
  # MutterClutterActor, gchar, gboolean, gpointer --> void
  method transition-stopped is also<transition_stopped> {
    self.connect-transition-stopped($!mca);
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method transitions-completed is also<transitions_completed> {
    self.connect($!mca, 'transitions-completed');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method unrealize {
    self.connect($!mca, 'unrealize');
  }

  method opacity is rw {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_opacity($!mca);
      },
      STORE => sub ($, Int() $opacity is copy) {
        my guint8 $o = $opacity;

        clutter_actor_set_opacity($!mca, $o);
      }
    );
  }

  method opacity-override is rw is also<opacity_override> {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_opacity_override($!mca);
      },
      STORE => sub ($, Int() $opacity is copy) {
        my gint $o = $opacity;

        clutter_actor_set_opacity_override($!mca, $o);
      }
    );
  }

  method pivot-point-z is rw is also<pivot_point_z> {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_pivot_point_z($!mca);
      },
      STORE => sub ($, $pivot_z is copy) {
        clutter_actor_set_pivot_point_z($!mca, $pivot_z);
      }
    );
  }

  method reactive is rw {
    Proxy.new(
      FETCH => sub ($) {
        so clutter_actor_get_reactive($!mca);
      },
      STORE => sub ($, Int() $reactive is copy) {
        my gboolean $r = $reactive.so.Int;

        clutter_actor_set_reactive($!mca, $r);
      }
    );
  }

  method request_mode is rw is also<request-mode> {
    Proxy.new(
      FETCH => sub ($) {
        ClutterRequestModeEnum( clutter_actor_get_request_mode($!mca) );
      },
      STORE => sub ($, Int() $mode is copy) {
        my guint $m = $mode;

        clutter_actor_set_request_mode($!mca, $m);
      }
    );
  }

  method scale_z is rw is also<scale-z> {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_scale_z($!mca);
      },
      STORE => sub ($, $scale_z is copy) {
        clutter_actor_set_scale_z($!mca, $scale_z);
      }
    );
  }

  method text_direction is rw is also<text-direction> {
    Proxy.new(
      FETCH => sub ($) {
        ClutterTextDirectionEnum( clutter_actor_get_text_direction($!mca) );
      },
      STORE => sub ($, Int() $text_dir is copy) {
        my guint $d = $text_dir;
        clutter_actor_set_text_direction($!mca, $d);
      }
    );
  }

  method width is rw {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_width($!mca);
      },
      STORE => sub ($, Num() $width is copy) {
        my gfloat $w = $width;

        clutter_actor_set_width($!mca, $w);
      }
    );
  }

  method x is rw {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_x($!mca);
      },
      STORE => sub ($, Num() $x is copy) {
        my gfloat $xx = $x;

        clutter_actor_set_x($!mca, $xx);
      }
    );
  }

  method x-align is rw is also<x_align> {
    Proxy.new(
      FETCH => sub ($) {
        ClutterActorAlignEnum( clutter_actor_get_x_align($!mca) );
      },
      STORE => sub ($, Int() $x_align is copy) {
        my ClutterActorAlign $xa = $x_align;

        clutter_actor_set_x_align($!mca, $xa);
      }
    );
  }

  method x-expand is rw is also<x_expand> {
    Proxy.new(
      FETCH => sub ($) {
        so clutter_actor_get_x_expand($!mca);
      },
      STORE => sub ($, Int() $expand is copy) {
        my gboolean $e = $expand.so.Int;

        clutter_actor_set_x_expand($!mca, $expand);
      }
    );
  }

  method y is rw {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_y($!mca);
      },
      STORE => sub ($, Num() $y is copy) {
        my gfloat $yy = $y;

        clutter_actor_set_y($!mca, $yy);
      }
    );
  }

  method y-align is rw is also<y_align> {
    Proxy.new(
      FETCH => sub ($) {
        ClutterActorAlignEnum( clutter_actor_get_y_align($!mca) );
      },
      STORE => sub ($, Int() $y_align is copy) {
        my ClutterActorAlign $ya = $y_align;

        clutter_actor_set_y_align($!mca, $ya);
      }
    );
  }

  method y-expand is rw is also<y_expand> {
    Proxy.new(
      FETCH => sub ($) {
        so clutter_actor_get_y_expand($!mca);
      },
      STORE => sub ($, Int() $expand is copy) {
        my gboolean $e = $expand.so.Int;

        clutter_actor_set_y_expand($!mca, $expand);
      }
    );
  }

  method z-position is rw is also<z_position> {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_z_position($!mca);
      },
      STORE => sub ($, Num() $z_position is copy) {
        my gfloat $z = $z_position;

        clutter_actor_set_z_position($!mca, $z_position);
      }
    );
  }

  # Type: ClutterAction
  method actions is rw  {
    my GLib::Value $gv .= new( Mutter::Clutter::Action.get_type );
    Proxy.new(
      FETCH => sub ($) {
        warn "'actions' does not allow reading" if $DEBUG;
        0;
      },
      STORE => -> $, ClutterAction() $val is copy {
        $gv.object = $val;
        self.prop_set('actions', $gv);
      }
    );
  }

  # Type: MutterClutterActorBox
  method allocation (:$raw = False) is rw  {
    my GLib::Value $gv .= new( Mutter::Clutter::ActorBox.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allocation', $gv);

        propReturnObject(
          $gv.boxed,
          $raw,
          |Mutter::Clutter::ActorBox.getTypePair
        )
      },
      STORE => -> $, $val is copy {
        warn "'allocation' does not allow writing"
      }
    );
  }

  method background-color is rw is also<background_color> {
    Proxy.new:
      FETCH => sub ($)    { self.get-background-color      },
      STORE => -> $, \val { self.set-background-color(val) };
  }

  # Type: gboolean
  method background-color-set is rw is also<background_color_set> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('background-color-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn "'background-color-set' does not allow writing" if $DEBUG;
      }
    );
  }

  # Type: ClutterMatrix
  method child-transform is rw is also<child_transform> {
    my GLib::Value $gv .= new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('child-transform', $gv);

        propReturnObject($gv.pointer, True, MutterClutterMatrix);
      },
      STORE => -> $, ClutterMatrix() $val is copy {
        $gv.pointer = $val;
        self.prop_set('child-transform', $gv);
      }
    );
  }

  # Type: gboolean
  method child-transform-set is rw is also<child_transform_set> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('child-transform-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn "'child-transform-set' does not allow writing" if $DEBUG;
      }
    );
  }

  # Type: MutterClutterRect
  method clip-rect is rw is also<clip_rect> {
    my GLib::Value $gv .= new( Mutter::Clutter::Rect.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('clip-rect', $gv);
        propReturnObject($gv.boxed, True, MutterClutterRect);
      },
      STORE => -> $, MutterClutterRect() $val is copy {
        $gv.boxed = $val;
        self.prop_set('clip-rect', $gv);
      }
    );
  }

  # Type: gboolean
  method clip-to-allocation is rw is also<clip_to_allocation> {
    Proxy.new:
      FETCH => sub ($)          { self.get-clip-to-allocation },
      STORE => -> $, Int() \val { self.set-clip-to-allocation(val) };
  }

  # Type: ClutterContent
  method content is rw  {
    Proxy.new:
      FETCH => sub ($)                     { self.get_content },
      STORE => -> $, ClutterContent() \val { self.set_content(val) };
  }

  # Type: ClutterActorBox
  method content-box ( :$raw = False ) is rw is also<content_box> {
    my GLib::Value $gv .= new( Mutter::Clutter::ActorBox.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('content-box', $gv);

        propReturnObject(
          $gv.boxed,
          $raw,
          |Mutter::Clutter::ActorBox.getTypePair
        );
      },
      STORE => -> $, $val is copy {
        warn "'content-box' does not allow writing";
      }
    );
  }

  # Type: ClutterContentGravity
  method content-gravity is rw is also<content_gravity> {
    Proxy.new:
      FETCH => sub ($)          { self.get-content-gravity },
      STORE => -> $, Int() \val { self.set-content-gravity(val) };
  }

  # Type: ClutterContentRepeat
  method content-repeat is rw is also<content_repeat> {
    Proxy.new:
      FETCH => sub ($)          { self.get-content-repeat },
      STORE => -> $, Int() \val { self.set-content-repeat(val) };
  }

  method easing_delay is rw is also<easing-delay> {
    Proxy.new:
      FETCH => sub ($)          { self.get-easing-delay },
      STORE => -> $, Int() \val { self.set-easing-delay(val) };
  }

  method easing-duration is rw is also<easing_duration> {
    Proxy.new:
      FETCH => sub ($)          { self.get-easing-duration },
      STORE => -> $, Int() \val { self.set-easing-duration(val) };
  }

  method easing-mode is rw is also<easing_mode> {
    Proxy.new:
      FETCH => sub ($)          { self.get-easing-mode },
      STORE => -> $, Int() \val { self.set-easing-mode(val) };
  }

  # Type: ClutterEffect
  method effect is rw  {
    my GLib::Value $gv .= new( Mutter::Clutter::Effect.get_type );
    Proxy.new(
      FETCH => sub ($) {
        warn "'effect' does not allow reading" if $DEBUG;
        0;
      },
      STORE => -> $, ClutterEffect() $val is copy {
        $gv.object = $val;
        self.prop_set('effect', $gv);
      }
    );
  }

  # Type: gboolean
  method fixed-position-set is rw is also<fixed_position_set> {
    Proxy.new:
      FETCH => sub ($)          { self.get-fixed-position-set };
      STORE => -> $, Int() \val { self.set-fixed-position-set(val) };
  }

  # Type: gfloat
  method fixed-x is rw is also<fixed_x> {
    my GLib::Value $gv .= new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fixed-x', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('fixed-x', $gv);
      }
    );
  }

  # Type: gfloat
  method fixed-y is rw is also<fixed_y> {
    my GLib::Value $gv .= new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fixed-y', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('fixed-y', $gv);
      }
    );
  }

  # Type: gfloat
  method height is rw {
    Proxy.new:
      FETCH => sub ($)          { self.get-height },
      STORE => -> $, Num() \val { self.set-height(val) };
  }

  # Type: ClutterLayoutManager
  method layout-manager (:$raw = False) is rw is also<layout_manager> {
    Proxy.new:
      FETCH => sub ($) {
        self.get-layout-manager(:$raw);
      },
      STORE => -> $, ClutterLayoutManager() \val {
        self.set-layout-manager(val)
      };
  }

  # Type: ClutterScalingFilter
  method magnification-filter is rw is also<magification_filter> {
    my GLib::Value $gv .= new( Mutter::Raw::Enums.scaling_filter_get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('magnification-filter', $gv);
        ClutterScalingFilterEnum( $gv.enum );
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('magnification-filter', $gv);
      }
    );
  }

  # Type: gboolean
  method mapped is rw  {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('mapped', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn "'mapped' does not allow writing"
      }
    );
  }

  method margins is rw {
    Proxy.new:
      FETCH => sub ($) {
        (
          self.margin-top,
          self.margin-left,
          self.margin-right,
          self.margin-bottom
        )
      },
      STORE => -> $, Num() $val {
        my gfloat $v = $val;
        (
          self.margin-top,
          self.margin-left,
          self.margin-right,
          self.margin-bottom
        ) = $val xx 4;
      }
  }

  # Type: gfloat
  method margin-bottom is rw is also<margin_bottom> {
    Proxy.new:
      FETCH => sub ($)          { self.get-margin-bottom },
      STORE => -> $, Num() \val { self.set-margin-bottom(val) };
  }

  # Type: gfloat
  method margin-left is rw is also<margin_left> {
    Proxy.new:
      FETCH => sub ($)          { self.get-margin-left },
      STORE => -> $, Num() \val { self.set-margin-left(val) };
  }

  # Type: gfloat
  method margin-right is rw is also<margin_right> {
  Proxy.new:
    FETCH => sub ($)          { self.get-margin-right },
    STORE => -> $, Num() \val { self.set-margin-right(val) };
  }

  # Type: gfloat
  method margin-top is rw is also<margin_top> {
    Proxy.new:
      FETCH => sub ($)          { self.get-margin-top },
      STORE => -> $, Num() \val { self.set-margin-top(val) };
  }

  # Type: gfloat
  method min-height is rw is also<min_height> {
    my GLib::Value $gv .= new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-height', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('min-height', $gv);
      }
    );
  }

  # Type: gboolean
  method min-height-set is rw is also<min_height_set> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-height-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('min-height-set', $gv);
      }
    );
  }

  # Type: gfloat
  method min-width is rw is also<min_width> {
    my GLib::Value $gv .= new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-width', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('min-width', $gv);
      }
    );
  }

  # Type: gboolean
  method min-width-set is rw is also<min_width_set> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-width-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('min-width-set', $gv);
      }
    );
  }

  # Type: ClutterScalingFilter
  method minification-filter is rw is also<minification_filter> {
    my GLib::Value $gv .= new( Mutter::Raw::Enums.scaling_filter_get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('minification-filter', $gv);
        ClutterScalingFilterEnum( $gv.enum );
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('minification-filter', $gv);
      }
    );
  }

  # Type: gchar
  method name is rw  {
    Proxy.new:
      FETCH => sub ($)          { self.get-name },
      STORE => -> $, Str() $val { self.set-name($val) };
  }

  # Type: gfloat
  method natural-height is rw is also<natural_height> {
    my GLib::Value $gv .= new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('natural-height', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('natural-height', $gv);
      }
    );
  }

  # Type: gboolean
  method natural-height-set is rw is also<natural_height_set> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('natural-height-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('natural-height-set', $gv);
      }
    );
  }

  # Type: gfloat
  method natural-width is rw is also<natural_width> {
    my GLib::Value $gv .= new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('natural-width', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('natural-width', $gv);
      }
    );
  }

  # Type: gboolean
  method natural-width-set is rw is also<natural_width_set> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('natural-width-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('natural-width-set', $gv);
      }
    );
  }

  # Type: ClutterOffscreenRedirect
  method offscreen-redirect is rw is also<offscreen_redirect> {
    Proxy.new:
      FETCH => sub ($)          { self.get-offscreen-redirect },
      STORE => -> $, Num() \val { self.set-offscreen-redirect(val) };
  }

  # Type: ClutterPoint
  method pivot-point is rw is also<pivot_point> {
    my GLib::Value $gv .= new( Mutter::Clutter::Point.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pivot-point', $gv);
        propReturnObject($gv.boxed, True, MutterClutterPoint);
      },
      STORE => -> $, MutterClutterPoint() $val is copy {
        $gv.boxed = $val;
        self.prop_set('pivot-point', $gv);
      }
    );
  }

  # Type: ClutterPoint
  method position is rw  {
    my GLib::Value $gv .= new( Mutter::Clutter::Point.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('position', $gv);
        propReturnObject($gv.boxed, True, MutterClutterPoint);
      },
      STORE => -> $, MutterClutterPoint() $val is copy {
        $gv.boxed = $val;
        self.prop_set('position', $gv);
      }
    );
  }

  # Type: gboolean
  method realized is rw  {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('realized', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn "realized does not allow writing"
      }
    );
  }

  # Type: gdouble
  method rotation-angle-x is rw is also<rotation_angle_x> {
    my GLib::Value $gv .= new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation-angle-x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation-angle-x', $gv);
      }
    );
  }

  # Type: gdouble
  method rotation-angle-y is rw is also<rotation_angle_y> {
    my GLib::Value $gv .= new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation-angle-y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation-angle-y', $gv);
      }
    );
  }

  # Type: gdouble
  method rotation-angle-z is rw is also<rotation_angle_z> {
    my GLib::Value $gv .= new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation-angle-z', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation-angle-z', $gv);
      }
    );
  }

  # Type: ClutterVertex
  method rotation-center-x (:$raw = False) is rw is also<rotation_center_x>
    is DEPRECATED( 'pivot-point' )
  {
    my GLib::Value $gv .= new( Mutter::Clutter::Vertex.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation-center-x', $gv);

        propReturnObject(
          $gv.boxed,
          $raw,
          |Mutter::Clutter::Vertex.getTypePair
        );
      },
      STORE => -> $, ClutterVertex() $val is copy {
        $gv.boxed = $val;
        self.prop_set('rotation-center-x', $gv);
      }
    );
  }

  # Type: gdouble
  method scale-x is rw is also<scale_x> {
    my GLib::Value $gv .= new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('scale-x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('scale-x', $gv);
      }
    );
  }

  # Type: gdouble
  method scale-y is rw is also<scale_y> {
    my GLib::Value $gv .= new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('scale-y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('scale-y', $gv);
      }
    );
  }

  # Type: gboolean
  method show-on-set-parent is rw is also<show_on_set_parent> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('show-on-set-parent', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-on-set-parent', $gv);
      }
    );
  }

  # Type: ClutterSize
  method size (:$raw = False) is rw  {
    my GLib::Value $gv .= new( Mutter::Clutter::Size.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('size', $gv);

        propReturnObject(
          $gv.boxed,
          $raw,
          |Mutter::Clutter::Size.getTypePair
        );
      },
      STORE => -> $, ClutterSize() $val is copy {
        $gv.boxed = $val;
        self.prop_set('size', $gv);
      }
    );
  }

  # Type: gboolean
  method transform-set is rw is also<transform_set> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('transform-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn "transform-set does not allow writing"
      }
    );
  }

  # Type: gfloat
  method translation-x is rw is also<translation_x> {
    my GLib::Value $gv .= new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('translation-x', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('translation-x', $gv);
      }
    );
  }

  # Type: gfloat
  method translation-y is rw is also<translation_y> {
    my GLib::Value $gv .= new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('translation-y', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('translation-y', $gv);
      }
    );
  }

  # Type: gfloat
  method translation-z is rw is also<translation_z> {
    my GLib::Value $gv .= new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('translation-z', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('translation-z', $gv);
      }
    );
  }

  # Type: gboolean
  method visible is rw  {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('visible', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('visible', $gv);
      }
    );
  }

  method add_child (MutterClutterActor() $child) {
    clutter_actor_add_child($!mca, $child);
  }

  method add_transition (Str $name, MutterClutterTransition() $transition) {
    clutter_actor_add_transition($!mca, $name, $transition);
  }

  method allocate (MutterClutterActorBox() $box) {
    clutter_actor_allocate($!mca, $box);
  }

  method allocate_align_fill (
    MutterClutterActorBox() $box,
    Num()                   $x_align,
    Num()                   $y_align,
    Int()                   $x_fill,
    Int()                   $y_fill,
  )
    is also<allocate-align-fill>
  {
    my gdouble ($xa, $ya)  = ($x_align, $y_align);
    my gboolean ($xf, $yf) = ($x_fill, $y_fill).map( *.so.Int);

    clutter_actor_allocate_align_fill($!mca, $box, $xa, $ya, $xf, $yf);
  }

  method allocate_available_size (
    Num() $x,
    Num() $y,
    Num() $available_width,
    Num() $available_height
  )
    is also<allocate-available-size>
  {
    my gfloat ($xx, $yy, $aw, $ah)
      = ($x, $y, $available_width, $available_height);

    clutter_actor_allocate_available_size($!mca, $xx, $yy, $aw, $ah, $f);
  }

  method allocate_preferred_size (Num() $x, Num() $y) {
    my gfloat ($xx, $yy);

    clutter_actor_allocate_preferred_size($!mca, $xx, $yy);
  }

  method apply_relative_transform_to_point (
    MutterClutterActor() $ancestor,
    graphene_point3d_t() $point,
    graphene_point3d_t() $vertex
  )
    is also<apply-relative-transform-to-point>
  {
    clutter_actor_apply_relative_transform_to_point(
      $!mca,
      $ancestor,
      $point,
      $vertex
    );
  }

  method apply_transform_to_point (
    graphene_point3d_t() $point,
    graphene_point3d_t() $vertex
  )
    is also<apply-transform-to-point>
  {
    clutter_actor_apply_transform_to_point($!mca, $point, $vertex);
  }

  method bind_model (
    GListModel() $model,
                 &create_child_func,
    gpointer     $user_data          = gpointer,
                 &notify             = $DEFAULT-GDESTROY-NOTIFY
  )
    is also<bind-model>
  {
    clutter_actor_bind_model(
      $!mca,
      $model,
      $create_child_func,
      $user_data,
      $notify
    );
  }

  method bind_model_with_properties (
    GListModel() $model,
    Int()        $child_type,
    Str()        $first_model_property
  )
    is also<bind-model-with-properties>
  {
    my GType $c = $child_type;

    # May require a helper func!
    clutter_actor_bind_model_with_properties(
      $!mca,
      $model,
      $child_type,
      $first_model_property
    );
  }

  method contains (MutterClutterActor() $descendant) {
    clutter_actor_contains($!mca, $descendant);
  }

  method continue_paint (MutterClutterPaintContext() $paint_context)
    is also<continue-paint>
  {
    clutter_actor_continue_paint($!mca, $paint_context);
  }

  method continue_pick (MutterClutterPickContext() $pick_context)
    is also<continue-pick>
  {
    clutter_actor_continue_pick($!mca, $pick_context);
  }

  method create_pango_context ( :$raw = False )
    is also<create-pango-context>
  {
    propReturnObject(
      clutter_actor_create_pango_context($!mca),
      $raw,
      |Pango::Context.getTypePair
    );
  }

  method create_pango_layout (Str() $text, :$raw = False)
    is also<create-pango-layout>
  {
    propReturnObject(
      clutter_actor_create_pango_layout($!mca, $text),
      $raw,
      |Pango::Context.getTypePair
    );
  }

  method destroy {
    clutter_actor_destroy($!mca);
  }

  method destroy_all_children is also<destroy-all-children> {
    clutter_actor_destroy_all_children($!mca);
  }

  method emit-event (MutterCluttserEvent() $event, Int() $capture)
    is also<emit_event>
  {
    my gboolean $c = $capture.so.Int;

    clutter_actor_event($!mca, $event, $capture);
  }

  method get_abs_allocation_vertices (graphene_point3d_t $verts) {
    clutter_actor_get_abs_allocation_vertices($!mca, $verts);
  }

  method get_accessible ( :$raw = False ) is also<get-accessible> {
    propReturnObject(
      clutter_actor_get_accessible($!mca),
      $raw,
      |ATK::Object.getTypePair
    );
  }

  method get_allocation_box (MutterClutterActorBox() $box) {
    clutter_actor_get_allocation_box($!mca, $box);
  }

  proto method get_background_color (|)
    is also<get-background-color>
  { * }

  multi method get_background_color ( :$raw = False ) {
    samewith($, :$raw);
  }
  multi method get_background_color ($color is rw, :$raw = False) {
    $color = ClutterColor.new;

    clutter_actor_get_background_color($!mca, $color);

    propReturnObject($color, $raw, |Mutter::Clutter::Color.getTypePair)
  }

  method get_child_at_index (Int() $index)
    is also<get-child-at-index>
  {
    my gint $i = $index;

    propReturnObject(
      clutter_actor_get_child_at_index($!mca, $i),
      $raw,
      |self.getTypePair
    )
  }

  # ...

  method get_child_transform (graphene_matrix_t() $transform) {
    clutter_actor_get_child_transform($!mca, $transform);
  }

  method get_children :$glist = False, :$raw = False)
    is also<
      get-children
      children
    >
  {
    returnGList(
      clutter_actor_get_children($!mca),
      $raw,
      $glist,
      |self.getTypePair`
    );
  }

  proto method get_clip (|)
    is also<get-clip>
  { * }

  multi method get_clip {
    samewith($, $, $, $);
  }
  multi method get_clip (
    $xoff   is rw,
    $yoff   is rw,
    $width  is rw,
    $height is rw
  ) {
    my num32 ($xo, $yo, $w, $h) = 0e0 xx 4;

    clutter_actor_get_clip($!mca, $xo, $yo, $w, $h);
    ($xoff, $yoff, $width, $height) = ($xo, $yo, $w, $h);
  }

  method get_clip_to_allocation
    is also<get-clip-to-allocation>
  {
    clutter_actor_get_clip_to_allocation($!mca);
  }

  method get_content is also<get-content> {
    Mutter::Clutter:Content.new(
      clutter_actor_get_content($!mca)
    );
  }

  method get_content_box (ClutterActorBox() $box) is also<get-content-box> {
    clutter_actor_get_content_box($!mca, $box);
  }

  method get_content_gravity is also<get-content-gravity> {
    MutterClutterContentGravityEnum( clutter_actor_get_content_gravity($!mca) );
  }

  method get_content_repeat is also<get-content-repeat> {
    MutterClutterContentRepeatEnum( clutter_actor_get_content_repeat($!mca) );
  }

  method get_content_scaling_filters (
    MutterClutterScalingFilter() $min_filter,
    MutterClutterScalingFilter() $mag_filter
  )
    is also<get-content-scaling-filters>
  {
    clutter_actor_get_content_scaling_filters($!mca, $min_filter, $mag_filter);
  }

  method get_default_paint_volume (:$raw = False)
    is also<
      get-default-paint-volume
      default_paint_volume
      default-paint-volume
    >
  {
    propReturnObject(
      clutter_actor_get_default_paint_volume($!mca),
      $raw,
      |Mutter::Clutter::PaintVolume.getTypePair
    );
  }

  method get_easing_delay is also<get-easing-delay> {
    clutter_actor_get_easing_delay($!mca);
  }

  method get_easing_duration is also<get-easing-duration> {
    clutter_actor_get_easing_duration($!mca);
  }

  method get_easing_mode is also<get-easing-mode> {
    MutterClutterAnimationModeEnum( clutter_actor_get_easing_mode($!mca) );
  }

  method get_first_child (:$raw = False)
    is also<
      get-first-child
      first_child
      first-child
    >
  {
    propReturnObject(
      clutter_actor_get_first_child($!mca),
      $raw,
      |self.getTypePair
    );
  }

  method get_fixed_position (gfloat $x is rw, gfloat $y is rw) {
    clutter_actor_get_fixed_position($!mca, $x is rw, $y is rw);
  }

  method get_fixed_position_set is also<get-fixed-position-set> {
    clutter_actor_get_fixed_position_set($!mca);
  }

  method get_flags
    is also<
      get-flags
      flags
    >
  {
    ClutterActorFlagsEnum( clutter_actor_get_flags($!mca);
  }

  method get_height is also<get-height> {
    clutter_actor_get_height($!mca);
  }

  method get_last_child (:$raw = False)
    is also<
      get-last-child
      last_child
      last-child
    >
  {
    propReturnObject(
      clutter_actor_get_last_child($!mca),
      $raw,
      |self.getTypePair
    );
  }

  method get_layout_manager(:$raw = False) is also<get-layout-manager> {
    propReturnObject(
      clutter_actor_get_layout_manager($!mca),
      $raw,
      |Mutter::Clutter::LayoutManager.getTypePair
    );
  }

  method get_margin (MutterClutterMargin() $margin) is also<get-margin> {
    clutter_actor_get_margin($!mca, $margin);
  }

  method get_margin_bottom is also<get-margin-bottom> {
    clutter_actor_get_margin_bottom($!mca);
  }

  method get_margin_left is also<get-margin-left> {
    clutter_actor_get_margin_left($!mca);
  }

  method get_margin_right is also<get-margin-right> {
    clutter_actor_get_margin_right($!mca);
  }

  method get_margin_top is also<get-margin-top> {
    clutter_actor_get_margin_top($!mca);
  }

  method get_n_children
    is also<
      get-n-children
      n_children
      n-children
      elems
    >
  {
    clutter_actor_get_n_children($!mca);
  }

  method get_name is also<get-name> {
    clutter_actor_get_name($!mca);
  }

  method get_next_sibling (:$raw = False)
    is also<
      get-next-sibling
      next_sibling
      next-sibling
    >
  {
    propReturnObject(
      clutter_actor_get_next_sibling($!mca),
      $raw,
      |self.getTypePair
    );
  }

  method get_offscreen_redirect is also<get-offscreen-redirect> {
    ClutterOffscreenRedirectEnum(
      clutter_actor_get_offscreen_redirect($!mca)
    );
  }

  method get_opacity {
    clutter_actor_get_opacity($!mca);
  }

  method get_opacity_override {
    clutter_actor_get_opacity_override($!mca);
  }

  method get_paint_box (MutterClutterActorBox() $box) {
    clutter_actor_get_paint_box($!mca, $box);
  }

  method get_paint_opacity
    is also<
      get-paint-opacity
      paint_opacity
      paint-opacity
    >
  {
    clutter_actor_get_paint_opacity($!mca);
  }

  method get_paint_visibility
    is also<
      get-paint-visibility
      paint_visibility
      paint-visibility
    >
  {
    clutter_actor_get_paint_visibility($!mca);
  }

  method get_paint_volume (:$raw = False)
    is also<
      get-paint-volume
      paint_volume
      paint-volume
    >
  {
    propReturnObject(
      clutter_actor_get_paint_volume($!mca),
      $raw,
      |Mutter::Clutter::PaintVolume.getTypePair
    );
  }

  method get_pango_context (:$raw = False)
    is also<
      get-pango-context
      pango_context
      pango-context
    >
  {
    propReturnObject(
      clutter_actor_get_pango_context($!mca),
      $raw,
      |Pango::Context.getTypePair
    );
  }

  method get_parent (:$raw = False)
    is also<
      get-parent
      parent
    >
  {
    propReturnObject(
      clutter_actor_get_parent($!mca),
      $raw,
      |self.getTypePair
    );
  }

  multi method get_pivot_point {
    samewith($, $);
  }
  multi method get_pivot_point ($pivot_x is rw, $pivot_y is rw)
    is also<get-pivot-point>
  {
    my gfloat ($px, $py) = 0e0 xx 2;

    clutter_actor_get_pivot_point($!mca, $px, $py);
    ($pivot_x, $pivot_y) = ($px, $py);
  }

  method get_pivot_point_z is also<get-pivot-point-z> {
    clutter_actor_get_pivot_point_z($!mca);
  }

  proto method get_position (|)
      is also<get-position>
    { * }

  multi method get_position {
    samewith($, $);
  }
  multi method get_position ($x is rw, $y is rw) {
    my gfloat ($xx, $yy) = 0e0 xx 2;

    clutter_actor_get_position($!mca, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  proto method get_preferred_height (|)
    is also<get-preferred-height>
  { * }

  multi method get_preferred_height (Num() $for_width) {
    samewith($for_width, $, $);
  }
  multi method get_preferred_height (
    Num() $for_width,
          $min_height_p     is rw,
          $natural_height_p is rw
  ) {
    my gfloat ($fw, $mh, $nh) = ($for_width, 0e0, 0e0);

    clutter_actor_get_preferred_height($!mca, $fw, $mh, $nh);
    ($min_height_p, $natural_height_p) = ($mh, $nh);
  }

  proto method get_preferred_size (|)
    is also<get-preferred-size>
  { * }

  multi method get_preferred_size {
    samewith($, $, $, $);
  }
  multi method get_preferred_size (
    $min_width_p      is rw,
    $min_height_p     is rw,
    $natural_width_p  is rw,
    $natural_height_p is rw
  ) {
    my gfloat ($mw, $mh, $nw, $nh) = 0e0 xx 4;

    clutter_actor_get_preferred_size($!mca, $mw, $mh, $nw, $nh);
    ($min_width_p, $min_height_p, $natural_width_p, $natural_height_p) =
      ($mw, $mh, $nw, $nh);
  }

  proto method get_preferred_width (|)
    is also<get-preferred-width>
  { * }

  multi method get_preferred_width (Num() $for_height) {
    samewith($for_height, $, $);
  }
  multi method get_preferred_width (
    Num() $for_height,
    $min_width_p       is rw,
    $natural_width_p   is rw
  ) {
    my ($fh, $mw, $nw) = ($fh, 0e0, 0e0);

    clutter_actor_get_preferred_width($!mca, $fh, $mw, $nw);
    ($min_width_p, $natural_width_p) = ($mw, $nw);
  }

  method get_previous_sibling (:$raw = False)
    is also<
      get-previous-sibling
      previous_sibling
      previous-sibling
    >
  {
    propReturnObject(
      clutter_actor_get_previous_sibling($!mca),
      $raw,
      |self.getTypePair
    );
  }

  method get_reactive {
    so clutter_actor_get_reactive($!mca);
  }

  method get_request_mode {
    MutterClutterRequestModeEnum( clutter_actor_get_request_mode($!mca) );
  }

  method get_resource_scale {
    clutter_actor_get_resource_scale($!mca);
  }

  method get_rotation_angle (
    Int() $axis # ClutterRotateAxis $axis
  )
    is also<get-rotation-angle>
  {
    my guint $a = $axis;

    clutter_actor_get_rotation_angle($!mca, $a);
  }

  proto method get_scale (|)
    is also<get-scale>
  { * }

  multi method get_scale {
    samewith($, $);
  }
  multi method get_scale (
    $scale_x is rw,
    $scale_y is rw
  ) {
    my gdouble ($sx, $sy) = 0e0 xx 2;

    clutter_actor_get_scale($!mca, $sx, $sy);
    ($scale_x, $scale_y) = ($sx, $sy);
  }

  method get_scale_z is also<get-scale-z> {
    clutter_actor_get_scale_z($!mca);
  }

  proto method get_size (|)
    is also<get-size>
  { * }

  multi method get_size {
    samewith($, $);
  }
  multi method get_size (
    $width  is rw,
    $height is rw
  ) {
    my gfloat ($w, $h) = 0e0 xx 2;

    clutter_actor_get_size($!mca, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_stage (:$raw = False)
    is also<
      get-stage
      stage
    >
  {
    propReturnObject(
      clutter_actor_get_stage($!mca),
      $raw,
      |Mutter::Clutter::Stage.getTypePair
    );
  }

  method get_text_direction {
    MutterClutterTextDirectionEnum(
      clutter_actor_get_text_direction($!mca)
    );
  }

  method get_transform (graphene_matrix_t $transform) {
    clutter_actor_get_transform($!mca, $transform);
  }

  method get_transformed_extents (graphene_rect_t $rect) {
    clutter_actor_get_transformed_extents($!mca, $rect);
  }

  method get_transformed_paint_volume (
    MutterClutterActor()  $relative_to_ancestor,
                         :$raw                   = False
  )
    is also<get-transformed-paint-volume>
  {
    propReturnObject(
      clutter_actor_get_transformed_paint_volume(
        $!mca,
        $relative_to_ancestor
      ),
      $raw,
      |Mutter::Clutter::PaintVolume.getTypePair
    );
  }

  proto method get_transformed_position (|)
    is also<get-transformed-position>
  { * }

  multi method get_transformed_position {
    samewith($, $);
  }
  multi method get_transformed_position (
    $x is rw,
    $y is rw
  ) {
    my gfloat ($xx, $yy) = 0e0 xx 2;

    clutter_actor_get_transformed_position($!mca, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  proto method get_transformed_size (|)
    is also<get-transformed-size>
  { * }

  multi method get_transformed_size {
    samewith($, $);
  }
  multi method get_transformed_size (
    $width  is rw,
    $height is rw
  ) {
    my gfloat ($w, $h) = 0e0 xx 2;

    clutter_actor_get_transformed_size($!mca, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_transition (Str() $name, :$raw = False) is also<get-transition> {
    propReturnObject(
      clutter_actor_get_transition($!mca, $name),
      $raw,
      |Mutter::Clutter::Transition.getTypePair
    );
  }

  proto method get_translation (|)
    is also<get-translation>
  { * }

  multi method get_translation {
    samewith($, $, $);
  }
  multi method get_translation (
    $translate_x is rw,
    $translate_y is rw,
    $translate_z is rw
  ) {
    my gfloat ($tx, $ty, $tz) = 0e0 xx 3;

    clutter_actor_get_translation($!mca, $tx, $ty, $tz);
    ($translate_x, $translate_y, $translate_z) = ($tx, $ty, $tz);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_actor_get_type, $n, $t );
  }

  method get_width is also<get-width> {
    clutter_actor_get_width($!mca);
  }

  method get_x is also<get-x> {
    clutter_actor_get_x($!mca);
  }

  method get_x_align is also<get-x-align> {
    clutter_actor_get_x_align($!mca);
  }

  method get_x_expand is also<get-x-expand> {
    clutter_actor_get_x_expand($!mca);
  }

  method get_y is also<get-y> {
    clutter_actor_get_y($!mca);
  }

  method get_y_align is also<get-y-align> {
    clutter_actor_get_y_align($!mca);
  }

  method get_y_expand is also<get-y-expand> {
    clutter_actor_get_y_expand($!mca);
  }

  method get_z_position is also<get-z-position> {
    clutter_actor_get_z_position($!mca);
  }

  method grab_key_focus is also<grab-key-focus> {
    clutter_actor_grab_key_focus($!mca);
  }

  method has_accessible is also<has-accessible> {
    so clutter_actor_has_accessible($!mca);
  }

  method has_allocation is also<has-allocation> {
    so clutter_actor_has_allocation($!mca);
  }

  method has_clip is also<has-clip> {
    so clutter_actor_has_clip($!mca);
  }

  method has_key_focus is also<has-key-focus> {
    so clutter_actor_has_key_focus($!mca);
  }

  method has_mapped_clones is also<has-mapped-clones> {
    so clutter_actor_has_mapped_clones($!mca);
  }

  method has_overlaps is also<has-overlaps> {
    so clutter_actor_has_overlaps($!mca);
  }

  method has_pointer is also<has-pointer> {
    so clutter_actor_has_pointer($!mca);
  }

  method hide_actor is also<hide-actor> {
    clutter_actor_hide($!mca);
  }

  method inhibit_culling {
    clutter_actor_inhibit_culling($!mca);
  }

  method insert_child_above (
    MutterClutterActor() $child,
    MutterClutterActor() $sibling
  ) {
    clutter_actor_insert_child_above($!mca, $child, $sibling);
  }

  method insert_child_at_index (MutterClutterActor() $child, Int() $index) {
    my gint $i = $index;

    clutter_actor_insert_child_at_index($!mca, $child, $i);
  }

  method insert_child_below (
    MutterClutterActor() $child,
    MutterClutterActor() $sibling
  ) {
    clutter_actor_insert_child_below($!mca, $child, $sibling);
  }

  method invalidate_paint_volume {
    clutter_actor_invalidate_paint_volume($!mca);
  }

  method invalidate_transform {
    clutter_actor_invalidate_transform($!mca);
  }

  method is_in_clone_paint is also<is-in-clone-paint> {
    so clutter_actor_is_in_clone_paint($!mca);
  }

  method is_mapped is also<is-mapped> {
    so clutter_actor_is_mapped($!mca);
  }

  method is_realized is also<is-realized> {
    so clutter_actor_is_realized($!mca);
  }

  method is_rotated is also<is-rotated> {
    so clutter_actor_is_rotated($!mca);
  }

  method is_scaled is also<is-scaled> {
    so clutter_actor_is_scaled($!mca);
  }

  method is_visible is also<is-visible> {
    so clutter_actor_is_visible($!mca);
  }

  method map {
    clutter_actor_map($!mca);
  }

  method move_by (Num() $dx, Num() $dy) is also<move-by> {
      my gfloat ($ddx, $ddy) = ($dx, $dy);

      clutter_actor_move_by($!mca, $ddx, $ddy);
    }

  method needs_expand (Int() $orientation) {
    my MutterClutterOrientation $o = $orientation;

    clutter_actor_needs_expand($!mca, $o);
  }

  method paint (MutterClutterPaintContext() $paint_context) {
    clutter_actor_paint($!mca, $paint_context);
  }

  # ...

  method peek_stage_views {
    clutter_actor_peek_stage_views($!mca);
  }

  method pick (MutterClutterPickContext $pick_context) {
    clutter_actor_pick($!mca, $pick_context);
  }

  method pick_box (MutterClutterPickContext $pick_context, MutterClutterActorBox $box) {
    clutter_actor_pick_box($!mca, $pick_context, $box);
  }

  method queue_redraw_actor is also<queue-redraw-actor> {
    clutter_actor_queue_redraw($!mca);
  }

  method queue_redraw_with_clip (cairo_rectangle_int_t $clip)
    is also<queue-redraw-actor>
  {
    clutter_actor_queue_redraw_with_clip($!mca, $clip);
  }

  method queue_relayout is also<queue-relayout-actor> {
    clutter_actor_queue_relayout($!mca);
  }

  method realize-actor is also<realize_actor> {
    clutter_actor_realize($!mca);
  }

  method remove_all_children is also<remove-all-children> {
    clutter_actor_remove_all_children($!mca);
  }

  method remove_all_transitions is also<remove-all-transitions> {
    clutter_actor_remove_all_transitions($!mca);
  }

  method remove_child (MutterClutterActor() $child) is also<remove-child> {
    clutter_actor_remove_child($!mca, $child);
  }

  method remove_clip is also<remove-clip> {
    clutter_actor_remove_clip($!mca);
  }

  method remove_transition (Str $name) is also<remove-transition> {
    clutter_actor_remove_transition($!mca, $name);
  }

  method replace_child method replace_child (
    ClutterActor() $old_child,
    ClutterActor() $new_child
  )
    is also<replace-child>
  {
    clutter_actor_replace_child($!mca, $old_child, $new_child);
  }

  method restore_easing_state is also<restore-easing-state> {
    clutter_actor_restore_easing_state($!mca);
  }

  method save_easing_state is also<save-easing-state> {
    clutter_actor_save_easing_state($!mca);
  }

  method set_allocation (MutterClutterActorBox() $box)
    is also<set-allocation>
  {
    clutter_actor_set_allocation($!mca, $box);
  }

  method set_background_color (MutterClutterColor() $color)
    is also<set-background-color>
  {
    clutter_actor_set_background_color($!mca, $color);
  }

  method set_child_above_sibling (
    MutterClutterActor() $child,
    MutterClutterActor() $sibling
  )
    is also<set-child-above-sibling>
  {
    clutter_actor_set_child_above_sibling($!mca, $child, $sibling);
  }

  method set_child_at_index (MutterClutterActor() $child, Int() $index)
    is also<set-child-at-index>
  {
    my gint $i = $index;

    clutter_actor_set_child_at_index($!mca, $child, $i);
  }

  method set_child_below_sibling (
    MutterClutterActor() $child,
    MutterClutterActor() $sibling
  ) {
    clutter_actor_set_child_below_sibling($!mca, $child, $sibling);
  }

  method set_child_transform (graphene_matrix_t $transform)
    is also<set-child-transform>
  {
    clutter_actor_set_child_transform($!mca, $transform);
  }

  method set_clip (
    Num() $xoff,
    Num() $yoff,
    Num() $width,
    Num() $height
  )
    is also<set-clip>
  {
    my gfloat ($xo, $yo, $w, $h) = ($xoff, $yoff, $width, $height);

    clutter_actor_set_clip($!mca, $xo, $yo, $w, $h);
  }

  method set_clip_to_allocation (Int() $clip_set)
    is also<set-clip-to-allocation>
  {
    my gboolean $c = $clip_set.so.Int;

    clutter_actor_set_clip_to_allocation($!mca, $c);
  }

  method set_content (MutterClutterContent() $content) is also<set-content> {
    clutter_actor_set_content($!mca, $content);
  }

  method set_content_gravity (
    Int() $gravity
  )
    is also<set-content-gravity>
  {
    my MutterClutterContentGravity $g = $gravity;

    clutter_actor_set_content_gravity($!mca, $g);
  }

  method set_content_repeat (Int() $repeat) {
    my MutterClutterContentRepeat $r = $repeat;

    clutter_actor_set_content_repeat($!mca, $r);
  }

  method set_content_scaling_filters (
    Int() $min_filter,
    Int() $mag_filter
  )
    is also<set-content-scaling-filters>
  {
    my MutterClutterScalingFilter ($mnf, $mgf) = ($min_filter, $mag_filter);

    clutter_actor_set_content_scaling_filters($!mca, $mnf, $mgf);
  }

  method set_easing_delay (Int() $msecs) is also<set-easing-delay> {
    my guint $ms = $msecs;

    clutter_actor_set_easing_delay($!mca, $ms);
  }

  method set_easing_duration (Int() $msecs) is also<set-easing-duration> {
    my guint $ms = $msecs;

    clutter_actor_set_easing_duration($!mca, $ms);
  }

  method set_easing_mode (Int() $mode) {
    my MutterClutterAnimationMode $m = $mode;

    clutter_actor_set_easing_mode($!mca, $m);
  }

  method set_fixed_position_set (Int() $is_set)
    is also<set-fixed-position-set>
  {
    my gboolean $is = $is_set.so.Int;

    clutter_actor_set_fixed_position_set($!mca, $is);
  }

  method set_flags (Int() $flags) {
    my MutterClutterActorFlags $f = $flags;

    clutter_actor_set_flags($!mca, $flags);
  }

  method set_height (Num() $height) is also<set-height> {
    my gfloat $h = $height;

    clutter_actor_set_height($!mca, $h);
  }

  method set_layout_manager (MutterClutterLayoutManager() $manager) {
    clutter_actor_set_layout_manager($!mca, $manager);
  }

  method set_margin (MutterClutterMargin() $margin) is also<set-margin> {
    clutter_actor_set_margin($!mca, $margin);
  }

  method set_margin_bottom (Num() $margin) is also<set-margin-bottom> {
    my gfloat $m = $margin;

    clutter_actor_set_margin_bottom($!mca, $m);
  }

  method set_margin_bottom (Num() $margin) is also<set-margin-bottom> {
    my gfloat $m = $margin;

    clutter_actor_set_margin_left($!mca, $m);
  }

  method set_margin_right (Num() $margin) is also<set-margin-right> {
    my gfloat $m = $margin;

    clutter_actor_set_margin_right($!mca, $m);
  }

  method set_margin_right (Num() $margin) is also<set-margin-right> {
    my gfloat $m = $margin;

    clutter_actor_set_margin_top($!mca, $m);
  }

  method set_name (Str() $name) {
    clutter_actor_set_name($!mca, $name);
  }

  method set_offscreen_redirect (Int() $redirect)
    is also<set-offscreen-redirect>
  {
    my MutterClutterOffscreenRedirect $r = $redirect;

    clutter_actor_set_offscreen_redirect($!mca, $r);
  }

  method set_opacity (Int() $opacity) is also<set-opacity> {
    my guint8 $o = $opacity;

    clutter_actor_set_opacity($!mca, $o);
  }

  method set_opacity_override (Int() $opacity) is also<set-opacity-override> {
    my gint $o = $opacity;

    clutter_actor_set_opacity_override($!mca, $o);
  }

  method set_pivot_point (Num() $pivot_x, Num() $pivot_y)
    is also<set-pivot-point>
  {
    my gfloat ($px, $py) = ($pivot_x, $pivot_y);

    clutter_actor_set_pivot_point($!mca, $px, $py);
  }

  method set_pivot_point_z (Num() $pivot_z) is also<set-pivot-point-z> {
    my gfloat $pz = $pivot_z;

    clutter_actor_set_pivot_point_z($!mca, $pivot_z);
  }

  proto method set_position (|)
    is also<set-position>
  { * }

  multi method set_position (MutterClutterPoint() $p) {
    samewith($p.x, $p.y);
  }
  multi method set_position (Num() $x, Num() $y)  {
    my gfloat ($xx, $yy) = ($x, $y);

    clutter_actor_set_position($!mca, $xx, $yy);
  }

  method set_reactive (Int() $reactive) is also<set-reactive> {
    my gboolean $r = $reactive.so.Int;

    clutter_actor_set_reactive($!mca, $rs);
  }

  method set_request_mode (Int() $mode) is also<set-request-mode> {
    my MutterClutterRequestMode $m = $mode;

    clutter_actor_set_request_mode($!mca, $m);
  }

  method set_rotation_angle (Int() $axis, Num() $angle)
    is also<set-rotation-angle>
  {
    my MutterClutterRotateAxis $a  = $axis;
    my gdouble                 $an = $angle;

    clutter_actor_set_rotation_angle($!mca, $a, $an);
  }

  method set_scale (Num() $scale_x, Num() $scale_y)
    is also<set-scale>
  {
    my gdouble ($sx, $sy) = ($scale_x, $scale_y);

    clutter_actor_set_scale($!mca, $sx, $sy);
  }

  method set_scale_z (Num() $scale_z) is also<set-scale-z> {
    my gdouble $sz = $scale_z;

    clutter_actor_set_scale_z($!mca, $sz);
  }

  method set_size (Num() $width, Num() $height) is also<set-size> {
    my gfloat ($w, $h) = ($width, $height);

    clutter_actor_set_size($!mca, $w, $h);
  }

  method set_text_direction (Int() $text_dir) {
    my MutterClutterTextDirection $t = $text_dir;

    clutter_actor_set_text_direction($!mca, $t);
  }

  method set_transform (graphene_matrix_t $transform) {
    clutter_actor_set_transform($!mca, $transform);
  }

  method set_translation (
    Num() $translate_x,
    Num() $translate_y,
    Num() $translate_z
  )
    is also<set-translation>
  {
    my gfloat ($tx, $ty, $tz) = ($translate_x, $translate_y, $translate_z);

    clutter_actor_set_translation($!mca, $tx, $ty, $tz);
  }

  method set_width (Num() $width) is also<set-width> {
    my gfloat $w = $width;

    clutter_actor_set_width($!mca, $w);
  }

  method set_x (Num() $x) is also<set-x> {
    my gfloat $xx = $x;

    clutter_actor_set_x($!mca, $xx);
  }

  method set_x_align (Int() $x_align) is also<set-x-align> {
    my MutterClutterActorAlign $xa = $x_align;

    clutter_actor_set_x_align($!mca, $xa);
  }

  method set_x_expand (Num() $expand) is also<set-x-expand> {
    my gboolean $e = $expand.so.Int;

    clutter_actor_set_x_expand($!mca, $e);
  }

  method set_y (Num() $y) is also<set-y> {
    my gfloat $yy = $y;

    clutter_actor_set_y($!mca, $yy);
  }

  method set_y_align (Int() $y_align) {
    my MutterClutterActorAlign $ya = $y_align;

    clutter_actor_set_y_align($!mca, $ya);
  }

  method set_y_expand (Int() $expand) is also<set-y-expand> {
    my gboolean $e = $expand.so.Int;

    clutter_actor_set_y_expand($!mca, $e);
  }

  method set_z_position (Num() $z_position) is also<set-z-position> {
    my gfloat $zp = $z_position;

    clutter_actor_set_z_position($!mca, $zp);
  }

  method should_pick (MutterClutterPickContext $pick_context) {
    clutter_actor_should_pick($!mca, $pick_context);
  }

  method show_actor is also<show-actor> {
    clutter_actor_show($!mca);
  }

  proto method transform_stage_point (|)
      is also<transform-stage-point>
    { * }

  multi method transform_stage_point (Num() $x, Num() $y) {
    samewith($x, $y, $, $);
  }
  multi method transform_stage_point (
    Num() $x,
    Num() $y,
          $x_out is rw,
          $y_out is rw
  ) {
    my gfloat ($xx, $yy, $xo, $yo) = ($x, $y, 0e0, 0e0);

    clutter_actor_transform_stage_point($!mca, $xx, $yy, $xo, $yo);
    ($x_out, $y_out) = ($xo, $yo);
  }

  method uninhibit_culling is also<uninhibit-culling> {
    clutter_actor_uninhibit_culling($!mca);
  }

  method unmap {
    clutter_actor_unmap($!mca);
  }

  method unrealize_actor is also<unrealize-actor> {
    clutter_actor_unrealize($!mca);
  }

  method unset_flags (Int() $flags) is also<unset-flags> {
    my MutterClutterActorFlags $f = $flags;

    clutter_actor_unset_flags($!mca, $f);
  }

  # ACTIONS

  method add_action (MutterlutterAction() $action) is also<add-action> {
    clutter_actor_add_action($!mca, $action);
  }

  method add_actions (*@actions) is also<add-actions> {
    for @actions {
      unless $_ ~~ Clutter::Action || .^lookup('ClutterAction') {
        die 'actions value must only contain Clutter::Action compatible types!'
      }
      self.add_action($_);
    }
  }

  method add_action_with_name (Str() $name, MutterClutterAction() $action)
    is also<
      add-action-with-name
      add_action_by_name
      add-action-by-name
    >
  {
    clutter_actor_add_action_with_name($!mca, $name, $action);
  }

  method add_actions_with_name (*@actions)
    is also<
      add-actions-with-name
      add_actions_by_name
      add-actions-by-name
    >
  {
    unless .[1] ~~ Clutter::Action || .[1].^lookup('ClutterAction') {
      die qq:to/DIE/;
        'constraints-with-name' value must only contain Clutter::Action {''
        }compatible types
        DIE
    }
    say "Action: { .[0] }" if $DEBUG;
    self.add-action-with-name(|$_);
  }

  method clear_actions is also<clear-action> {
    clutter_actor_clear_actions($!mca);
  }

  method get_action (Str() $name, :$raw = False) is also<get-action> {
    propReturnObject(
      clutter_actor_get_action($!mca, $name),
      $raw,
      |Mutter::Clutter::Action.getTypePair
    );
  }

  method get_actions (:$glist = False, :$raw = False) is also<get-actions> {
    propReturnObject(
      clutter_actor_get_actions($!mca),
      $raw,
      $glist,
      |Mutter::Clutter::Action.getTypePair
    )
  }

  method has_actions is also<has-action> {
    so clutter_actor_has_actions($!mca);
  }

  method remove_action (MutterClutterAction() $action) is also<remove-action> {
    clutter_actor_remove_action($!mca, $action);
  }

  method remove_action_by_name (Str() $name) is also<remove-action-by-name> {
    clutter_actor_remove_action_by_name($!mca, $name);
  }

}

class Mutter::Clutter::Actor::Iter {
  has MutterClutterActorIter $!mcai is implementor;

  submethod BUILD ( :$mutter-actor-iter ) {
    $!mcai = $mutter-actor-iter;
  }

  method init (MutterClutterActor() $root) {
    my $mutter-actor-iter = clutter_actor_iter_init($!mca, $root);

    $mutter-actor-iter ?? self.bless( :$mutter-actor-iter ) !! Nil;
  }

  method destroy {
    clutter_actor_iter_destroy($!mcai);
  }

  method is_valid {
    so clutter_actor_iter_is_valid($!mcai);
  }

  multi method next ( :$raw = False ) {
    samewith( newCArray(MutterClutterActor), :$raw )
  }
  multi method next (CArray[MutterClutterActor] $child, :$raw = False) {
    clutter_actor_iter_next($!mcai, $child);
    propReturnObject( ppr($child), $raw, |self.getTypePair );
  }

  method prev ( :$raw = False ) {
    samewith( newCArray(MutterClutterActor), :$raw )
  }
  method prev (CArray[MutterClutterActor] $child, :$raw = False) {
    clutter_actor_iter_prev($!mcai, $child);
    propReturnObject( ppr($child), $raw, |self.getTypePair );
  }

  method remove {
    clutter_actor_iter_remove($!mcai);
  }
}

use GLib::Object::Type;
use GLib::Class::Object;
INIT {
  unless %*ENV<P6_GLIB_COMPILE_PROCESS> {
    my $o = GLib::Object.new-object(Mutter::Clutter::Actor.get-type);
    %properties = $o.getClass.getProperties;
    my $np = %properties.elems;
    say "Clutter::Actor - { $np } property entr{ $np == 1 ?? 'y' !! 'ies' }";
  }
}
