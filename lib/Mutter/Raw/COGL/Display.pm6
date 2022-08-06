use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::COGL::Display;

### /usr/src/mutter-42.1/cogl/cogl/cogl-display.h

sub cogl_is_display (MutterCoglDisplay $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_display_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_display_get_renderer (MutterCoglDisplay $display)
  returns MutterCoglRenderer
  is native(mutter-clutter)
  is export
{ * }

sub cogl_display_new (
  MutterCoglRenderer         $renderer,
  MutterCoglOnscreenTemplate $onscreen_template
)
  returns MutterCoglDisplay
  is native(mutter-clutter)
  is export
{ * }

sub cogl_display_set_onscreen_template (
  MutterCoglDisplay          $display,
  MutterCoglOnscreenTemplate $onscreen_template
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_display_setup (
  MutterCoglDisplay       $display,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }
