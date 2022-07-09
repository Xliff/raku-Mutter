use v6.c;

use NativeCall;

use Mutter::Raw::Types;

role Mutter::Clutter::Roles::Signals::TextBuffer {
  has %signals-mctb;

  #  guint position,  Str *chars,  guint n_chars --> void
  method connect-inserted-text (
    $obj,
    $signal = 'inserted-text',
    &handler?
  ) {
    my $hid;
    %!signals-mctb{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-inserted-text($obj, $signal,
        -> $, $g, $s1, $g2, $ud {
          CATCH {
            default { 𝒮.note($_) }
          }

          𝒮.emit( [self, $g, $s1, $g2, $ud] );
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-mctb{$signal}[0].tap(&handler) with &handler;
    %!signals-mctb{$signal}[0];
  }
}

# ClutterTextBuffer *buffer,  guint position,  Str *chars,  guint n_chars
sub g-connect-inserted-text (
  Pointer $app,
  Str     $name,
          &handler (MutterClutterTextBuffer, guint, Str, guint, gpointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
