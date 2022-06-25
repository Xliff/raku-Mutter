use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::StartupNotification;

use GLib::GSList;

class Mutter::Meta::Startup::Notification {
  has MetaStartupNotification $!msn is implementor;

  method create_launcher ( :$raw = False ) {
    propReturnObject(
      meta_startup_notification_create_launcher($!msn),
      $raw,
      |Mutter::Meta::LaunchContext.getTypePair
    );
  }

  method get_sequences ( :$raw = False, :$glist = False ) {
    returnGSList(
      meta_startup_notification_get_sequences($!msn),
      $raw,
      $glist,
      |Mutter::Meta::Startup::Sequence.getTypePair
    );
  }
}

class Mutter::Meta::Startup::Sequence {
  has MetaStartupSequence $!mss is implemnentor;

  method complete {
    meta_startup_sequence_complete($!msn);
  }

  method get_application_id {
    meta_startup_sequence_get_application_id($!msn);
  }

  method get_completed {
    meta_startup_sequence_get_completed($!msn);
  }

  method get_icon_name {
    meta_startup_sequence_get_icon_name($!msn);
  }

  method get_id {
    meta_startup_sequence_get_id($!msn);
  }

  method get_name {
    meta_startup_sequence_get_name($!msn);
  }

  method get_timestamp {
    meta_startup_sequence_get_timestamp($!msn);
  }

  method get_wmclass {
    meta_startup_sequence_get_wmclass($!msn);
  }

  method get_workspace {
    meta_startup_sequence_get_workspace($!msn);
  }

}
