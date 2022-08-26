use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Startup;

use GLib::GSList;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterMetaStartupNotificationAncestry is export of Mu
  where MutterMetaStartupNotification | GObject;

class Mutter::Meta::Startup::Notification {
  also does GLib::Roles::Object;

  has MutterMetaStartupNotification $!msn is implementor;

  submethod BUILD ( :$meta-startup ) {
    self.setMutterMetaStartupNotification($meta-startup) if $meta-startup
  }

  method setMutterMetaStartupNotification (
    MutterMetaStartupNotificationAncestry $_
  ) {
    my $to-parent;

    $!msn = do {
      when MutterMetaStartupNotification {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaStartupNotification, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterMetaStartupNotification
    is also<MutterMetaStartupNotification>
  { $!msn }

  multi method new (
    MutterMetaStartupNotificationAncestry  $meta-startup,
                                          :$ref           = True
  ) {
    return unless $meta-startup;

    my $o = self.bless( :$meta-startup );
    $o.ref if $ref;
    $o;
  }

  method create_launcher ( :$raw = False ) is also<create-launcher> {
    propReturnObject(
      meta_startup_notification_create_launcher($!msn),
      $raw,
      |Mutter::Meta::LaunchContext.getTypePair
    );
  }

  method get_sequences ( :$raw = False, :$glist = False )
    is also<get-sequences>
  {
    returnGSList(
      meta_startup_notification_get_sequences($!msn),
      $raw,
      $glist,
      |Mutter::Meta::Startup::Sequence.getTypePair
    );
  }
}

our subset MutterMetaStartupSequenceAncestry is export of Mu
  where MutterMetaStartupSequence | GObject;

class Mutter::Meta::Startup::Sequence {
  also does GLib::Roles::Object;
  
  has MutterMetaStartupSequence $!mss is implementor;

  submethod BUILD ( :$meta-startup ) {
    self.setMutterMetaStartupSequence($meta-startup) if $meta-startup
  }

  method setMutterMetaStartupSequence (MutterMetaStartupSequenceAncestry $_) {
    my $to-parent;

    $!mss = do {
      when MutterMetaStartupSequence {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaStartupSequence, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterMetaStartupSequence
    is also<MutterMetaStartupSequence>
  { $!mss }

  multi method new (
    MutterMetaStartupSequenceAncestry  $meta-startup,
                                      :$ref           = True
  ) {
    return unless $meta-startup;

    my $o = self.bless( :$meta-startup );
    $o.ref if $ref;
    $o;
  }

  method complete {
    meta_startup_sequence_complete($!mss);
  }

  method get_application_id
    is also<
      get-application-id
      application_id
      aplication-id
    >
  {
    meta_startup_sequence_get_application_id($!mss);
  }

  method get_completed
    is also<
      get-completed
      completed
    >
  {
    so meta_startup_sequence_get_completed($!mss);
  }

  method get_icon_name
    is also<
      get-icon-name
      icon_name
      icon-name
    >
  {
    meta_startup_sequence_get_icon_name($!mss);
  }

  method get_id
    is also<
      get-id
      id
    >
  {
    meta_startup_sequence_get_id($!mss);
  }

  method get_name
    is also<
      get-name
      name
    >
  {
    meta_startup_sequence_get_name($!mss);
  }

  method get_timestamp
    is also<
      get-timestamp
      timestamp
    >
  {
    meta_startup_sequence_get_timestamp($!mss);
  }

  method get_wmclass
    is also<
      get-wmclass
      wmclass
    >
  {
    meta_startup_sequence_get_wmclass($!mss);
  }

  method get_workspace
    is also<
      get-workspace
      workspace
    >
  {
    meta_startup_sequence_get_workspace($!mss);
  }

}
