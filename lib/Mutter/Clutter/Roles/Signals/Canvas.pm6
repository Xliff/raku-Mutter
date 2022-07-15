use v6.c;

use NativeCall;

use GLib::Raw::ReturnedValue;

use Mutter::Raw::Types;

role Mutter::Clutter::Roles::Signals::Canvas {
  has %!signals-mcc;

  # MutterClutterCanvas, CairoContext, gint, gint, gpointer --> gboolean
  method connect-draw (
    $obj,
    $signal = 'draw',
    &handler?
  ) {
    my $hid;
    %!signals-mcc{$signal} //= do {
      my $s = Supplier.new;
      $hid = g-connect-canvas-draw($obj, $signal,
        -> $, $cr, $gt1, $gt2, $ud --> gboolean {
          CATCH {
            default { $s.note($_) }
          }

          my $r = ReturnedValue.new;
          $s.emit( [self, $cr, $gt1, $gt2, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ $s.Supply, $obj, $hid ];
    };
    %!signals-mcc{$signal}[0].tap(&handler) with &handler;
    %!signals-mcc{$signal}[0];
  }

}

# ClutterCanvas, CairoContext, gint, gint, gpointer --> gboolean
sub g-connect-canvas-draw(
  Pointer $app,
  Str     $name,
          &handler (Pointer, cairo_t, gint, gint, Pointer --> gboolean),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native('gobject-2.0')
  is symbol('g_signal_connect_object')
  { * }
