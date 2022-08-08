use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::COGL::Framebuffer;

use Mutter::COGL::Object;

use GLib::Roles::Implementor;

our subset MutterCoglFramebufferAncestry is export of Mu
  where MutterCoglFramebuffer | MutterCoglObjectAncestry;

class Mutter::COGL::Framebuffer is Mutter::COGL::Object {
  has MutterCoglFramebuffer $!mcf is implementor;

  submethod BUILD ( :$mutter-cogl-framebuffer ) {
    self.setMutterCoglFramebuffer($mutter-cogl-framebuffer)
      if $mutter-cogl-framebuffer
  }

  method setMutterCoglFramebuffer (MutterCoglFramebufferAncestry $_) {
    my $to-parent;

    $!mcf = do {
      when MutterCoglFramebuffer {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglFramebuffer, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglFramebuffer
    is also<MutterCoglFramebuffer>
  { $!mcf }

  multi method new (
    MutterCoglFramebufferAncestry  $mutter-cogl-framebuffer,
                                  :$ref                      = True
  ) {
    return unless $mutter-cogl-framebuffer;

    my $o = self.bless( :$mutter-cogl-framebuffer );
    $o.ref if $ref;
    $o;
  }

  # Type: MutterCoglContext
  method context ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::COGL::Context.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('context', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::COGL::Context.getTypePair
        );
      },
      STORE => -> $, $val is copy {
        warn 'Mutter::COGL::Framebuffer.context is a construct-only property!';
      }
    );
  }

