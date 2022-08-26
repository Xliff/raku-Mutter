use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::StartupNotification;

### /usr/src/mutter-42.1/src/meta/meta-startup-notification.h

sub meta_startup_notification_create_launcher (
  MutterMetaStartupNotification $sn
)
  returns MutterMetaLaunchContext
  is native(mutter)
  is export
{ * }

sub meta_startup_notification_get_sequences (MutterMetaStartupNotification $sn)
  returns GSList
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_complete (MutterMetaStartupSequence $seq)
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_application_id (MutterMetaStartupSequence $seq)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_completed (MutterMetaStartupSequence $seq)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_icon_name (MutterMetaStartupSequence $seq)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_id (MutterMetaStartupSequence $seq)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_name (MutterMetaStartupSequence $seq)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_timestamp (MutterMetaStartupSequence $seq)
  returns uint64_t
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_wmclass (MutterMetaStartupSequence $seq)
  returns Str
  is native(mutter)
  is export
{ * }

sub meta_startup_sequence_get_workspace (MutterMetaStartupSequence $seq)
  returns gint
  is native(mutter)
  is export
{ * }
