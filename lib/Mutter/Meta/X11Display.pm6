use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::X11Display;

has GLib::Roles::Object;

class Mutter::Meta::X11Display {
  also does GLib::Roles::Object;
  
  has MetaX11Display $!mx11d is implementor;

  method clear_stage_input_region is also<clear-stage-input-region> {
    meta_x11_display_clear_stage_input_region($!mx11d);
  }

  method get_damage_event_base is also<get-damage-event-base> {
    meta_x11_display_get_damage_event_base($!mx11d);
  }

  method get_screen_number is also<get-screen-number> {
    meta_x11_display_get_screen_number($!mx11d);
  }

  method get_shape_event_base is also<get-shape-event-base> {
    meta_x11_display_get_shape_event_base($!mx11d);
  }

  method get_xdisplay is also<get-xdisplay> {
    meta_x11_display_get_xdisplay($!mx11d);
  }

  method get_xinput_opcode is also<get-xinput-opcode> {
    meta_x11_display_get_xinput_opcode($!mx11d);
  }

  method get_xroot is also<get-xroot> {
    meta_x11_display_get_xroot($!mx11d);
  }

  method has_shape is also<has-shape> {
    meta_x11_display_has_shape($!mx11d);
  }

  method meta_x11_init_gdk_display is also<meta-x11-init-gdk-display> {
    meta_x11_init_gdk_display($!mx11d);
  }

  method set_cm_selection is also<set-cm-selection> {
    meta_x11_display_set_cm_selection($!mx11d);
  }

  method set_stage_input_region (XserverRegion $region)
    is also<set-stage-input-region>
  {
    meta_x11_display_set_stage_input_region($!mx11d, $region);
  }

  method xwindow_is_a_no_focus_window (Window $xwindow)
    is also<xwindow-is-a-no-focus-window>
  {
    meta_x11_display_xwindow_is_a_no_focus_window($!mx11d, $xwindow);
  }

}
