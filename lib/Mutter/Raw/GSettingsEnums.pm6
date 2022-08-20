use v6.c;

use GLib::Raw::Definitions;

unit package Mutter::Raw::GSettingsEnums;

constant GDesktopBackgroundShading is export := guint32;
our enum GDesktopBackgroundShadingEnum is export <
  G_DESKTOP_BACKGROUND_SHADING_SOLID
  G_DESKTOP_BACKGROUND_SHADING_VERTICAL
  G_DESKTOP_BACKGROUND_SHADING_HORIZONTAL
>;

constant GDesktopBackgroundStyle is export := guint32;
our enum GDesktopBackgroundStyleEnum is export <
  G_DESKTOP_BACKGROUND_STYLE_NONE
  G_DESKTOP_BACKGROUND_STYLE_WALLPAPER
  G_DESKTOP_BACKGROUND_STYLE_CENTERED
  G_DESKTOP_BACKGROUND_STYLE_SCALED
  G_DESKTOP_BACKGROUND_STYLE_STRETCHED
  G_DESKTOP_BACKGROUND_STYLE_ZOOM
  G_DESKTOP_BACKGROUND_STYLE_SPANNED
>;

constant GDesktopClockFormat is export := guint32;
our enum GDesktopClockFormatEnum is export <
  G_DESKTOP_CLOCK_FORMAT_24H
  G_DESKTOP_CLOCK_FORMAT_12H
>;

constant GDesktopColorScheme is export := guint32;
our enum GDesktopColorSchemeEnum is export <
  G_DESKTOP_COLOR_SCHEME_DEFAULT
  G_DESKTOP_COLOR_SCHEME_PREFER_DARK
  G_DESKTOP_COLOR_SCHEME_PREFER_LIGHT
>;

constant GDesktopDeviceSendEvents is export := guint32;
our enum GDesktopDeviceSendEventsEnum is export <
  G_DESKTOP_DEVICE_SEND_EVENTS_ENABLED
  G_DESKTOP_DEVICE_SEND_EVENTS_DISABLED
  G_DESKTOP_DEVICE_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE
>;

constant GDesktopFocusMode is export := guint32;
our enum GDesktopFocusModeEnum is export <
  G_DESKTOP_FOCUS_MODE_CLICK
  G_DESKTOP_FOCUS_MODE_SLOPPY
  G_DESKTOP_FOCUS_MODE_MOUSE
>;

constant GDesktopFocusNewWindows is export := guint32;
our enum GDesktopFocusNewWindowsEnum is export <
  G_DESKTOP_FOCUS_NEW_WINDOWS_SMART
  G_DESKTOP_FOCUS_NEW_WINDOWS_STRICT
>;

constant GDesktopFontAntialiasingMode is export := guint32;
our enum GDesktopFontAntialiasingModeEnum is export <
  G_DESKTOP_FONT_ANTIALIASING_MODE_NONE
  G_DESKTOP_FONT_ANTIALIASING_MODE_GRAYSCALE
  G_DESKTOP_FONT_ANTIALIASING_MODE_RGBA
>;

constant GDesktopFontHinting is export := guint32;
our enum GDesktopFontHintingEnum is export <
  G_DESKTOP_FONT_HINTING_NONE
  G_DESKTOP_FONT_HINTING_SLIGHT
  G_DESKTOP_FONT_HINTING_MEDIUM
  G_DESKTOP_FONT_HINTING_FULL
>;

constant GDesktopFontRgbaOrder is export := guint32;
our enum GDesktopFontRgbaOrderEnum is export <
  G_DESKTOP_FONT_RGBA_ORDER_RGBA
  G_DESKTOP_FONT_RGBA_ORDER_RGB
  G_DESKTOP_FONT_RGBA_ORDER_BGR
  G_DESKTOP_FONT_RGBA_ORDER_VRGB
  G_DESKTOP_FONT_RGBA_ORDER_VBGR
>;

constant GDesktopLocationAccuracyLevel is export := guint32;
our enum GDesktopLocationAccuracyLevelEnum is export <
  G_DESKTOP_LOCATION_ACCURACY_LEVEL_COUNTRY
  G_DESKTOP_LOCATION_ACCURACY_LEVEL_CITY
  G_DESKTOP_LOCATION_ACCURACY_LEVEL_NEIGHBORHOOD
  G_DESKTOP_LOCATION_ACCURACY_LEVEL_STREET
  G_DESKTOP_LOCATION_ACCURACY_LEVEL_EXACT
