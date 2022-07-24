use v6.c;

use NativeCall;

use GLib::Raw::ReturnedValue;
use Mutter::Raw::Types;

role Mutter::Clutter::Roles::Signals::ZoomAction {
  has %!signals-za;

  # ClutterZoomAction, ClutterActor, graphene_point_t, gdouble, gpointer
  method connect-zoom (
    $obj,
    $signal = 'zoom',
    &handler?
  ) {
    my $hid;
    %!signals-za{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-zoom($obj, $signal,
        -> $, $a, $p, $d, $ud {
          CATCH {
            default { .message.say; $s.note($_) }
          }

          my $r = ReturnedValue.new;
          $s.emit( [self, $a, $p, $d, $ud, $r ] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid];
    };
    %!signals-za{$signal}[0].tap(&handler) with &handler;
    %!signals-za{$signal}[0];
  }

}

# ClutterZoomAction, ClutterActor, graphene_point_t, gdouble, gpointer
sub g-connect-zoom (
  Pointer $app,
  Str     $name,
          &handler (
            MutterClutterZoomAction,
            MutterClutterActor,
            graphene_point_t,
            gdouble,
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
