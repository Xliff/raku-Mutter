use v6.c;

use Mutter::Raw::Types;
use Graphene::Raw::Matrix;
use Mutter::Raw::Clutter::PickContext;

# BOXED`

class Mutter::Clutter::PickContext {
  has MutterClutterPickContext $!mcpc is implementor;

  submethod BUILD ( :$mutter-clutter-pick-context ) {
    $!mcpc = $mutter-clutter-pick-context;
  }

  method new (MutterClutterPickContext $mutter-clutter-pick-context) {
    $mutter-clutter-pick-context ?? self.bless( :$mutter-clutter-pick-context )
                                 !! Nil;
  }

  method destroy {
    clutter_pick_context_destroy($!mcpc);
  }

  method get_mode {
    MutterClutterPickModeEnum( clutter_pick_context_get_mode($!mcpc) )
  }

  proto method get_transform (|)
  { * }

  multi method get_transform ( :$raw = False ) {
    my $m = graphene_matrix_alloc;

    samewith($m);
  }
  multi method get_transform (graphene_matrix_t() $out_matrix, :$raw = False) {
    clutter_pick_context_get_transform($!mcpc, $out_matrix);
    propReturnObject( $out_matrix, $raw, |Graphene::Matrix.getTypePair );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_pick_context_get_type, $n, $t );
  }

  method log_overlap (MutterClutterActor() $actor) {
    clutter_pick_context_log_overlap($!mcpc, $actor);
  }

  method log_pick (MutterClutterActorBox() $box, MutterClutterActor() $actor) {
    clutter_pick_context_log_pick($!mcpc, $box, $actor);
  }

  method pop_clip {
    clutter_pick_context_pop_clip($!mcpc);
  }

  method pop_transform {
    clutter_pick_context_pop_transform($!mcpc);
  }

  method push_clip (MutterClutterActorBox() $box) {
    clutter_pick_context_push_clip($!mcpc, $box);
  }

  method push_transform (graphene_matrix_t() $transform) {
    clutter_pick_context_push_transform($!mcpc, $transform);
  }

  method ref {
    clutter_pick_context_ref($!mcpc);
    self
  }

  method unref {
    clutter_pick_context_unref($!mcpc);
  }

}