>;

constant GDesktopMagnifierCaretTrackingMode is export := guint32;
our enum GDesktopMagnifierCaretTrackingModeEnum is export <
  G_DESKTOP_MAGNIFIER_CARET_TRACKING_MODE_NONE
  G_DESKTOP_MAGNIFIER_CARET_TRACKING_MODE_CENTERED
  G_DESKTOP_MAGNIFIER_CARET_TRACKING_MODE_PROPORTIONAL
  G_DESKTOP_MAGNIFIER_CARET_TRACKING_MODE_PUSH
>;

constant GDesktopMagnifierFocusTrackingMode is export := guint32;
our enum GDesktopMagnifierFocusTrackingModeEnum is export <
  G_DESKTOP_MAGNIFIER_FOCUS_TRACKING_MODE_NONE
  G_DESKTOP_MAGNIFIER_FOCUS_TRACKING_MODE_CENTERED
  G_DESKTOP_MAGNIFIER_FOCUS_TRACKING_MODE_PROPORTIONAL
  G_DESKTOP_MAGNIFIER_FOCUS_TRACKING_MODE_PUSH
>;

constant GDesktopMagnifierMouseTrackingMode is export := guint32;
our enum GDesktopMagnifierMouseTrackingModeEnum is export <
  G_DESKTOP_MAGNIFIER_MOUSE_TRACKING_MODE_NONE
  G_DESKTOP_MAGNIFIER_MOUSE_TRACKING_MODE_CENTERED
  G_DESKTOP_MAGNIFIER_MOUSE_TRACKING_MODE_PROPORTIONAL
  G_DESKTOP_MAGNIFIER_MOUSE_TRACKING_MODE_PUSH
>;

constant GDesktopMagnifierScreenPosition is export := guint32;
our enum GDesktopMagnifierScreenPositionEnum is export <
  G_DESKTOP_MAGNIFIER_SCREEN_POSITION_NONE
  G_DESKTOP_MAGNIFIER_SCREEN_POSITION_FULL_SCREEN
  G_DESKTOP_MAGNIFIER_SCREEN_POSITION_TOP_HALF
  G_DESKTOP_MAGNIFIER_SCREEN_POSITION_BOTTOM_HALF
  G_DESKTOP_MAGNIFIER_SCREEN_POSITION_LEFT_HALF
  G_DESKTOP_MAGNIFIER_SCREEN_POSITION_RIGHT_HALF
>;

constant GDesktopMouseDwellDirection is export := guint32;
our enum GDesktopMouseDwellDirectionEnum is export <
  G_DESKTOP_MOUSE_DWELL_DIRECTION_LEFT
  G_DESKTOP_MOUSE_DWELL_DIRECTION_RIGHT
  G_DESKTOP_MOUSE_DWELL_DIRECTION_UP
  G_DESKTOP_MOUSE_DWELL_DIRECTION_DOWN
>;

constant GDesktopMouseDwellMode is export := guint32;
our enum GDesktopMouseDwellModeEnum is export <
  G_DESKTOP_MOUSE_DWELL_MODE_WINDOW
  G_DESKTOP_MOUSE_DWELL_MODE_GESTURE
>;

constant GDesktopPadButtonAction is export := guint32;
our enum GDesktopPadButtonActionEnum is export <
  G_DESKTOP_PAD_BUTTON_ACTION_NONE
  G_DESKTOP_PAD_BUTTON_ACTION_HELP
  G_DESKTOP_PAD_BUTTON_ACTION_SWITCH_MONITOR
  G_DESKTOP_PAD_BUTTON_ACTION_KEYBINDING
>;

constant GDesktopPointerAccelProfile is export := guint32;
our enum GDesktopPointerAccelProfileEnum is export <
  G_DESKTOP_POINTER_ACCEL_PROFILE_DEFAULT
  G_DESKTOP_POINTER_ACCEL_PROFILE_FLAT
  G_DESKTOP_POINTER_ACCEL_PROFILE_ADAPTIVE
>;

constant GDesktopProxyMode is export := guint32;
our enum GDesktopProxyModeEnum is export <
  G_DESKTOP_PROXY_MODE_NONE
  G_DESKTOP_PROXY_MODE_MANUAL
  G_DESKTOP_PROXY_MODE_AUTO
>;

