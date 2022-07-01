use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GTK::Raw::Definitions;
use GTK::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

use GLib::Roles::Pointers;

unit package Mutter::Raw::Structs;

class MutterClutterOffscreenRectangle is repr<CStruct> is export {
	has gint $.x      is rw;
	has gint $.y      is rw;
	has gint $.width  is rw;
	has gint $.height is rw;
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
