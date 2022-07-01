use v6.c;

use NativeCall;

use Cairo;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::Path;

### /usr/src/mutter-42.1/clutter/clutter/clutter-path.h

sub clutter_path_add_cairo_path (MutterClutterPath $path, cairo_path_t $cpath)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_add_close (MutterClutterPath $path)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_add_curve_to (
  MutterClutterPath $path,
  gint        $x_1,
  gint        $y_1,
  gint        $x_2,
  gint        $y_2,
  gint        $x_3,
  gint        $y_3
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_add_line_to (MutterClutterPath $path, gint $x, gint $y)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_add_move_to (MutterClutterPath $path, gint $x, gint $y)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_add_node (
  MutterClutterPath     $path,
  MutterClutterPathNode $node
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_add_rel_curve_to (
  MutterClutterPath $path,
  gint        $x_1,
  gint        $y_1,
  gint        $x_2,
  gint        $y_2,
  gint        $x_3,
  gint        $y_3
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_add_rel_line_to (MutterClutterPath $path, gint $x, gint $y)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_add_rel_move_to (MutterClutterPath $path, gint $x, gint $y)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_add_string (MutterClutterPath $path, Str $str)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_clear (MutterClutterPath $path)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_foreach (
  MutterClutterPath $path,
                    &callback (MutterClutterPathNode, gpointer),
  gpointer          $user_data
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_get_description (MutterClutterPath $path)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_get_length (MutterClutterPath $path)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_get_n_nodes (MutterClutterPath $path)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_get_node (
  MutterClutterPath     $path,
  guint                 $index,
  MutterClutterPathNode $node
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_get_nodes (MutterClutterPath $path)
  returns GSList
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_get_position (
  MutterClutterPath $path,
  gdouble           $progress,
  MutterClutterKnot $position
)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_insert_node (
  MutterClutterPath     $path,
  gint                  $index,
  MutterClutterPathNode $node
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_new ()
  returns MutterClutterPath
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_new_with_description (Str $desc)
  returns MutterClutterPath
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_remove_node (MutterClutterPath $path, guint $index)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_replace_node (
  MutterClutterPath     $path,
  guint                 $index,
  MutterClutterPathNode $node
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_set_description (MutterClutterPath $path, Str $str)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_path_to_cairo_path (MutterClutterPath $path, cairo_t $cr)
  is native(mutter-clutter)
  is export
{ * }
