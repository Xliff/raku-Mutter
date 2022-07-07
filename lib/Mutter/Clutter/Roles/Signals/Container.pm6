use v6.c;

use NativeCall;

use Mutter::Raw::Types;

role Mutter::Clutter::Roles::Signals::Container {
  has %!signals-c;

  # ClutterContainer, ClutterActor, GParamSpec, gpointer
  method connect-child-notify (
    $obj,
    $signal = 'child-notify',
    &handler?
  ) {
    my $hid;
    %!signals-c{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-child-notify($obj, $signal,
        -> $, $car, $g, $ud {
          CATCH {
            default { $s.quit($_) }
          }

          $s.emit( [self, $car, $g, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-c{$signal}[0].tap(&handler) with &handler;
    %!signals-c{$signal}[0];
  }
}

# ClutterContainer, ClutterActor, GParamSpec, gpointer
sub g-connect-child-notify(
  Pointer $app,
  Str     $name,
          &handler (
            MutterClutterActor,
            MutterClutterActor,
            GParamSpec,
            Pointer
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
{ * }
