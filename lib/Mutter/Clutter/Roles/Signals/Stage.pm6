use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Raw::ReturnedValue;

role Mutter::Clutter::Roles::Signals::Stage {
  has %!signals-mcs;

  # ClutterStage, ClutterEvent, gpointer --> gboolean
  method connect-delete-event (
    $obj,
    $signal = 'delete-event',
    &handler?
  ) {
    my $hid;
    %!signals-mcs{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-delete-event($obj, $signal,
        -> $, $cet, $ud --> gboolean {
          CATCH {
            default { $s.quit($_) }
          }

          my $r = ReturnedValue.new;
          $s.emit( [self, $cet, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-mcs{$signal}[0].tap(&handler) with &handler;
    %!signals-mcs{$signal}[0];
  }

}

# ClutterStage, ClutterEvent, gpointer --> gboolean
sub g-connect-delete-event(
  Pointer $app,
  Str     $name,
          &handler (
            MutterClutterStage,
            MutterClutterEvent,
            gpointer,
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
{ * }
