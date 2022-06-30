use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Path;

class Mutter::Cluter::Path {
  has MutterClutterPath $!mcp is implementor;

  method new {
    my $mutter-clutter-path = clutter_path_new();

    $mutter-clutter-path ?? self.bless( :$mutter-clutter-path ) !! Nil;
  }

  method new_with_description (Str() $desc) {
    my $mutter-clutter-path = clutter_path_new_with_description($!mcp, $desc);

    $mutter-clutter-path ?? self.bless( :$mutter-clutter-path ) !! Nil;
  }

  method add_cairo_path (cairo_path_t() $cpath) {
    clutter_path_add_cairo_path($!mcp, $cpath);
  }

  method add_close {
    clutter_path_add_close($!mcp);
  }

  method add_curve_to (
    Int() $x_1,
    Int() $y_1,
    Int() $x_2,
    Int() $y_2,
    Int() $x_3,
    Int() $y_3
  ) {
    my gint ($x1, $y1, $x2, $y2, $x3, $y3) = (
      $x_1, $y_1, $x_2, $y_2, $x_3, $y_3);

    clutter_path_add_curve_to($!mcp, $x1, $y1, $x2, $y2, $x3, $y3);
  }

  method add_line_to (Int() $x, Int() $y) {
    my gint ($xx, $yy);

    clutter_path_add_line_to($!mcp, $xx, $yy);
  }

  method add_move_to (Int() $x, Int() $y) {
    my gint ($xx, $yy);

    clutter_path_add_move_to($!mcp, $xx, $yy);
  }

  method add_node (MutterClutterPathNode() $node) {
    clutter_path_add_node($!mcp, $node);
  }

  method add_rel_curve_to (Int() $x_1,
  Int() $y_1,
  Int() $x_2,
  Int() $y_2,
  Int() $x_3,
  Int() $y_3
) {
  my gint ($x1, $y1, $x2, $y2, $x3, $y3) =
    ($x_1, $y_1, $x_2, $y_2, $x_3, $y_3);

    clutter_path_add_rel_curve_to($!mcp, $x1, $y1, $x2, $y2, $x3, $y3)
  }

  method add_rel_line_to (Int() $x, Int() $y) {
    my gint ($xx, $yy);

    clutter_path_add_rel_line_to($!mcp, $xx, $yy);
  }

  method add_rel_move_to (Int() $x, Int() $y) {
    my gint ($xx, $yy);

    clutter_path_add_rel_move_to($!mcp, $xx, $yy);
  }

  method add_string (Str $str) {
    clutter_path_add_string($!mcp, $str);
  }

  method clear {
    clutter_path_clear($!mcp);
  }

  method foreach (&callback, gpointer $user_data = gpointer) {
    clutter_path_foreach($!mcp, &callback, $user_data);
  }

  method get_description {
    clutter_path_get_description($!mcp);
  }

  method get_length {
    clutter_path_get_length($!mcp);
  }

  method get_n_nodes {
    clutter_path_get_n_nodes($!mcp);
  }

  method get_node (Int() $index, MutterClutterPathNode() $node) {
    my guint $i = $index;

    clutter_path_get_node($!mcp, $i, $node);
  }

  method get_nodes ( :$raw = False, :$glist = False ) {
    propReturnObject(
      clutter_path_get_nodes($!mcp),
      $raw,
      $glist,
      |Mutter::Clutter::Path::Node.getTypePair
    );
  }

  method get_position (Num() $progress, MutterClutterKnot() $position) {
    my gdouble $p = $progress;

    clutter_path_get_position($!mcp, $p, $position);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_path_get_type, $n, $t );
  }

  method insert_node (Int() $index, MutterClutterPathNode() $node) {
    my gint $i = $index;

    clutter_path_insert_node($!mcp, $i, $node);
  }

  method remove_node (Int() $index) {
    my guint $i = $index;
    clutter_path_remove_node($!mcp, $i);
  }

  method replace_node (Int() $index, MutterClutterPathNode() $node) {
    my guint $i = $index;

    clutter_path_replace_node($!mcp, $index, $node);
  }

  method set_description (Str() $str) {
    clutter_path_set_description($!mcp, $str);
  }

  method to_cairo_path (cairo_t() $cr) {
    clutter_path_to_cairo_path($!mcp, $cr);
  }

}
