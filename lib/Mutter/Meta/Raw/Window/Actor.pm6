use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::Window::Actor;

### /usr/src/mutter-42.1/src/meta/meta-window-actor.h

sub meta_window_actor_freeze (MetaWindowActor $self)
  is native(mutter)
  is export
{ * }

sub meta_window_actor_get_image (
  MetaWindowActor       $self,
  cairo_rectangle_int_t $clip
)
  returns cairo_surface_t
  is native(mutter)
  is export
{ * }

sub meta_window_actor_get_meta_window (MetaWindowActor $self)
  returns MetaWindow
  is native(mutter)
  is export
{ * }

sub meta_window_actor_get_texture (MetaWindowActor $self)
  returns MetaShapedTexture
  is native(mutter)
  is export
{ * }

sub meta_window_actor_is_destroyed (MetaWindowActor $self)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_window_actor_paint_to_content (
  MetaWindowActor         $self,
  MetaRectangle           $clip,
  CArray[Pointer[GError]] $error
)
  returns ClutterContent
  is native(mutter)
  is export
{ * }

sub meta_window_actor_sync_visibility (MetaWindowActor $self)
  is native(mutter)
  is export
{ * }

sub meta_window_actor_thaw (MetaWindowActor $self)
  is native(mutter)
  is export
{ * }
