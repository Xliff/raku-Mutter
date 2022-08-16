use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use Graphene::Matrix;

role Mutter::COGL::Roles::Graphene::Matrix {

  proto method project_point (|)
  { * }

  multi method project_point {
    samewith($, $, $, $);
  }
  multi method project_point ($x is rw, $y is rw, $z is rw, $w is rw) {
    my gfloat ($xx, $yy, $zz, $ww) = 0e0 xx 4;

    cogl_graphene_matrix_project_point(
      self.graphene_matrix_t,
      $xx,
      $yy,
      $zz,
      $ww
    );
    ($x, $y, $z, $w) = ($xx, $yy, $zz, $ww)
  }

  proto method project_points (|)
  { * }

  multi method project_points (
    Int()   $n_components,
    Int()   $stride,
            @points_in,
    Int()  :$n_points      = @points_in.elems,
    Int()  :$stride_out    = $stride
  ) {
    samewith(
      $n_components,
      $stride,
      Buf.new(@points_in),
      :$n_points,
      :$stride_out
    ).Array
  }
  multi method project_points (
    Int()   $n_components,
    Int()   $stride,
    Buf()   $points_in,
    Int()  :$n_points      = $points_in.bytes,
    Int()  :$stride_out    = $stride
  ) {
    cast(
      Buf,
      samewith(
         $n_components,
         $stride,
         $points_in.&ba,
        :$stride_out,
        :$n_points
      )
    );
  }
  multi method project_points (
    Int()          $n_components,
    Int()          $stride,
    CArray[uint8]  $points_in,
    Int()          $n_points,
    Int()         :$stride_out    = $stride,
    CArray[uint8] :$points_out    = CArray[uint8].allocate( [*](
                                      $stride_out,
                                      $n_points,
                                      $n_components,
                                      nativesizeof(num32)
                                    ) )
  ) {
    samewith(
      $n_components,
      $stride,
      $points_in.&p,
      $stride_out,
      $points_out.&p,
      $n_points
    );
    $points_out
  }
  multi method project_points (
    Int()    $n_components,
    Int()    $stride_in,
    gpointer $points_in,
    Int()    $stride_out,
    gpointer $points_out,
    Int()    $n_points
  ) {
    my size_t ($si, $so) = ($stride_in, $stride_out);
    my gint   ($nc, $np) = ($n_components, $n_points);

    cogl_graphene_matrix_project_points(
      self.graphene_matrix_t,
      $nc,
      $si,
      $points_in,
      $so,
      $points_out,
      $np
    );
  }

  proto method transform_points (|)
  { * }

  multi method transform_points (
    Int()   $n_components,
    Int()   $stride,
            @points_in,
    Int()  :$n_points      = @points_in.elems,
    Int()  :$stride_out    = $stride
  ) {
    samewith(
      $n_components,
      $stride,
      Buf.new(@points_in),
      :$n_points,
      :$stride_out
    ).Array
  }
  multi method transform_points (
    Int()   $n_components,
    Int()   $stride,
    Buf()   $points_in,
    Int()  :$n_points      = $points_in.bytes,
    Int()  :$stride_out    = $stride
  ) {
    cast(
      Buf,
      samewith(
         $n_components,
         $stride,
         $points_in.&ba,
        :$stride_out,
        :$n_points
      )
    );
  }
  multi method transform_points (
    Int()          $n_components,
    Int()          $stride,
    CArray[uint8]  $points_in,
    Int()          $n_points,
    Int()         :$stride_out    = $stride,
    CArray[uint8] :$points_out    = CArray[uint8].allocate( [*](
                                      $stride_out,
                                      $n_points,
                                      $n_components,
                                      nativesizeof(num32)
                                    ) )
  ) {
    samewith(
      $n_components,
      $stride,
      $points_in.&p,
      $stride_out,
      $points_out.&p,
      $n_points
    );
    $points_out
  }
  multi method transform_points (
    Int()    $n_components,
    Int()    $stride_in,
    gpointer $points_in,
    Int()    $stride_out,
    gpointer $points_out,
    Int()    $n_points
  ) {
    my size_t ($si, $so) = ($stride_in, $stride_out);
    my gint   ($nc, $np) = ($n_components, $n_points);

    cogl_graphene_matrix_transform_points(
      self.graphene_matrix_t,
      $nc,
      $si,
      $points_in,
      $so,
      $points_out,
      $np
    );
  }

}

### /usr/src/mutter-42.1/cogl/cogl/cogl-graphene.h

sub cogl_graphene_matrix_project_point (
  graphene_matrix_t $matrix,
  gfloat            $x is rw,
  gfloat            $y is rw,
  gfloat            $z is rw,
  gfloat            $w is rw
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_graphene_matrix_project_points (
  graphene_matrix_t $matrix,
  gint              $n_components,
  size_t            $stride_in,
  Pointer           $points_in,
  size_t            $stride_out,
  Pointer           $points_out,
  gint              $n_points
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_graphene_matrix_transform_points (
  graphene_matrix_t $matrix,
  gint              $n_components,
  size_t            $stride_in,
  Pointer           $points_in,
  size_t            $stride_out,
  Pointer           $points_out,
  gint              $n_points
)
  is native(mutter-clutter)
  is export
{ * }
