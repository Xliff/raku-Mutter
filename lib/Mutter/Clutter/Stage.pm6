use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Boxed;
use Mutter::Raw::Clutter::Stage;

use GLib::Value;
use MutterClutter::Actor;

use Mutter::Clutter::Roles::Signals::Stage;

our subset MutterClutterStageAncestry is export of Mu
  where MutterClutterStage | MutterClutterActorAncestry;

class Mutter::Clutter::Stage is Mutter::Clutter::Actor {
  also does Mutter::Clutter::Roles::Signals::Stage;

  has MutterClutterStage $!mcs is implementor;

  method MutterClutter::Raw::Definitions::MutterClutterStage
    is also<MutterClutterStage>
  { $!mcs }

  multi method new (
    MutterClutterStageAncestry  $mutter-clutter-stage,
                               :$ref                   = True
  )
    is default
  {
    return unless $mutter-clutter-stage;

    my $o = self.bless(:$mutter-clutter-stage, :$ref)
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-stage = clutter_stage_new();

    $stage ?? self.bless(:$mutter-clutter-stage) !! Nil;
  }

  # Type: gboolean
  method accept-focus is rw  is also<accept_focus> {
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
  method cursor-visible is rw  is also<cursor_visible> {
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
  method fullscreen-set is rw  is also<fullscreen_set> {
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
  method key-focus is rw  is also<key_focus> {
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
  method no-clear-hint is rw  is also<no_clear_hint> {
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
  method offscreen is rw is DEPRECATED {
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
  method perspective is rw  {
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
  method title is rw  {
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
  method use-alpha is rw  is also<use_alpha> {
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
  method user-resizable is rw  is also<user_resizable> {
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
  # MutterClutterStage, gpointer --> void
  method activate {
    self.connect($!mcs, 'activate');
  }

  # Is originally:
  # MutterClutterStage, gpointer --> void
  method after-paint is also<after_paint> {
    self.connect($!mcs, 'after-paint');
  }

  # Is originally:
  # MutterClutterStage, gpointer --> void
  method deactivate {
    self.connect($!mcs, 'deactivate');
  }

  # Is originally:
  # MutterClutterStage, MutterClutterEvent, gpointer --> gboolean
  method delete-event is also<delete_event> {
    self.connec-event($!mcs, 'delete-event');
  }

  # Is originally:
  # MutterClutterStage, gpointer --> void
  method fullscreen {
    self.connect($!mcs, 'fullscreen');
  }

  # Is originally:
  # MutterClutterStage, gpointer --> void
  method unfullscreen {
    self.connect($!mcs, 'unfullscreen');
  }

  method ensure_viewport is also<ensure-viewport> {
    clutter_stage_ensure_viewport($!cs);
  }

  method get_actor_at_pos (
    Int()  $pick_mode, # ClutterPickMode $pick_mode,
    Int()  $x,
    Int()  $y,
          :$raw = False
  )
    is also<get-actor-at-pos>
  {
    my guint $pm       = $pick_mode;
    my gint ($xx, $yy) = $x, $y;

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

  method get_capture_final_size (cairo_rectangle_int_t $rect, gint $out_width is rw, gint $out_height is rw, gfloat $out_scale is rw) {
    clutter_stage_get_capture_final_size($!mcs, $rect, $out_width is rw, $out_height is rw, $out_scale is rw);
  }

  method get_device_actor (
    MutterClutterInputDevice()    $device,
    MutterClutterEventSequence()  $sequence,
                                 :$raw       = False
  ) {
    propReturnObject(
      clutter_stage_get_device_actor($!mcs, $device, $sequence),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_event_actor (MutterClutterEvent() $event, :$raw = False) {
    propReturnObject(
      clutter_stage_get_event_actor($!mcs, $event),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_grab_actor ( :$raw = False ) {
    propReturnObject(
      clutter_stage_get_grab_actor($!mcs),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_key_focus {
    clutter_stage_get_key_focus($!mcs);
  }

  proto method get_minimum_size (|)
  { * }

  multi method get_minimum_size {
    samewith($, $);
  }
  multi method get_minimum_size ($width is rw, $height is rw) {
    my guint ($w, $h) = 0 xx 2;

    clutter_stage_get_minimum_size($!mcs, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_perspective (MutterClutterPerspective() $perspective) {
    clutter_stage_get_perspective($!mcs, $perspective);
  }

  method get_title {
    clutter_stage_get_title($!mcs);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_stage_get_type, $n, $t );
  }

  method get_view_at (Num() $x, Num() $y) {
    my gfloat ($xx, $yy) = ($x, $y);

    clutter_stage_get_view_at($!mcs, $xx, $yy);
  }

  method grab (MutterClutterActor() $actor) {
    clutter_stage_grab($!mcs, $actor);
  }

  method is_redraw_queued_on_view (MutterClutterStageView() $view) {
    so clutter_stage_is_redraw_queued_on_view($!mcs, $view);
  }

  method paint_to_buffer (
    cairo_rectangle_int_t   $rect,
    gfloat                  $scale,
    CArray[uint8]           $data,
    gint                    $stride,
    CoglPixelFormat         $format,
    MutterClutterPaintFlag  $paint_flags,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    clutter_stage_paint_to_buffer(
      $!mcs,
      $rect,
      $scale,
      $data,
      $stride,
      $format,
      $paint_flags,
      $error
    );
    set_error($error);
  }

  method paint_to_content (
    cairo_rectangle_int_t   $rect,
    gfloat                  $scale,
    MutterClutterPaintFlag  $paint_flags,
    CArray[Pointer[GError]] $error
  ) {
    clear_error;
    clutter_stage_paint_to_content(
      $!mcs,
      $rect,
      $scale,
      $paint_flags,
      $error
    );
    set_error($error);
  }

  method paint_to_framebuffer (
    CoglFramebuffer()      $framebuffer,
    cairo_rectangle_int_t  $rect,
    gfloat                 $scale,
    MutterClutterPaintFlag $paint_flags
  ) {
    clutter_stage_paint_to_framebuffer(
      $!mcs,
      $framebuffer,
      $rect,
      $scale,
      $paint_flags
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

  method schedule_update {
    clutter_stage_schedule_update($!mcs);
  }

  method set_key_focus (MutterClutterActor() $actor) {
    clutter_stage_set_key_focus($!mcs, $actor);
  }

  method set_minimum_size (Int() $width, Int() $height)
    is also<set-minimum-size>
  {
    my guint ($w, $h) = ($width, $height);

    clutter_stage_set_minimum_size($!mcs, $w, $h);
  }

  method set_title (Str() $title) {
    clutter_stage_set_title($!mcs, $title);
  }

}
