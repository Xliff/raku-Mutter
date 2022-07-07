use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Text;

### /usr/src/mutter-42.1/clutter/clutter/clutter-text.h

sub clutter_text_activate (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_coords_to_position (
  MutterClutterText $self,
  gfloat            $x,
  gfloat            $y
)
  returns gint
  is native(mutter)
  is export
{ * }

sub clutter_text_delete_chars (MutterClutterText $self, guint $n_chars)
  is native(mutter)
  is export
{ * }

sub clutter_text_delete_selection (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_delete_text (
  MutterClutterText $self,
  gssize            $start_pos,
  gssize            $end_pos
)
  is native(mutter)
  is export
{ * }

sub clutter_text_get_activatable (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_get_attributes (MutterClutterText $self)
  returns PangoAttrList
  is native(mutter)
  is export
{ * }

sub clutter_text_get_buffer (MutterClutterText $self)
  returns MutterClutterTextBuffer
  is native(mutter)
  is export
{ * }

sub clutter_text_get_chars (
  MutterClutterText $self,
  gssize $start_pos,
  gssize $end_pos
)
  returns Str
  is native(mutter)
  is export
{ * }

sub clutter_text_get_color (MutterClutterText $self, MutterClutterColor $color)
  is native(mutter)
  is export
{ * }

sub clutter_text_get_cursor_color (
  MutterClutterText  $self,
  MutterClutterColor $color
)
  is native(mutter)
  is export
{ * }

sub clutter_text_get_cursor_position (MutterClutterText $self)
  returns gint
  is native(mutter)
  is export
{ * }

sub clutter_text_get_cursor_rect (
  MutterClutterText $self,
  graphene_rect_t   $rect
)
  is native(mutter)
  is export
{ * }

sub clutter_text_get_cursor_size (MutterClutterText $self)
  returns guint
  is native(mutter)
  is export
{ * }

sub clutter_text_get_cursor_visible (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_get_editable (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_get_ellipsize (MutterClutterText $self)
  returns PangoEllipsizeMode
  is native(mutter)
  is export
{ * }

sub clutter_text_get_font_description (MutterClutterText $self)
  returns PangoFontDescription
  is native(mutter)
  is export
{ * }

sub clutter_text_get_font_name (MutterClutterText $self)
  returns Str
  is native(mutter)
  is export
{ * }

sub clutter_text_get_input_hints (MutterClutterText $self)
  returns MutterClutterInputContentHintFlags
  is native(mutter)
  is export
{ * }

sub clutter_text_get_input_purpose (MutterClutterText $self)
  returns MutterClutterInputContentPurpose
  is native(mutter)
  is export
{ * }

sub clutter_text_get_justify (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_get_layout (MutterClutterText $self)
  returns PangoLayout
  is native(mutter)
  is export
{ * }

sub clutter_text_get_layout_offsets (
  MutterClutterText $self,
  gint $x is rw,
  gint $y is rw
)
  is native(mutter)
  is export
{ * }

sub clutter_text_get_line_alignment (MutterClutterText $self)
  returns PangoAlignment
  is native(mutter)
  is export
{ * }

sub clutter_text_get_line_wrap (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_get_line_wrap_mode (MutterClutterText $self)
  returns PangoWrapMode
  is native(mutter)
  is export
{ * }

sub clutter_text_get_max_length (MutterClutterText $self)
  returns gint
  is native(mutter)
  is export
{ * }

sub clutter_text_get_password_char (MutterClutterText $self)
  returns gunichar
  is native(mutter)
  is export
{ * }

sub clutter_text_get_selectable (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_get_selected_text_color (
  MutterClutterText  $self,
  MutterClutterColor $color
)
  is native(mutter)
  is export
{ * }

sub clutter_text_get_selection (MutterClutterText $self)
  returns Str
  is native(mutter)
  is export
{ * }

sub clutter_text_get_selection_bound (MutterClutterText $self)
  returns gint
  is native(mutter)
  is export
{ * }

sub clutter_text_get_selection_color (
  MutterClutterText  $self,
  MutterClutterColor $color
)
  is native(mutter)
  is export
{ * }

sub clutter_text_get_single_line_mode (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_get_text (MutterClutterText $self)
  returns Str
  is native(mutter)
  is export
{ * }

sub clutter_text_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_text_get_use_markup (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_has_preedit (MutterClutterText $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_insert_text (
  MutterClutterText $self,
  Str               $text,
  gssize            $position
)
  is native(mutter)
  is export
{ * }

sub clutter_text_insert_unichar (MutterClutterText $self, gunichar $wc)
  is native(mutter)
  is export
{ * }

sub clutter_text_new ()
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_text_new_full (
  Str                $font_name,
  Str                $text,
  MutterClutterColor $color
)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_text_new_with_buffer (MutterClutterTextBuffer $buffer)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_text_new_with_text (Str $font_name, Str $text)
  returns MutterClutterActor
  is native(mutter)
  is export
{ * }

sub clutter_text_position_to_coords (
  MutterClutterText $self,
  gint              $position,
  gfloat            $x           is rw,
  gfloat            $y           is rw,
  gfloat            $line_height is rw
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_text_set_activatable (
  MutterClutterText $self,
  gboolean          $activatable
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_attributes (MutterClutterText $self, PangoAttrList $attrs)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_buffer (
  MutterClutterText       $self,
  MutterClutterTextBuffer $buffer
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_color (MutterClutterText $self, MutterClutterColor $color)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_cursor_color (
  MutterClutterText  $self,
  MutterClutterColor $color
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_cursor_position (MutterClutterText $self, gint $position)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_cursor_size (MutterClutterText $self, gint $size)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_cursor_visible (
  MutterClutterText $self,
  gboolean $cursor_visible
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_editable (MutterClutterText $self, gboolean $editable)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_ellipsize (
  MutterClutterText  $self,
  PangoEllipsizeMode $mode
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_font_description (
  MutterClutterText    $self,
  PangoFontDescription $font_desc
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_font_name (MutterClutterText $self, Str $font_name)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_input_hints (
  MutterClutterText                  $self,
  MutterClutterInputContentHintFlags $hints
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_input_purpose (
  MutterClutterText                $self,
  MutterClutterInputContentPurpose $purpose
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_justify (MutterClutterText $self, gboolean $justify)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_line_alignment (
  MutterClutterText $self,
  PangoAlignment    $alignment
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_line_wrap (MutterClutterText $self, gboolean $line_wrap)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_line_wrap_mode (
  MutterClutterText $self,
  PangoWrapMode     $wrap_mode
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_markup (MutterClutterText $self, Str $markup)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_max_length (MutterClutterText $self, gint $max)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_password_char (MutterClutterText $self, gunichar $wc)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_preedit_string (
  MutterClutterText $self,
  Str               $preedit_str,
  PangoAttrList     $preedit_attrs,
  guint             $cursor_pos
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_selectable (MutterClutterText $self, gboolean $selectable)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_selected_text_color (
  MutterClutterText  $self,
  MutterClutterColor $color
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_selection (
  MutterClutterText $self,
  gssize            $start_pos,
  gssize            $end_pos
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_selection_bound (
  MutterClutterText $self,
  gint              $selection_bound
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_selection_color (
  MutterClutterText  $self,
  MutterClutterColor $color
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_single_line_mode (
  MutterClutterText $self,
  gboolean          $single_line
)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_text (MutterClutterText $self, Str $text)
  is native(mutter)
  is export
{ * }

sub clutter_text_set_use_markup (MutterClutterText $self, gboolean $setting)
  is native(mutter)
  is export
{ * }
