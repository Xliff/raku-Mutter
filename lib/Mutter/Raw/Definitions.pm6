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

# Meta

class MetaBackend                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaBackgroundContent      is repr<CPointer> does GLib::Roles::Pointers is export { }
#class MetaBarrierEvent           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaCloseDialog            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaCompositor             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaCursorTracker          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaDisplay                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaLaters                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaLaunchContext          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaMonitorManager         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaPlugin                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaRectangle              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaRemoteAccessController is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaSelection              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaSelectionSource        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaShapedTexture          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaStartupNotification    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaWindowShape            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaWorkspace              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MetaX11Display             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterBarrier              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterKeyBinding           is repr<CPointer> does GLib::Roles::Pointers is export { }

# Clutter

class MutterClutterAction        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActor         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActorBox      is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActorIter     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterAnimatable    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterColor         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterContent       is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterConstraint    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterContainer     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterEffect        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterInterval      is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterKnot          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterLayoutManager is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterLayoutMeta    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterMargin        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPathNode      is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPaintContext  is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPaintVolume   is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPickContext   is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterScript        is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterStage         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTimeline      is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTransition    is repr<CPointer> does GLib::Roles::Pointers is export { }

class MutterClutterEvent         is repr<CPointer> does GLib::Roles::Pointers is export { }
