use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use Mutter::Clutter::Actor;

class Mutter::Meta::Background::Actor is Mutter::Clutter::Actor {
  MetaBackgroundActor $!mba is implementor;

  method new (MetaDisplay() $display, Int() $monitor) {
    my gint $m = $monitor;

    my $meta-background-actor = meta_background_actor_new($display, $m);

    $meta-background-actor ?? self.bless( :$meta-background-actor ) !! Nil;
  }

}

### /usr/src/mutter-42.1/src/meta/meta-background-actor.h

sub meta_background_actor_new (MetaDisplay $display, gint $monitor)
  returns ClutterActor
  is native(mutter)
  is export
{ * }
