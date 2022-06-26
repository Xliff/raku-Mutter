use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Enums;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Script;

#: ClutterScriptConnectFunc =
#:   &(MutterClutterScript, GObject, Str, Str, GObject, GConnectFlags, gpointer);

### /usr/src/mutter-42.1/clutter/clutter/clutter-script.h

sub clutter_script_add_search_paths (
  MutterClutterScript $script,
  CArray[Str]         $paths,
  gsize               $n_paths
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_get_script_id (GObject $gobject)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_connect_signals (
  MutterClutterScript $script,
  gpointer            $user_data
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_connect_signals_full (
  MutterClutterScript $script,
                &func (
                  MutterClutterScript,
                  GObject,
                  Str,
                  Str,
                  GObject,
                  GConnectFlags,
                  gpointer
                ),
  gpointer      $user_data
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_ensure_objects (MutterClutterScript $script)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_error_quark ()
  returns GQuark
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_get_object (MutterClutterScript $script, Str $name)
  returns GObject
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_get_objects (MutterClutterScript $script, Str $first_name)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_get_translation_domain (MutterClutterScript $script)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_get_type_from_name (
  MutterClutterScript $script,
  Str                 $type_name
)
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_list_objects (MutterClutterScript $script)
  returns GList
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_load_from_data (
  MutterClutterScript     $script,
  Str                     $data,
  gssize                  $length,
  CArray[Pointer[GError]] $error
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_load_from_file (
  MutterClutterScript     $script,
  Str                     $filename,
  CArray[Pointer[GError]] $error
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_load_from_resource (
  MutterClutterScript     $script,
  Str                     $resource_path,
  CArray[Pointer[GError]] $error
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_lookup_filename (
  MutterClutterScript $script,
  Str                 $filename
)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_new ()
  returns MutterClutterScript
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_set_translation_domain (
  MutterClutterScript $script,
  Str                 $domain
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_unmerge_objects (
  MutterClutterScript $script,
  guint               $merge_id
)
  is native(mutter-clutter)
  is export
{ * }
