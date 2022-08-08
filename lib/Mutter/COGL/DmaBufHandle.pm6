use v6.c;

use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::DmaBufHandle;

use Mutter::COGL::Object;
use Mutter::COGL::Framebuffer;

use GLib::Roles::Implementor;

our subset MutterCoglDmaBufHandleAncestry is export of Mu
  where MutterCoglDmaBufHandle | MutterCoglObjectAncestry;

class Mutter::COGL::DmaBufHandle is Mutter::COGL::Object {
  has MutterCoglDmaBufHandle $!mcdbh is implementor;

  submethod BUILD ( :$mutter-cogl-dma ) {
    self.setMutterCoglDmaBufHandle($mutter-cogl-dma)
      if $mutter-cogl-dma
  }

  method setMutterCoglDmaBufHandle (MutterCoglDmaBufHandleAncestry $_) {
    my $to-parent;

    $!mcdbh = do {
      when MutterCoglDmaBufHandle {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglDmaBufHandle, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglDmaBufHandle
  { $!mcdbh }

  multi method new (
    MutterCoglDmaBufHandleAncestry  $mutter-cogl-dma,
                                   :$ref              = True
  ) {
    return unless $mutter-cogl-dma;

    my $o = self.bless( :$mutter-cogl-dma );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    MutterCoglFramebuffer() $framebuffer,
    Int()                   $dmabuf_fd,
    Int()                   $width,
    Int()                   $height,
    Int()                   $stride,
    Int()                   $offset,
    Int()                   $bpp,
    gpointer                $user_data    = gpointer,
                            &destroy_func = %DEFAULT-CALLBACKS<GDestroyNotify>
  ) {
    my gint ($df, $w, $h, $s, $o, $b) =
      ($dmabuf_fd, $width, $height, $stride, $offset, $bpp);

    my $mutter-cogl-dma = cogl_dma_buf_handle_new(
      $framebuffer,
      $df,
      $w,
      $h,
      $s,
      $o,
      $b,
      $user_data,
      &destroy_func
    );

    $mutter-cogl-dma ?? self.bless( :$mutter-cogl-dma ) !! Nil;
  }

  method free {
    cogl_dma_buf_handle_free($!mcdbh);
  }

  method get_bpp {
    cogl_dma_buf_handle_get_bpp($!mcdbh);
  }

  method get_fd {
    cogl_dma_buf_handle_get_fd($!mcdbh);
  }

  method get_framebuffer ( :$raw = False ) {
    propReturnObject(
      cogl_dma_buf_handle_get_framebuffer($!mcdbh),
      $raw,
      |Mutter::COGL::Framebuffer.getTypePair
    );
  }

  method get_height {
    cogl_dma_buf_handle_get_height($!mcdbh);
  }

  method get_offset {
    cogl_dma_buf_handle_get_offset($!mcdbh);
  }

  method get_stride {
    cogl_dma_buf_handle_get_stride($!mcdbh);
  }

  method get_width {
    cogl_dma_buf_handle_get_width($!mcdbh);
  }

  method mmap (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $p = cogl_dma_buf_handle_mmap($!mcdbh, $error);
    set_error($error);
    $p;
  }

  method munmap (gpointer $data, CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $rv = cogl_dma_buf_handle_munmap($!mcdbh, $data, $error);
    set_error($error);
    $rv;
  }

  method sync_read_end (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $rv = cogl_dma_buf_handle_sync_read_end($!mcdbh, $error);
    set_error($error);
    $rv;
  }

  method sync_read_start (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $rv = cogl_dma_buf_handle_sync_read_start($!mcdbh, $error);
    set_error($error);
    $rv;
  }

}
