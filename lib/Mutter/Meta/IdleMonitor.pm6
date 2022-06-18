use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Object;

class Mutter::Meta::IdleMonitor {
  also does GLib::Roles::Object;

  method add_idle_watch (
    Int()    $interval_msec,
             &callback,
    gpointer $user_data       = gpointer,
             &notify          = $DEFAULT-GDESTROY-NOTIFY
  ) {
    my guint64 $i = $interval_msec;

    meta_idle_monitor_add_idle_watch(
      $!mim,
      $interval_msec,
      &callback,
      $user_data,
      &notify
    );
  }

  method add_user_active_watch (
             &callback,
    gpointer $user_data = gpointer,
             &notify    = $DEFAULT-GDESTROY-NOTIFY
  ) {
    meta_idle_monitor_add_user_active_watch(
      $!mim,
      &callback,
      $user_data,
      &notify
    );
  }

  method get_idletime {
    meta_idle_monitor_get_idletime($!mim);
  }

  method remove_watch (Int() $id) {
    my guint $i = $id;

    meta_idle_monitor_remove_watch($!mim, $i);
  }

}


### /usr/src/mutter-42.1/src/meta/meta-idle-monitor.h

sub meta_idle_monitor_add_idle_watch (
  MetaIdleMonitor $monitor,
  guint64         $interval_msec,
                  &callback (MetaIdleMonitor, guint, gpointer), #= MetaIdleMonitorFunc
  gpointer        $user_data,
                  &notify (gpointer)
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_idle_monitor_add_user_active_watch (
  MetaIdleMonitor $monitor,
                  &callback (MetaIdleMonitor, guint, gpointer),
  gpointer        $user_data,
                  &notify (gpointer)
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_idle_monitor_get_idletime (MetaIdleMonitor $monitor)
  returns gint64
  is native(mutter)
  is export
{ * }

sub meta_idle_monitor_remove_watch (MetaIdleMonitor $monitor, guint $id)
  is native(mutter)
  is export
{ * }
