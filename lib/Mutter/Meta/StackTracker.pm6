use v6.c;

use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::StackTracker;

class Mutter::Meta::StackTracker {
  has MutterMetaStackTracker $!mst is implementor;

  multi method new {
    my $mutter-stack-tracker = meta_stack_tracker_new();

    $mutter-stack-tracker ?? self.bless( :$mutter-stack-tracker ) !! Nil;
  }

  method configure_event (XConfigureEvent  $event) {
    meta_stack_tracker_configure_event($!mst, $event);
  }

  method create_event (XCreateWindowEvent $event) {
    meta_stack_tracker_create_event($!mst, $event);
  }

  method destroy_event (XDestroyWindowEvent $event) {
    meta_stack_tracker_destroy_event($!mst, $event);
  }

  method free {
    meta_stack_tracker_free($!mst);
  }

  proto method get_stack (|)
  { * }

  multi method get_stack (
    samewith( newCArray(guint64), $ );

  }
  multi method get_stack (
    CArray[guint64]  $windows,
                     $n_entries is rw
                    :$raw            = False
  ) {
    my guint $n = 0;
    meta_stack_tracker_get_stack($!mst, $windows, $n);
    $n_entries = $n;
    return $windows if $raw;
    CArrayToArray($windows);
  }

  method lower (Int() $window) {
    my guint64 $w = $window;

    meta_stack_tracker_lower($!mst, $w);
  }

  method queue_sync_stack {
    meta_stack_tracker_queue_sync_stack($!mst);
  }

  method record_add (Int() $window, Int() $serial) {
    my guint64 $w = $window;
    my gulong  $s = $serial;

    meta_stack_tracker_record_add($!mst, $w, $s);
  }

  method record_remove (Int() $window, Int() $serial) {
    my guint64 $w = $window;
    my gulong  $s = $serial;

    meta_stack_tracker_record_remove($!mst, $w, $s);
  }

  method reparent_event (XReparentEvent $event) {
    meta_stack_tracker_reparent_event($!mst, $event);
  }

  proto method restack_at_bottom (|)
  { * }

  method restack_at_bottom (@new-order) {
    samewith( ArrayToCArray(guint64, @new-order), @new-order.elems )
  }
  method restack_at_bottom (
    CArray[guint64]  $new_order,
    gint             $n_new_order
  ) {
    meta_stack_tracker_restack_at_bottom($!mst, $new_order, $n_new_order);
  }

  proto method restack_managed (|)
  { * }

  method restack_managed (@new-order) {
    samewith( ArrayToCArray(guint64, @new-order), @new-order.elems )
  }
  method restack_managed (
    CArray[guint64]  $windows,
    gint             $n_windows
  ) {
    meta_stack_tracker_restack_managed($!mst, $windows, $n_windows);
  }

  method sync_stack {
    meta_stack_tracker_sync_stack($!mst);
  }

}