constant GDesktopScreensaverMode is export := guint32;
our enum GDesktopScreensaverModeEnum is export <
  G_DESKTOP_SCREENSAVER_MODE_BLANK_ONLY
  G_DESKTOP_SCREENSAVER_MODE_RANDOM
  G_DESKTOP_SCREENSAVER_MODE_SINGLE
>;

constant GDesktopStylusButtonAction is export := guint32;
our enum GDesktopStylusButtonActionEnum is export <
  G_DESKTOP_STYLUS_BUTTON_ACTION_DEFAULT
  G_DESKTOP_STYLUS_BUTTON_ACTION_MIDDLE
  G_DESKTOP_STYLUS_BUTTON_ACTION_RIGHT
  G_DESKTOP_STYLUS_BUTTON_ACTION_BACK
  G_DESKTOP_STYLUS_BUTTON_ACTION_FORWARD
>;

constant GDesktopTabletMapping is export := guint32;
our enum GDesktopTabletMappingEnum is export <
  G_DESKTOP_TABLET_MAPPING_ABSOLUTE
  G_DESKTOP_TABLET_MAPPING_RELATIVE
>;

constant GDesktopTitlebarAction is export := guint32;
our enum GDesktopTitlebarActionEnum is export <
  G_DESKTOP_TITLEBAR_ACTION_TOGGLE_SHADE
  G_DESKTOP_TITLEBAR_ACTION_TOGGLE_MAXIMIZE
  G_DESKTOP_TITLEBAR_ACTION_TOGGLE_MAXIMIZE_HORIZONTALLY
  G_DESKTOP_TITLEBAR_ACTION_TOGGLE_MAXIMIZE_VERTICALLY
  G_DESKTOP_TITLEBAR_ACTION_MINIMIZE
  G_DESKTOP_TITLEBAR_ACTION_NONE
  G_DESKTOP_TITLEBAR_ACTION_LOWER
  G_DESKTOP_TITLEBAR_ACTION_MENU
>;

constant GDesktopToolbarIconSize is export := guint32;
our enum GDesktopToolbarIconSizeEnum is export <
  G_DESKTOP_TOOLBAR_ICON_SIZE_SMALL
  G_DESKTOP_TOOLBAR_ICON_SIZE_LARGE
>;

constant GDesktopToolbarStyle is export := guint32;
our enum GDesktopToolbarStyleEnum is export <
  G_DESKTOP_TOOLBAR_STYLE_BOTH
  G_DESKTOP_TOOLBAR_STYLE_BOTH_HORIZ
  G_DESKTOP_TOOLBAR_STYLE_ICONS
  G_DESKTOP_TOOLBAR_STYLE_TEXT
>;

constant GDesktopTouchpadClickMethod is export := guint32;
our enum GDesktopTouchpadClickMethodEnum is export <
  G_DESKTOP_TOUCHPAD_CLICK_METHOD_DEFAULT
  G_DESKTOP_TOUCHPAD_CLICK_METHOD_NONE
  G_DESKTOP_TOUCHPAD_CLICK_METHOD_AREAS
  G_DESKTOP_TOUCHPAD_CLICK_METHOD_FINGERS
>;

constant GDesktopTouchpadHandedness is export := guint32;
our enum GDesktopTouchpadHandednessEnum is export <
  G_DESKTOP_TOUCHPAD_HANDEDNESS_RIGHT
  G_DESKTOP_TOUCHPAD_HANDEDNESS_LEFT
  G_DESKTOP_TOUCHPAD_HANDEDNESS_MOUSE
>;

constant GDesktopTouchpadTapButtonMap is export := guint32;
our enum GDesktopTouchpadTapButtonMapEnum is export <
  G_DESKTOP_TOUCHPAD_BUTTON_TAP_MAP_DEFAULT
  G_DESKTOP_TOUCHPAD_BUTTON_TAP_MAP_LRM
  G_DESKTOP_TOUCHPAD_BUTTON_TAP_MAP_LMR
>;

constant GDesktopUsbProtection is export := guint32;
our enum GDesktopUsbProtectionEnum is export <
  G_DESKTOP_USB_PROTECTION_LOCKSCREEN
  G_DESKTOP_USB_PROTECTION_ALWAYS
>;

constant GDesktopVisualBellType is export := guint32;
our enum GDesktopVisualBellTypeEnum is export <
  G_DESKTOP_VISUAL_BELL_FULLSCREEN_FLASH
  G_DESKTOP_VISUAL_BELL_FRAME_FLASH
>;
