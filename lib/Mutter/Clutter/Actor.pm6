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

  has MutterClutterActor $!ca;

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
    self.connect-allocation-changed($!ca);
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method button-press-event is also<button_press_event> {
    self.connect-clutter-event($!ca, 'button-press-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method button-release-event is also<button_release_event> {
    self.connect-clutter-event($!ca, 'button-release-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method captured-event is also<captured_event> {
    self.connect-clutter-event($!ca, 'captured-event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method destroy {
    self.connect($!ca, 'destroy');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method enter-event is also<enter_event> {
    self.connect-clutter-event($!ca, 'enter-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method event {
    self.connect-clutter-event($!ca, 'event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method hide {
    self.connect($!ca, 'hide');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method key-focus-in is also<key_focus_in> {
    self.connect($!ca, 'key-focus-in');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method key-focus-out is also<key_focus_out> {
    self.connect($!ca, 'key-focus-out');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method key-press-event is also<key_press_event> {
    self.connect-clutter-event($!ca, 'key-press-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method key-release-event is also<key_release_event> {
    self.connect-clutter-event($!ca, 'key-release-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method leave-event is also<leave_event> {
    self.connect-clutter-event($!ca, 'leave-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method motion-event is also<motion_event> {
    self.connect-clutter-event($!ca, 'motion-event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method paint {
    self.connect($!ca, 'paint');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterActor, gpointer --> void
  method parent-set is also<parent_set> {
    self.connect-parent-set($!ca);
  }

  # Is originally:
  # MutterClutterActor, MutterClutterColor, gpointer --> void
  method pick {
    self.connect-pick($!ca);
  }

  # Is originally:
  # void, void
  method queue-redraw {
    self.connect($!ca, 'queue-redraw');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method queue-relayout is also<queue_relayout> {
    self.connect($!ca, 'queue-relayout');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method realize {
    self.connect($!ca, 'realize');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method scroll-event is also<scroll_event> {
    self.connect-clutter-event($!ca, 'scroll-event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method show {
    self.connect($!ca, 'show');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method touch-event is also<touch_event> {
    self.connect-clutter-event($!ca, 'touch-event');
  }

  # Is originally:
  # MutterClutterActor, gchar, gboolean, gpointer --> void
  method transition-stopped is also<transition_stopped> {
    self.connect-transition-stopped($!ca);
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method transitions-completed is also<transitions_completed> {
    self.connect($!ca, 'transitions-completed');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method unrealize {
    self.connect($!ca, 'unrealize');
  }

  method opacity is rw {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_opacity($!ca);
      },
      STORE => sub ($, Int() $opacity is copy) {
        my guint8 $o = $opacity;

        clutter_actor_set_opacity($!ca, $o);
      }
    );
  }

  method opacity-override is rw is also<opacity_override> {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_opacity_override($!ca);
      },
      STORE => sub ($, Int() $opacity is copy) {
        my gint $o = $opacity;

        clutter_actor_set_opacity_override($!ca, $o);
      }
    );
  }

  method pivot-point-z is rw is also<pivot_point_z> {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_pivot_point_z($!ca);
      },
      STORE => sub ($, $pivot_z is copy) {
        clutter_actor_set_pivot_point_z($!ca, $pivot_z);
      }
    );
  }

  method reactive is rw {
    Proxy.new(
      FETCH => sub ($) {
        so clutter_actor_get_reactive($!ca);
      },
      STORE => sub ($, Int() $reactive is copy) {
        my gboolean $r = $reactive.so.Int;

        clutter_actor_set_reactive($!ca, $r);
      }
    );
  }

  method request_mode is rw is also<request-mode> {
    Proxy.new(
      FETCH => sub ($) {
        ClutterRequestModeEnum( clutter_actor_get_request_mode($!ca) );
      },
      STORE => sub ($, Int() $mode is copy) {
        my guint $m = $mode;

        clutter_actor_set_request_mode($!ca, $m);
      }
    );
  }

  method scale_z is rw is also<scale-z> {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_scale_z($!ca);
      },
      STORE => sub ($, $scale_z is copy) {
        clutter_actor_set_scale_z($!ca, $scale_z);
      }
    );
  }

  method text_direction is rw is also<text-direction> {
    Proxy.new(
      FETCH => sub ($) {
        ClutterTextDirectionEnum( clutter_actor_get_text_direction($!ca) );
      },
      STORE => sub ($, Int() $text_dir is copy) {
        my guint $d = $text_dir;
        clutter_actor_set_text_direction($!ca, $d);
      }
    );
  }

  method width is rw {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_width($!ca);
      },
      STORE => sub ($, Num() $width is copy) {
        my gfloat $w = $width;

        clutter_actor_set_width($!ca, $w);
      }
    );
  }

  method x is rw {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_x($!ca);
      },
      STORE => sub ($, Num() $x is copy) {
        my gfloat $xx = $x;

        clutter_actor_set_x($!ca, $xx);
      }
    );
  }

  method x-align is rw is also<x_align> {
    Proxy.new(
      FETCH => sub ($) {
        ClutterActorAlignEnum( clutter_actor_get_x_align($!ca) );
      },
      STORE => sub ($, Int() $x_align is copy) {
        my ClutterActorAlign $xa = $x_align;

        clutter_actor_set_x_align($!ca, $xa);
      }
    );
  }

  method x-expand is rw is also<x_expand> {
    Proxy.new(
      FETCH => sub ($) {
        so clutter_actor_get_x_expand($!ca);
      },
      STORE => sub ($, Int() $expand is copy) {
        my gboolean $e = $expand.so.Int;

        clutter_actor_set_x_expand($!ca, $expand);
      }
    );
  }

  method y is rw {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_y($!ca);
      },
      STORE => sub ($, Num() $y is copy) {
        my gfloat $yy = $y;

        clutter_actor_set_y($!ca, $yy);
      }
    );
  }

  method y-align is rw is also<y_align> {
    Proxy.new(
      FETCH => sub ($) {
        ClutterActorAlignEnum( clutter_actor_get_y_align($!ca) );
      },
      STORE => sub ($, Int() $y_align is copy) {
        my ClutterActorAlign $ya = $y_align;

        clutter_actor_set_y_align($!ca, $ya);
      }
    );
  }

  method y-expand is rw is also<y_expand> {
    Proxy.new(
      FETCH => sub ($) {
        so clutter_actor_get_y_expand($!ca);
      },
      STORE => sub ($, Int() $expand is copy) {
        my gboolean $e = $expand.so.Int;

        clutter_actor_set_y_expand($!ca, $expand);
      }
    );
  }

  method z-position is rw is also<z_position> {
    Proxy.new(
      FETCH => sub ($) {
        clutter_actor_get_z_position($!ca);
      },
      STORE => sub ($, Num() $z_position is copy) {
        my gfloat $z = $z_position;

        clutter_actor_set_z_position($!ca, $z_position);
      }
    );
  }

  # Type: ClutterAction
  method actions is rw  {
    my GLib::Value $gv .= new( Clutter::Action.get_type );
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
    my GLib::Value $gv .= new( Clutter::Raw::Enums.scaling_filter_get_type );
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
    my GLib::Value $gv .= new( Clutter::Raw::Enums.scaling_filter_get_type );
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
    my GLib::Value $gv .= new( Clutter::Vertex.get_type );
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
    my GLib::Value $gv .= new( Clutter::Size.get_type );
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

    clutter_actor_allocate_align_fill($!ca, $box, $xa, $ya, $xf, $yf);
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

    clutter_actor_allocate_available_size($!ca, $xx, $yy, $aw, $ah, $f);
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

    clutter_actor_event($!ca, $event, $capture);
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

  method get_children {
    clutter_actor_get_children($!mca);
  }

  method get_clip (gfloat $xoff is rw, gfloat $yoff is rw, gfloat $width is rw, gfloat $height is rw) {
    clutter_actor_get_clip($!mca, $xoff is rw, $yoff is rw, $width is rw, $height is rw);
  }

  method get_clip_to_allocation {
    clutter_actor_get_clip_to_allocation($!mca);
  }

  method get_content {
    clutter_actor_get_content($!mca);
  }

  method get_content_box (MutterClutterActorBox $box) {
    clutter_actor_get_content_box($!mca, $box);
  }

  method get_content_gravity {
    clutter_actor_get_content_gravity($!mca);
  }

  method get_content_repeat {
    clutter_actor_get_content_repeat($!mca);
  }

  method get_content_scaling_filters (MutterClutterScalingFilter $min_filter, MutterClutterScalingFilter $mag_filter) {
    clutter_actor_get_content_scaling_filters($!mca, $min_filter, $mag_filter);
  }

  method get_default_paint_volume {
    clutter_actor_get_default_paint_volume($!mca);
  }

  method get_easing_delay {
    clutter_actor_get_easing_delay($!mca);
  }

  method get_easing_duration {
    clutter_actor_get_easing_duration($!mca);
  }

  method get_easing_mode {
    clutter_actor_get_easing_mode($!mca);
  }

  method get_first_child {
    clutter_actor_get_first_child($!mca);
  }

  method get_fixed_position (gfloat $x is rw, gfloat $y is rw) {
    clutter_actor_get_fixed_position($!mca, $x is rw, $y is rw);
  }

  method get_fixed_position_set {
    clutter_actor_get_fixed_position_set($!mca);
  }

  method get_flags {
    clutter_actor_get_flags($!mca);
  }

  method get_height {
    clutter_actor_get_height($!mca);
  }

  method get_last_child {
    clutter_actor_get_last_child($!mca);
  }

  method get_layout_manager {
    clutter_actor_get_layout_manager($!mca);
  }

  method get_margin (MutterClutterMargin $margin) {
    clutter_actor_get_margin($!mca, $margin);
  }

  method get_margin_bottom {
    clutter_actor_get_margin_bottom($!mca);
  }

  method get_margin_left {
    clutter_actor_get_margin_left($!mca);
  }

  method get_margin_right {
    clutter_actor_get_margin_right($!mca);
  }

  method get_margin_top {
    clutter_actor_get_margin_top($!mca);
  }

  method get_n_children {
    clutter_actor_get_n_children($!mca);
  }

  method get_name {
    clutter_actor_get_name($!mca);
  }

  method get_next_sibling {
    clutter_actor_get_next_sibling($!mca);
  }

  method get_offscreen_redirect {
    clutter_actor_get_offscreen_redirect($!mca);
  }

  method get_opacity {
    clutter_actor_get_opacity($!mca);
  }

  method get_opacity_override {
    clutter_actor_get_opacity_override($!mca);
  }

  method get_paint_box (MutterClutterActorBox $box) {
    clutter_actor_get_paint_box($!mca, $box);
  }

  method get_paint_opacity {
    clutter_actor_get_paint_opacity($!mca);
  }

  method get_paint_visibility {
    clutter_actor_get_paint_visibility($!mca);
  }

  method get_paint_volume {
    clutter_actor_get_paint_volume($!mca);
  }

  method get_pango_context {
    clutter_actor_get_pango_context($!mca);
  }

  method get_parent {
    clutter_actor_get_parent($!mca);
  }

  method get_pivot_point (gfloat $pivot_x is rw, gfloat $pivot_y is rw) {
    clutter_actor_get_pivot_point($!mca, $pivot_x is rw, $pivot_y is rw);
  }

  method get_pivot_point_z {
    clutter_actor_get_pivot_point_z($!mca);
  }

  method get_position (gfloat $x is rw, gfloat $y is rw) {
    clutter_actor_get_position($!mca, $x is rw, $y is rw);
  }

  method get_preferred_height (gfloat $for_width, gfloat $min_height_p is rw, gfloat $natural_height_p is rw) {
    clutter_actor_get_preferred_height($!mca, $for_width, $min_height_p is rw, $natural_height_p is rw);
  }

  method get_preferred_size (gfloat $min_width_p is rw, gfloat $min_height_p is rw, gfloat $natural_width_p is rw, gfloat $natural_height_p is rw) {
    clutter_actor_get_preferred_size($!mca, $min_width_p is rw, $min_height_p is rw, $natural_width_p is rw, $natural_height_p is rw);
  }

  method get_preferred_width (gfloat $for_height, gfloat $min_width_p is rw, gfloat $natural_width_p is rw) {
    clutter_actor_get_preferred_width($!mca, $for_height, $min_width_p is rw, $natural_width_p is rw);
  }

  method get_previous_sibling {
    clutter_actor_get_previous_sibling($!mca);
  }

  method get_reactive {
    clutter_actor_get_reactive($!mca);
  }

  method get_request_mode {
    clutter_actor_get_request_mode($!mca);
  }

  method get_resource_scale {
    clutter_actor_get_resource_scale($!mca);
  }

  method get_rotation_angle (MutterClutterRotateAxis $axis) {
    clutter_actor_get_rotation_angle($!mca, $axis);
  }

  method get_scale (gdouble $scale_x is rw, gdouble $scale_y is rw) {
    clutter_actor_get_scale($!mca, $scale_x is rw, $scale_y is rw);
  }

  method get_scale_z {
    clutter_actor_get_scale_z($!mca);
  }

  method get_size (gfloat $width is rw, gfloat $height is rw) {
    clutter_actor_get_size($!mca, $width is rw, $height is rw);
  }

  method get_stage {
    clutter_actor_get_stage($!mca);
  }

  method get_text_direction {
    clutter_actor_get_text_direction($!mca);
  }

  method get_transform (graphene_matrix_t $transform) {
    clutter_actor_get_transform($!mca, $transform);
  }

  method get_transformed_extents (graphene_rect_t $rect) {
    clutter_actor_get_transformed_extents($!mca, $rect);
  }

  method get_transformed_paint_volume (MutterClutterActor $relative_to_ancestor) {
    clutter_actor_get_transformed_paint_volume($!mca, $relative_to_ancestor);
  }

  method get_transformed_position (gfloat $x is rw, gfloat $y is rw) {
    clutter_actor_get_transformed_position($!mca, $x is rw, $y is rw);
  }

  method get_transformed_size (gfloat $width is rw, gfloat $height is rw) {
    clutter_actor_get_transformed_size($!mca, $width is rw, $height is rw);
  }

  method get_transition (Str $name) {
    clutter_actor_get_transition($!mca, $name);
  }

  method get_translation (gfloat $translate_x is rw, gfloat $translate_y is rw, gfloat $translate_z is rw) {
    clutter_actor_get_translation($!mca, $translate_x is rw, $translate_y is rw, $translate_z is rw);
  }

  method get_width {
    clutter_actor_get_width($!mca);
  }

  method get_x {
    clutter_actor_get_x($!mca);
  }

  method get_x_align {
    clutter_actor_get_x_align($!mca);
  }

  method get_x_expand {
    clutter_actor_get_x_expand($!mca);
  }

  method get_y {
    clutter_actor_get_y($!mca);
  }

  method get_y_align {
    clutter_actor_get_y_align($!mca);
  }

  method get_y_expand {
    clutter_actor_get_y_expand($!mca);
  }

  method get_z_position {
    clutter_actor_get_z_position($!mca);
  }

  method grab_key_focus {
    clutter_actor_grab_key_focus($!mca);
  }

  method has_accessible {
    clutter_actor_has_accessible($!mca);
  }

  method has_allocation {
    clutter_actor_has_allocation($!mca);
  }

  method has_clip {
    clutter_actor_has_clip($!mca);
  }

  method has_key_focus {
    clutter_actor_has_key_focus($!mca);
  }

  method has_mapped_clones {
    clutter_actor_has_mapped_clones($!mca);
  }

  method has_overlaps {
    clutter_actor_has_overlaps($!mca);
  }

  method has_pointer {
    clutter_actor_has_pointer($!mca);
  }

  method hide {
    clutter_actor_hide($!mca);
  }

  method inhibit_culling {
    clutter_actor_inhibit_culling($!mca);
  }

  method insert_child_above (MutterClutterActor $child, MutterClutterActor $sibling) {
    clutter_actor_insert_child_above($!mca, $child, $sibling);
  }

  method insert_child_at_index (MutterClutterActor $child, gint $index_) {
    clutter_actor_insert_child_at_index($!mca, $child, $index_);
  }

  method insert_child_below (MutterClutterActor $child, MutterClutterActor $sibling) {
    clutter_actor_insert_child_below($!mca, $child, $sibling);
  }

  method invalidate_paint_volume {
    clutter_actor_invalidate_paint_volume($!mca);
  }

  method invalidate_transform {
    clutter_actor_invalidate_transform($!mca);
  }

  method is_in_clone_paint {
    clutter_actor_is_in_clone_paint($!mca);
  }

  method is_mapped {
    clutter_actor_is_mapped($!mca);
  }

  method is_realized {
    clutter_actor_is_realized($!mca);
  }

  method is_rotated {
    clutter_actor_is_rotated($!mca);
  }

  method is_scaled {
    clutter_actor_is_scaled($!mca);
  }

  method is_visible {
    clutter_actor_is_visible($!mca);
  }

  method iter_destroy {
    clutter_actor_iter_destroy($!mca);
  }

  method iter_init (MutterClutterActor $root) {
    clutter_actor_iter_init($!mca, $root);
  }

  method iter_is_valid {
    clutter_actor_iter_is_valid($!mca);
  }

  method iter_next (CArray[MutterClutterActor] $child) {
    clutter_actor_iter_next($!mca, $child);
  }

  method iter_prev (CArray[MutterClutterActor] $child) {
    clutter_actor_iter_prev($!mca, $child);
  }

  method iter_remove {
    clutter_actor_iter_remove($!mca);
  }

  method map {
    clutter_actor_map($!mca);
  }

  method move_by (gfloat $dx, gfloat $dy) {
    clutter_actor_move_by($!mca, $dx, $dy);
  }

  method needs_expand (MutterClutterOrientation $orientation) {
    clutter_actor_needs_expand($!mca, $orientation);
  }

  method new {
    clutter_actor_new();
  }

  method paint (MutterClutterPaintContext $paint_context) {
    clutter_actor_paint($!mca, $paint_context);
  }

  method peek_stage_views {
    clutter_actor_peek_stage_views($!mca);
  }

  method pick (MutterClutterPickContext $pick_context) {
    clutter_actor_pick($!mca, $pick_context);
  }

  method pick_box (MutterClutterPickContext $pick_context, MutterClutterActorBox $box) {
    clutter_actor_pick_box($!mca, $pick_context, $box);
  }

  method queue_redraw {
    clutter_actor_queue_redraw($!mca);
  }

  method queue_redraw_with_clip (cairo_rectangle_int_t $clip) {
    clutter_actor_queue_redraw_with_clip($!mca, $clip);
  }

  method queue_relayout {
    clutter_actor_queue_relayout($!mca);
  }

  method realize {
    clutter_actor_realize($!mca);
  }

  method remove_all_children {
    clutter_actor_remove_all_children($!mca);
  }

  method remove_all_transitions {
    clutter_actor_remove_all_transitions($!mca);
  }

  method remove_child (MutterClutterActor $child) {
    clutter_actor_remove_child($!mca, $child);
  }

  method remove_clip {
    clutter_actor_remove_clip($!mca);
  }

  method remove_transition (Str $name) {
    clutter_actor_remove_transition($!mca, $name);
  }

  method replace_child (MutterClutterActor $old_child, MutterClutterActor $new_child) {
    clutter_actor_replace_child($!mca, $old_child, $new_child);
  }

  method restore_easing_state {
    clutter_actor_restore_easing_state($!mca);
  }

  method save_easing_state {
    clutter_actor_save_easing_state($!mca);
  }

  method set_allocation (MutterClutterActorBox $box) {
    clutter_actor_set_allocation($!mca, $box);
  }

  method set_background_color (MutterClutterColor $color) {
    clutter_actor_set_background_color($!mca, $color);
  }

  method set_child_above_sibling (MutterClutterActor $child, MutterClutterActor $sibling) {
    clutter_actor_set_child_above_sibling($!mca, $child, $sibling);
  }

  method set_child_at_index (MutterClutterActor $child, gint $index_) {
    clutter_actor_set_child_at_index($!mca, $child, $index_);
  }

  method set_child_below_sibling (MutterClutterActor $child, MutterClutterActor $sibling) {
    clutter_actor_set_child_below_sibling($!mca, $child, $sibling);
  }

  method set_child_transform (graphene_matrix_t $transform) {
    clutter_actor_set_child_transform($!mca, $transform);
  }

  method set_clip (gfloat $xoff, gfloat $yoff, gfloat $width, gfloat $height) {
    clutter_actor_set_clip($!mca, $xoff, $yoff, $width, $height);
  }

  method set_clip_to_allocation (gboolean $clip_set) {
    clutter_actor_set_clip_to_allocation($!mca, $clip_set);
  }

  method set_content (MutterClutterContent $content) {
    clutter_actor_set_content($!mca, $content);
  }

  method set_content_gravity (MutterClutterContentGravity $gravity) {
    clutter_actor_set_content_gravity($!mca, $gravity);
  }

  method set_content_repeat (MutterClutterContentRepeat $repeat) {
    clutter_actor_set_content_repeat($!mca, $repeat);
  }

  method set_content_scaling_filters (MutterClutterScalingFilter $min_filter, MutterClutterScalingFilter $mag_filter) {
    clutter_actor_set_content_scaling_filters($!mca, $min_filter, $mag_filter);
  }

  method set_easing_delay (guint $msecs) {
    clutter_actor_set_easing_delay($!mca, $msecs);
  }

  method set_easing_duration (guint $msecs) {
    clutter_actor_set_easing_duration($!mca, $msecs);
  }

  method set_easing_mode (MutterClutterAnimationMode $mode) {
    clutter_actor_set_easing_mode($!mca, $mode);
  }

  method set_fixed_position_set (gboolean $is_set) {
    clutter_actor_set_fixed_position_set($!mca, $is_set);
  }

  method set_flags (MutterClutterActorFlags $flags) {
    clutter_actor_set_flags($!mca, $flags);
  }

  method set_height (gfloat $height) {
    clutter_actor_set_height($!mca, $height);
  }

  method set_layout_manager (MutterClutterLayoutManager $manager) {
    clutter_actor_set_layout_manager($!mca, $manager);
  }

  method set_margin (MutterClutterMargin $margin) {
    clutter_actor_set_margin($!mca, $margin);
  }

  method set_margin_bottom (gfloat $margin) {
    clutter_actor_set_margin_bottom($!mca, $margin);
  }

  method set_margin_left (gfloat $margin) {
    clutter_actor_set_margin_left($!mca, $margin);
  }

  method set_margin_right (gfloat $margin) {
    clutter_actor_set_margin_right($!mca, $margin);
  }

  method set_margin_top (gfloat $margin) {
    clutter_actor_set_margin_top($!mca, $margin);
  }

  method set_name (Str $name) {
    clutter_actor_set_name($!mca, $name);
  }

  method set_offscreen_redirect (MutterClutterOffscreenRedirect $redirect) {
    clutter_actor_set_offscreen_redirect($!mca, $redirect);
  }

  method set_opacity (guint8 $opacity) {
    clutter_actor_set_opacity($!mca, $opacity);
  }

  method set_opacity_override (gint $opacity) {
    clutter_actor_set_opacity_override($!mca, $opacity);
  }

  method set_pivot_point (gfloat $pivot_x, gfloat $pivot_y) {
    clutter_actor_set_pivot_point($!mca, $pivot_x, $pivot_y);
  }

  method set_pivot_point_z (gfloat $pivot_z) {
    clutter_actor_set_pivot_point_z($!mca, $pivot_z);
  }

  method set_position (gfloat $x, gfloat $y) {
    clutter_actor_set_position($!mca, $x, $y);
  }

  method set_reactive (gboolean $reactive) {
    clutter_actor_set_reactive($!mca, $reactive);
  }

  method set_request_mode (MutterClutterRequestMode $mode) {
    clutter_actor_set_request_mode($!mca, $mode);
  }

  method set_rotation_angle (MutterClutterRotateAxis $axis, gdouble $angle) {
    clutter_actor_set_rotation_angle($!mca, $axis, $angle);
  }

  method set_scale (gdouble $scale_x, gdouble $scale_y) {
    clutter_actor_set_scale($!mca, $scale_x, $scale_y);
  }

  method set_scale_z (gdouble $scale_z) {
    clutter_actor_set_scale_z($!mca, $scale_z);
  }

  method set_size (gfloat $width, gfloat $height) {
    clutter_actor_set_size($!mca, $width, $height);
  }

  method set_text_direction (MutterClutterTextDirection $text_dir) {
    clutter_actor_set_text_direction($!mca, $text_dir);
  }

  method set_transform (graphene_matrix_t $transform) {
    clutter_actor_set_transform($!mca, $transform);
  }

  method set_translation (gfloat $translate_x, gfloat $translate_y, gfloat $translate_z) {
    clutter_actor_set_translation($!mca, $translate_x, $translate_y, $translate_z);
  }

  method set_width (gfloat $width) {
    clutter_actor_set_width($!mca, $width);
  }

  method set_x (gfloat $x) {
    clutter_actor_set_x($!mca, $x);
  }

  method set_x_align (MutterClutterActorAlign $x_align) {
    clutter_actor_set_x_align($!mca, $x_align);
  }

  method set_x_expand (gboolean $expand) {
    clutter_actor_set_x_expand($!mca, $expand);
  }

  method set_y (gfloat $y) {
    clutter_actor_set_y($!mca, $y);
  }

  method set_y_align (MutterClutterActorAlign $y_align) {
    clutter_actor_set_y_align($!mca, $y_align);
  }

  method set_y_expand (gboolean $expand) {
    clutter_actor_set_y_expand($!mca, $expand);
  }

  method set_z_position (gfloat $z_position) {
    clutter_actor_set_z_position($!mca, $z_position);
  }

  method should_pick (MutterClutterPickContext $pick_context) {
    clutter_actor_should_pick($!mca, $pick_context);
  }

  method show {
    clutter_actor_show($!mca);
  }

  method transform_stage_point (gfloat $x, gfloat $y, gfloat $x_out is rw, gfloat $y_out is rw) {
    clutter_actor_transform_stage_point($!mca, $x, $y, $x_out is rw, $y_out is rw);
  }

  method uninhibit_culling {
    clutter_actor_uninhibit_culling($!mca);
  }

  method unmap {
    clutter_actor_unmap($!mca);
  }

  method unrealize {
    clutter_actor_unrealize($!mca);
  }

  method unset_flags (MutterClutterActorFlags $flags) {
    clutter_actor_unset_flags($!mca, $flags);
  }
}
