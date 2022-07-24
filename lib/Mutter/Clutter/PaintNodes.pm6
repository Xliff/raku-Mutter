use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::PaintNodes;

use Mutter::Clutter::PaintNode;

use GLib::Roles::Implementor;

our subset MutterClutterActorNodeAncestry is export of Mu
  where MutterClutterActorNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Actor is Mutter::Clutter::Paint::Node {
  has MutterClutterActorNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterActorNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterActorNode (
    MutterClutterActorNodeAncestry $_
  ) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterActorNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterActorNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterActorNode
  { $!mcspn }

  multi method new (
    MutterClutterActorNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterClutterActor() $actor, Int() $opacity) {
    my gint $o = $opacity;

    my $mutter-clutter-spec-node = clutter_actor_node_new($actor, $o);

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_actor_node_get_type, $n, $t );
  }
}


our subset MutterClutterBlitNodeAncestry is export of Mu
  where MutterClutterBlitNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Blit is Mutter::Clutter::Paint::Node {
  has MutterClutterBlitNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterBlitNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterBlitNode (
    MutterClutterBlitNodeAncestry $_
  ) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterBlitNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterBlitNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterBlitNode
  { $!mcspn }

  multi method new (
    MutterClutterBlitNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterCoglFramebuffer $src) {
    my $mutter-clutter-spec-node = clutter_blit_node_new($src);

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method add_blit_rectangle (
    Int() $src_x,
    Int() $src_y,
    Int() $dst_x,
    Int() $dst_y,
    Int() $width,
    Int() $height
  ) {
    my gint ($sx, $sy, $dx, $dy, $w, $h) =
      ($src_x, $src_y, $dst_x, $dst_y, $width, $height);

    clutter_blit_node_add_blit_rectangle($!mcspn, $sx, $sy, $dx, $dy, $w, $h);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_blit_node_get_type, $n, $t );
  }

}


our subset MutterClutterBlurNodeAncestry is export of Mu
  where MutterClutterBlurNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Blur is Mutter::Clutter::Paint::Node {
  has MutterClutterBlurNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterBlurNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterBlurNode (
    MutterClutterBlurNodeAncestry $_
  ) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterBlurNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterBlurNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterBlurNode
  { $!mcspn }

  multi method new (
    MutterClutterBlurNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new (Int() $width, Int() $height, Num() $sigma) {
    my gint   ($w, $h) = ($width, $height);
    my gfloat  $s      = $sigma;

    my $mutter-clutter-spec-node = clutter_blur_node_new($w, $h, $s);

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_blur_node_get_type, $n, $t );
  }

}


our subset MutterClutterClipNodeAncestry is export of Mu
  where MutterClutterClipNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Clip is Mutter::Clutter::Paint::Node {
  has MutterClutterClipNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterClipNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterClipNode (
    MutterClutterClipNodeAncestry $_
  ) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterClipNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterClipNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterClipNode
  { $!mcspn }

  multi method new (
    MutterClutterClipNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-spec-node = clutter_clip_node_new();

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_clip_node_get_type, $n, $t );
  }

}


our subset MutterClutterColorNodeAncestry is export of Mu
  where MutterClutterColorNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Color is Mutter::Clutter::Paint::Node {
  has MutterClutterColorNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterColorNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterColorNode (
    MutterClutterColorNodeAncestry $_
  ) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterColorNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterColorNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterColorNode
  { $!mcspn }

  multi method new (
    MutterClutterColorNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterClutterColor() $color) {
    my $mutter-clutter-spec-node = clutter_color_node_new($color);

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_color_node_get_type, $n, $t );
  }

}


our subset MutterClutterLayerNodeAncestry is export of Mu
  where MutterClutterLayerNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Layer is Mutter::Clutter::Paint::Node {
  has MutterClutterLayerNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterLayerNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterLayerNode (
    MutterClutterLayerNodeAncestry $_
  ) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterLayerNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterLayerNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterLayerNode
  { $!mcspn }

  multi method new (
    MutterClutterLayerNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    graphene_matrix_t() $projection,
    cairo_rectangle_t() $viewport,
    Num()               $width,
    Num()               $height,
    Int()               $opacity
  ) {
    my gfloat ($w, $h) = ($width, $height);
    my guint8  $o      =  $opacity;

    my $mutter-clutter-spec-node = clutter_layer_node_new(
      $projection,
      $viewport,
      $w,
      $h,
      $o
    );

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method new_to_framebuffer (
    MutterCoglFramebuffer() $framebuffer,
    MutterCoglPipeline()    $pipeline
  ) {
    my $mutter-clutter-spec-node = clutter_layer_node_new_to_framebuffer(
      $framebuffer,
      $pipeline
    );

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_layer_node_get_type, $n, $t );
  }

}


