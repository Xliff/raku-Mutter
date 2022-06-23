use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::X11Display;

### /usr/src/mutter-42.1/src/meta/meta-x11-display.h

sub meta_x11_display_clear_stage_input_region (MetaX11Display $x11_display)
  is native(mutter)
  is export
{ * }

sub meta_x11_display_get_damage_event_base (MetaX11Display $x11_display)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_x11_display_get_screen_number (MetaX11Display $x11_display)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_x11_display_get_shape_event_base (MetaX11Display $x11_display)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_x11_display_get_xdisplay (MetaX11Display $x11_display)
  returns Display
  is native(mutter)
  is export
{ * }

sub meta_x11_display_get_xinput_opcode (MetaX11Display $x11_display)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_x11_display_get_xroot (MetaX11Display $x11_display)
  returns Window
  is native(mutter)
  is export
{ * }

sub meta_x11_display_has_shape (MetaX11Display $x11_display)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_x11_init_gdk_display (CArray[Pointer[GError]] $error)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_x11_display_set_cm_selection (MetaX11Display $x11_display)
  is native(mutter)
  is export
{ * }

sub meta_x11_display_set_stage_input_region (
  MetaX11Display $x11_display,
  XserverRegion  $region
)
  is native(mutter)
  is export
{ * }

sub meta_x11_display_xwindow_is_a_no_focus_window (
  MetaX11Display $x11_display,
  Window         $xwindow
)
  returns uint32
  is native(mutter)
  is export
{ * }
