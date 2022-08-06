use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::COGL::Output;

### /usr/src/mutter-42.1/cogl/cogl/cogl-output.h

sub cogl_is_output (MutterCoglOutput $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_output_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_output_get_height (MutterCoglOutput $output)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_output_get_mm_height (MutterCoglOutput $output)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_output_get_mm_width (MutterCoglOutput $output)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_output_get_refresh_rate (MutterCoglOutput $output)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_output_get_subpixel_order (MutterCoglOutput $output)
  returns MutterCoglSubpixelOrder
  is native(mutter-clutter)
  is export
{ * }

sub cogl_output_get_width (MutterCoglOutput $output)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_output_get_x (MutterCoglOutput $output)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_output_get_y (MutterCoglOutput $output)
  returns gint
  is native(mutter-clutter)
  is export
{ * }
