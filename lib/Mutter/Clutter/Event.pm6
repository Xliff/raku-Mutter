use v6.c;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Event;

# STRUCT

use GLib::Roles::Implementor;

class Mutter::Clutter::Event::Sequence {
  has MutterClutterEventSequence $!mces handles(*) is implementor;

  method get_slot {
    clutter_event_sequence_get_slot($!mces);
  }

  method get_type is static {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_event_sequence_get_type, $n, $t );
  }
}

class Mutter::Clutter::Event {
  also does GLib::Roles::Implementor;

  has MutterClutterEvent $!mce is implementor;

  submethod BUILD ( :$mutter-clutter-event ) {
    $!mce = $mutter-clutter-event ~~ MutterClutterEvent
      ?? $mutter-clutter-event
      !! cast(MutterClutterEvent, $mutter-clutter-event)
  }

  multi method new (
    #MutterClutterEventAncestry
    $mutter-clutter-event
  ) {
    $mutter-clutter-event ?? self.bless( :$mutter-clutter-event ) !! Nil
  }
  multi method new (Int() $type) {
    my guint $t                    = $type;
    my       $mutter-clutter-event = clutter_event_new($t);

    $mutter-clutter-event ?? self.bless( :$mutter-clutter-event ) !! Nil
  }

  method get (:$raw = False ) is static {
    my $mutter-clutter-event = clutter_event_get();

    $mutter-clutter-event ?? self.bless( :$mutter-clutter-event ) !! Nil
  }

  method get_current_event ( :$raw = False ) {
    my $mutter-clutter-event = clutter_get_current_event();

    $mutter-clutter-event ?? self.bless( :$mutter-clutter-event ) !! Nil;
  }

