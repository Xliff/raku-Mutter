use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
#use Mutter::Raw::Clutter::Boxed;
use Mutter::Raw::Clutter::Stage;

use GLib::Value;
use Mutter::Clutter::Actor;

use GLib::Roles::Implementor;
use Mutter::Clutter::Roles::Signals::Stage;

our subset MutterClutterStageAncestry is export of Mu
  where MutterClutterStage | MutterClutterActorAncestry;

class Mutter::Clutter::Stage is Mutter::Clutter::Actor {
  also does Mutter::Clutter::Roles::Signals::Stage;

  has MutterClutterStage $!mcs is implementor;

  method Mutter::Raw::Definitions::MutterClutterStage
    is also<MutterClutterStage>
  { $!mcs }

  multi method new (
    MutterClutterStageAncestry  $mutter-clutter-stage,
                               :$ref                   = True
  )
    is default
  {
    return unless $mutter-clutter-stage;

    my $o = self.bless(:$mutter-clutter-stage, :$ref);
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-stage = clutter_stage_new();

    $mutter-clutter-stage ?? self.bless( :$mutter-clutter-stage ) !! Nil;
  }

  # Type: gboolean
  method accept-focus is rw is g-property is also<accept_focus> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('accept-focus', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('accept-focus', $gv);
      }
    );
  }

  # Type: gboolean
  method cursor-visible is rw is g-property is also<cursor_visible> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('cursor-visible', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('cursor-visible', $gv);
      }
    );
  }

  # Type: gboolean
  method fullscreen-set is rw is g-property is also<fullscreen_set> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fullscreen-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn "fullscreen-set does not allow writing"
      }
    );
  }

  # Type: MutterClutterActor
  method key-focus is rw is g-property is also<key_focus> {
    my GLib::Value $gv .= new( MutterClutter::Actor.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('key-focus', $gv);
        MutterClutter::Actor.new( cast(MutterClutterActor, $gv.object) )
      },
      STORE => -> $, MutterClutterActor() $val is copy {
        $gv.object = $val;
        self.prop_set('key-focus', $gv);
      }
    );
  }

  # Type: gboolean
  method no-clear-hint is rw is g-property is also<no_clear_hint> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('no-clear-hint', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('no-clear-hint', $gv);
      }
    );
  }

  # Type: gboolean
  method offscreen is rw is g-property  is DEPRECATED {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('offscreen', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('offscreen', $gv);
      }
    )
  }

  # Type: MutterClutterPerspective
  method perspective is rw is g-property {
    my GLib::Value $gv .= new( MutterClutter::Boxed.perspective_get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('perspective', $gv);
        cast(MutterClutterPerspective, $gv.boxed);
      },
      STORE => -> $, MutterClutterPerspective $val is copy {
        $gv.boxed = $val;
        self.prop_set('perspective', $gv);
      }
    );
  }

  # Type: gchar
  method title is rw is g-property {
    my GLib::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('title', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('title', $gv);
      }
    );
  }

  # Type: gboolean
  method use-alpha is rw is g-property is also<use_alpha> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('use-alpha', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('use-alpha', $gv);
      }
    );
  }

  # Type: gboolean
  method user-resizable is rw is g-property is also<user_resizable> {
    my GLib::Value $gv .= new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('user-resizable', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('user-resizable', $gv);
      }
    );
  }

  # Is originally:
  # MutterClutterStage, -> void
  method Activate {
    self.connect($!mcs, 'activate');
  }

  # Is originally:
  # MutterClutterStage, gpointer --> void
  method After-Paint is also<after_paint> {
    self.connect($!mcs, 'after-paint');
  }

  # Is originally:
  # MutterClutterStage, gpointer --> void
  method Deactivate {
    self.connect($!mcs, 'deactivate');
  }

  # Is originally:
  # MutterClutterStage, MutterClutterEvent, gpointer --> gboolean
  method Delete-Event is also<delete_event> {
    self.connec-event($!mcs, 'delete-event');
  }

  # Is originally:
  # MutterClutterStage, gpointer --> void
  method Fullscreen {
    self.connect($!mcs, 'fullscreen');
  }

  # Is originally:
  # MutterClutterStage, gpointer --> void
  method Unfullscreen {
    self.connect($!mcs, 'unfullscreen');
  }

  method ensure_viewport is also<ensure-viewport> {
    clutter_stage_ensure_viewport($!mcs);
  }

  multi method get_actor_at_pos (|)
    is also<get-actor-at-pos>
  { * }

  multi method get_actor_at_pos (
    Int()  $x,
    Int()  $y,
          :$raw = False,
    Int() :pick_mode(:pick-mode(:$mode)) = CLUTTER_PICK_ALL
  ) {
    samewith($mode, $x, $y, :$raw);
  }
  multi method get_actor_at_pos (
    Int()  $pick_mode,
    Int()  $x,
    Int()  $y,
          :$raw = False
  ) {
    my MutterClutterPickMode  $pm       = $pick_mode;
    my gfloat                ($xx, $yy) = $x, $y;

    propReturnObject(
      clutter_stage_get_actor_at_pos(
        $!mcs,
        $pm,
        $xx,
        $yy
      ),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  proto method get_capture_final_size (|)
    is also<get-capture-final-size>
  { * }

  multi method get_capture_final_size (cairo_rectangle_int_t() $rect) {
    samewith($rect, $, $, $);
  }
  multi method get_capture_final_size (
    cairo_rectangle_int_t() $rect,
                            $out_width  is rw,
                            $out_height is rw,
                            $out_scale  is rw
  ) {
    my gint   ($ow, $oh) = 0 xx 2;
    my gfloat  $os       = 0e0;

    clutter_stage_get_capture_final_size($!mcs, $rect, $ow, $oh, $os);
    ($out_width, $out_height, $out_scale) = ($ow, $oh, $os);
  }

  method get_device_actor (
    MutterClutterInputDevice()    $device,
    MutterClutterEventSequence()  $sequence,
                                 :$raw       = False
  )
    is also<get-device-actor>
  {
    propReturnObject(
      clutter_stage_get_device_actor($!mcs, $device, $sequence),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_event_actor (MutterClutterEvent() $event, :$raw = False)
    is also<get-event-actor>
  {
    propReturnObject(
      clutter_stage_get_event_actor($!mcs, $event),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_grab_actor ( :$raw = False ) is also<get-grab-actor> {
    propReturnObject(
      clutter_stage_get_grab_actor($!mcs),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_key_focus is also<get-key-focus> {
    clutter_stage_get_key_focus($!mcs);
  }

  proto method get_minimum_size (|)
    is also<get-minimum-size>
  { * }

  multi method get_minimum_size {
    samewith($, $);
  }
  multi method get_minimum_size ($width is rw, $height is rw) {
    my guint ($w, $h) = 0 xx 2;

    clutter_stage_get_minimum_size($!mcs, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_perspective (MutterClutterPerspective() $perspective)
    is also<get-perspective>
  {
    clutter_stage_get_perspective($!mcs, $perspective);
  }

  method get_title is also<get-title> {
    clutter_stage_get_title($!mcs);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_stage_get_type, $n, $t );
  }

  method get_view_at (Num() $x, Num() $y) is also<get-view-at> {
    my gfloat ($xx, $yy) = ($x, $y);

    clutter_stage_get_view_at($!mcs, $xx, $yy);
  }

  method grab (MutterClutterActor() $actor) {
    clutter_stage_grab($!mcs, $actor);
  }

  method is_redraw_queued_on_view (MutterClutterStageView() $view)
    is also<is-redraw-queued-on-view>
  {
    so clutter_stage_is_redraw_queued_on_view($!mcs, $view);
  }

  method paint_to_buffer (
    cairo_rectangle_int_t()  $rect,
    Num()                    $scale,
    CArray[uint8]            $data,
    Int()                    $stride,
    Int()                    $format,
    Int()                    $paint_flags,
    CArray[Pointer[GError]]  $error        = gerror
  )
    is also<paint-to-buffer>
  {
    my gfloat                 $sc = $scale,
    my gint                   $s  = $stride;
    my MutterCoglPixelFormat  $f  = $format;
    my MutterClutterPaintFlag $p  = $paint_flags,

    clear_error;
    clutter_stage_paint_to_buffer(
      $!mcs,
      $rect,
      $sc,
      $data,
      $s,
      $f,
      $p,
      $error
    );
    set_error($error);
  }

  method paint_to_content (
    cairo_rectangle_int_t() $rect,
    Num()                   $scale,
    Int()                   $paint_flags,
    CArray[Pointer[GError]] $error         = gerror
  )
    is also<paint-to-content>
  {
    my gfloat                 $s = $scale;
    my MutterClutterPaintFlag $p = $paint_flags;

    clear_error;
    clutter_stage_paint_to_content(
      $!mcs,
      $rect,
      $s,
      $p,
      $error
    );
    set_error($error);
  }

  method paint_to_framebuffer (
    MutterCoglFramebuffer() $framebuffer,
    cairo_rectangle_int_t() $rect,
    Num()                   $scale,
    Int()                   $paint_flags
  )
    is also<paint-to-framebuffer>
  {
    my gfloat                 $s = $scale;
    my MutterClutterPaintFlag $p = $paint_flags;

    clutter_stage_paint_to_framebuffer(
      $!mcs,
      $framebuffer,
      $rect,
      $s,
      $p
    );
  }

  method read_pixels (
    Int() $x,
    Int() $y,
    Int() $width,
    Int() $height
  )
    is also<read-pixels>
  {
    my gint ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    clutter_stage_read_pixels($!mcs, $xx, $yy, $w, $h);
  }

  method schedule_update is also<schedule-update> {
    clutter_stage_schedule_update($!mcs);
  }

  method set_key_focus (MutterClutterActor() $actor) is also<set-key-focus> {
    clutter_stage_set_key_focus($!mcs, $actor);
  }

  method unset_key_focus is also<unset-key-focus> {
    self.set_key_focus(MutterClutterActor);
  }

  method set_minimum_size (Int() $width, Int() $height)
    is also<set-minimum-size>
  {
    my guint ($w, $h) = ($width, $height);

    clutter_stage_set_minimum_size($!mcs, $w, $h);
  }

  method set_title (Str() $title) is also<set-title> {
    clutter_stage_set_title($!mcs, $title);
  }

}
