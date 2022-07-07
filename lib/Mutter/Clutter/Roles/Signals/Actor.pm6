use v6.c;

use NativeCall;


use Clutter::Raw::Types;

use GLib::Raw::ReturnedValue;

use GLib::Roles::Signals::Generic;
use Mutter::Clutter::Roles::Signals::Generic;

role Clutter::Roles::Signals::Actor {
  has %!signals-a;

  # ClutterActor, ClutterActorBox, ClutterAllocationFlags, gpointer
  method connect-allocation-changed (
    $obj,
    $signal = 'allocation-changed',
    &handler?
  ) {
    my $hid;
    %!signals-a{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-allocation-changed($obj, $signal,
        -> $, $cabx, $cafs, $ud {
          CATCH {
            default { .message.say; $s.quit($_) }
          }

          $s.emit( [self, $cabx, $cafs, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-a{$signal}[0].tap(&handler) with &handler;
    %!signals-a{$signal}[0];
  }

  # ClutterActor, ClutterEvent, gpointer --> gboolean
  method connect-clutter-event (
    $obj,
    $signal,
    &handler?
  ) {
    my $hid;
    %!signals-a{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-clutter-event($obj, $signal,
        -> $, $cet, $ud --> gboolean {
          CATCH {
            default { .message.say; $s.quit($_) }
          }

          my $r = ReturnedValue.new;
          $s.emit( [self, $cet, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-a{$signal}[0].tap(&handler) with &handler;
    %!signals-a{$signal}[0];
  }

  # ClutterActor, ClutterColor, gpointer
  method connect-pick (
    $obj,
    $signal = 'pick',
    &handler?
  ) {
    my $hid;
    %!signals-a{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-pick($obj, $signal,
        -> $, $ccr, $ud {
          CATCH {
            default { .message.say; $s.quit($_) }
          }

          $s.emit( [self, $ccr, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-a{$signal}[0].tap(&handler) with &handler;
    %!signals-a{$signal}[0];
  }

  # ClutterActor, gchar, gboolean, gpointer
  method connect-transition-stopped (
    $obj,
    $signal = 'transition-stopped',
    &handler?
  ) {
    my $hid;
    %!signals-a{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-transition-stopped($obj, $signal,
        -> $, $gr, $gn, $ud {
          CATCH {
            default { .message.say; $s.quit($_) }
          }

          $s.emit( [self, $gr, $gn, $ud ] );
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-a{$signal}[0].tap(&handler) with &handler;
    %!signals-a{$signal}[0];
  }
}

# ClutterActor, ClutterActorBox, ClutterAllocationFlags, gpointer
sub g-connect-allocation-changed (
  Pointer $app,
  Str     $name,
          &handler (
            MutterClutterActor,
            MutterClutterActorBox,
            guint,
            Pointer
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
{ * }

# ClutterActor, ClutterEvent, gpointer --> gboolean
sub g-connect-clutter-event (
  Pointer $app,
  Str     $name,
          &handler (
            MutterClutterActor,
            MutterClutterEvent,
            Pointer
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
{ * }

# ClutterActor, ClutterColor, gpointer
sub g-connect-pick (
  Pointer $app,
  Str     $name,
          &handler (MutterClutterActor, MutterClutterColor, Pointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
{ * }


# ClutterActor, gchar, gboolean, gpointer
sub g-connect-transition-stopped (
  Pointer $app,
  Str     $name,
          &handler (MutterClutterActor, Str, gboolean, Pointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
{ * }
