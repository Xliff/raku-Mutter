use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::InputMethod;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterClutterInputMethodAncestry is export of Mu
  where MutterClutterInputMethod | GObject;

class Mutter::Clutter::InputMethod {
  also does GLib::Roles::Object;

  has MutterClutterInputMethod $!mcim is implementor;

  submethod BUILD ( :$mutter-clutter-input-method ) {
    self.setMutterClutterInputMethod($mutter-clutter-input-method)
      if $mutter-clutter-input-method;
  }

  method setMutterClutterInputMethod(MutterClutterInputMethodAncestry $_) {
    my $to-parent;

    $!mcim = do {
      when MutterClutterInputMethod {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterInputMethod, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Clutter::Definitions::MutterClutterInputMethod
  { $!mcim }

  method new (
    MutterClutterInputMethodAncestry  $mutter-clutter-input-method,
                                     :$ref                          = True
  ) {
    return Nil unless $mutter-clutter-input-method;

    my $o = self.bless( :$mutter-clutter-input-method );
    $o.ref if $ref;
    $o;
  }

  method commit (Str() $text) {
    clutter_input_method_commit($!mcim, $text);
  }

  method delete_surrounding (Int() $offset, Int() $len) {
    my gint  $o = $offset;
    my guint $l = $len;

    clutter_input_method_delete_surrounding($!mcim, $o, $l);
  }

  method focus_in (MutterClutterInputFocus() $focus) {
    clutter_input_method_focus_in($!mcim, $focus);
  }

  method focus_out {
    clutter_input_method_focus_out($!mcim);
  }

  method forward_key (
    Int() $keyval,
    Int() $keycode,
    Int() $state,
    Int() $time,
    Int() $press
  ) {
    my uint32_t ($kv, $kc, $s, $t) = ($keyval, $keycode, $state, $time);
    my gboolean  $p                =  $press.so.Int;

    clutter_input_method_forward_key($!mcim, $kv, $kc, $s, $t, $p);
  }

  method notify_key_event (MutterClutterEvent() $event, Int() $filtered) {
    my gboolean $f = $filtered.so.Int;

    clutter_input_method_notify_key_event($!mcim, $event, $f);
  }

  method request_surrounding {
    clutter_input_method_request_surrounding($!mcim);
  }

  method set_input_panel_state (Int() $state) {
    my MutterClutterInputPanelState $s = $state;

    clutter_input_method_set_input_panel_state($!mcim, $state);
  }

  method set_preedit_text (
    Str() $preedit,
    Int() $cursor,
    Int() $mode
  ) {
    my MutterClutterPreeditResetMode $m = $mode;
    my gint                          $c = $cursor;

    clutter_input_method_set_preedit_text($!mcim, $preedit, $c, $m);
  }

}