our subset MutterClutterPipelineNodeAncestry is export of Mu
  where MutterClutterPipelineNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Pipeline is Mutter::Clutter::Paint::Node {
  has MutterClutterPipelineNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterPipelineNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterPipelineNode (
    MutterClutterPipelineNodeAncestry $_
  ) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterPipelineNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterPipelineNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterPipelineNode
  { $!mcspn }

  multi method new (
    MutterClutterPipelineNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterCoglPipeline() $pipeline) {
    my $mutter-clutter-spec-node = clutter_pipeline_node_new($pipeline);

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_pipeline_node_get_type, $n, $t );
  }

}


our subset MutterClutterRootNodeAncestry is export of Mu
  where MutterClutterRootNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Root is Mutter::Clutter::Paint::Node {
  has MutterClutterRootNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterRootNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterRootNode (
    MutterClutterRootNodeAncestry $_
  ) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterRootNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterRootNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterRootNode
  { $!mcspn }

  multi method new (
    MutterClutterRootNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    MutterCoglFramebuffer() $framebuffer,
    MutterClutterColor()    $clear_color,
    Int()                   $clear_flags
  ) {
    my MutterCoglBufferBit $c = $clear_flags;

    my $mutter-clutter-spec-node = clutter_root_node_new(
      $framebuffer,
      $clear_color,
      $c
    );

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_root_node_get_type, $n, $t );
  }

}


our subset MutterClutterTextNodeAncestry is export of Mu
  where MutterClutterTextNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Text is Mutter::Clutter::Paint::Node {
  has MutterClutterTextNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterTextNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterTextNode (MutterClutterTextNodeAncestry $_) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterTextNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterTextNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterTextNode
  { $!mcspn }

  multi method new (
    MutterClutterTextNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new (PangoLayout() $layout, MutterClutterColor() $color) {
    my $mutter-clutter-spec-node = clutter_text_node_new($layout, $color);

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_text_node_get_type, $n, $t );
  }

}


our subset MutterClutterTextureNodeAncestry is export of Mu
  where MutterClutterTextureNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Texture is Mutter::Clutter::Paint::Node {
  has MutterClutterTextureNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterTextureNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterTextureNode (
    MutterClutterTextureNodeAncestry $_
  ) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterTextureNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterTextureNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterTextureNode
  { $!mcspn }

  multi method new (
    MutterClutterTextureNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    MutterCoglTexture()  $texture,
    MutterClutterColor() $color,
    Int()                $min_filter,
    Int()                $mag_filter
  ) {
    my MutterClutterScalingFilter ($mn, $mg) = ($min_filter, $mag_filter);

    my $mutter-clutter-spec-node = clutter_texture_node_new(
      $texture,
      $color,
      $mn,
      $mg
    );

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }


  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_texture_node_get_type, $n, $t );
  }

}


our subset MutterClutterTransformNodeAncestry is export of Mu
  where MutterClutterTransformNode | MutterClutterPaintNode;

class Mutter::Clutter::Paint::Node::Transform is Mutter::Clutter::Paint::Node {
  has MutterClutterTransformNode $!mcspn is implementor;

  submethod BUILD ( :$mutter-clutter-spec-node ) {
    self.setMutterClutterTransformNode($mutter-clutter-spec-node)
      if $mutter-clutter-spec-node;
  }

  method setMutterClutterTransformNode (
    MutterClutterTransformNodeAncestry $_
  ) {
    my $to-parent;

    $!mcspn = do {
      when MutterClutterTransformNode {
        $to-parent = cast(MutterClutterPaintNode, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterTransformNode, $_);
      }
    }
    self.setMutterClutterPaintNode($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterClutterTransformNode
  { $!mcspn }

  multi method new (
    MutterClutterTransformNodeAncestry  $mutter-clutter-spec-node,
                                            :$ref                       = True
  ) {
    return unless $mutter-clutter-spec-node;

    my $o = self.bless( :$mutter-clutter-spec-node );
    $o.ref if $ref;
    $o;
  }
  multi method new (graphene_matrix_t() $projection) {
    my $mutter-clutter-spec-node = clutter_transform_node_new($projection);

    $mutter-clutter-spec-node ?? self.bless( :$mutter-clutter-spec-node )
                              !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_transform_node_get_type, $n, $t );
  }

}
