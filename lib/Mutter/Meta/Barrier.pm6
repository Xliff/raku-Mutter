use v6.c;

use NativeCall;

use Mutter::Raw::Types;

class Mutter::Barrier {
  has MutterBarrier $!mb is implementor;

  method destroy {
    meta_barrier_destroy($!mb);
  }

  method get_type {
    meta_barrier_get_type();
  }

  method is_active {
    so meta_barrier_is_active($!mb);
  }

  method release (MetaBarrierEvent() $event) {
    meta_barrier_release($!mb, $event);
  }
}

# BOXED ?

class Meta::Barrier::Event {
  has MetaBarrierEvent $!mbe is implementor handles(*);

  method get_type {
    state ($n, $t);

    unstable_get_type(self.^name, &meta_barrier_event_get_type, $n, $t);
  }

}

### /usr/include/mutter-10/meta/barrier.h

sub meta_barrier_destroy (MetaBarrier $barrier)
  is native(mutter)
  is export
{ * }

sub meta_barrier_event_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_barrier_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub meta_barrier_is_active (MetaBarrier $barrier)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_barrier_release (MetaBarrier $barrier, MetaBarrierEvent $event)
  is native(mutter)
  is export
{ * }
