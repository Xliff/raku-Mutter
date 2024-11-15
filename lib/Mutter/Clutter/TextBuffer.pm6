use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::TextBuffer;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterClutterTextBufferAncestry is export of Mu
  where MutterClutterTextBuffer | GObject;

class Mutter::Clutter::TextBuffer {
  also does GLib::Roles::Object;

  has MutterClutterTextBuffer $!mctb is implementor;

  submethod BUILD ( :$mutter-text-buffer ) {
    self.setMutterClutterTextBuffer($mutter-text-buffer)
      if $mutter-text-buffer;
  }

  method setMutterClutterTextBuffer (MutterClutterTextBufferAncestry $_) {
    my $to-parent;

    $!mctb = do {
      when MutterClutterTextBuffer {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterTextBuffer, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterTextBuffer
    is also<MutterClutterTextBuffer>
  { $!mctb }

  multi method new (
    MutterClutterTextBufferAncestry  $mutter-text-buffer,
                                    :$ref                 = True
  ) {
    return unless $mutter-text-buffer;

    my $o = self.bless( :$mutter-text-buffer );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-text-buffer = clutter_text_buffer_new();

    $mutter-text-buffer ?? self.bless( :$mutter-text-buffer )
                        !! Nil;
  }

  proto method new_with_text (|)
    is also<new-with-text>
  { * }

  multi method new_with_text (Str $text, :$encoding = 'utf8') {
    my $e = $text.encode($encoding);

    samewith( $e, $e.strlen);
  }
  multi method new_with_text (Blob $text) {
    samewith( CArray[uint8].new($text), $text.chars );
  }
  multi method new_with_text (@a) {
    samewith( ArrayToCArray(uint8, @a), @a.elems )
  }
  multi method new_with_text (CArray[uint8] $text, Int() $text_len) {
    my gssize $t = $text_len;

    clutter_text_buffer_new_with_text($text, $t);
  }

  # Type: string
  method text is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('text', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'text does not allow writing'
      }
    );
  }

  # Type: uint
  method length is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('length', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        warn 'length does not allow writing'
      }
    );
  }

  # Type: int
  method max-length is rw  is g-property is also<max_length> {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('max-length', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('max-length', $gv);
      }
    );
  }

  method deleted-text is also<deleted_text> {
    self.connect-uintuint($!mctb, 'deleted-text');
  }

  method inserted-text is also<inserted_text> {
    self.connect-inserted-text($!mctb);
  }

  method delete_text (Int() $position, Int() $n_chars) is also<delete-text> {
    my guint $p = $position;
    my gint  $n = $n_chars;

    clutter_text_buffer_delete_text($!mctb, $p, $n);
  }

  method emit_deleted_text (Int() $position, Int() $n_chars)
    is also<emit-deleted-text>
  {
    my guint ($p, $n) = ($position, $n_chars);

    clutter_text_buffer_emit_deleted_text($!mctb, $p, $n);
  }

  method emit_inserted_text (Int() $position, Str() $chars, Int() $n_chars)
    is also<emit-inserted-text>
  {
    my guint ($p, $n) = ($position, $n_chars);

    clutter_text_buffer_emit_inserted_text($!mctb, $p, $chars, $n);
  }

  method get_bytes is also<get-bytes> {
    clutter_text_buffer_get_bytes($!mctb);
  }

  method get_length is also<get-length> {
    clutter_text_buffer_get_length($!mctb);
  }

  method get_max_length is also<get-max-length> {
    clutter_text_buffer_get_max_length($!mctb);
  }

  method get_text is also<get-text> {
    clutter_text_buffer_get_text($!mctb);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_text_buffer_get_type, $n, $t );
  }

  proto method insert_text (|)
    is also<insert-text>
  { * }

  multi method insert_text (
    Int()  $position,
    Str    $chars,
          :$encoding = 'utf8',
          :$size     = $chars.chars
  ) {
    samewith( $position, $chars.encode($encoding), $size );
  }
  multi method insert_text (
    Int()  $position,
    Buf    $chars,
          :$size      = $chars.bytes
  ) {
    samewith($position, $chars.bytes, $size );
  }
  multi method insert_text (
    Int()         $position,
    CArray[uint8] $chars,
    Int()         $n_chars
  ) {
    my guint $p = $position;
    my gint  $n = $n_chars;

    clutter_text_buffer_insert_text($!mctb, $position, $chars, $n_chars);
  }

  method set_max_length (Int() $max_length) is also<set-max-length> {
    my gint $m = $max_length;

    clutter_text_buffer_set_max_length($!mctb, $m);
  }

  proto method set_text (|)
    is also<set-text>
  { * }

  multi method set_text (Str $chars, :$encoding = 'utf8') {
    samewith($chars.encode($encoding), $chars.chars);
  }
  multi method set_text (Blob $chars) {
    samewith( CArray[uint8].new($chars), $chars.bytes );
  }
  multi method set_text (CArray[uint8] $chars, Int() $n_chars) {
    my gint $n = $n_chars;

    clutter_text_buffer_set_text($!mctb, $chars, $n);
  }

}
