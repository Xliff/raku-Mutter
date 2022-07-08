use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::InputFocus;

### /usr/src/mutter-42.1/clutter/clutter/clutter-input-focus.h

sub clutter_input_focus_filter_event (
  MutterClutterInputFocus $focus,
  MutterClutterEvent      $event
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_focus_is_focused (MutterClutterInputFocus $focus)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_focus_reset (MutterClutterInputFocus $focus)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_focus_set_can_show_preedit (
  MutterClutterInputFocus $focus,
  gboolean                $can_show_preedit
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_focus_set_content_hints (
  MutterClutterInputFocus            $focus,
  MutterClutterInputContentHintFlags $hint
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_focus_set_content_purpose (
  MutterClutterInputFocus          $focus,
  MutterClutterInputContentPurpose $purpose
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_focus_set_cursor_location (
  MutterClutterInputFocus $focus,
  graphene_rect_t         $rect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_focus_set_input_panel_state (
  MutterClutterInputFocus      $focus,
  MutterClutterInputPanelState $state
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_focus_set_surrounding (
  MutterClutterInputFocus $focus,
  Str                     $text,
  guint                   $cursor,
  guint                   $anchor
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_input_focus_get_type
  returns GType
  is native(mutter-clutter)
  is export
{ * }
