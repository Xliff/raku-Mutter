use v6.c;

use NativeCall;

use Method::Also;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GTK::Raw::Definitions;
use GTK::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

use GLib::Roles::Pointers;

unit package Mutter::Raw::Structs;

class MutterClutterFrameInfo is repr<CStruct> is export {
	has int64_t                    $.frame-counter                  is rw;
	has int64_t                    $.presentation-time              is rw; #= microseconds
	has num32                      $.refresh-rate                   is rw;
	has MutterClutterFrameInfoFlag $.flag                           is rw;
	has guint                      $.sequence                       is rw;
	has int64_t                    $.gpu-rendering-duration-us      is rw;
	has int64_t                    $.cpu-time-before-buffer-swap-us is rw;

	method gpu-rendering-duration-µs is rw {
		$!gpu-rendering-duration-us
	}

	method cpu-time-before-buffer-swap-us is rw {
		$!cpu-time-before-buffer-swap-us
	}
}

class MutterClutterFrameListenerIface is repr<CStruct> is export {
	has Pointer $.before-frame; #= (MutterClutterFrameClock, gint64, gpointer)
	has Pointer $.frame;        #= (MutterClutterFrameClock, gint64, gpointer --> MutterClutterFrameResult)
}

class MutterClutterMargin is repr<CStruct> is export {
	has gfloat $.left   is rw;
	has gfloat $.right  is rw;
	has gfloat $.top    is rw;
	has gfloat $.bottom is rw;

	method l is rw { $.left   }
	method r is rw { $.right  }
	method t is rw { $.top    }
	method b is rw { $.bottom }

	method width       is also<w>  { $!right  - $!left   }
	method height      is also<h>  { $!bottom - $!top    }
	method anti-width  is also<aw> { $!left   - $!right  }
	method anti-height is also<ah> { $!top    - $!bottom }

	multi method new (:$c-alloc is required, :$right, :$left, :$top, :$bottom) {
		sub clutter_margin_new ()
			returns MutterClutterMargin
			is      export
			is      native(mutter-clutter)
		{ * }

		my $o = clutter_margin_new();
		$o.right  = $right  if $right.defined;
		$o.left   = $left   if $left.defined;
		$o.top    = $top    if $top.defined;
		$o.bottom = $bottom if $bottom.defined;
	}

	method copy
		returns MutterClutterMargin
		is      export
		is      symbol('clutter_margin_copy')
		is      native(mutter-clutter)
	{ * }

	method free
		returns MutterClutterMargin
		is      export
		is      symbol('clutter_margin_free')
		is      native(mutter-clutter)
	{ * }

}

class MutterClutterOffscreenRectangle is repr<CStruct> is export {
	has gint $.x      is rw;
	has gint $.y      is rw;
	has gint $.width  is rw;
	has gint $.height is rw;

	method w is rw { $.width  }
	method h is rw { $.height }
}

class MutterClutterOffscreenBarrierEvent is repr<CStruct> does GLib::Roles::Pointers is export {
  has guint    $!ref_count;

  has gint     $.event_id is rw;
  has gint     $.dt       is rw;
  has guint32  $.time     is rw;
  has gdouble  $.x        is rw;
  has gdouble  $.y        is rw;
  has gdouble  $.dx       is rw;
  has gdouble  $.dy       is rw;
  has gboolean $.released is rw;
  has gboolean $.grabbed  is rw;
}

# class MutterClutterOffscreenBackgroundGroupClass is repr<CStruct> is export {
# 	has MutterClutterOffscreenActorClass $!parent_class;
# }

class MutterClutterOffscreenBarrier is repr<CStruct> is export {
	has GObject $!parent;
	has Pointer $!priv  ;
}

# class MutterClutterOffscreenBarrierClass is repr<CStruct> is export {
# 	has GObjectClass $!parent_class;
# }

# class MutterClutterOffscreenEdge is repr<CStruct> is export {
# 	has MutterClutterOffscreenRectangle $.rect     ;
# 	has MutterClutterOffscreenSide      $.side_type;
# 	has MutterClutterOffscreendgeType  $.edge_type;
# }

class MutterClutterOffscreenFrameBorders is repr<CStruct> is export {
	has GtkBorder $.visible  ;
	has GtkBorder $.invisible;
	has GtkBorder $.total    ;
}

class MutterClutterOffscreenPluginInfo is repr<CStruct> is export {
	has Str $!name       ;
	has Str $!version    ;
	has Str $!author     ;
	has Str $!license    ;
	has Str $!description;

