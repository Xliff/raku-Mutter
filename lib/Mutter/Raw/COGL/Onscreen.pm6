use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;
use Mutter::Raw::Structs;

unit package Mutter::Raw::COGL::Onscreen;

### /usr/src/mutter-42.1/cogl/cogl/cogl-onscreen.h

sub cogl_onscreen_add_dirty_callback (
  MutterCoglOnscreen $onscreen,
                     &callback (
                       MutterCoglOnscreen,
                       MutterCoglOnscreenDirtyInfo,
                       gpointer
                     ),
  Pointer            $user_data,
                     &destroy (gpointer)
)
  returns MutterCoglOnscreenDirtyClosure
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_add_frame_callback (
  MutterCoglOnscreen $onscreen,
                     &callback (
                       MutterCoglOnscreen,
                       MutterCoglFrameEvent,
                       MutterCoglFrameInfo,
                       gpointer
                     ),
  Pointer            $user_data,
                     &destroy (gpointer)
)
  returns MutterCoglFrameClosure
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_add_frame_info (
  MutterCoglOnscreen  $onscreen,
  MutterCoglFrameInfo $info
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_frame_closure_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_scanout_error_quark ()
  returns GQuark
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_direct_scanout (
  MutterCoglOnscreen      $onscreen,
  MutterCoglScanout       $scanout,
  MutterCoglFrameInfo     $info,
  gpointer                $user_data,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_dirty_closure_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_get_buffer_age (MutterCoglOnscreen $onscreen)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_get_frame_counter (MutterCoglOnscreen $onscreen)
  returns int64_t
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_hide (MutterCoglOnscreen $onscreen)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_queue_damage_region (
  MutterCoglOnscreen $onscreen,
  CArray[gint]       $rectangles,
  gint               $n_rectangles
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_remove_dirty_callback (
  MutterCoglOnscreen             $onscreen,
  MutterCoglOnscreenDirtyClosure $closure
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_remove_frame_callback (
  MutterCoglOnscreen     $onscreen,
  MutterCoglFrameClosure $closure
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_show (MutterCoglOnscreen $onscreen)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_swap_buffers (
  MutterCoglOnscreen  $onscreen,
  MutterCoglFrameInfo $frame_info,
  gpointer            $user_data
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_swap_buffers_with_damage (
  MutterCoglOnscreen  $onscreen,
  CArray[gint]        $rectangles    is rw,
  gint                $n_rectangles,
  MutterCoglFrameInfo $info,
  gpointer            $user_data
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_swap_region (
  MutterCoglOnscreen  $onscreen,
  CArray[gint]        $rectangles,
  gint                $n_rectangles,
  MutterCoglFrameInfo $info,
  gpointer            $user_data
)
  is native(mutter-clutter)
  is export
{ * }
