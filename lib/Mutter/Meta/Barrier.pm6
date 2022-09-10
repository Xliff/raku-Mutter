use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterMetaBarrierAncestry is export of Mu
  where MutterMetaBarrier | GObject;

class Mutter::Meta::Barrier {
  also does GLib::Roles::Object;

  has MutterMetaBarrier $!mb is implementor;

  submethod BUILD ( :$meta-barrier ) {
    self.setMutterMetaBarrier($meta-barrier) if $meta-barrier
  }

  method setMutterMetaBarrier (MutterMetaBarrierAncestry $_) {
    my $to-parent;

    $!mb = do {
      when MutterMetaBarrier {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaBarrier, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterMetaBarrier
  { $!mb }

  multi method new (MutterMetaBarrierAncestry $meta-barrier, :$ref = True) {
    return unless $meta-barrier;

    my $o = self.bless( :$meta-barrier );
    $o.ref if $ref;
    $o;
  }

  method destroy {
    meta_barrier_destroy($!mb);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &meta_barrier_get_type, $n, $t );
  }

  method is_active {
    so meta_barrier_is_active($!mb);
  }

  method release (MutterMetaBarrierEvent() $event) {
    meta_barrier_release($!mb, $event);
  }
}

# BOXED ?

class Meta::Barrier::Event {
  has MutterMetaBarrierEvent $!mbe is implementor handles(*);

  method get_type {
    state ($n, $t);

    unstable_get_type(self.^name, &meta_barrier_event_get_type, $n, $t);
  }

}

### /usr/src/mutter-42.1/src/meta/barrier.h

sub meta_barrier_destroy (MutterMetaBarrier $barrier)
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

sub meta_barrier_is_active (MutterMetaBarrier $barrier)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_barrier_release (
  MutterMetaBarrier      $barrier, 
  MutterMetaBarrierEvent $event
)
  is native(mutter)
  is export
{ * }
