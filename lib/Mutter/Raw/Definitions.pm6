use v6.c;

use NativeCall;

use Cairo;

use GLib::Raw::Definitions;

unit package Mutter::Raw::Definitions;

constant mutter            is export = 'mutter-10',v0;
constant mutter-clutter    is export = 'mutter-clutter-10',v0;
constant mutter-cogl       is export = 'mutter-cogl-10',v0;
constant mutter-cogl-pango is export = 'mutter-cogl-pango-10',v0;

constant cairo_rectangle_int_t  is export = Cairo::cairo_rectangle_int_t;
constant cairo_t                is export = Cairo::cairo_t;
constant cairo_path_t           is export = Cairo::cairo_path_t;
constant cairo_region_t         is export = Pointer;

# Meta

class MutterMetaBackend                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaBackground             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaBackgroundContent      is repr<CPointer> does GLib::Roles::Pointers is export { }
#class MutterMetaBarrierEvent           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaCloseDialog            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaCompositor             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaContext                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaCursorTracker          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaDisplay                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaDnd                    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaIdleMonitor            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaLaters                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaLaunchContext          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaMonitorManager         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaPlugin                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaRectangle              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaRemoteAccessController is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaSelection              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaSelectionSource        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaSettings               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaShapedTexture          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaStartupNotification    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaWindow                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaWindowShape            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaWorkspace              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaX11Display             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaBarrier                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaKeyBinding             is repr<CPointer> does GLib::Roles::Pointers is export { }

# Clutter

class MutterClutterAction             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActor              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActorBox           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActorMeta          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActorIter          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterAlignConstraint    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterAnimatable         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBackend            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBindConstraint     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBindingPool        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBinLayout          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBoxLayout          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterChildMeta          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterColor              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterContent            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterConstraint         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterContainer          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterEffect             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterEvent              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterEventSequence      is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterFixedLayout        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterFlowLayout         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterFrame              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterFrameClock         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterGrab               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterGridLayout         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterInputDevice        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterInputMethod        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterInputFocus         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterInterval           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterKeymap             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterKnot               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterLayoutManager      is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterLayoutMeta         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterMargin             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterOffscreenEffect    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPageTurnEffect     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPanAction          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPathConstraint     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPath               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPathNode           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPaintContext       is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPaintNode          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPaintVolume        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPerspective        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPickContext        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPropertyTransition is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterRotateAction       is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterScript             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterScriptable         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterScrollActor        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterSeat               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterSettings           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterShaderEffect       is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterSnapConstraint     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterStage              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterStageManager       is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterStageView          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterStageWindow        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterSwipeAction        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTapAction          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTextBuffer         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTimeline           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTransition         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterVirtualInputDevice is repr<CPointer> does GLib::Roles::Pointers is export { }


# Cogl

class MutterCoglContext          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglFramebuffer      is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglHandle           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglPipeline         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglPrimitive        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglScanout          is repr<CPointer> does GLib::Roles::Pointers is export { }
