use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Structs;

unit package Mutter::Raw::COGL::DepthState;


### /usr/src/mutter-42.1/cogl/cogl/cogl-depth-state.h

sub cogl_depth_state_get_range (
  MutterCoglDepthState $state,
  gfloat               $near_val is rw,
  gfloat               $far_val  is rw
)
  is native(mutter-cogl)
  is export
{ * }

sub cogl_depth_state_get_test_enabled (MutterCoglDepthState $state)
  returns uint32
  is native(mutter-cogl)
  is export
{ * }

sub cogl_depth_state_get_test_function (MutterCoglDepthState $state)
  returns Pointer # MutterCoglDepthTestFunction
  is native(mutter-cogl)
  is export
{ * }

sub cogl_depth_state_get_write_enabled (MutterCoglDepthState $state)
  returns uint32
  is native(mutter-cogl)
  is export
{ * }

sub cogl_depth_state_init (MutterCoglDepthState $state)
  is native(mutter-cogl)
  is export
{ * }

sub cogl_depth_state_set_range (
  MutterCoglDepthState $state,
  gfloat               $near_val,
  gfloat               $far_val
)
  is native(mutter-cogl)
  is export
{ * }

sub cogl_depth_state_set_test_enabled (
  MutterCoglDepthState $state,
  gboolean             $enable
)
  is native(mutter-cogl)
  is export
{ * }

sub cogl_depth_state_set_test_function (
  MutterCoglDepthState $state,
                       &function #= MutterCoglDepthTestFunction
)
  is native(mutter-cogl)
  is export
{ * }

sub cogl_depth_state_set_write_enabled (
  MutterCoglDepthState $state,
  gboolean             $enable
)
  is native(mutter-cogl)
  is export
{ * }
