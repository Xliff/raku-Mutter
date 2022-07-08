use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::InputMethod;

### /usr/src/mutter-42.1/clutter/clutter/clutter-input-method.h

sub clutter_input_method_commit (MutterClutterInputMethod $im, Str $text)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_method_delete_surrounding (
  MutterClutterInputMethod $im,
  gint                     $offset,
  guint                    $len
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_method_focus_in (
  MutterClutterInputMethod $im,
  MutterClutterInputFocus  $focus
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_method_focus_out (MutterClutterInputMethod $im)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_method_forward_key (
  MutterClutterInputMethod $im,
  uint32_t                 $keyval,
  uint32_t                 $keycode,
  uint32_t                 $state,
  uint64_t                 $time_,
  gboolean                 $press
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_method_notify_key_event (
  MutterClutterInputMethod $im,
  MutterClutterEvent       $event,
  gboolean                 $filtered
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_method_request_surrounding (MutterClutterInputMethod $im)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_method_set_input_panel_state (
  MutterClutterInputMethod     $im,
  MutterClutterInputPanelState $state
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_method_set_preedit_text (
  MutterClutterInputMethod      $im,
  Str                           $preedit,
  gint                          $cursor,
  MutterClutterPreeditResetMode $mode
)
  is native(mutter-clutter)
  is export
{ * }
