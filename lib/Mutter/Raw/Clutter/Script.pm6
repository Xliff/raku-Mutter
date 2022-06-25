use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Script;

#: ClutterScriptConnectFunc =
#:   &(ClutterScript, GObject, Str, Str, GObject, GConnectFlags, gpointer);

### /usr/src/mutter-42.1/clutter/clutter/clutter-script.h

sub clutter_script_add_search_paths (
  ClutterScript $script,
  CArray[Str]   $paths,
  gsize         $n_paths
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_get_script_id (GObject $gobject)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_connect_signals (ClutterScript $script, gpointer $user_data)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_connect_signals_full (
  ClutterScript $script,
                &func (
                  ClutterScript,
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

sub clutter_script_ensure_objects (ClutterScript $script)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_error_quark ()
  returns GQuark
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_get_object (ClutterScript $script, Str $name)
  returns GObject
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_get_objects (ClutterScript $script, Str $first_name)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_get_translation_domain (ClutterScript $script)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_get_type_from_name (ClutterScript $script, Str $type_name)
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_list_objects (ClutterScript $script)
  returns GList
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_load_from_data (
  ClutterScript           $script,
  Str                     $data,
  gssize                  $length,
  CArray[Pointer[GError]] $error
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_load_from_file (
  ClutterScript           $script,
  Str                     $filename,
  CArray[Pointer[GError]] $error
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_load_from_resource (
  ClutterScript           $script,
  Str                     $resource_path,
  CArray[Pointer[GError]] $error
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_lookup_filename (ClutterScript $script, Str $filename)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_new ()
  returns ClutterScript
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_set_translation_domain (ClutterScript $script, Str $domain)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_script_unmerge_objects (ClutterScript $script, guint $merge_id)
  is native(mutter-clutter)
  is export
{ * }
