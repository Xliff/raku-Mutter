use v6.c;

use Method::Also;
use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Onscreen;

use Mutter::COGL::Framebuffer;

use GLib::Roles::Implementor;

our subset MutterCoglOnscreenAncestry is export of Mu
  where MutterCoglOnscreen | MutterCoglFramebufferAncestry;

class Mutter::COGL::Onscreen is Mutter::COGL::Framebuffer {
  has MutterCoglOnscreen $!mco is implementor;

  submethod BUILD ( :$mutter-cogl-onscreen ) {
    self.setMutterCoglOnscreen($mutter-cogl-onscreen)
      if $mutter-cogl-onscreen
  }

  method setMutterCoglOnscreen (MutterCoglOnscreenAncestry $_) {
    my $to-parent;

    $!mco = do {
      when MutterCoglOnscreen {
        $to-parent = cast(MutterCoglFramebuffer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglOnscreen, $_);
      }
    }
    self.setMutterCoglFramebuffer($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglOnscreen
  { $!mco }

  multi method new (
    MutterCoglOnscreenAncestry  $mutter-cogl-onscreen,
                               :$ref                   = True
  ) {
    return unless $mutter-cogl-onscreen;

    my $o = self.bless( :$mutter-cogl-onscreen );
    $o.ref if $ref;
    $o;
  }

  method add_dirty_callback (
             &callback,
    gpointer $user_data  = gpointer,
             &destroy    = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<add-dirty-callback>
  {
    cogl_onscreen_add_dirty_callback($!mco, &callback, $user_data, &destroy);
  }

  method add_frame_callback (
             &callback,
    gpointer $user_data = gpointer,
             &destroy   = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<add-frame-callback>
  {
    cogl_onscreen_add_frame_callback($!mco, &callback, $user_data, &destroy);
  }

  method add_frame_info (MutterCoglFrameInfo() $info) is also<add-frame-info> {
    cogl_onscreen_add_frame_info($!mco, $info);
  }

  method frame_closure_get_gtype is also<frame-closure-get-gtype> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &cogl_frame_closure_get_gtype,
      $n,
      $t
    );
  }

  method scanout_error_quark is also<scanout-error-quark> {
    cogl_scanout_error_quark();
  }

  method direct_scanout (
    MutterCoglScanout()     $scanout,
    MutterCoglFrameInfo()   $info,
    gpointer                $user_data = gpointer,
    CArray[Pointer[GError]] $error     = gerror
  )
    is also<direct-scanout>
  {
    clear_error;
    cogl_onscreen_direct_scanout(
      $!mco,
      $scanout,
      $info,
      $user_data,
      $error
    );
    set_error($error);
  }

  method dirty_closure_get_gtype is also<dirty-closure-get-gtype> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &cogl_onscreen_dirty_closure_get_gtype,
      $n,
      $t
    );
  }

  method get_buffer_age is also<get-buffer-age> {
    cogl_onscreen_get_buffer_age($!mco);
  }

  method get_frame_counter is also<get-frame-counter> {
    cogl_onscreen_get_frame_counter($!mco);
  }

  method hide {
    cogl_onscreen_hide($!mco);
  }

  proto method queue_damage_region (|)
    is also<queue-damage-region>
  { * }

  multi method queue_damage_region (@rectangles) {
    samewith(
      ArrayToCArray(gint, @rectangles),
      @rectangles.elems
    );
  };
  multi method queue_damage_region (
    CArray[gint] $rectangles,
    Int()        $n_rectangles
  ) {
    my gint $n = $n_rectangles;

    cogl_onscreen_queue_damage_region($!mco, $rectangles, $n);
  }

  method remove_dirty_callback (MutterCoglOnscreenDirtyClosure() $closure)
    is also<remove-dirty-callback>
  {
    cogl_onscreen_remove_dirty_callback($!mco, $closure);
  }

  method remove_frame_callback (MutterCoglFrameClosure() $closure)
    is also<remove-frame-callback>
  {
    cogl_onscreen_remove_frame_callback($!mco, $closure);
  }

  method show {
    cogl_onscreen_show($!mco);
  }

  method swap_buffers (
    MutterCoglFrameInfo() $frame_info,
    gpointer              $user_data   = gpointer
  )
    is also<swap-buffers>
  {
    cogl_onscreen_swap_buffers($!mco, $frame_info, $user_data);
  }

  proto method swap_buffers_with_damage (|)
    is also<swap-buffers-with-damage>
  { * }

  multi method swap_buffers_with_damage (
                          @rectangles,
    MutterCoglFrameInfo() $info,
    gpointer              $user_data     = gpointer
  ) {
    samewith(
      ArrayToCArray(gint, @rectangles),
      @rectangles.elems,
      $info,
      $user_data
    );
  }
  multi method swap_buffers_with_damage (
    CArray[gint]          $rectangles,
    Int()                 $n_rectangles,
    MutterCoglFrameInfo() $info,
    gpointer              $user_data     = gpointer
  ) {
    my gint $n = $n_rectangles;

    cogl_onscreen_swap_buffers_with_damage(
      $!mco,
      $rectangles,
      $n_rectangles,
      $info,
      $user_data
    );
  }

  proto method swap_region (|)
    is also<swap-region>
  { * }

  multi method swap_region (
                          @rectangles,
    MutterCoglFrameInfo() $info,
    gpointer              $user_data     = gpointer
  ) {
    samewith(
      ArrayToCArray(gint, @rectangles),
      @rectangles.xelems,
      $info,
      $user_data
    );
  }
  multi method swap_region (
    CArray[gint]          $rectangles,
    Int()                 $n_rectangles,
    MutterCoglFrameInfo() $info,
    gpointer              $user_data     = gpointer
  ) {
    my gint $n = $n_rectangles;

    cogl_onscreen_swap_region(
      $!mco,
      $rectangles,
      $n_rectangles,
      $info,
      $user_data
    );
  }

}
