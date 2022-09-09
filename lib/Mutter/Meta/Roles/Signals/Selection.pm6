use v6.c;

use NativeCall;

use Mutter::Raw::Types;

role Mutter::Meta::Roles::Signals::Selection {
  has %!signals-mss;

  # MutterSelection, gint, MutterSelectionSource
  method connect-owner-changed (
    $obj,
    $signal = 'owner-changed',
    &handler?
  ) {
    my $hid;
    %!signals-mss{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-owner-changed($obj, $signal,
        -> $, $i, $ss, $ud {
          CATCH {
            default { $s.note($_) }
          }

          $s.emit( [self, $i, $ss, $ud] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-mss{$signal}[0].tap(&handler) with &handler;
    %!signals-mss{$signal}[0];
  }

}

# MutterSelection, gint, MutterSelectionSource
sub g-connect-owner-changed (
  Pointer $app,
  Str     $name,
          &handler (
            MutterMetaSelection,
            gint,
            MutterMetaSelectionSource,
            Pointer
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
{ * }
