use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;
use Mutter::Raw::Structs;

unit package Mutter::Raw::COGL::Renderer;

### /usr/src/mutter-42.1/cogl/cogl/cogl-renderer.h

sub cogl_renderer_add_constraint (
  MutterCoglRenderer           $renderer,
  MutterCoglRendererConstraint $constraint
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_renderer_bind_api (MutterCoglRenderer $renderer)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_renderer_check_onscreen_template (
  MutterCoglRenderer         $renderer,
  MutterCoglOnscreenTemplate $onscreen_template,
  CArray[Pointer[GError]]    $error
)
  returns uint32
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_is_renderer (MutterCoglRenderer $object)
  returns uint32
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_renderer_connect (
  MutterCoglRenderer      $renderer,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_renderer_create_dma_buf (
  MutterCoglRenderer      $renderer,
  gint                    $width,
  gint                    $height,
  CArray[Pointer[GError]] $error
)
  returns MutterCoglDmaBufHandle
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_renderer_error_quark ()
  returns uint32_t
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_renderer_foreach_output (
  MutterCoglRenderer $renderer,
                     &callback (MutterCoglOutput, gpointer),
  Pointer            $user_data
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_renderer_get_driver (MutterCoglRenderer $renderer)
  returns MutterCoglDriver
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_renderer_get_gtype ()
  returns GType
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_renderer_get_winsys_id (MutterCoglRenderer $renderer)
  returns MutterCoglWinsysID
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_renderer_is_dma_buf_supported (MutterCoglRenderer $renderer)
  returns uint32
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_renderer_new ()
  returns MutterCoglRenderer
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_renderer_remove_constraint (
  MutterCoglRenderer           $renderer,
  MutterCoglRendererConstraint $constraint
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_renderer_set_driver (
  MutterCoglRenderer $renderer,
  MutterCoglDriver   $driver
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_renderer_set_winsys_id (
  MutterCoglRenderer $renderer,
  MutterCoglWinsysID $winsys_id
)
  is native(mutter-clutter)
  is export
{ * }

### /usr/src/mutter-42.1/cogl/cogl/cogl-poll.h

sub cogl_poll_renderer_dispatch (
  MutterCoglRenderer $renderer,
  Pointer            $poll_fds,
  gint               $n_poll_fds
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_poll_renderer_get_info (
  MutterCoglRenderer $renderer,
  Pointer            $poll_fds,
  gint               $n_poll_fds is rw,
  gint64_t           $timeout    is rw
)
  returns gint
  is native(mutter-clutter)
  is export
{ * }
