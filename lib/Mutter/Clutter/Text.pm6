use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Text;

use Mutter::Clutter::Actor;

use GLib::Roles::Implementor;

our subset MutterClutterTextAncestry is export of Mu
  where MutterClutterText | MutterClutterActorAncestry;

class Mutter::Clutter::Text is Mutter::Clutter::Actor {
  has MutterClutterText $!mct is implementor;

  has $!old-markup;

  submethod BUILD ( :$mutter-clutter-text ) {
    self.setMutterClutterText($mutter-clutter-text) if $mutter-clutter-text
  }

  method setMutterClutterText (MutterClutterTextAncestry $_) {
    my $to-parent;

    $!mct = do {
      when MutterClutterText {
        $to-parent = cast(MutterClutterActor, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterText, $_);
      }
    }
    self.setMutterClutterActor($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterText
    is also<MutterClutterText>
  { $!mct }

  multi method new (
    MutterClutterTextAncestry  $mutter-clutter-text,

                              :$ref = True
  ) {
    return unless $mutter-clutter-text;

    my $o = self.bless( :$mutter-clutter-text );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-text = clutter_text_new();

    $mutter-clutter-text ?? self.bless( :$mutter-clutter-text )  !! Nil
  }

  method new_full (
    Str()                $font_name,
    Str()                $text,
    MutterClutterColor() $color
  )
    is also<new-full>
  {
    my $mutter-clutter-text = clutter_text_new_full(
      $font_name,
      $text,
      $color
    );

    $mutter-clutter-text ?? self.bless( :$mutter-clutter-text )  !! Nil
  }

  method new_with_buffer (MutterClutterTextBuffer() $buffer)
    is also<new-with-buffer>
  {
    my $mutter-clutter-text = clutter_text_new_with_buffer($!mct, $buffer);

    $mutter-clutter-text ?? self.bless( :$mutter-clutter-text )  !! Nil
  }

  method new_with_text (Str() $font_name, Str() $text)
    is also<new-with-text>
  {
    my $mutter-clutter-text = clutter_text_new_with_text($font_name, $text);

    $mutter-clutter-text ?? self.bless( :$mutter-clutter-text )  !! Nil
  }

  # Type: MutterTextBuffer
  method buffer ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::TextBuffer.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('buffer', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::TextBuffer.getTypePair
        );
      },
      STORE => -> $, MutterClutterTextBuffer() $val is copy {
        $gv.object = $val;
        self.prop_set('buffer', $gv);
      }
    );
  }

  # Type: string
  method font-name is rw  is g-property is also<font_name> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('font-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('font-name', $gv);
      }
    );
  }

  # Type: MutterFontDescription
  method font-description ( :$raw = False )
    is rw
    is g-property
    is also<font_description>
  {
    my $gv = GLib::Value.new( Pango::FontDescription.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('font-description', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Pango::FontDescription.getTypePair
        );
      },
      STORE => -> $, PangoFontDescription() $val is copy {
        $gv.object = $val;
        self.prop_set('font-description', $gv);
      }
    );
  }

  # Type: string
  method text is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('text', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('text', $gv);
      }
    );
  }

  # Type: boolean
  method editable is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('editable', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('editable', $gv);
      }
    );
  }

  # Type: boolean
  method selectable is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('selectable', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('selectable', $gv);
      }
    );
  }

  # Type: boolean
  method activatable is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('activatable', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('activatable', $gv);
      }
    );
  }

  # Type: boolean
  method cursor-visible is rw  is g-property is also<cursor_visible> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('cursor-visible', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('cursor-visible', $gv);
      }
    );
  }

  # Type: boolean
  method cursor-color-set is rw  is g-property is also<cursor_color_set> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('cursor-color-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'cursor-color-set does not allow writing'
      }
    );
  }

  # Type: int
  method cursor-size is rw  is g-property is also<cursor_size> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('cursor-size', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('cursor-size', $gv);
      }
    );
  }

  # Type: int
  method position is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        warn 'position does not allow reading' if $DEBUG;
        0;
      },
      STORE => -> $, Int() $val is copy {
        warn 'position does not allow writing'
      }
    );
  }

  # Type: int
  method cursor-position is rw  is g-property is also<cursor_position> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('cursor-position', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('cursor-position', $gv);
      }
    );
  }

  # Type: int
  method selection-bound is rw  is g-property is also<selection_bound> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('selection-bound', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('selection-bound', $gv);
      }
    );
  }

  # Type: boolean
  method selection-color-set
    is rw
    is g-property
    is also<selection_color_set>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('selection-color-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'selection-color-set does not allow writing'
      }
    );
  }

  # Type: PangoAttrList
  method attributes ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Pango::AttrList.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('attributes', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Pango::AtrrList.getTypePair
        );
      },
      STORE => -> $, PangoAttrList() $val is copy {
        $gv.object = $val;
        self.prop_set('attributes', $gv);
      }
    );
  }

  # Type: boolean
  method use-markup is rw  is g-property is also<use_markup> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('use-markup', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('use-markup', $gv);
      }
    );
  }

  # Type: boolean
  method line-wrap is rw  is g-property is also<line_wrap> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('line-wrap', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('line-wrap', $gv);
      }
    );
  }

  # Type: PangoWrapMode
  method line-wrap-mode is rw  is g-property is also<line_wrap_mode> {
    my $gv = GLib::Value.new( GLib::Value.typeFromEnum(PangoWrapMode) );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('line-wrap-mode', $gv);
        PangoWrapModeEnum( $gv.valueFromEnum(PangoWrapMode) )
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(PangoWrapMode) = $val;
        self.prop_set('line-wrap-mode', $gv);
      }
    );
  }

  # Type: MutterEllipsizeMode
  method ellipsize is rw  is g-property {
    my $gv = GLib::Value.new( GLib::Value.typeFromEnum(PangoEllipsizeMode) );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('ellipsize', $gv);
        PangoEllipsizeModeEnum( $gv.valueFromEnum(PangoEllipsizeMode) )
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(PangoEllipsizeMode) = $val;
        self.prop_set('ellipsize', $gv);
      }
    );
  }

  # Type: Mutter
  method line-alignment is rw  is g-property is also<line_alignment> {
    my $gv = GLib::Value.new( Mutter );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('line-alignment', $gv);
        $gv.Mutter;
      },
      STORE => -> $,  $val is copy {
        $gv.Mutter = $val;
        self.prop_set('line-alignment', $gv);
      }
    );
  }

  # Type: boolean
  method justify is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('justify', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('justify', $gv);
      }
    );
  }

  # Type: Mutter
  method password-char is rw  is g-property is also<password_char> {
    my $gv = GLib::Value.new( Mutter );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('password-char', $gv);
        $gv.Mutter;
      },
      STORE => -> $,  $val is copy {
        $gv.Mutter = $val;
        self.prop_set('password-char', $gv);
      }
    );
  }

  # Type: int
  method max-length is rw  is g-property is also<max_length> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('max-length', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('max-length', $gv);
      }
    );
  }

  # Type: boolean
  method single-line-mode is rw  is g-property is also<single_line_mode> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('single-line-mode', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('single-line-mode', $gv);
      }
    );
  }

  # Type: boolean
  method selected-text-color-set
    is rw
    is g-property
    is also<selected_text_color_set>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('selected-text-color-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, $val is copy {
        warn 'selected-text-color-set does not allow writing'
      }
    );
  }

  # Type: MutterClutterInputContentHintFlags
  method input-hints is rw  is g-property is also<input_hints> {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterInputContentHintFlags)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('input-hints', $gv);
        $gv.valueFromEnum(MutterClutterInputContentHintFlags);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(MutterClutterInputContentHintFlags) = $val;
        self.prop_set('input-hints', $gv);
      }
    );
  }

  # Type: MutterClutterInputContentPurpose
  method input-purpose is rw  is g-property is also<input_purpose> {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterInputContentPurpose)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('input-purpose', $gv);
        MutterClutterInputContentPurposeEnum(
          $gv.valueFromEnum(MutterClutterInputContentPurpose)
        );
      },
      STORE => -> $, Int() $val is copy {
        $gv.$gv.valueFromEnum(MutterClutterInputContentPurpose) = $val;
        self.prop_set('input-purpose', $gv);
      }
    );
  }

  method markup is rw {
    Proxy.new:
      FETCH => $     { $!old-markup // '' }
      STIRE => $, \v { $.set_markup(v)    }
  }

  method activate {
    clutter_text_activate($!mct);
  }

  method coords_to_position (Num() $x, Num() $y)
    is also<coords-to-position>
  {
    my gfloat ($xx, $yy) = ($x, $y);

    clutter_text_coords_to_position($!mct, $xx, $yy);
  }

  method delete_chars (Int() $n_chars) is also<delete-chars> {
    my guint $n = $n_chars;

    clutter_text_delete_chars($!mct, $n);
  }

  method delete_selection is also<delete-selection> {
    clutter_text_delete_selection($!mct);
  }

  method delete_text (Int() $start_pos, Int() $end_pos)
    is also<delete-text>
  {
    my gssize ($s, $e) = ($start_pos, $end_pos);

    clutter_text_delete_text($!mct, $s, $e);
  }

  method get_activatable is also<get-activatable> {
    so clutter_text_get_activatable($!mct);
  }

  method get_attributes ( :$raw = False ) is also<get-attributes> {
    propReturnObject(
      clutter_text_get_attributes($!mct),
      $raw,
      |Pango::AttrList.getTypePair
    );
  }

  method get_buffer ( :$raw = False ) is also<get-buffer> {
    propReturnObject(
      clutter_text_get_buffer($!mct),
      $raw,
      |Mutter::Clutter::TextBuffer.getTypePair
    );
  }

  method get_chars (Int() $start_pos, Int() $end_pos) is also<get-chars> {
    my gssize ($s, $e) = ($start_pos, $end_pos);

    clutter_text_get_chars($!mct, $s, $e);
  }

  method get_color (MutterClutterColor() $color) is also<get-color> {
    clutter_text_get_color($!mct, $color);
  }

  method get_cursor_color (MutterClutterColor() $color)
    is also<get-cursor-color>
  {
    clutter_text_get_cursor_color($!mct, $color);
  }

  method get_cursor_position is also<get-cursor-position> {
    clutter_text_get_cursor_position($!mct);
  }
  method get_cursor_rect (graphene_rect_t() $rect) is also<get-cursor-rect> {
    clutter_text_get_cursor_rect($!mct, $rect);
  }

  method get_cursor_size is also<get-cursor-size> {
    clutter_text_get_cursor_size($!mct);
  }

  method get_cursor_visible is also<get-cursor-visible> {
    so clutter_text_get_cursor_visible($!mct);
  }

  method get_editable is also<get-editable> {
    so clutter_text_get_editable($!mct);
  }

  method get_ellipsize is also<get-ellipsize> {
    PangoEllipsizeModeEnum( clutter_text_get_ellipsize($!mct) );
  }

  method get_font_description is also<get-font-description> {
    clutter_text_get_font_description($!mct);
  }

  method get_font_name is also<get-font-name> {
    clutter_text_get_font_name($!mct);
  }

  method get_input_hints ( :set(:$flags) ) is also<get-input-hints> {
    my $hf = clutter_text_get_input_hints($!mct);
    return unless $flags;
    getFlags(MutterClutterInputContentHintFlags, $flags);
  }

  method get_input_purpose ( :set(:$flags) ) is also<get-input-purpose> {
    MutterClutterInputContentPurpose( clutter_text_get_input_purpose($!mct) )
  }

  method get_justify is also<get-justify> {
    so clutter_text_get_justify($!mct);
  }

  method get_layout (:$raw = False ) is also<get-layout> {
    propReturnObject(
      clutter_text_get_layout($!mct),
      $raw,
      |Pango::Layout.getTypePair
    );
  }

  proto method get_layout_offsets (|)
    is also<get-layout-offsets>
  { * }

  multi method get_layout_offsets {
    samewith($, $);
  }
  multi method get_layout_offsets ($x is rw, $y is rw) {
    my gint ($xx, $yy) = 0 xx 2;

    clutter_text_get_layout_offsets($!mct, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  method get_line_alignment is also<get-line-alignment> {
    PangoAlignmentEnum( clutter_text_get_line_alignment($!mct) );
  }

  method get_line_wrap is also<get-line-wrap> {
    so clutter_text_get_line_wrap($!mct);
  }

  method get_line_wrap_mode is also<get-line-wrap-mode> {
    PangoWrapModeEnum( clutter_text_get_line_wrap_mode($!mct) );
  }

  method get_max_length is also<get-max-length> {
    clutter_text_get_max_length($!mct);
  }

  method get_password_char is also<get-password-char> {
    clutter_text_get_password_char($!mct);
  }

  method get_selectable is also<get-selectable> {
    so clutter_text_get_selectable($!mct);
  }

  method get_selected_text_color (MutterClutterColor() $color)
    is also<get-selected-text-color>
  {
    clutter_text_get_selected_text_color($!mct, $color);
  }

  method get_selection is also<get-selection> {
    clutter_text_get_selection($!mct);
  }

  method get_selection_bound is also<get-selection-bound> {
    clutter_text_get_selection_bound($!mct);
  }

  method get_selection_color (MutterClutterColor() $color)
    is also<get-selection-color>
  {
    clutter_text_get_selection_color($!mct, $color);
  }

  method get_single_line_mode is also<get-single-line-mode> {
    so clutter_text_get_single_line_mode($!mct);
  }

  method get_text is also<get-text> {
    clutter_text_get_text($!mct);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_text_get_type, $n, $t );
  }

  method get_use_markup is also<get-use-markup> {
    so clutter_text_get_use_markup($!mct);
  }

  method has_preedit is also<has-preedit> {
    so clutter_text_has_preedit($!mct);
  }

  method insert_text (Str() $text, Int() $position) is also<insert-text> {
    my gssize $p = $position;

    clutter_text_insert_text($!mct, $text, $p);
  }

  proto method insert_unichar (|)
    is also<insert-unichar>
  { * }

  multi method insert_unichar (Str $wc) {
    samewith( $wc.substr(0, 1).ord );
  }
  multi method insert_unichar (Int $wc) {
    my gunichar $w = $wc;
    clutter_text_insert_unichar($!mct, $wc);
  }

  proto method position_to_coords (|)
    is also<position-to-coords>
  { * }

  multi method position_to_coords (Int() $position) {
    samewith($position, $, $)
  }
  multi method position_to_coords (
    Int() $position,
          $x           is rw,
          $y           is rw,
          $line_height is rw
  ) {
    my gint    $p            = $position;
    my gfloat ($xx, $yy, $l) = 0e0 xx 3;
set_selec
    clutter_text_position_to_coords($!mct, $position, $xx, $yy, $l);
    ($x, $y, $line_height) = ($x, $y,= $l);
  }

  method set_activatable (Int() $activatable) is also<set-activatable> {
    my gboolean $a = $activatable.so.Int;

    clutter_text_set_activatable($!mct, $activatable);
  }

  method set_attributes (PangoAttrList() $attrs) is also<set-attributes> {
    clutter_text_set_attributes($!mct, $attrs);
  }

  method set_buffer (MutterClutterTextBuffer() $buffer) is also<set-buffer> {
    clutter_text_set_buffer($!mct, $buffer);
  }

  method set_color (MutterClutterColor() $color) is also<set-color> {
    clutter_text_set_color($!mct, $color);
  }

  method set_cursor_color (MutterClutterColor() $color)
    is also<set-cursor-color>
  {
    clutter_text_set_cursor_color($!mct, $color);
  }

  method set_cursor_position (Int() $position) is also<set-cursor-position> {
    my gint $p = $position;

    clutter_text_set_cursor_position($!mct, $p);
  }

  method set_cursor_size (Int() $size) is also<set-cursor-size> {
    my gint $s = $size;

    clutter_text_set_cursor_size($!mct, $size);
  }

  method set_cursor_visible (Int() $cursor_visible)
    is also<set-cursor-visible>
  {
    my gboolean $c = $cursor_visible.so.Int;

    clutter_text_set_cursor_visible($!mct, $c);
  }

  method set_editable (Int() $editable) is also<set-editable> {
    my gboolean $e = $editable.so.Int;

    clutter_text_set_editable($!mct, $e);
  }

  method set_ellipsize (Int() $mode) is also<set-ellipsize> {
    my PangoEllipsizeMode $m = $mode;

    clutter_text_set_ellipsize($!mct, $m);
  }

  method set_font_description (PangoFontDescription() $font_desc)
    is also<set-font-description>
  {
    clutter_text_set_font_description($!mct, $font_desc);
  }

  method set_font_name (Str() $font_name) is also<set-font-name> {
    clutter_text_set_font_name($!mct, $font_name);
  }

  method set_input_hints (Int() $hints) is also<set-input-hints> {
    my MutterClutterInputContentHintFlags $h = $hints;

    clutter_text_set_input_hints($!mct, $h);
  }

  method set_input_purpose (MutterClutterInputContentPurpose $purpose)
    is also<set-input-purpose>
  {
    my MutterClutterInputContentPurpose $p = $purpose;

    clutter_text_set_input_purpose($!mct, $p);
  }

  method set_justify (Int() $justify) is also<set-justify> {
    my gboolean $j = $justify;

    clutter_text_set_justify($!mct, $justify);
  }

  method set_line_alignment (Int(set_selec) $alignment)
    is also<set-line-alignment>
  {
    my PangoAlignment $a = $alignment;

    clutter_text_set_line_alignment($!mct, $a);
  }

  method set_line_wrap (Int() $line_wrap) is also<set-line-wrap> {
    my gboolean $l = $line_wrap.so.Int;

    clutter_text_set_line_wrap($!mct, $l);
  }

  method set_line_wrap_mode (Int() $wrap_mode) is also<set-line-wrap-mode> {
    my PangoWrapMode $w = $wrap_mode;

    clutter_text_set_line_wrap_mode($!mct, $w);
  }

  method set_markup (Str() $markup) is also<set-markup> {
    $!old-markup = $markup;
    clutter_text_set_markup($!mct, $markup);
  }

  method set_max_length (Int() $max) is also<set-max-length> {
    my gint $m = $max;

    clutter_text_set_max_length($!mct, $max);
  }

  proto method set_password_char (|)
    is also<set-password-char>
  { * }

  multi method set_password_char (Str $wc) {
    die 'Cannot set password char from null string!'
      unless $wc.chars;
    warn 'Setting password char to first character of an oversized string!'
      unless $wc.chars == 1;

    samewith($wc.substr(0, 1).ord);
  }
  multi method set_password_char (Int $wc) {
    my gunichar $w = $wc;

    clutter_text_set_password_char($!mct, $w);
  }

  method set_preedit_string (
    Str() $preedit_str,
    Int() $preedit_attrs,
    Int() $cursor_pos
  )
    is also<set-preedit-string>
  {
    my guint         $c = $cursor_pos;
    my PangoAttrList $p = $preedit_attrs,

    clutter_text_set_preedit_string($!mct, $preedit_str, $p, $c);
  }

  method set_selectable (Int() $selectable) is also<set-selectable> {
    my gboolean $s = $selectable.so.Int;

    clutter_text_set_selectable($!mct, $selectable);
  }

  method set_selected_text_color (MutterClutterColor() $color)
    is also<set-selected-text-color>
  {
    clutter_text_set_selected_text_color($!mct, $color);
  }

  method set_selection (Int() $start_pos, Int() $end_pos)
    is also<set-selection>
  {
    my gssize ($s, $e) = ($start_pos, $end_pos);

    clutter_text_set_selection($!mct, $s, $e);
  }
  method unset_selection is also<unset-selection> {
    self.set_selection(0, 0);
  }

  method set_selection_bound (Int() $selection_bound)
    is also<set-selection-bound>
  {
    my gint $s = $selection_bound;

    clutter_text_set_selection_bound($!mct, $s);
  }

  method set_selection_color (MutterClutterColor() $color)
    is also<set-selection-color>
  {
    clutter_text_set_selection_color($!mct, $color);
  }

  method set_single_line_mode (Int() $single_line)
    is also<set-single-line-mode>
  {
    my gboolean $s = $single_line.so.Int;

    clutter_text_set_single_line_mode($!mct, $s);
  }

  method set_text (Str() $text) is also<set-text> {
    clutter_text_set_text($!mct, $text);
  }

  method set_use_markup (Int() $setting) is also<set-use-markup> {
    my gboolean $s = $setting.so.Int;

    clutter_text_set_use_markup($!mct, $s);
  }

}
