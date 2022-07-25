use v6.c;

use MONKEY-TYPING;

use NativeCall;

use Mutter::Raw::Types;

augment class MutterClutterFrame {

  method get_hints {
    clutter_frame_get_hints(self);
  }

  method has_result {
    so clutter_frame_has_result(self);
  }

  method set_hint (Int() $hint) {
    my MutterClutterFrameHint $h = $hint;

    clutter_frame_set_hint(self, $hint);
  }

  method set_result (Int() $result) {
    my MutterClutterFrameResult $r = $result;

    clutter_frame_set_result(self, $r);
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-frame.h

sub clutter_frame_get_hints (MutterClutterFrame $frame)
  returns MutterClutterFrameHint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_has_result (MutterClutterFrame $frame)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_set_hint (
  MutterClutterFrame     $frame,
  MutterClutterFrameHint $hint
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_frame_set_result (
  MutterClutterFrame       $frame,
  MutterClutterFrameResult $result
)
  is native(mutter-clutter)
  is export
{ * }
