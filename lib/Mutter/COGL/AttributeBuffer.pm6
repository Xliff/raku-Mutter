use v6.c;

use Method::Also;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Implementor;
use Mutter::COGL::Buffer;

our subset MutterCoglAttributeBufferAncestry is export of Mu
  where MutterCoglAttributeBuffer | MutterCoglBufferAncestry;

class Mutter::COGL::AttributeBuffer is Mutter::COGL::Buffer {
  has MutterCoglAttributeBuffer $!mcab is implementor;

  submethod BUILD ( :$mutter-cogl-attribute-buf ) {
    self.setMutterCoglAttributeBuffer($mutter-cogl-attribute-buf)
      if $mutter-cogl-attribute-buf
  }

  method setMutterCoglAttributeBuffer (MutterCoglAttributeBufferAncestry $_) {
    my $to-parent;

    $!mcab = do {
      when MutterCoglAttributeBuffer {
        $to-parent = cast(MutterCoglBuffer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglAttributeBuffer, $_);
      }
    }
    self.setMutterCoglBuffer($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglAttributeBuffer
    is also<MutterCoglAttributeBuffer>
  { $!mcab }

  multi method new (
    MutterCoglAttributeBufferAncestry  $mutter-cogl-attribute-buf,
                                      :$ref                        = True
  ) {
    return unless $mutter-cogl-attribute-buf;

    my $o = self.bless( :$mutter-cogl-attribute-buf );
    $o.ref if $ref;
    $o;
  }

  multi method new (
    MutterCoglContext()  $context,
    Str                  $data,
                        :$encoding = 'utf8'
  ) {
    samewith( $context, $data.encode($encoding) );
  }
  multi method new (MutterCoglContext() $context, Buf $data) {
    samewith( $context, CArray[uint8].new($data), bytes => $data.bytes );
  }
  multi method new (
    MutterCoglContext()  $context,
    CArray[uint8]        $data,
    Int()               :$bytes     = $data.elems
  ) {
    samewith($context, $bytes, $data.&p);
  }
  multi method new (
    MutterCoglContext() $context,
    Int()               $bytes,
    Pointer             $data
  ) {
    my size_t $b = $bytes;

    my $mutter-cogl-attribute-buf = cogl_attribute_buffer_new(
      $context,
      $b,
      $data
    );

    $mutter-cogl-attribute-buf ?? self.bless( :$mutter-cogl-attribute-buf )
                               !! Nil
  }

  method new_with_size (MutterCoglContext() $context, Int() $bytes)
    is also<new-with-size>
  {
    my size_t $b = $bytes;

    my $mutter-cogl-attribute-buf = cogl_attribute_buffer_new_with_size(
      $context,
      $b
    );

    $mutter-cogl-attribute-buf ?? self.bless( :$mutter-cogl-attribute-buf )
                               !! Nil
  }

  method is_attribute_buffer is also<is-attribute-buffer> {
    so cogl_is_attribute_buffer($!mcab);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_attribute_buffer_get_gtype, $n, $t );
  }
}


### /usr/src/mutter-42.1/cogl/cogl/cogl-attribute-buffer.h

sub cogl_is_attribute_buffer (MutterCoglAttributeBuffer $object)
  returns uint32
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_attribute_buffer_get_gtype ()
  returns GType
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_attribute_buffer_new (
  MutterCoglContext $context,
  size_t            $bytes,
  Pointer           $data
)
  returns MutterCoglAttributeBuffer
  is      native(mutter-clutter)
  is      export
{ * }

sub cogl_attribute_buffer_new_with_size (
  MutterCoglContext $context,
  size_t            $bytes
)
  returns MutterCoglAttributeBuffer
  is      native(mutter-clutter)
  is      export
{ * }
