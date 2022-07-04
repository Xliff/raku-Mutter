use v6.c;

use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::TextBuffer;

class Mutter::Text::Buffer {
  has MutterClutterTextBuffer $!mctb is implementor;

  method new {
    my $mutter-text-buffer = clutter_text_buffer_new();

    $mutter-text-buffer ?? self.bless( :$mutter-text-buffer )
                        !! Nil;
  }

  proto method new_with_text (|)
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

  method delete_text (Int() $position, Int() $n_chars) {
    my guint $p = $position;
    my gint  $n = $n_chars;

    clutter_text_buffer_delete_text($!mctb, $p, $n);
  }

  method emit_deleted_text (Int() $position, Int() $n_chars) {
    my guint ($p, $n) = ($position, $n_chars);

    clutter_text_buffer_emit_deleted_text($!mctb, $p, $n);
  }

  method emit_inserted_text (Int() $position, Str $chars, Int() $n_chars) {
    my guint ($p, $n) = ($position, $n_chars);

    clutter_text_buffer_emit_inserted_text($!mctb, $p, $chars, $n);
  }

  method get_bytes {
    clutter_text_buffer_get_bytes($!mctb);
  }

  method get_length {
    clutter_text_buffer_get_length($!mctb);
  }

  method get_max_length {
    clutter_text_buffer_get_max_length($!mctb);
  }

  method get_text {
    clutter_text_buffer_get_text($!mctb);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_text_buffer_get_type, $n, $t );
  }

  proto method insert_text (|)
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
          :$size = $chars.bytes
  ) {
    samewith($position, $chars.bytes, $size );
  }
  multi method insert_text (Int() $position, CArray[uint8] $chars, Int() $n_chars) {
    my guint $p = $position;
    my gint  $n = $n_chars;

    clutter_text_buffer_insert_text($!mctb, $position, $chars, $n_chars);
  }

  method set_max_length (Int() $max_length) {
    my gint $m = $max_length;

    clutter_text_buffer_set_max_length($!mctb, $m);
  }

  proto method set_text (|)
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
