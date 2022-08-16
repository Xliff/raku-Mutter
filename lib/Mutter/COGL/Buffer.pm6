use v6.c;

use Method::Also;

use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Buffer;

use GLib::Roles::Implementor;
use Mutter::COGL::Object;

our subset MutterCoglBufferAncestry is export of Mu
  where MutterCoglBuffer | MutterCoglObjectAncestry;

class Mutter::COGL::Buffer is Mutter::COGL::Object {
  has MutterCoglBuffer $!mcb is implementor;

  submethod BUILD ( :$mutter-cogl-buffer ) {
    self.setMutterCoglBuffer($mutter-cogl-buffer)
      if $mutter-cogl-buffer
  }

  method setMutterCoglBuffer (MutterCoglBufferAncestry $_) {
    my $to-parent;

    $!mcb = do {
      when MutterCoglBuffer {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglBuffer, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglBuffer
  { $!mcb }

  multi method new (
    MutterCoglBufferAncestry  $mutter-cogl-buffer,
                             :$ref                 = True
  ) {
    return unless $mutter-cogl-buffer;

    my $o = self.bless( :$mutter-cogl-buffer );
    $o.ref if $ref;
    $o;
  }

  method is_buffer is also<is-buffer> {
    so cogl_is_buffer($!mcb);
  }

  method get_size is also<get-size> {
    cogl_buffer_get_size($!mcb);
  }

  method get_update_hint is also<get-update-hint> {
    MutterCoglBufferMapHintEnum( cogl_buffer_get_update_hint($!mcb) )
  }

  method map (Int() $access, Int() $hints) {
    my MutterCoglBufferAccess  $a = $access;
    my MutterCoglBufferMapHint $h = $hints;

    cogl_buffer_map($!mcb, $a, $h);
  }

  method map_range (
    Int()                   $offset,
    Int()                   $size,
    Int()                   $access,
    Int()                   $hints,
    CArray[Pointer[GError]] $error   = gerror
  )
    is also<map-range>
  {
    my size_t                  ($o, $s) = ($offset, $size);
    my MutterCoglBufferAccess   $a      =  $access;
    my MutterCoglBufferMapHint  $h      =  $hints;

    clear_error;
    cogl_buffer_map_range($!mcb, $offset, $size, $access, $hints, $error);
    set_error($error);
  }

  method set_data (Int() $offset, Pointer $data, Int() $size)
    is also<set-data>
  {
    my size_t ($o, $s) = ($offset, $size);

    cogl_buffer_set_data($!mcb, $o, $data, $s);
  }

  method set_update_hint (Int() $hint) is also<set-update-hint> {
    my MutterCoglBufferUpdateHint $h = $hint;

    cogl_buffer_set_update_hint($!mcb, $h);
  }

  method unmap {
    cogl_buffer_unmap($!mcb);
  }

}
