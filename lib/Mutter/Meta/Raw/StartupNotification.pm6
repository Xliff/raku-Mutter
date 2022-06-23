use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Meta::Raw::StartupNotification;


### /usr/src/mutter-42.1/src/meta/meta-startup-notification.h

sub meta_startup_notification_create_launcher (MetaStartupNotification $sn)
  returns MetaLaunchContext
  is native(mutter)
  is export
{ * }

sub meta_startup_notification_get_sequences (MetaStartupNotification $sn)
  returns GSList
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_complete (MetaStartupSequence $seq)
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_application_id (MetaStartupSequence $seq)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_completed (MetaStartupSequence $seq)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_icon_name (MetaStartupSequence $seq)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_id (MetaStartupSequence $seq) 
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_name (MetaStartupSequence $seq)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_timestamp (MetaStartupSequence $seq)
  returns uint64_t
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_wmclass (MetaStartupSequence $seq)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_workspace (MetaStartupSequence $seq)
  returns gint
  is native(mutter)
  is export
{ * }