  method name is rw {
    Proxy.new:
      FETCH => -> $           { $!name },
      STORE => -> $, Str() \s { $!version := s }
  }

  method version is rw {
    Proxy.new:
      FETCH => -> $           { $!version },
      STORE => -> $, Str() \s { $!version := s }
  }

  method author is rw {
    Proxy.new:
      FETCH => -> $           { $!author },
      STORE => -> $, Str() \s { $!version := s }
  }

  method license is rw {
    Proxy.new:
      FETCH => -> $           { $!license },
      STORE => -> $, Str() \s { $!version := s }
  }

  method description is rw {
    Proxy.new:
      FETCH => -> $           { $!description },
      STORE => -> $, Str() \s { $!version := s }
  }
}

class MutterClutterOffscreenShadowParams is repr<CStruct> is export {
	has gint    $.radius   is rw;
	has gint    $.top_fade is rw;
	has gint    $.x_offset is rw;
	has gint    $.y_offset is rw;
	has guint8  $.opacity  is rw;
}

# class MutterClutterOffscreenStrut is repr<CStruct> is export {
# 	has MutterClutterOffscreenRectangle $!rect;
# 	has MutterClutterOffscreenSide      $!side;
# }

class MutterClutterPointerA11ySettings is repr<CStruct> is export {
  has MutterClutterPointerA11yFlags          $.controls                is rw;
  has MutterClutterPointerA11yDwellClickType $.dwell_click_type        is rw;
  has MutterClutterPointerA11yDwellMode      $.dwell_mode              is rw;
  has MutterClutterPointerA11yDwellDirection $.dwell_gesture_single    is rw;
  has MutterClutterPointerA11yDwellDirection $.dwell_gesture_double    is rw;
  has MutterClutterPointerA11yDwellDirection $.dwell_gesture_drag      is rw;
  has MutterClutterPointerA11yDwellDirection $.dwell_gesture_secondary is rw;
  has gint                                   $.secondary_click_delay   is rw;
  has gint                                   $.dwell_delay             is rw;
  has gint                                   $.dwell_threshold         is rw;
}

class MutterClutterUnits
	is   repr<CStruct>
	is   export
	does GLib::Roles::Pointers
{
  has MutterClutterUnitType $!unit_type;
  has gfloat                $!value;
  has gfloat                $!pixels;
  has guint                 $!pixels_set;
  has gint32                $!serial;

  has gint32                $!padding_1;
  has gint64                $!padding_2;
}


class MutterCoglUserDataKey
	is   repr<CStruct>
	is   export
	does GLib::Roles::Pointers
{
	has guint $.unused;
}

class MutterCoglDebugObjectTypeInfo
	is   repr<CStruct>
	is   export
	does GLib::Roles::Pointers
{
  has Str    $.name;
  has gulong $.instance_count;
}

class MutterCoglPollFD is repr<CStruct> is export does GLib::Roles::Pointers {
  has gint   $.fd      is rw;
  has gshort $.events  is rw;
  has gshort $.revents is rw;
}

class MutterCoglColor is repr<CStruct> is export does GLib::Roles::Pointers {
	has guint8 $!red;
	has guint8 $!green;
	has guint8 $!blue;
	has guint8 $!alpha;

	has guint32 $!red32;
	has guint32 $!green32;
	has guint32 $!blue32;
	has guint32 $!alpha32;
}

class MutterCoglOnscreenDirtyInfo is export does GLib::Roles::Pointers {
	has gint $.x      is rw;
	has gint $.y      is rw;
	has gint $.width  is rw;
	has gint $.height is rw;
}

class MutterCoglDepthState is export does GLib::Roles::Pointers {
  # All private
  has uint32_t $!magic;

  has gboolean $!test_enabled;
  has Pointer  $!test_function;
  has gboolean $!write_enabled;
  has gfloat   $!range_near;
  has gfloat   $!range_far;

  has uint32_t $!padding0;
  has uint32_t $!padding1;
  has uint32_t $!padding2;
  has uint32_t $!padding3;
  has uint32_t $!padding4;
  has uint32_t $!padding5;
  has uint32_t $!padding6;
  has uint32_t $!padding7;
  has uint32_t $!padding8;
  has uint32_t $!padding9;

	method test-enabled  is rw { $!test_enabled  }
	method test-function is rw { $!test_function }
	method write-enabled is rw { $!write_enabled }
	method range-near    is rw { $!range_near    }
	method range-far     is rw { $!range_far     }
}

