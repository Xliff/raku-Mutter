use v6.c;

use NativeCall;

use GLib::Raw::ReturnedValue;

use Mutter::Raw::Types;

role Mutter::Clutter::Roles::Signals::ClickAction {
  has %!signals-mcca;

  #  MutterClutterActor *actor,  MutterClutterLongPressState state --> gboolean
  method connect-long-press (
    $obj,
    $signal = 'long-press',
    &handler?
  ) {
    my $hid;
    %!signals-mcca{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-long-press($obj, $signal,
        -> $, $ca, $clps {
          CATCH {
            default { 𝒮.note($_) }
          }

          my $r = ReturnedValue.new;
          𝒮.emit( [self, $ca, $clps, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-mcca{$signal}[0].tap(&handler) with &handler;
    %!signals-mcca{$signal}[0];
  }

}

# MutterClutterClickAction *action,  MutterClutterActor *actor,  MutterClutterLongPressState state --> gboolean
sub g-connect-long-press (
  Pointer $app,
  Str     $name,
          &handler (
            MutterClutterClickAction,
            MutterClutterActor,
            MutterClutterLongPressState
            --> gboolean
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
