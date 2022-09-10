use v6.c;

use NativeCall;

use Cairo;

use GLib::Raw::Definitions;

unit package Mutter::Raw::Definitions;

constant mutter                 is export = 'mutter-10',v0;
constant mutter-clutter         is export = 'mutter-clutter-10',v0;
constant mutter-cogl            is export = 'mutter-cogl-10',v0;
constant mutter-cogl-pango      is export = 'mutter-cogl-pango-10',v0;

constant cairo_rectangle_t      is export := Cairo::cairo_rectangle_t;
constant cairo_rectangle_int_t  is export := Cairo::cairo_rectangle_int_t;
constant cairo_t                is export := Cairo::cairo_t;
constant cairo_path_t           is export := Cairo::cairo_path_t;
constant cairo_region_t         is export := Pointer;

# Compat
constant EGLDisplay             is export := Pointer;
constant EGLImageKHR            is export := Pointer;

# Cally
class MutterCallyActor                 is repr<CPointer> does GLib::Roles::Pointers is export { }


# Meta

class MutterMetaBackend                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaBackground              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaBackgroundContent       is repr<CPointer> does GLib::Roles::Pointers is export { }
#class MutterMetaBarrierEvent            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaCloseDialog             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaCompositor              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaContext                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaCursorTracker           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaDisplay                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaDnd                     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaFrame                   is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaIdleMonitor             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaInhibitShortcutsDialog  is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaLaters                  is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaLaunchContext           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaMonitorManager          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaPlugin                  is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaRectangle               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaRemoteAccessController  is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaSelection               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaSelectionSource         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaSelectionSourceMemory   is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaSettings                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaShapedTexture           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaStartupNotification     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaStartupSequence         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaWindow                  is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaWindowActor             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaWindowShape             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaWorkspace               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaX11Display              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaBarrier                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterMetaKeyBinding              is repr<CPointer> does GLib::Roles::Pointers is export { }

# Clutter

class MutterClutterAction                   is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActor                    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActorBox                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActorMeta                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterActorIter                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterAlignConstraint          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterAnimatable               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBackend                  is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBindConstraint           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBindingPool              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBinLayout                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBlurEffect               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBrightnessContrastEffect is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBoxLayout                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterCanvas                   is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterChildMeta                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterClickAction              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterClone                    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterColor                    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterColorizeEffect           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterContent                  is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterConstraint               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterContainer                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterDamageHistory            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterDeformEffect             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterDesaturateEffect         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterEffect                   is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterEvent                    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterEventSequence            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterFixedLayout              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterFlowLayout               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterFrame                    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterFrameClock               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterGestureAction            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterGrab                     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterGridLayout               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterImage                    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterInputDevice              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterInputDeviceTool          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterInputMethod              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterInputFocus               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterInterval                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterKeyframeTransition       is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterKeymap                   is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterKnot                     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterLayoutManager            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterLayoutMeta               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterOffscreenEffect          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPageTurnEffect           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPanAction                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPathConstraint           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPath                     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPathNode                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPaintContext             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPaintNode                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPaintVolume              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPerspective              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPickContext              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPropertyTransition       is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterRotateAction             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterScript                   is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterScriptable               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterScrollActor              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterSeat                     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterSettings                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterShaderEffect             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterSnapConstraint           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterStage                    is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterStageManager             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterStageView                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterStageWindow              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterSwipeAction              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTapAction                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterText                     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTextBuffer               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTimeline                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTransition               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTransitionGroup          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTextureContent           is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterVirtualInputDevice       is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterZoomAction               is repr<CPointer> does GLib::Roles::Pointers is export { }

class MutterClutterActorNode                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBlitNode                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterBlurNode                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterClipNode                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterColorNode                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterLayerNode                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterPipelineNode             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterRootNode                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTextureNode              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTextNode                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterClutterTransformNode            is repr<CPointer> does GLib::Roles::Pointers is export { }

# Cogl

class MutterCoglAttribute            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglAttributeBuffer      is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglAtlasTexture         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglBitmap               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglBuffer               is repr<CPointer> does GLib::Roles::Pointers is export { }
#class MutterCoglColor                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglContext              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglDisplay              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglDmaBufHandle         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglDriver               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglFence                is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglFenceClosure         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglFramebuffer          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglFrameClosure         is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglFrameInfo            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglHandle               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglIndexBuffer          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglObject               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglOffscreen            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglOnscreen             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglOnscreenDirtyClosure is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglOnscreenTemplate     is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglOutput               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglPipeline             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglPixelBuffer          is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglPrimitive            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglRenderer             is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglRendererSource       is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglScanout              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglSource               is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglSwapChain            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglTexture              is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglTexture2d            is repr<CPointer> does GLib::Roles::Pointers is export { }
class MutterCoglTimestampQuery       is repr<CPointer> does GLib::Roles::Pointers is export { }

constant MutterCoglPipelineKey is export := Str;

class X::Mutter::COGL::InvalidNumberOfElements is Exception {
  has $.routine is built;

  method message {
    "Invalid number of elements in call to { $.routine }!";
  }
}
