use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::COGL::FrameInfo;

### /usr/src/mutter-42.1/cogl/cogl/cogl-frame-info.h

sub cogl_is_frame_info (MutterCoglFrameInfo $object)
  returns uint32
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_get_frame_counter (MutterCoglFrameInfo $info)
  returns int64_t
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_get_global_frame_counter (MutterCoglFrameInfo $info)
  returns int64_t
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_get_gtype ()
  returns GType
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_get_is_symbolic (MutterCoglFrameInfo $info)
  returns uint32
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_get_presentation_time_us (MutterCoglFrameInfo $info)
  returns int64_t
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_get_refresh_rate (MutterCoglFrameInfo $info)
  returns gfloat
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_get_rendering_duration_ns (MutterCoglFrameInfo $info)
  returns int64_t
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_get_sequence (MutterCoglFrameInfo $info)
  returns gint
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_get_time_before_buffer_swap_us (MutterCoglFrameInfo $info)
  returns int64_t
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_is_hw_clock (MutterCoglFrameInfo $info)
  returns uint32
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_is_vsync (MutterCoglFrameInfo $info)
  returns uint32
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_is_zero_copy (MutterCoglFrameInfo $info)
  returns uint32
  is native(mutter-cogl)
  is export
{ * }

sub cogl_frame_info_new (
  MutterCoglContext $context,
  int64_t           $global_frame_counter
)
  returns MutterCoglFrameInfo
  is native(mutter-cogl)
  is export
{ * }