class MutterMetaBarrierEvent is repr<CStruct> does GLib::Roles::Pointers is export {
  has guint $!ref_count;

  has gint     $.event_id    is rw;
  has gint     $.dt          is rw;
  has guint32  $.time        is rw;
  has gdouble  $.x           is rw;
  has gdouble  $.y           is rw;
  has gdouble  $.dx          is rw;
  has gdouble  $.dy          is rw;
  has gboolean $.released    is rw;
  has gboolean $.grabbed     is rw;

	method event-id is rw { $!event_id }
}

class MutterMetaShadowParams is repr<CStruct> does GLib::Roles::Pointers is export {
  has gint   $.radius   is rw;
  has gint   $.top_fade is rw;
  has gint   $.x_offset is rw;
  has gint   $.y_offset is rw;
  has guint8 $.opacity  is rw;

	method top-fade is rw { $!top_fade  }
	method x-offset is rw { $!x_offset  }
	method y-offset is rw { $!y_offset  }
}

class MutterClutterAnyEvent is repr<CStruct> is export does GLib::Roles::Pointers {
  has guint                   $.type  ;
  has guint32                 $.time  ;
  has MutterClutterEventFlags $.flags ;
  has MutterClutterStage      $.stage ;
}

role MutterClutterEventMethods {
  method type   { self.header.type   }
  method time   { self.header.time   }
  method flags  { self.header.flags  }
  method stage  { self.header.stage  }
  method source { self.header.source }
}

# Why can't CStructs use delegation?

class MutterClutterKeyEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
  HAS MutterClutterAnyEvent     $.header;

  has guint                     $.modifier_state; # MutterClutterModifierType
  has guint                     $.keyval;
  has guint16                   $.hardware_keycode;
  has gunichar                  $.unicode_value;
  has MutterClutterInputDevice  $.device;
	has guint32                   $.evdev_code;
}

class MutterClutterButtonEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
  HAS MutterClutterAnyEvent     $.header;

  has gfloat                    $.x;
  has gfloat                    $.y;
  has guint                     $.modifier_state; # MutterClutterModifierType
  has guint32                   $.button;
  has CArray[gdouble]           $.axes;
  has MutterClutterInputDevice  $.device;
  has guint32                   $.evdev_code;
}

class MutterClutterProximityEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
  HAS MutterClutterAnyEvent     $.header;
  has MutterClutterInputDevice  $.device;
}

class MutterClutterCrossingEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
  HAS MutterClutterAnyEvent     $.header;

  has gfloat                     $.x;
  has gfloat                     $.y;
  has MutterClutterInputDevice   $.device;
	has MutterClutterEventSequence $.sequence;
  has MutterClutterActor         $.related;
}

class MutterClutterMotionEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
  HAS MutterClutterAnyEvent     $.header;

  has gfloat                    $.x;
  has gfloat                    $.y;
  has guint                     $.modifier_state; # MutterClutterModifierType
  has CArray[gdouble]           $.axes;
  has MutterClutterInputDevice  $.device;
	has int64                     $.time_us;
	has gdouble                   $.dx;
	has gdouble                   $.dy;
	has gdouble                   $.dx_unaccel;
	has gdouble                   $.dy_unaccel;
}

class MutterClutterScrollEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
  HAS MutterClutterAnyEvent     $.header;

  has gfloat                    $.x;
  has gfloat                    $.y;
  has guint                     $.direction;      # MutterClutterScrollDirection direction;
  has guint                     $.modifier_state; # MutterClutterModifierType
  has CArray[gdouble]           $.axes;
  has MutterClutterInputDevice  $.device;
  has guint                     $.scroll_source;  # MutterClutterScrollSource scroll_source;
  has guint                     $.finish_flags;   # MutterClutterScrollFinishFlags finish_flags;
}

class MutterClutterStageStateEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
  HAS MutterClutterAnyEvent     $.header;

  has guint $.changed_mask; # MutterClutterStageState changed_mask;
  has guint $.new_state;    # MutterClutterStageState new_state;
}

class MutterClutterTouchEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
  HAS MutterClutterAnyEvent      $.header;

  has gfloat                     $.x;
  has gfloat                     $.y;
  has MutterClutterEventSequence $.sequence;
  has guint                      $.modifier_state; # MutterClutterModifierType
	has CArray[gdouble]            $.axes;
  has MutterClutterInputDevice   $.device;
}

class MutterClutterTouchpadPinchEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
  HAS MutterClutterAnyEvent     $.header;

  has guint                     $.phase; # MutterClutterTouchpadGesturePhase phase;
  has gfloat                    $.x;
  has gfloat                    $.y;
  has gfloat                    $.dx;
  has gfloat                    $.dy;
  has gfloat                    $.angle_delta;
  has gfloat                    $.scale;
	has guint                     $.n_fingers;
}

class MutterClutterTouchpadSwipeEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
  HAS MutterClutterAnyEvent     $.header;

  has guint                     $.phase; # MutterClutterTouchpadGesturePhase phase;
  has guint                     $.n_fingers;
  has gfloat                    $.x;
  has gfloat                    $.y;
  has gfloat                    $.dx;
  has gfloat                    $.dy;
	has gfloat                    $.dx_unaccel;
	has gfloat                    $.dy_unaccel;
}

class MutterClutterTouchpadHoldEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
	HAS MutterClutterAnyEvent     $.header;

	has guint32 $.phase; #= MutterClutterGesturePhase $.phase;
	has guint32                   $.n_fingers;
	has gfloat                    $.x;
	has gfloat                    $.y;
}

class MutterClutterPadButtonEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
	HAS MutterClutterAnyEvent     $.header;

	has guint32                   $.button;
	has guint32                   $.group;
	has MutterClutterInputDevice  $.device;
	has guint32                   $.mode;
}

class MutterClutterPadStripEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
	HAS MutterClutterAnyEvent          $.header;

	has MutterClutterInputDevice       $.device;
	#has MutterClutterInputDeviceSource $.strip_source;
	has guint32                        $.strip_source;
	has guint32                        $.strip_number;
	has guint32                        $.group;
	has guint32                        $.value;
	has guint32                        $.mode;
}

class MutterClutterPadRingEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
	HAS MutterClutterAnyEvent             $.header;

	has MutterClutterInputDevice          $.device;
	has MutterClutterInputDevicePadSource $.ring;
	has guint32                           $.ring_number;
	has guint32                           $.group;
	has gdouble                           $.angle;
	has guint32                           $.mode;
}

class MutterClutterDeviceEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
	HAS MutterClutterAnyEvent             $.header;

	has MutterClutterInputDevice          $.device;
}

class MutterClutterIMEvent is repr<CStruct> is export does MutterClutterEventMethods does GLib::Roles::Pointers {
	HAS MutterClutterAnyEvent         $.header;

	has Str                           $.text;
	has int32                         $.offset;
	has uint32                        $.len;
	has MutterClutterPreeditResetMode $.mode;
}

#| Skip Test
class MutterClutterEvent is repr<CUnion> is repr<CStruct> is export does GLib::Roles::Pointers {
  has MutterClutterAnyEvent           $.any;
  has MutterClutterButtonEvent        $.button;
  has MutterClutterKeyEvent           $.key;
  has MutterClutterMotionEvent        $.motion;
  has MutterClutterScrollEvent        $.scroll;
  has MutterClutterStageStateEvent    $.stage_state;
  has MutterClutterCrossingEvent      $.crossing;
  has MutterClutterTouchEvent         $.touch;
  has MutterClutterTouchpadPinchEvent $.touchpad_pinch;
  has MutterClutterTouchpadSwipeEvent $.touchpad_swipe;
	has MutterClutterTouchpadHoldEvent  $.touchpad_hold;
	has MutterClutterProximityEvent     $.proximity;
	has MutterClutterPadButtonEvent     $.pad_button;
	has MutterClutterPadStripEvent      $.pad_strip;
	has MutterClutterPadRingEvent       $.pad_ring;
	has MutterClutterDeviceEvent        $.device;
	has MutterClutterIMEvent            $.im;
}

our subset MutterClutterEvents is export where
  MutterClutterAnyEvent           | MutterClutterButtonEvent      | MutterClutterKeyEvent           |
  MutterClutterMotionEvent        | MutterClutterScrollEvent      | MutterClutterStageStateEvent    |
  MutterClutterCrossingEvent      | MutterClutterTouchEvent       | MutterClutterTouchpadPinchEvent |
  MutterClutterTouchpadSwipeEvent | MutterClutterTouchpadHoldEvent| MutterClutterProximityEvent     |
	MutterClutterPadButtonEvent     | MutterClutterPadStripEvent    | MutterClutterPadRingEvent       |
	MutterClutterDeviceEvent        | MutterClutterIMEvent;