  method button is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_button    },
      STORE => -> $, \v { self.set_button(v) }
  }

  method coords is rw is an-attribute {
    Proxy.new:
      FETCH => -> $                        { self.get_coords        },
      STORE => -> $, @v where *.elems == 2 { self.set_coords( |@v ) }
  }

  method device is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_device    },
      STORE => -> $, \v { self.set_device(v) }
  }

  method device_tool is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_device_tool    },
      STORE => -> $, \v { self.set_device_tool(v) }
  }

  method flags is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_flags    },
      STORE => -> $, \v { self.set_flags(v) }
  }

  method key_code is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_key_code    },
      STORE => -> $, \v { self.set_key_code(v) }
  }

  method key_symbol is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_key_symbol    },
      STORE => -> $, \v { self.set_key_symbol(v) }
  }

  method key_unicode is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_key_unicode    },
      STORE => -> $, \v { self.set_key_unicode(v) }
  }

  method related is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_related    },
      STORE => -> $, \v { self.set_related(v) }
  }

  method scroll_delta is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_scroll_delta    },
      STORE => -> $, \v { self.set_scroll_delta(v) }
  }

  method scroll_direction is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_scroll_direction    },
      STORE => -> $, \v { self.set_scroll_direction(v) }
  }

  method source is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_source    },
      STORE => -> $, \v { self.set_source(v) }
  }

  method source_device is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_source_device    },
      STORE => -> $, \v { self.set_source_device(v) }
  }

  method stage is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_stage    },
      STORE => -> $, \v { self.set_stage(v) }
  }

  method state is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_state    },
      STORE => -> $, \v { self.set_state(v) }
  }

  method time is rw is an-attribute {
    Proxy.new:
      FETCH => -> $     { self.get_time    },
      STORE => -> $, \v { self.set_time(v) }
  }

  method add_filter (
             &func,
             &notify    = %DEFAULT-CALLBACKS<GDestroyNotify>,
    gpointer $user_data = gpointer
  ) {
    clutter_event_add_filter($!mce, &func, &notify, $user_data);
  }

  method events_pending  is static {
    clutter_events_pending();
  }

  method current_event_time is static {
    clutter_get_current_event_time();
  }

  method keysym_to_unicode (Int() $sym) is static {
    my guint $s = $sym;

    clutter_keysym_to_unicode($s);
  }

  method unicode_to_keysym (Int() $unicode) is static {
    my guint32 $u = $unicode;

    clutter_unicode_to_keysym($u);
  }

  method copy ( $raw = False ) {
    propReturnObject(
      clutter_event_copy($!mce),
      $raw,
      |self.getTypePair
    );
  }

  method free {
    clutter_event_free($!mce);
  }

  method get_angle (MutterClutterEvent() $target) {
    clutter_event_get_angle($!mce, $target);
  }

  proto method get_axes (|)
  { * }

  multi method get_axes {
    samewith($);
  }
  multi method get_axes ($n_axes is rw) {
    my guint $n = 0;

    clutter_event_get_axes($!mce, $n);
    $n_axes = $n;
  }

  method get_button {
    clutter_event_get_button($!mce);
  }

  proto method get_coords (|)
  { * }

  multi method get_coords {
    samewith($, $);
  }
  multi method get_coords ($x is rw, $y is rw) {
    my gfloat ($xx, $yy) = 0e0 xx 2;

    clutter_event_get_coords($!mce, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  method get_device ( :$raw = False ) {
    propReturnObject(
      clutter_event_get_device($!mce),
      $raw,
      |Mutter::Clutter::InputDevice.getTypePair
    );
  }

  method get_device_tool ( :$raw = False ) {
    propReturnObject(
      clutter_event_get_device_tool($!mce),
      $raw,
      |Mutter::Clutter::InputDevice::Tool
    );
  }

  method get_device_type {
    MutterClutterInputDeviceTypeEnum(
      clutter_event_get_device_type($!mce)
    );
  }

  method get_distance (MutterClutterEvent() $target) {
    clutter_event_get_distance($!mce, $target);
  }

  method get_event_code {
    clutter_event_get_event_code($!mce);
  }

  method get_event_sequence ( :$raw = False ) {
    propReturnObject(
      clutter_event_get_event_sequence($!mce),
      $raw,
      |Mutter::Clutter::Event::Sequence.getTypePair
    );
  }

  method get_flags ( :set(:$flags) = False ) {
    returnFlags(
      clutter_event_get_flags($!mce),
      $flags,
      MutterClutterEventFlagsEnum
    )
  }

  proto method get_gesture_motion_delta (|)
  { * }

  multi method get_gesture_motion_delta {
    samewith($, $);
  }
  multi method get_gesture_motion_delta ($dx is rw, $dy is rw) {
    my gdouble ($x, $y) = 0e0 xx 2;

    clutter_event_get_gesture_motion_delta($!mce, $x, $y);
    ($dx, $dy) = ($x, $y);
  }

  proto method get_gesture_motion_delta_unaccelerated (|)
  { * }

  multi method get_gesture_motion_delta_unaccelerated {
    samewith($, $);
  }
  multi method get_gesture_motion_delta_unaccelerated ($dx is rw, $dy is rw) {
    my gdouble ($x, $y) = 0e0 xx 2;

    clutter_event_get_gesture_motion_delta_unaccelerated($!mce, $x, $y);
    ($dx, $dy) = ($x, $y);
  }

  method get_gesture_phase {
    clutter_event_get_gesture_phase($!mce);
  }

  method get_gesture_pinch_angle_delta {
    clutter_event_get_gesture_pinch_angle_delta($!mce);
  }

  method get_gesture_pinch_scale {
    clutter_event_get_gesture_pinch_scale($!mce);
  }

  method get_key_code {
    clutter_event_get_key_code($!mce);
  }

  method get_key_symbol {
    clutter_event_get_key_symbol($!mce);
  }

  method get_key_unicode {
    clutter_event_get_key_unicode($!mce);
  }

  method get_mode_group {
    clutter_event_get_mode_group($!mce);
  }

  proto method get_pad_event_details (|)
  { * }

  multi method get_pad_event_details {
    samewith($, $, $);
  }
  multi method get_pad_event_details (
    $number is rw,
    $mode   is rw,
    $value  is rw
  ) {
    my guint   ($n, $m) = 0 xx 2;
    my gdouble  $v      = 0e0;

    clutter_event_get_pad_event_details($!mce, $n, $m, $v);
    ($number, $mode, $value) = ($n, $m, $v);
  }

  proto method get_position (|)
  { * }

  multi method get_position ( :$raw = False ) {
    samewith(Graphene::Point.alloc, :$raw);
  }
  multi method get_position (graphene_point_t() $position, :$raw = False) {
    clutter_event_get_position($!mce, $position);
    propReturnObject($position, $raw, Graphene::Point.getTypePair);
  }

  method get_related {
    clutter_event_get_related($!mce);
  }

  proto method get_relative_motion (|)
  { * }

  multi method get_relative_motion {
    samewith($, $, $, $);
  }
  multi method get_relative_motion (
    $dx         is rw,
    $dy         is rw,
    $dx_unaccel is rw,
    $dy_unaccel is rw
  ) {
    my gdouble ($x, $y, $xu, $yu) = 0e0 xx 4;

    clutter_event_get_relative_motion($!mce, $x, $y, $xu, $yu);
    ($dx, $dy, $dx_unaccel, $dy_unaccel) = ($x, $y, $xu, $yu);
  }

  proto method get_scroll_delta (|)
  { * }

  multi method get_scroll_delta {
    samewith($, $);
  }
  multi method get_scroll_delta ($dx is rw, $dy is rw) {
    my gdouble ($x, $y) = 0e0 xx 2;

    clutter_event_get_scroll_delta($!mce, $x, $y);
    ($dx, $dy) = ($x, $y);
  }

  method get_scroll_direction {
    MutterClutterScrollDirectionEnum(
      clutter_event_get_scroll_direction($!mce)
    );
  }

  method get_scroll_finish_flags ( :set(:$flags) = False ) {
    returnFlags(
      clutter_event_get_scroll_finish_flags($!mce),
      $flags,
      MutterClutterScrollFinishFlagsEnum
    );
  }

  method get_scroll_source {
    MutterClutterScrollSourceEnum(
      clutter_event_get_scroll_source($!mce)
    );
  }

  method get_source ( :$raw = False ) {
    propReturnObject(
      clutter_event_get_source($!mce),
      $raw,
      |Mutter::Clutter::Actor.getTypePair
    );
  }

  method get_source_device ( :$raw = False ) {
    propReturnObject(
      clutter_event_get_source_device($!mce),
      $raw,
      |Mutter::Clutter::InputDevice.getTypePair
    );
  }

  method get_stage ( :$raw = False ) {
    propReturnObject(
      clutter_event_get_stage($!mce),
      $raw,
      |Mutter::Clutter::Stage.getTypePair
    );
  }

  method get_state {
    MutterClutterModifierTypeEnum(
      clutter_event_get_state($!mce)
    );
  }

  proto method get_state_full (|)
  { * }

  multi method get_state_full {
    samewith($, $, $, $, $);
  }
  multi method get_state_full (
    $button_state    is rw,
    $base_state      is rw,
    $latched_state   is rw,
    $locked_state    is rw,
    $effective_state is rw
  ) {
    my MutterClutterModifierType ($b1, $b2, $l1, $l2, $e) = 0 xx 5;

    clutter_event_get_state_full($!mce, $b1, $b2, $l1, $l2, $e);

    (
      $button_state,
      $base_state,
      $latched_state,
      $locked_state,
      $effective_state
    ) = ($b1, $b2, $l1, $l2, $e)
  }

  method get_time {
    clutter_event_get_time($!mce);
  }

  method get_time_us {
    clutter_event_get_time_us($!mce);
  }

  method get_touchpad_gesture_finger_count {
    clutter_event_get_touchpad_gesture_finger_count($!mce);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_event_get_type, $n, $t );
  }

  method has_control_modifier {
    so clutter_event_has_control_modifier($!mce);
  }

  method has_shift_modifier {
    so clutter_event_has_shift_modifier($!mce);
  }

  method is_pointer_emulated {
    so clutter_event_is_pointer_emulated($!mce);
  }

  method put {
    clutter_event_put($!mce);
  }

  method remove_filter {
    clutter_event_remove_filter($!mce);
  }

  method set_button (Int() $button) {
    my guint32 $b = $button;

    clutter_event_set_button($!mce, $b);
  }

  method set_coords (Num() $x, Num() $y) {
    my gfloat ($xx, $yy) = ($x, $y);

    clutter_event_set_coords($!mce, $xx, $yy);
  }

  method set_device (MutterClutterInputDevice() $device) {
    clutter_event_set_device($!mce, $device);
  }

  method set_device_tool (MutterClutterInputDeviceTool() $tool) {
    clutter_event_set_device_tool($!mce, $tool);
  }

  method set_flags (Int $flags) {
    my MutterClutterEventFlags $f = $flags;

    clutter_event_set_flags($!mce, $f);
  }

  method set_key_code (Int() $key_code) {
    my guint16 $k = $key_code;

    clutter_event_set_key_code($!mce, $k);
  }

  method set_key_symbol (Int() $key_sym) {
    my guint $k = $key_sym;

    clutter_event_set_key_symbol($!mce, $k);
  }

  method set_key_unicode (Int() $key_unicode) {
    my gunichar $k = $key_unicode;

    clutter_event_set_key_unicode($!mce, $key_unicode);
  }

  method set_related (MutterClutterActor() $actor) {
    clutter_event_set_related($!mce, $actor);
  }

  method set_scroll_delta (Num() $dx, Num() $dy) {
    my gdouble ($x, $y) = ($dx, $dy);

    clutter_event_set_scroll_delta($!mce, $x, $y);
  }

  method set_scroll_direction (Int() $direction) {
    my MutterClutterScrollDirection $d = $direction;

    clutter_event_set_scroll_direction($!mce, $d);
  }

  method set_source (MutterClutterActor() $actor) {
    clutter_event_set_source($!mce, $actor);
  }

  method set_source_device (MutterClutterInputDevice() $device) {
    clutter_event_set_source_device($!mce, $device);
  }

  method set_stage (MutterClutterStage() $stage) {
    clutter_event_set_stage($!mce, $stage);
  }

  method set_state (Int() $state) {
    my MutterClutterModifierType $s = $state;

    clutter_event_set_state($!mce, $state);
  }

  method set_time (Int() $time) {
    my guint32 $t = $time;

    clutter_event_set_time($!mce, $t);
  }

  method type {
    MutterClutterEventTypeEnum( clutter_event_type($!mce) );
  }

}
