use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Stage::Window;

use GLib::GList;

class Mutter::Clutter::Stage::Window {
  has MutterClutterStageWindow $!mcsw is implementor;

  method can_clip_redraws {
    so _clutter_stage_window_can_clip_redraws($!mcsw);
  }

  method finish_frame (
    MutterClutterStageView() $view,
    MutterClutterFrame()     $frame
  ) {
    _clutter_stage_window_finish_frame($!mcsw, $view, $frame);
  }

  method get_frame_counter {
    _clutter_stage_window_get_frame_counter($!mcsw);
  }

  method get_geometry (cairo_rectangle_int_t() $geometry) {
    _clutter_stage_window_get_geometry($!mcsw, $geometry);
  }

  method get_views ( :$raw = False, :$glist = False ) {
    returnGList(
      _clutter_stage_window_get_views($!mcsw),
      $raw,
      $glist,
      |Mutter::Clutter::Stage::View.getTypePair
    );
  }

  method get_wrapper ( :$raw = False ) {
    propReturnObject(
      _clutter_stage_window_get_wrapper($!mcsw),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method hide {
    _clutter_stage_window_hide($!mcsw);
  }

  method prepare_frame (
    MutterClutterStageView() $view,
    MutterClutterFrame()     $frame
  ) {
    _clutter_stage_window_prepare_frame($!mcsw, $view, $frame);
  }

  method realize {
    _clutter_stage_window_realize($!mcsw);
  }

  method redraw_view (
    MutterClutterStageView() $view,
    MutterClutterFrame()     $frame
  ) {
    _clutter_stage_window_redraw_view($!mcsw, $view, $frame);
  }

  method resize (Int() $width, Int() $height) {
    my gint ($w, $h) = ($width, $height);

    _clutter_stage_window_resize($!mcsw, $w, $h);
  }

  method set_accept_focus (Int() $accept_focus) {
    my gboolean $a = $accept_focus;

    _clutter_stage_window_set_accept_focus($!mcsw, $a);
  }

  method set_cursor_visible (Int() $is_visible) {
    my gboolean $i = $is_visible.so.Int;

    _clutter_stage_window_set_cursor_visible($!mcsw, $i);
  }

  method set_title (Str() $title) {
    _clutter_stage_window_set_title($!mcsw, $title);
  }

  method show (Int() $do_raise) {
    my gboolean $d = $do_raise;

    _clutter_stage_window_show($!mcsw, $do_raise);
  }

  method unrealize {
    _clutter_stage_window_unrealize($!mcsw);
  }

}
