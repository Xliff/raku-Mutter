use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ATK::Raw::Structs;
use GIO::Raw::Definitions;
use Pango::Raw::Definitions;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Clutter::Actor;

### /usr/src/mutter-42.1/clutter/clutter/clutter-actor.h

sub clutter_actor_add_child (
  MutterClutterActor $self,
  MutterClutterActor $child
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_add_transition (
  MutterClutterActor      $self,
  Str                     $name,
  MutterClutterTransition $transition
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_allocate (
  MutterClutterActor    $self,
  MutterClutterActorBox $box
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_allocate_align_fill (
  MutterClutterActor    $self,
  MutterClutterActorBox $box,
  gdouble               $x_align,
  gdouble               $y_align,
  gboolean              $x_fill,
  gboolean              $y_fill
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_allocate_available_size (
  MutterClutterActor $self,
  gfloat             $x,
  gfloat             $y,
  gfloat             $available_width,
  gfloat             $available_height
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_allocate_preferred_size (
  MutterClutterActor $self,
  gfloat             $x,
  gfloat             $y
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_apply_relative_transform_to_point (
  MutterClutterActor       $self,
  MutterClutterActor       $ancestor,
  graphene_point3d_t       $point,
  graphene_point3d_t       $vertex
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_apply_transform_to_point (
  MutterClutterActor $self,
  graphene_point3d_t $point,
  graphene_point3d_t $vertex
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_bind_model (
  MutterClutterActor $self,
  GListModel         $model,
                     &create_child_func (
                       gpointer,
                       gpointer
                       --> MutterClutterActor
                     ), #= MutterClutterActorCreateChildFunc
  gpointer           $user_data,
                     &notify (gpointer)
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_bind_model_with_properties (
  MutterClutterActor $self,
  GListModel         $model,
  GType              $child_type,
  Str                $first_model_property
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_contains (
  MutterClutterActor $self,
  MutterClutterActor $descendant
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_continue_paint (
  MutterClutterActor        $self,
  MutterClutterPaintContext $paint_context
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_continue_pick (
  MutterClutterActor       $actor,
  MutterClutterPickContext $pick_context
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_create_pango_context (MutterClutterActor $self)
  returns PangoContext
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_create_pango_layout (MutterClutterActor $self, Str $text)
  returns PangoLayout
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_destroy (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_destroy_all_children (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_event (
  MutterClutterActor $actor,
  MutterClutterEvent $event,
  gboolean           $capture
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_abs_allocation_vertices (
  MutterClutterActor $self,
  graphene_point3d_t $verts
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_accessible (MutterClutterActor $self)
  returns AtkObject
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_allocation_box (
  MutterClutterActor    $self,
  MutterClutterActorBox $box
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_background_color (
  MutterClutterActor $self,
  MutterClutterColor $color
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_child_at_index (MutterClutterActor $self, gint $index)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_child_transform (
  MutterClutterActor $self,
  graphene_matrix_t  $transform
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_children (MutterClutterActor $self)
  returns GList
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_clip (
  MutterClutterActor $self,
  gfloat             $xoff   is rw,
  gfloat             $yoff   is rw,
  gfloat             $width  is rw,
  gfloat             $height is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_clip_to_allocation (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_content (MutterClutterActor $self)
  returns MutterClutterContent
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_content_box (
  MutterClutterActor    $self,
  MutterClutterActorBox $box
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_content_gravity (MutterClutterActor $self)
  returns MutterClutterContentGravity
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_content_repeat (MutterClutterActor $self)
  returns MutterClutterContentRepeat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_content_scaling_filters (
  MutterClutterActor         $self,
  MutterClutterScalingFilter $min_filter,
  MutterClutterScalingFilter $mag_filter
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_default_paint_volume (MutterClutterActor $self)
  returns MutterClutterPaintVolume
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_easing_delay (MutterClutterActor $self)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_easing_duration (MutterClutterActor $self)
  returns guint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_easing_mode (MutterClutterActor $self)
  returns MutterClutterAnimationMode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_first_child (MutterClutterActor $self)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_fixed_position (
  MutterClutterActor $self,
  gfloat             $x     is rw,
  gfloat             $y     is rw
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_fixed_position_set (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_flags (MutterClutterActor $self)
  returns MutterClutterActorFlags
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_height (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_last_child (MutterClutterActor $self)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_layout_manager (MutterClutterActor $self)
  returns MutterClutterLayoutManager
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_margin (
  MutterClutterActor  $self,
  MutterClutterMargin $margin
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_margin_bottom (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_margin_left (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_margin_right (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_margin_top (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_n_children (MutterClutterActor $self)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_name (MutterClutterActor $self)
  returns Str
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_next_sibling (MutterClutterActor $self)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_offscreen_redirect (MutterClutterActor $self)
  returns MutterClutterOffscreenRedirect
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_opacity (MutterClutterActor $self)
  returns guint8
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_opacity_override (MutterClutterActor $self)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_paint_box (
  MutterClutterActor    $self,
  MutterClutterActorBox $box
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_paint_opacity (MutterClutterActor $self)
  returns guint8
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_paint_visibility (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_paint_volume (MutterClutterActor $self)
  returns MutterClutterPaintVolume
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_pango_context (MutterClutterActor $self)
  returns PangoContext
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_parent (MutterClutterActor $self)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_pivot_point (
  MutterClutterActor $self,
  gfloat             $pivot_x is rw,
  gfloat             $pivot_y is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_pivot_point_z (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_position (
  MutterClutterActor $self,
  gfloat             $x     is rw,
  gfloat             $y     is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_preferred_height (
  MutterClutterActor $self,
  gfloat             $for_width,
  gfloat             $min_height_p     is rw,
  gfloat             $natural_height_p is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_preferred_size (
  MutterClutterActor $self,
  gfloat             $min_width_p      is rw,
  gfloat             $min_height_p     is rw,
  gfloat             $natural_width_p  is rw,
  gfloat             $natural_height_p is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_preferred_width (
  MutterClutterActor $self,
  gfloat             $for_height,
  gfloat             $min_width_p     is rw,
  gfloat             $natural_width_p is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_previous_sibling (MutterClutterActor $self)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_reactive (MutterClutterActor $actor)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_request_mode (MutterClutterActor $self)
  returns MutterClutterRequestMode
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_resource_scale (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_rotation_angle (
  MutterClutterActor      $self,
  MutterClutterRotateAxis $axis
)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_scale (
  MutterClutterActor $self,
  gdouble            $scale_x is rw,
  gdouble            $scale_y is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_scale_z (MutterClutterActor $self)
  returns gdouble
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_size (
  MutterClutterActor $self,
  gfloat             $width  is rw,
  gfloat             $height is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_stage (MutterClutterActor $actor)
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_text_direction (MutterClutterActor $self)
  returns MutterClutterTextDirection
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_transform (
  MutterClutterActor $self,
  graphene_matrix_t  $transform
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_transformed_extents (
  MutterClutterActor $self,
  graphene_rect_t    $rect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_transformed_paint_volume (
  MutterClutterActor $self,
  MutterClutterActor $relative_to_ancestor
)
  returns MutterClutterPaintVolume
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_transformed_position (
  MutterClutterActor $self,
  gfloat             $x     is rw,
  gfloat             $y     is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_transformed_size (
  MutterClutterActor $self,
  gfloat             $width  is rw,
  gfloat             $height is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_transition (MutterClutterActor $self, Str $name)
  returns MutterClutterTransition
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_translation (
  MutterClutterActor $self,
  gfloat             $translate_x is rw,
  gfloat             $translate_y is rw,
  gfloat             $translate_z is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_width (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_x (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_x_align (MutterClutterActor $self)
  returns MutterClutterActorAlign
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_x_expand (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_y (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_y_align (MutterClutterActor $self)
  returns MutterClutterActorAlign
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_y_expand (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_z_position (MutterClutterActor $self)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_grab_key_focus (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_has_accessible (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_has_allocation (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_has_clip (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_has_key_focus (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_has_mapped_clones (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_has_overlaps (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_has_pointer (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_hide (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_inhibit_culling (MutterClutterActor $actor)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_insert_child_above (
  MutterClutterActor $self,
  MutterClutterActor $child,
  MutterClutterActor $sibling
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_insert_child_at_index (
  MutterClutterActor $self,
  MutterClutterActor $child,
  gint               $index
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_insert_child_below (
  MutterClutterActor $self,
  MutterClutterActor $child,
  MutterClutterActor $sibling
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_invalidate_paint_volume (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_invalidate_transform (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_is_in_clone_paint (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_is_mapped (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_is_realized (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_is_rotated (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_is_scaled (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_is_visible (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_iter_destroy (MutterClutterActorIter $iter)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_iter_init (
  MutterClutterActorIter $iter,
  MutterClutterActor     $root
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_iter_is_valid (MutterClutterActorIter $iter)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_iter_next (
  MutterClutterActorIter     $iter,
  CArray[MutterClutterActor] $child
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_iter_prev (
  MutterClutterActorIter     $iter,
  CArray[MutterClutterActor] $child
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_iter_remove (MutterClutterActorIter $iter)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_map (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_move_by (MutterClutterActor $self, gfloat $dx, gfloat $dy)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_needs_expand (
  MutterClutterActor       $self,
  MutterClutterOrientation $orientation
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_new ()
  returns MutterClutterActor
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_paint (
  MutterClutterActor        $self,
  MutterClutterPaintContext $paint_context
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_peek_stage_views (MutterClutterActor $self)
  returns GList
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_pick (
  MutterClutterActor       $actor,
  MutterClutterPickContext $pick_context
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_pick_box (
  MutterClutterActor       $self,
  MutterClutterPickContext $pick_context,
  MutterClutterActorBox    $box
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_queue_redraw (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_queue_redraw_with_clip (
  MutterClutterActor    $self,
  cairo_rectangle_int_t $clip
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_queue_relayout (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_realize (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_all_children (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_all_transitions (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_child (
  MutterClutterActor $self,
  MutterClutterActor $child
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_clip (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_transition (MutterClutterActor $self, Str $name)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_replace_child (
  MutterClutterActor $self,
  MutterClutterActor $old_child,
  MutterClutterActor $new_child
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_restore_easing_state (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_save_easing_state (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_allocation (
  MutterClutterActor    $self,
  MutterClutterActorBox $box
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_background_color (
  MutterClutterActor $self,
  MutterClutterColor $color
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_child_above_sibling (
  MutterClutterActor $self,
  MutterClutterActor $child,
  MutterClutterActor $sibling
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_child_at_index (
  MutterClutterActor $self,
  MutterClutterActor $child,
  gint               $index
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_child_below_sibling (
  MutterClutterActor $self,
  MutterClutterActor $child,
  MutterClutterActor $sibling
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_child_transform (
  MutterClutterActor $self,
  graphene_matrix_t  $transform
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_clip (
  MutterClutterActor $self,
  gfloat             $xoff,
  gfloat             $yoff,
  gfloat             $width,
  gfloat             $height
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_clip_to_allocation (
  MutterClutterActor $self,
  gboolean           $clip_set
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_content (
  MutterClutterActor   $self,
  MutterClutterContent $content
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_content_gravity (
  MutterClutterActor          $self,
  MutterClutterContentGravity $gravity
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_content_repeat (
  MutterClutterActor         $self,
  MutterClutterContentRepeat $repeat
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_content_scaling_filters (
  MutterClutterActor         $self,
  MutterClutterScalingFilter $min_filter,
  MutterClutterScalingFilter $mag_filter
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_easing_delay (MutterClutterActor $self, guint $msecs)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_easing_duration (MutterClutterActor $self, guint $msecs)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_easing_mode (
  MutterClutterActor         $self,
  MutterClutterAnimationMode $mode
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_fixed_position_set (
  MutterClutterActor $self,
  gboolean           $is_set
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_flags (
  MutterClutterActor      $self,
  MutterClutterActorFlags $flags
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_height (MutterClutterActor $self, gfloat $height)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_layout_manager (
  MutterClutterActor         $self,
  MutterClutterLayoutManager $manager
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_margin (
  MutterClutterActor  $self,
  MutterClutterMargin $margin
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_margin_bottom (MutterClutterActor $self, gfloat $margin)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_margin_left (MutterClutterActor $self, gfloat $margin)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_margin_right (MutterClutterActor $self, gfloat $margin)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_margin_top (MutterClutterActor $self, gfloat $margin)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_name (MutterClutterActor $self, Str $name)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_offscreen_redirect (
  MutterClutterActor             $self,
  MutterClutterOffscreenRedirect $redirect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_opacity (MutterClutterActor $self, guint8 $opacity)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_opacity_override (
  MutterClutterActor $self,
  gint               $opacity
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_pivot_point (
  MutterClutterActor $self,
  gfloat             $pivot_x,
  gfloat             $pivot_y
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_pivot_point_z (
  MutterClutterActor $self,
  gfloat             $pivot_z
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_position (
  MutterClutterActor $self,
  gfloat             $x,
  gfloat             $y
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_reactive (MutterClutterActor $actor, gboolean $reactive)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_request_mode (
  MutterClutterActor       $self,
  MutterClutterRequestMode $mode
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_rotation_angle (
  MutterClutterActor      $self,
  MutterClutterRotateAxis $axis,
  gdouble                 $angle
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_scale (
  MutterClutterActor $self,
  gdouble            $scale_x,
  gdouble            $scale_y
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_scale_z (MutterClutterActor $self, gdouble $scale_z)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_size (
  MutterClutterActor $self,
  gfloat             $width,
  gfloat             $height
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_text_direction (
  MutterClutterActor         $self,
  MutterClutterTextDirection $text_dir
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_transform (
  MutterClutterActor $self,
  graphene_matrix_t  $transform
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_translation (
  MutterClutterActor $self,
  gfloat             $translate_x,
  gfloat             $translate_y,
  gfloat             $translate_z
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_width (MutterClutterActor $self, gfloat $width)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_x (MutterClutterActor $self, gfloat $x)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_x_align (
  MutterClutterActor      $self,
  MutterClutterActorAlign $x_align
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_x_expand (MutterClutterActor $self, gboolean $expand)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_y (MutterClutterActor $self, gfloat $y)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_y_align (
  MutterClutterActor      $self,
  MutterClutterActorAlign $y_align
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_y_expand (MutterClutterActor $self, gboolean $expand)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_set_z_position (MutterClutterActor $self, gfloat $z_position)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_should_pick (
  MutterClutterActor       $self,
  MutterClutterPickContext $pick_context
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_show (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_transform_stage_point (
  MutterClutterActor $self,
  gfloat             $x,
  gfloat             $y,
  gfloat             $x_out is rw,
  gfloat             $y_out is rw
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_uninhibit_culling (MutterClutterActor $actor)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_unmap (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_unrealize (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_unset_flags (
  MutterClutterActor      $self,
  MutterClutterActorFlags $flags
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_type
  returns GType
  is native(mutter-clutter)
  is export
{ * }

### /usr/src/mutter-42.1/clutter/clutter/clutter-action.h

sub clutter_actor_add_action (
  MutterClutterActor  $self,
  MutterClutterAction $action
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_add_action_full (
  MutterClutterActor      $self,
  Str                     $name,
  MutterClutterEventPhase $phase,
  MutterClutterAction     $action
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_add_action_with_name (
  MutterClutterActor  $self,
  Str                 $name,
  MutterClutterAction $action
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_clear_actions (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_action_get_phase (MutterClutterAction $action)
  returns MutterClutterEventPhase
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_action (MutterClutterActor $self, Str $name)
  returns MutterClutterAction
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_actions (MutterClutterActor $self)
  returns GList
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_has_actions (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_action (
  MutterClutterActor  $self,
  MutterClutterAction $action
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_action_by_name (MutterClutterActor $self, Str $name)
  is native(mutter-clutter)
  is export
{ * }

### /usr/src/mutter-42.1/clutter/clutter/clutter-constraint.h

sub clutter_actor_add_constraint (
  MutterClutterActor      $self,
  MutterClutterConstraint $constraint
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_add_constraint_with_name (
  MutterClutterActor      $self,
  Str                     $name,
  MutterClutterConstraint $constraint
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_clear_constraints (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_constraint (MutterClutterActor $self, Str $name)
  returns MutterClutterConstraint
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_constraints (MutterClutterActor $self)
  returns GList
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_has_constraints (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_constraint (
  MutterClutterActor      $self,
  MutterClutterConstraint $constraint
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_constraint_by_name (
  MutterClutterActor $self,
  Str                $name
)
  is native(mutter-clutter)
  is export
{ * }


### /usr/src/mutter-42.1/clutter/clutter/clutter-effect.h

sub clutter_actor_add_effect (
  MutterClutterActor  $self,
  MutterClutterEffect $effect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_add_effect_with_name (
  MutterClutterActor  $self,
  Str                 $name,
  MutterClutterEffect $effect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_clear_effects (MutterClutterActor $self)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_effect_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub clutter_effect_queue_repaint (MutterClutterEffect $effect)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_effect (MutterClutterActor $self, Str $name)
  returns MutterClutterEffect
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_get_effects (MutterClutterActor $self)
  returns GList
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_has_effects (MutterClutterActor $self)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_effect (
  MutterClutterActor  $self,
  MutterClutterEffect $effect
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_actor_remove_effect_by_name (MutterClutterActor $self, Str $name)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_constraint_update_preferred_size (
  MutterClutterConstraint  $constraint,
  MutterClutterActor       $actor,
  MutterClutterOrientation $direction,
  gfloat                   $for_size,
  gfloat                   $minimum_size is rw,
  gfloat                   $natural_size is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub clutter_constraint_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }
