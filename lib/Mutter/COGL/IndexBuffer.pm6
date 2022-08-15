use v6.c;

use Method::Also;
use NativeCall;

use Mutter::Raw::Types;

use Mutter::COGL::Buffer;

use GLib::Roles::Implementor;

our subset MutterCoglIndexBufferAncestry is export of Mu
  where MutterCoglIndexBuffer | MutterCoglBufferAncestry;

class Mutter::COGL::IndexBuffer is Mutter::COGL::Buffer {
  has MutterCoglIndexBuffer $!mcib is implementor;

  submethod BUILD ( :$mutter-cogl-index-buffer ) {
    self.setMutterCoglIndexBuffer($mutter-cogl-index-buffer)
      if $mutter-cogl-index-buffer
  }

  method setMutterCoglIndexBuffer (MutterCoglIndexBufferAncestry $_) {
    my $to-parent;

    $!mcib = do {
      when MutterCoglIndexBuffer {
        $to-parent = cast(MutterCoglBuffer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglIndexBuffer, $_);
      }
    }
    self.setMutterCoglBuffer($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglIndexBuffer
    is also<MutterCoglIndexBuffer>
  { $!mcib }

  multi method new (MutterCoglIndexBufferAncestry $mutter-cogl-index-buffer, :$ref = True) {
    return unless $mutter-cogl-index-buffer;

    my $o = self.bless( :$mutter-cogl-index-buffer );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterCoglContext() $context, Int() $bytes) {
    my size_t $b = $bytes;

    my $mutter-cogl-index-buffer = cogl_index_buffer_new($context, $b);

    $mutter-cogl-index-buffer ?? self.bless( :$mutter-cogl-index-buffer )
                              !! Nil;
  }

  method is_index_buffer is also<is-index-buffer> {
    so cogl_is_index_buffer($!mcib);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, ^cogl_index_buffer_get_gtype, $n, $t );
  }

}


### /usr/src/mutter-42.1/cogl/cogl/cogl-index-buffer.h

sub cogl_is_index_buffer (MutterCoglIndexBuffer $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_index_buffer_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_index_buffer_new (MutterCoglContext $context, size_t $bytes)
  returns MutterCoglIndexBuffer
  is native(mutter-clutter)
  is export
{ * }
