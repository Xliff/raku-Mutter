use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Graphene::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;
use Mutter::Raw::Structs;

unit package Mutter::Raw::COGL::Framebuffer;

### /usr/src/mutter-42.1/cogl/cogl/cogl-framebuffer.h

sub cogl_framebuffer_allocate (
  MutterCoglFramebuffer   $framebuffer,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_clear (
  MutterCoglFramebuffer $framebuffer,
  gulong                $buffers,
  MutterCoglColor       $color
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_clear4f (
  MutterCoglFramebuffer $framebuffer,
  gulong                $buffers,
  gfloat                $red,
  gfloat                $green,
  gfloat                $blue,
  gfloat                $alpha
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_blit_framebuffer (
  MutterCoglFramebuffer   $framebuffer,
  MutterCoglFramebuffer   $dst,
  gint                    $src_x,
  gint                    $src_y,
  gint                    $dst_x,
  gint                    $dst_y,
  gint                    $width,
  gint                    $height,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_is_framebuffer (MutterCoglFramebuffer $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_create_timestamp_query (
  MutterCoglFramebuffer $framebuffer
)
  returns MutterCoglTimestampQuery
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_discard_buffers (MutterCoglFramebuffer $framebuffer)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_draw_multitextured_rectangle (
  MutterCoglFramebuffer $framebuffer,
  MutterCoglPipeline    $pipeline,
  gfloat                $x_1,
  gfloat                $y_1,
  gfloat                $x_2,
  gfloat                $y_2,
  CArray[gfloat]        $tex_coords,
  gint                  $tex_coords_len
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_draw_rectangle (
  MutterCoglFramebuffer $framebuffer,
  MutterCoglPipeline    $pipeline,
  gfloat                $x_1,
  gfloat                $y_1,
  gfloat                $x_2,
  gfloat                $y_2
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_draw_rectangles (
  MutterCoglFramebuffer $framebuffer,
  MutterCoglPipeline    $pipeline,
  CArray[gfloat]        $coordinates,
  gint                  $n_rectangles
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_draw_textured_rectangle (
  MutterCoglFramebuffer $framebuffer,
  MutterCoglPipeline    $pipeline,
  gfloat                $x_1,
  gfloat                $y_1,
  gfloat                $x_2,
  gfloat                $y_2,
  gfloat                $s_1,
  gfloat                $t_1,
  gfloat                $s_2,
  gfloat                $t_2
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_draw_textured_rectangles (
  MutterCoglFramebuffer $framebuffer,
  MutterCoglPipeline    $pipeline,
  CArray[gfloat]        $coordinates,
  gint                  $n_rectangles
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_error_quark ()
  returns uint32_t
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_finish (MutterCoglFramebuffer $framebuffer)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_flush (MutterCoglFramebuffer $framebuffer)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_frustum (
  MutterCoglFramebuffer $framebuffer,
  gfloat                $left,
  gfloat                $right,
  gfloat                $bottom,
  gfloat                $top,
  gfloat                $z_near,
  gfloat                $z_far
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_alpha_bits (MutterCoglFramebuffer $framebuffer)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_blue_bits (MutterCoglFramebuffer $framebuffer)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_context (MutterCoglFramebuffer $framebuffer)
  returns MutterCoglContext
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_depth_bits (MutterCoglFramebuffer $framebuffer)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_depth_write_enabled (
  MutterCoglFramebuffer $framebuffer
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_dither_enabled (MutterCoglFramebuffer $framebuffer)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_green_bits (MutterCoglFramebuffer $framebuffer)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_height (MutterCoglFramebuffer $framebuffer)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_is_stereo (MutterCoglFramebuffer $framebuffer)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_modelview_matrix (
  MutterCoglFramebuffer $framebuffer,
  graphene_matrix_t     $matrix
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_projection_matrix (
  MutterCoglFramebuffer $framebuffer,
  graphene_matrix_t     $matrix
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_red_bits (MutterCoglFramebuffer $framebuffer)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_samples_per_pixel (
  MutterCoglFramebuffer $framebuffer
)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_stereo_mode (MutterCoglFramebuffer $framebuffer)
  returns MutterCoglStereoMode
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_viewport4fv (
  MutterCoglFramebuffer $framebuffer,
  CArray[gfloat]        $viewport
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_viewport_height (MutterCoglFramebuffer $framebuffer)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_viewport_width (MutterCoglFramebuffer $framebuffer)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_viewport_x (MutterCoglFramebuffer $framebuffer)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_viewport_y (MutterCoglFramebuffer $framebuffer)
  returns gfloat
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_get_width (MutterCoglFramebuffer $framebuffer)
  returns gint
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_identity_matrix (MutterCoglFramebuffer $framebuffer)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_orthographic (
  MutterCoglFramebuffer $framebuffer,
  gfloat                $x_1,
  gfloat                $y_1,
  gfloat                $x_2,
  gfloat                $y_2,
  gfloat                $near,
  gfloat                $far
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_perspective (
  MutterCoglFramebuffer $framebuffer,
  gfloat                $fov_y,
  gfloat                $aspect,
  gfloat                $z_near,
  gfloat                $z_far
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_pop_clip (MutterCoglFramebuffer $framebuffer)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_pop_matrix (MutterCoglFramebuffer $framebuffer)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_push_matrix (MutterCoglFramebuffer $framebuffer)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_push_primitive_clip (
  MutterCoglFramebuffer $framebuffer,
  MutterCoglPrimitive   $primitive,
  gfloat                $bounds_x1,
  gfloat                $bounds_y1,
  gfloat                $bounds_x2,
  gfloat                $bounds_y2
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_push_rectangle_clip (
  MutterCoglFramebuffer $framebuffer,
  gfloat                $x_1,
  gfloat                $y_1,
  gfloat                $x_2,
  gfloat                $y_2
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_push_region_clip (
  MutterCoglFramebuffer $framebuffer,
  cairo_region_t        $region
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_push_scissor_clip (
  MutterCoglFramebuffer $framebuffer,
  gint                  $x,
  gint                  $y,
  gint                  $width,
  gint                  $height
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_read_pixels (
  MutterCoglFramebuffer $framebuffer,
  gint                  $x,
  gint                  $y,
  gint                  $width,
  gint                  $height,
  MutterCoglPixelFormat $format,
  CArray[uint8_t]       $pixels
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_read_pixels_into_bitmap (
  MutterCoglFramebuffer    $framebuffer,
  gint                      $x,
  gint                      $y,
  MutterCoglReadPixelsFlags $source,
  MutterCoglBitmap          $bitmap
)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_resolve_samples (MutterCoglFramebuffer $framebuffer)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_resolve_samples_region (
  MutterCoglFramebuffer $framebuffer,
  gint                  $x,
  gint                  $y,
  gint                  $width,
  gint                  $height
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_rotate (
  MutterCoglFramebuffer $framebuffer,
  gfloat                $angle,
  gfloat                $x,
  gfloat                $y,
  gfloat                $z
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_rotate_euler (
  MutterCoglFramebuffer $framebuffer,
  graphene_euler_t      $euler
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_scale (
  MutterCoglFramebuffer $framebuffer,
  gfloat                $x,
  gfloat                $y,
  gfloat                $z
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_set_depth_write_enabled (
  MutterCoglFramebuffer $framebuffer,
  gboolean              $depth_write_enabled
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_set_dither_enabled (
  MutterCoglFramebuffer $framebuffer,
  gboolean              $dither_enabled
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_set_modelview_matrix (
  MutterCoglFramebuffer $framebuffer,
  graphene_matrix_t     $matrix
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_set_projection_matrix (
  MutterCoglFramebuffer $framebuffer,
  graphene_matrix_t     $matrix
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_set_samples_per_pixel (
  MutterCoglFramebuffer $framebuffer,
  gint                  $samples_per_pixel
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_set_stereo_mode (
  MutterCoglFramebuffer $framebuffer,
  MutterCoglStereoMode  $stereo_mode
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_set_viewport (
  MutterCoglFramebuffer $framebuffer,
  gfloat                $x,
  gfloat                $y,
  gfloat                $width,
  gfloat                $height
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_transform (
  MutterCoglFramebuffer $framebuffer,
  graphene_matrix_t     $matrix
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_framebuffer_translate (
  MutterCoglFramebuffer $framebuffer,
  gfloat                $x,
  gfloat                $y,
  gfloat                $z
)
  is native(mutter-clutter)
  is export
{ * }
