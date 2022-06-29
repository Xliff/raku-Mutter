use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::PaintNode;

class Mutter::Clutter::PaintNode {
  has MutterMutterClutterPaintNode $!mcpm is implementor;

  method add_child (MutterClutterPaintNode() $child) {
    clutter_paint_node_add_child($!mcpn, $child);
  }

  proto method add_multitexture_rectangle (|)
  { * }

  multi method add_multitexture_rectangle (
    MutterClutterActorBox()  $rect,
                             @text_coords,
                            :$size         = @text_coords.elems
  ) {
    die 'Cannot use a larger size than the array size!'
      if $size > @coords.elems;

    samewith( $rect, ArrayToCArray(gfloat, @text_coords), $size );
  }
  multi method add_multitexture_rectangle (
    MutterClutterActorBox() $rect,
    CArray[gfloat]          $text_coords,
    Int()                   $text_coords_len
  ) {
    my gint $t = $text_coords_len;

    clutter_paint_node_add_multitexture_rectangle(
      $!mcpn,
      $rect,
      $text_coords,
      $t
    );
  }

  method add_primitive (MutterCoglPrimitive() $primitive) {
    clutter_paint_node_add_primitive($!mcpn, $primitive);
  }

  method add_rectangle (MutterClutterActorBox() $rect) {
    clutter_paint_node_add_rectangle($!mcpn, $rect);
  }

  proto method add_rectangles (|)
  { * }

  method add_rectangles (@coords, :$size = @coords.elems ) {
    die 'Cannot use a larger size than the array size!'
      if $size > @coords.elems;

    samewith( ArrayToCArray(gfloat, @coords), $size );
  }
  method add_rectangles (CArray[gfloat] $coords, Int() $n_rects) {
    my gint $n = $n_rects;

    clutter_paint_node_add_rectangles($!mcpn, $coords, $n);
  }

  method add_texture_rectangle (
    MutterClutterActorBox() $rect,
    Num()                   $x_1,
    Num()                   $y_1,
    Num()                   $x_2,
    Num()                   $y_2
  ) {
    my gfloat ($x1, $y1, $x2, $y2) = ($x_1, $y_1, $x_2, $y_2);

    clutter_paint_node_add_texture_rectangle(
      $!mcpn,
      $rect,
      $x1,
      $y1,
      $x2,
      $y2
    );
  }

  proto method add_texture_rectangles (|)
  { *}

  multi method add_texture_rectangles (@coords, :$size = @coords.elems) {
    die 'Cannot use a larger size than the array size!'
      if $size > @coords.elems;
    samewith( ArrayToCArray(gfloat, @coords), $size );
  }
  multi method add_texture_rectangles (CArray[gfloat] $coords, Int() $n_rects) {
    clutter_paint_node_add_texture_rectangles($!mcpn, $c, $n_rects);
  }

  method get_framebuffer ( :$raw = False) {
    propReturnObject(
      clutter_paint_node_get_framebuffer($!mcpn),
      $raw,
      |Mutter::Cogl::Framebuffer.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_paint_node_get_type, $n, $t );
  }

  method paint (MutterClutterPaintContext() $paint_context) {
    clutter_paint_node_paint($!mcpn, $paint_context);
  }

  method ref {
    clutter_paint_node_ref($!mcpn);
    self;
  }

  method set_name (Str() $name) {
    clutter_paint_node_set_name($!mcpn, $name);
  }

  method set_static_name (Str() $name) {
    clutter_paint_node_set_static_name($!mcpn, $name);
  }

  method unref {
    clutter_paint_node_unref($!mcpn);
  }

}

use GLib::Raw::Value;

class Mutter::Clutter::PaintNode::Value is GLib::Value {

  method new {
    self.bless( type => Mutter::Clutter::PaintNode.get_type );
  }

  method value ( :$raw = False ) {
    Proxy.new:
      FETCH => -> $      { self.get_paint_node( :$raw ) },
      STORE => -> $, \v  { self.set_paint_node(v)       };
  }

  method dup_paint_node {
    clutter_value_dup_paint_node(self.GValue);
  }

  method get_paint_node ( :$raw = False ) {
    propReturnObject(
      clutter_value_get_paint_node(self.GValue),
      $raw,
      |Mutter::Clutter::PaintNode.getTypePair
    );
  }

  method set_paint_node (MutterClutterPaintNode() $node) {
    clutter_value_set_paint_node(self.GValue, $node);
  }

  method take_paint_node (MutterClutterPaintNode() $node) {
    clutter_value_take_paint_node(self.GValue, $node);
  }

}