  # Type: pointer
  method driver-config is rw  is g-property is also<driver_config> {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('driver-config', $gv);
        $gv.pointer;
      },
      STORE => -> $,  $val is copy {
        $gv.pointer = $val;
        self.prop_set('driver-config', $gv);
      }
    );
  }

  # Type: int
  method width is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('width', $gv);
      }
    );
  }

  # Type: int
  method height is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('height', $gv);
      }
    );
  }

  method destroy {
    self.connect($!mcf, 'destroy');
  }

  method allocate (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $a = cogl_framebuffer_allocate($!mcf, $error);
    set_error($error);
    $a;
  }

  method clear (MutterCoglColor() $color) {
    cogl_framebuffer_clear($!mcf, $color);
  }

  method clear4f (
    Int() $buffers,
    Int() $red,
    Int() $green,
    Int() $blue,
    Int() $alpha
  ) {
    my gulong  $bf             =  $buffers;
    my gfloat ($r, $g, $b, $a) = ($red, $green, $blue, $alpha);

    cogl_framebuffer_clear4f($!mcf, $bf, $r, $g, $b, $a)
  }

  method cogl_blit_framebuffer (
    MutterCoglFramebuffer() $dst,
    Int()                   $src_x,
    Int()                   $src_y,
    Int()                   $dst_x,
    Int()                   $dst_y,
    Int()                   $width,
    Int()                   $height,
    CArray[Pointer[GError]] $error   = gerror
  )
    is also<cogl-blit-framebuffer>
  {
    my gint ($sx, $sy, $dx, $dy, $w, $h) =
      ($src_x, $src_y, $dst_x, $dst_y, $width, $height);

    clear_error;
    my $rv = so cogl_blit_framebuffer(
      $!mcf,
      $dst,
      $sx,
      $sy,
      $dx,
      $dy,
      $w,
      $h,
      $error
    );
    set_error($error);
    $rv;
  }

  method is_framebuffer is also<is-framebuffer> {
    so cogl_is_framebuffer($!mcf);
  }

  method create_timestamp_query is also<create-timestamp-query> {
    cogl_framebuffer_create_timestamp_query($!mcf);
  }

  method discard_buffers is also<discard-buffers> {
    cogl_framebuffer_discard_buffers($!mcf);
  }

  proto method draw_multitextured_rectangle (|)
    is also<draw-multitextured-rectangle>
  { * }

  multi method draw_multitextured_rectangle (
    MutterCoglPipeline() $pipeline,
    Num()                $x_1,
    Num()                $y_1,
    Num()                $x_2,
    Num()                $y_2,
                         @tex_coords
  ) {
    samewith(
      $pipeline,
      $x_1,
      $y_1,
      $x_2,
      $y_2,
      ArrayToCArray(gfloat, @tex_coords),
      @tex_coords.elems
    );
  }
  multi method draw_multitextured_rectangle (
    MutterCoglPipeline() $pipeline,
    Num()                $x_1,
    Num()                $y_1,
    Num()                $x_2,
    Num()                $y_2,
    Buf()                $tex_coords
  ) {
    samewith(
      $pipeline,
      $x_1,
      $y_1,
      $x_2,
      $y_2,
      cast( CArray[gfloat], CArray[uint8].new($tex_coords) ),
      $tex_coords.bytes / nativesizeof(gfloat)
    );
  }
  multi method draw_multitextured_rectangle (
    MutterCoglPipeline() $pipeline,
    Num()                $x_1,
    Num()                $y_1,
    Num()                $x_2,
    Num()                $y_2,
    CArray[gfloat]       $tex_coords,
    Int()                $tex_coords_len
  ) {
    my gfloat ($x1, $y1, $x2, $y2) = ($x_1, $y_1, $x_2, $y_2);

    cogl_framebuffer_draw_multitextured_rectangle(
      $!mcf,
      $pipeline,
      $x1,
      $y1,
      $x2,
      $y2,
      $tex_coords,
      $tex_coords_len
    );
  }

  method draw_rectangle (
    MutterCoglPipeline() $pipeline,
    Num()                $x_1,
    Num()                $y_1,
    Num()                $x_2,
    Num()                $y_2
  )
    is also<draw-rectangle>
  {
    my gfloat ($x1, $y1, $x2, $y2) = ($x_1, $y_1, $x_2, $y_2);

    cogl_framebuffer_draw_rectangle($!mcf, $pipeline, $x1, $y1, $x2, $y2);
  }

  proto method draw_rectangles (|)
    is also<draw-rectangles>
  { * }

  multi method draw_rectangles (
    MutterCoglPipeline() $pipeline,
                         @coordinates
  ) {
    samewith(
      $pipeline,
      ArrayToCArray(gfloat, @coordinates),
      @coordinates.elems
    );
  }
  multi method draw_rectangles (
    MutterCoglPipeline() $pipeline,
    Buf()                $coordinates,
  ) {
    samewith(
      $pipeline,
      cast( CArray[gfloat], CArray[uint8].new($coordinates) ),
      $coordinates.bytes / nativesizeof(gfloat)
    );
  }
  multi method draw_rectangles (
    MutterCoglPipeline() $pipeline,
    CArray[gfloat]       $coordinates,
    Int()                $n_rectangles
  ) {
    my gint $n = $n_rectangles;

    cogl_framebuffer_draw_rectangles($!mcf, $pipeline, $coordinates, $n);
  }

  method draw_textured_rectangle (
    MutterCoglPipeline() $pipeline,
    Num()                $x_1,
    Num()                $y_1,
    Num()                $x_2,
    Num()                $y_2,
    Num()                $s_1,
    Num()                $t_1,
    Num()                $s_2,
    Num()                $t_2
  )
    is also<draw-textured-rectangle>
  {
    my gfloat ($x1, $y1, $x2, $y2, $s1, $t1, $s2, $t2) =
      ($x_1, $y_1, $x_2, $y_2, $s_1, $t_1, $s_2, $t_2);

    cogl_framebuffer_draw_textured_rectangle(
      $!mcf,
      $pipeline,
      $x1,
      $y1,
      $x2,
      $y2,
      $s1,
      $t1,
      $s2,
      $t2
    )
  }

  proto method draw_textured_rectangles (|)
    is also<draw-textured-rectangles>
  { * }

  multi method draw_textured_rectangles (
    MutterCoglPipeline() $pipeline,
                         @coordinates
  ) {
    samewith(
      $pipeline,
      ArrayToCArray(gfloat, @coordinates),
      @coordinates.elems
    )
  }
  multi method draw_textured_rectangles (
    MutterCoglPipeline() $pipeline,
    Buf()                $coordinates
  ) {
    samewith(
      $pipeline,
      cast( CArray[gfloat], CArray[uint8].new($coordinates) ),
      $coordinates.bytes / nativesizeof(gfloat)
    )
  }
  multi method draw_textured_rectangles (
    MutterCoglPipeline() $pipeline,
    CArray[gfloat]       $coordinates,
    Int()                $n_rectangles
  ) {
    my gint $n = $n_rectangles;

    cogl_framebuffer_draw_textured_rectangles(
      $!mcf,
      $pipeline,
      $coordinates,
      $n
    );
  }

  method error_quark is also<error-quark> {
    cogl_framebuffer_error_quark();
  }

  method finish {
    cogl_framebuffer_finish($!mcf);
  }

  method flush {
    cogl_framebuffer_flush($!mcf);
  }

  method frustum (
    Num() $left,
    Num() $right,
    Num() $bottom,
    Num() $top,
    Num() $z_near,
    Num() $z_far
  ) {
    my gfloat ($l, $r, $b, $t, $zn, $zf) =
      ($left, $right, $bottom, $top, $z_near, $z_far);

    cogl_framebuffer_frustum($!mcf, $l, $r, $b, $t, $zn, $zf);
  }

  method get_alpha_bits is also<get-alpha-bits> {
    cogl_framebuffer_get_alpha_bits($!mcf);
  }

  method get_blue_bits is also<get-blue-bits> {
    cogl_framebuffer_get_blue_bits($!mcf);
  }

  method get_context ( :$raw = False ) is also<get-context> {
    propReturnObject(
      cogl_framebuffer_get_context($!mcf),
      $raw,
      |Mutter::COGL::Context.getTypePair
    )
  }

  method get_depth_bits is also<get-depth-bits> {
    cogl_framebuffer_get_depth_bits($!mcf);
  }

  method get_depth_write_enabled is also<get-depth-write-enabled> {
    so cogl_framebuffer_get_depth_write_enabled($!mcf);
  }

  method get_dither_enabled is also<get-dither-enabled> {
    so cogl_framebuffer_get_dither_enabled($!mcf);
  }

  method get_green_bits is also<get-green-bits> {
    cogl_framebuffer_get_green_bits($!mcf);
  }

  method get_height is also<get-height> {
    cogl_framebuffer_get_height($!mcf);
  }

  method get_is_stereo is also<get-is-stereo> {
    so cogl_framebuffer_get_is_stereo($!mcf);
  }

  proto method get_modelview_matrix (|)
    is also<get-modelview-matrix>
  { * }

  multi method get_modelview_matrix ( :$raw = False ) {
    propReturnObject(
      samewith(Graphene::Matrix.alloc),
      $raw,
      |Graphene::Matrix.getTypePair
    );
  }
  multi method get_modelview_matrix (graphene_matrix_t() $matrix) {
    cogl_framebuffer_get_modelview_matrix($!mcf, $matrix);
    $matrix;
  }

  proto method get_projection_matrix (|)
    is also<get-projection-matrix>
  { * }

  multi method get_projection_matrix ( :$raw = False ) {
    propReturnObject(
      samewith(Graphene::Matrix.alloc),
      $raw,
      |Graphene::Matrix.getTypePair
    );
  }
  multi method get_projection_matrix (graphene_matrix_t() $matrix) {
    cogl_framebuffer_get_projection_matrix($!mcf, $matrix);
    $matrix;
  }

  method get_red_bits is also<get-red-bits> {
    cogl_framebuffer_get_red_bits($!mcf);
  }

  method get_samples_per_pixel is also<get-samples-per-pixel> {
    cogl_framebuffer_get_samples_per_pixel($!mcf);
  }

  method get_stereo_mode is also<get-stereo-mode> {
    MutterCoglStereoModeEnum( cogl_framebuffer_get_stereo_mode($!mcf) );
  }

  proto method get_viewport4fv (|)
    is also<get-viewport4fv>
  { * }

  multi method get_viewport4fv ( $raw = False ) {
    my $ca = CArray[gfloat].allocate(4);
    samewith($ca);
    return $ca if $raw;
    CArrayToArray($ca);
  }
  multi method get_viewport4fv (CArray[gfloat] $viewport) {
    cogl_framebuffer_get_viewport4fv($!mcf, $viewport);
  }

  method get_viewport_height is also<get-viewport-height> {
    cogl_framebuffer_get_viewport_height($!mcf);
  }

  method get_viewport_width is also<get-viewport-width> {
    cogl_framebuffer_get_viewport_width($!mcf);
  }

  method get_viewport_x is also<get-viewport-x> {
    cogl_framebuffer_get_viewport_x($!mcf);
  }

  method get_viewport_y is also<get-viewport-y> {
    cogl_framebuffer_get_viewport_y($!mcf);
  }

  method get_width is also<get-width> {
    cogl_framebuffer_get_width($!mcf);
  }

  method identity_matrix is also<identity-matrix> {
    cogl_framebuffer_identity_matrix($!mcf);
  }

  method orthographic (
    Num() $x_1,
    Num() $y_1,
    Num() $x_2,
    Num() $y_2,
    Num() $near,
    Num() $far
  ) {
    my gfloat ($x1, $y1, $x2, $y2, $n, $f) =
      ($x_1, $y_1, $x_2, $y_2, $near, $far);

    cogl_framebuffer_orthographic($!mcf, $x1, $y1, $x2, $y2, $n, $f);
  }

  method perspective (
    Num() $fov_y,
    Num() $aspect,
    Num() $z_near,
    Num() $z_far
  ) {
    my gfloat ($f, $a, $zn, $zf) = ($fov_y, $aspect, $z_near, $z_far);

    cogl_framebuffer_perspective($!mcf, $fov_y, $aspect, $z_near, $z_far);
  }

  method pop_clip is also<pop-clip> {
    cogl_framebuffer_pop_clip($!mcf);
  }

  method pop_matrix is also<pop-matrix> {
    cogl_framebuffer_pop_matrix($!mcf);
  }

  method push_matrix is also<push-matrix> {
    cogl_framebuffer_push_matrix($!mcf);
  }

  method push_primitive_clip (
    MutterCoglPrimitive $primitive,
    gfloat $bounds_x1,
    gfloat $bounds_y1,
    gfloat $bounds_x2,
    gfloat $bounds_y2
  )
    is also<push-primitive-clip>
  {
    my gfloat ($x1, $y1, $x2, $y2) =
      ($bounds_x1, $bounds_y1, $bounds_x2, $bounds_y2);

    cogl_framebuffer_push_primitive_clip(
      $!mcf,
      $primitive,
      $x1,
      $y1,
      $x2,
      $y2
    );
  }

  method push_rectangle_clip (Num() $x_1, Num() $y_1, Num() $x_2, Num() $y_2)
    is also<push-rectangle-clip>
  {
    my gfloat ($x1, $y1, $x2, $y2) = ($x_1, $y_1, $x_2, $y_2);

    cogl_framebuffer_push_rectangle_clip($!mcf, $x1, $y1, $x2, $y2)
  }

  method push_region_clip (cairo_region_t() $region)
    is also<push-region-clip>
  {
    cogl_framebuffer_push_region_clip($!mcf, $region);
  }

  method push_scissor_clip (Int() $x, Int() $y, Int() $width, Int() $height)
    is also<push-scissor-clip>
  {
    my gint ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    cogl_framebuffer_push_scissor_clip($!mcf, $xx, $yy, $w, $h);
  }

  proto method read_pixels (|)
    is also<read-pixels>
  { * }

  multi method read_pixels (
    Int()           $x,
    Int()           $y,
    Int()           $width,
    Int()           $height,
    Int()           $format
  ) {
    my $ca = CArray[uint8].allocate(
      $width * $height * bppForMutterCoglFormat($format)
    );

    samewith( $x, $y, $width, $height, $format, $ca );
    Buf.new($ca);
  }
  multi method read_pixels (
    Int()           $x,
    Int()           $y,
    Int()           $width,
    Int()           $height,
    Int()           $format,
    CArray[uint8_t] $pixels,
  ) {
    my MutterCoglPixelFormat  $f                =  $format;
    my gint                  ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    cogl_framebuffer_read_pixels($!mcf, $xx, $yy, $w, $h, $f, $pixels);
  }

  method read_pixels_into_bitmap (
    Int()              $x,
    Int()              $y,
    Int()              $source,
    MutterCoglBitmap() $bitmap
  )
    is also<read-pixels-into-bitmap>
  {
    my gint                      ($xx, $yy) = ($x, $y);
    my MutterCoglReadPixelsFlags  $s        =  $source;

    cogl_framebuffer_read_pixels_into_bitmap($!mcf, $xx, $yy, $s, $bitmap);
  }

  method resolve_samples is also<resolve-samples> {
    cogl_framebuffer_resolve_samples($!mcf);
  }

  method resolve_samples_region (
    Int() $x,
    Int() $y,
    Int() $width,
    Int() $height
  )
    is also<resolve-samples-region>
  {
    my gint ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    cogl_framebuffer_resolve_samples_region($!mcf, $xx, $yy, $w, $h);
  }

  method rotate (Num() $angle, Num() $x, Num() $y, Num() $z) {
    my gfloat ($a, $xx, $yy, $zz) = ($angle, $x, $y, $z);

    cogl_framebuffer_rotate($!mcf, $a, $x, $y, $z);;
  }

  method rotate_euler (graphene_euler_t() $euler) is also<rotate-euler> {
    cogl_framebuffer_rotate_euler($!mcf, $euler);
  }

  method scale (Num() $x, Num() $y, Num() $z) {
    my gfloat ($xx, $yy, $zz) = ($x, $y, $z);

    cogl_framebuffer_scale($!mcf, $xx, $yy, $zz);
  }

  method set_depth_write_enabled (Int() $depth_write_enabled)
    is also<set-depth-write-enabled>
  {
    my gboolean $d = $depth_write_enabled.so.Int;

    cogl_framebuffer_set_depth_write_enabled($!mcf, $d);
  }

  method set_dither_enabled (Int() $dither_enabled)
    is also<set-dither-enabled>
  {
    my gboolean $d = $dither_enabled.so.Int;

    cogl_framebuffer_set_dither_enabled($!mcf, $d);
  }

  method set_modelview_matrix (graphene_matrix_t() $matrix)
    is also<set-modelview-matrix>
  {
    cogl_framebuffer_set_modelview_matrix($!mcf, $matrix);
  }

  method set_projection_matrix (graphene_matrix_t() $matrix)
    is also<set-projection-matrix>
  {
    cogl_framebuffer_set_projection_matrix($!mcf, $matrix);
  }

  method set_samples_per_pixel (Int() $samples_per_pixel)
    is also<set-samples-per-pixel>
  {
    my gint $s = $samples_per_pixel;

    cogl_framebuffer_set_samples_per_pixel($!mcf, $s);
  }

  method set_stereo_mode (Int() $stereo_mode) is also<set-stereo-mode> {
    my MutterCoglStereoMode $s = $stereo_mode;

    cogl_framebuffer_set_stereo_mode($!mcf, $s);
  }

  method set_viewport (Num() $x, Num() $y, Num() $width, Num() $height)
    is also<set-viewport>
  {
    my gfloat ($xx, $yy, $w, $h) = ($x, $y, $width, $height);

    cogl_framebuffer_set_viewport($!mcf, $xx, $yy, $w, $h);
  }

  method transform (graphene_matrix_t() $matrix) {
    cogl_framebuffer_transform($!mcf, $matrix);
  }

  method translate (Num() $x, Num() $y, Num() $z) {
    my gfloat ($xx, $yy, $zz) = ($x, $y, $z);

    cogl_framebuffer_translate($!mcf, $xx, $yy, $zz)
  }

}
