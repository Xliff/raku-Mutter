use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::StackTracker;

constant XConfigureEvent     is export := Pointer;
constant XCreateWindowEvent  is export := Pointer;
constant XDestroyWindowEvent is export := Pointer;
constant XReparentEvent      is export := Pointer;

### /usr/src/mutter/src/core/stack-tracker.h

sub meta_stack_tracker_configure_event (
  MutterMetaStackTracker $tracker,
  XConfigureEvent        $event
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_create_event (
  MutterMetaStackTracker $tracker,
  XCreateWindowEvent     $event
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_destroy_event (
  MutterMetaStackTracker $tracker,
  XDestroyWindowEvent    $event
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_free (MutterMetaStackTracker $tracker)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_get_stack (
  MutterMetaStackTracker $tracker,
  CArray[guint64]        $windows,
  gint                   $n_entries is rw
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_lower (
  MutterMetaStackTracker $tracker,
  guint64          $window
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_new (MutterMetaDisplay $display)
  returns MutterMetaStackTracker
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_queue_sync_stack (
  MutterMetaStackTracker $tracker
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_record_add (
  MutterMetaStackTracker $tracker,
  guint64                $window,
  gulong                 $serial
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_record_remove (
  MutterMetaStackTracker $tracker,
  guint64                $window,
  gulong                 $serial
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_reparent_event (
  MutterMetaStackTracker $tracker,
  XReparentEvent   $event
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_restack_at_bottom (
  MutterMetaStackTracker $tracker,
  CArray[guint64]        $new_order,
  gint                   $n_new_order
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_restack_managed (
  MutterMetaStackTracker $tracker,
  CArray[guint64]        $windows,
  gint                   $n_windows
)
  is      native(mutter)
  is      export
{ * }

sub meta_stack_tracker_sync_stack (
  MutterMetaStackTracker $tracker
)
  is      native(mutter)
  is      export
{ * }
