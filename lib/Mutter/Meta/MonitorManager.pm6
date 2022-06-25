use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::MonitorManager;

use GLib::Roles::Object;

class Mutter::Meta::MonitorManager {
  also does GLib::Roles::Object;

  has MetaMonitorManager $!mmm is implementor;

  method new is also<get> {
    my $monitor-manager = meta_monitor_manager_get($!mmm);

    $monitor-manager ?? self.bless( :$monitor-manager ) !! Nil
  }

  method can_switch_config is also<can-switch-config> {
    so meta_monitor_manager_can_switch_config($!mmm);
  }

  method get_display_configuration_timeout
    is also<get-display-configuration-timeout>
  {
    meta_monitor_manager_get_display_configuration_timeout($!mmm);
  }

  method get_is_builtin_display_on
    is also<get-is-builtin-display-on>
  {
    so meta_monitor_manager_get_is_builtin_display_on($!mmm);
  }

  method get_monitor_for_connector (Str())$connector)
    is also<get-monitor-for-connector>
  {
    meta_monitor_manager_get_monitor_for_connector($!mmm, $connector);
  }

  method get_panel_orientation_managed
    is also<get-panel-orientation-managed>
  {
    meta_monitor_manager_get_panel_orientation_managed($!mmm);
  }

  method get_switch_config is also<get-switch-config> {
    meta_monitor_manager_get_switch_config($!mmm);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &meta_monitor_manager_get_type, $n, $t );
  }

  method switch_config is also<switch-config> {
    my MetaMonitorSwitchConfigType $c = $config_type;

    meta_monitor_manager_switch_config($!mmm, $c);
  }

}
