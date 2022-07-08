use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::InputFocus;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterClutterInputFocusAncestry is export of Mu
  where MutterClutterInputFocus | GObject;

class Mutter::Clutter::InputFocus {
  also does GLib::Roles::Object;

  has MutterClutterInputFocus $!mcif is implementor;

  submethod BUILD ( :$mutter-clutter-container ) {
    self.setMutterClutterInputFocus($mutter-clutter-container)
      if $mutter-clutter-container;
  }

  method setMutterClutterInputFocus(MutterClutterInputFocusAncestry $_) {
    my $to-parent;

    $!mcif = do {
      when MutterClutterInputFocus {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterInputFocus, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Clutter::Definitions::MutterClutterInputFocus
  { $!mcif }

  method new (
    MutterClutterInputFocusAncestry  $mutter-clutter-container,
                                    :$ref                       = True
  ) {
    return Nil unless $mutter-clutter-container;

    my $o = self.bless( :$mutter-clutter-container );
    $o.ref if $ref;
    $o;
  }

  method filter_event (MutterClutterEvent() $event) {
    so clutter_input_focus_filter_event($!mcif, $event);
  }

  method is_focused {
    so clutter_input_focus_is_focused($!mcif);
  }

  method reset {
    clutter_input_focus_reset($!mcif);
  }

  method set_can_show_preedit (gboolean $can_show_preedit) {
    my gboolean $c = $can_show_preedit.so.Int;

    clutter_input_focus_set_can_show_preedit($!mcif, $c);
  }

  method set_content_hints (Int() $hint) {
    my MutterClutterInputContentHintFlags $h = $hint;

    clutter_input_focus_set_content_hints($!mcif, $h);
  }

  method set_content_purpose (Int() $purpose) {
    my MutterClutterInputContentPurpose $p = $purpose;

    clutter_input_focus_set_content_purpose($!mcif, $p);
  }

  method set_cursor_location (graphene_rect_t() $rect) {
    clutter_input_focus_set_cursor_location($!mcif, $rect);
  }

  method set_input_panel_state (Int() $state) {
    my MutterClutterInputPanelState $s = $state;

    clutter_input_focus_set_input_panel_state($!mcif, $s);
  }

  method set_surrounding (Str() $text, Int() $cursor, Int() $anchor) {
    my guint ($c, $a) = ($cursor, $anchor);

    clutter_input_focus_set_surrounding($!mcif, $text, $c, $a);
  }

}
