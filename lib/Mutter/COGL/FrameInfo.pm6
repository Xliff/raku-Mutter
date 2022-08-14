use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::FrameInfo;

use Mutter::COGL::Object;

use GLib::Roles::Implementor;

our subset MutterCoglFrameInfoAncestry is export of Mu
  where MutterCoglFrameInfo | MutterCoglObjectAncestry;

class Mutter::COGL::FrameInfo is Mutter::COGL::Object {
  has MutterCoglFrameInfo $!mcfi is implementor;

  submethod BUILD ( :$mutter-cogl-frame-info ) {
    self.setMutterCoglFrameInfo($mutter-cogl-frame-info)
      if $mutter-cogl-frame-info
  }

  method setMutterCoglFrameInfo (MutterCoglFrameInfoAncestry $_) {
    my $to-parent;

    $!mcfi = do {
      when MutterCoglFrameInfo {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglFrameInfo, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglFrameInfo
    is also<MutterCoglFrameInfo>
  { $!mcfi }

  multi method new (
    MutterCoglFrameInfoAncestry  $mutter-cogl-frame-info,
                                :$ref                     = True
  ) {
    return unless $mutter-cogl-frame-info;

    my $o = self.bless( :$mutter-cogl-frame-info );
    $o.ref if $ref;
    $o;
  }

  method cogl_is_frame_info is also<cogl-is-frame-info> {
    so cogl_is_frame_info($!mcfi);
  }

  method get_frame_counter is also<get-frame-counter> {
    cogl_frame_info_get_frame_counter($!mcfi);
  }

  method get_global_frame_counter is also<get-global-frame-counter> {
    cogl_frame_info_get_global_frame_counter($!mcfi);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_frame_info_get_gtype, $n, $t );
  }

  method get_is_symbolic is also<get-is-symbolic> {
    so cogl_frame_info_get_is_symbolic($!mcfi);
  }

  method get_presentation_time_us is also<get-presentation-time-us> {
    cogl_frame_info_get_presentation_time_us($!mcfi);
  }

  method get_refresh_rate is also<get-refresh-rate> {
    cogl_frame_info_get_refresh_rate($!mcfi);
  }

  method get_rendering_duration_ns is also<get-rendering-duration-ns> {
    cogl_frame_info_get_rendering_duration_ns($!mcfi);
  }

  method get_sequence is also<get-sequence> {
    cogl_frame_info_get_sequence($!mcfi);
  }

  method get_time_before_buffer_swap_us
    is also<get-time-before-buffer-swap-us>
  {
    cogl_frame_info_get_time_before_buffer_swap_us($!mcfi);
  }

  method is_hw_clock is also<is-hw-clock> {
    so cogl_frame_info_is_hw_clock($!mcfi);
  }

  method is_vsync is also<is-vsync> {
    so cogl_frame_info_is_vsync($!mcfi);
  }

  method is_zero_copy is also<is-zero-copy> {
    so cogl_frame_info_is_zero_copy($!mcfi);
  }
}
