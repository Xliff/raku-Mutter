use v6.c;

use Method::Also;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Source;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

our subset MutterMetaIdleMonitorAncestry is export of Mu
  where MutterMetaIdleMonitor | GObject;

class MutterMeta::Meta::IdleMonitor {
  also does GLib::Roles::Object;

  has MutterMetaIdleMonitor $!mim is implementor;

  submethod BUILD ( :$meta-idle-monitor ) {
    self.setMutterMetaIdleMonitor($meta-idle-monitor)
      if $meta-idle-monitor
  }

  method setMutterMetaIdleMonitor (MutterMetaIdleMonitorAncestry $_) {
    my $to-parent;

    $!mim = do {
      when MutterMetaIdleMonitor {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaIdleMonitor, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Definitions::MutterMetaIdleMonitor
    is also<MutterMetaIdleMonitor>
  { $!mim }

  multi method new (
    MutterMetaIdleMonitorAncestry  $meta-idle-monitor,
                                  :$ref                = True
  ) {
    return unless $meta-idle-monitor;

    my $o = self.bless( :$meta-idle-monitor );
    $o.ref if $ref;
    $o;
  }

  method add_idle_watch (
    Int()    $interval_msec,
             &callback,
    gpointer $user_data       = gpointer,
             &notify          = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<add-idle-watch>
  {
    my guint64 $i = $interval_msec;

    meta_idle_monitor_add_idle_watch(
      $!mim,
      $interval_msec,
      &callback,
      $user_data,
      &notify
    ) but GIdleId[ sub ($i) { self.remove-watch($i) } ]
  }

  method add_user_active_watch (
             &callback,
    gpointer $user_data = gpointer,
             &notify    = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<add-user-active-watch>
  {
    meta_idle_monitor_add_user_active_watch(
      $!mim,
      &callback,
      $user_data,
      &notify
    ) but GIdleId[ sub ($i) { self.remove-watch($i) } ]
  }

  method get_idletime is also<get-idletime> {
    meta_idle_monitor_get_idletime($!mim);
  }

  method remove_watch (Int() $id) is also<remove-watch> {
    my guint $i = $id;

    meta_idle_monitor_remove_watch($!mim, $i);
  }

}


### /usr/src/mutter-42.1/src/meta/meta-idle-monitor.h

sub meta_idle_monitor_add_idle_watch (
  MutterMetaIdleMonitor $monitor,
  guint64               $interval_msec,
                        &callback (
                          MutterMetaIdleMonitor,
                          guint,
                          gpointer
                        ), #= MutterMetaIdleMonitorFunc
  gpointer              $user_data,
                        &notify (gpointer)
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_idle_monitor_add_user_active_watch (
  MutterMetaIdleMonitor $monitor,
                        &callback (MutterMetaIdleMonitor, guint, gpointer),
  gpointer              $user_data,
                        &notify (gpointer)
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_idle_monitor_get_idletime (MutterMetaIdleMonitor $monitor)
  returns gint64
  is native(mutter)
  is export
{ * }

sub meta_idle_monitor_remove_watch (MutterMetaIdleMonitor $monitor, guint $id)
  is native(mutter)
  is export
{ * }
