use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::COGL::DmaBufHandle;

### /usr/src/mutter-42.1/cogl/cogl/cogl-dma-buf-handle.h

sub cogl_dma_buf_handle_free (MutterCoglDmaBufHandle $dmabuf_handle)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_get_bpp (MutterCoglDmaBufHandle $dmabuf_handle)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_get_fd (MutterCoglDmaBufHandle $dmabuf_handle)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_get_framebuffer (
  MutterCoglDmaBufHandle $dmabuf_handle
)
  returns MutterCoglFramebuffer
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_get_height (MutterCoglDmaBufHandle $dmabuf_handle)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_get_offset (MutterCoglDmaBufHandle $dmabuf_handle)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_get_stride (MutterCoglDmaBufHandle $dmabuf_handle)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_get_width (MutterCoglDmaBufHandle $dmabuf_handle)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_mmap (
  MutterCoglDmaBufHandle  $dmabuf_handle,
  CArray[Pointer[GError]] $error
)
  returns Pointer
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_munmap (
  MutterCoglDmaBufHandle  $dmabuf_handle,
  gpointer                $data,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_new (
  MutterCoglFramebuffer $framebuffer,
  gint                  $dmabuf_fd,
  gint                  $width,
  gint                  $height,
  gint                  $stride,
  gint                  $offset,
  gint                  $bpp,
  gpointer              $user_data,
                        &destroy_func (gpointer)
)
  returns MutterCoglDmaBufHandle
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_sync_read_end (
  MutterCoglDmaBufHandle  $dmabuf_handle,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_dma_buf_handle_sync_read_start (
  MutterCoglDmaBufHandle  $dmabuf_handle,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }
