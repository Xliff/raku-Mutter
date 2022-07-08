use v6.c;

use NativeCall;

use Cairo;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Backend;

### /usr/src/mutter-42.1/clutter/clutter/clutter-backend.h

sub clutter_get_default_backend ()
  returns MutterClutterBackend
  is native(mutter-clutter)
  is export
{ * }

sub clutter_backend_get_cogl_context (MutterClutterBackend $backend)
  returns MutterCoglContext
  is native(mutter-clutter)
  is export
{ * }

sub clutter_backend_get_default_seat (MutterClutterBackend $backend)
  returns MutterClutterSeat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_backend_get_font_options (MutterClutterBackend $backend)
  returns Cairo::cairo_font_options_t
  is native(mutter-clutter)
  is export
{ * }

sub clutter_backend_get_input_method (MutterClutterBackend $backend)
  returns MutterClutterInputMethod
  is native(mutter-clutter)
  is export
{ * }

sub clutter_backend_get_resolution (MutterClutterBackend $backend)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_backend_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_backend_set_font_options (
  MutterClutterBackend        $backend,
  Cairo::cairo_font_options_t $options
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_backend_set_input_method (
  MutterClutterBackend     $backend,
  MutterClutterInputMethod $method
)
  is native(mutter-clutter)
  is export
{ * }
