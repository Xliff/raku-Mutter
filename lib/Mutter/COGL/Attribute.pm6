use v6.c;

use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Attribute;

use GLib::Roles::Implementor;
use Mutter::COGL::Object;

class Mutter::COGL::Attribute is Mutter::COGL::Object {
  has MutterCoglAttribute $!mca is implementor;

  method new (
    MutterCoglAttributeBuffer() $buffer,
    Str()                       $name,
    Int()                       $stride,
    Int()                       $offset,
    Int()                       $components,
    Int()                       $type
  ) {
    my size_t                   ($s, $o) = ($stride, $offset);
    my gint                      $c      =  $components;
    my MutterCoglAttributeType   $t      =  $type;

    my $mutter-cogl-attribute = cogl_attribute_new(
      $buffer,
      $name,
      $s,
      $o,
      $c,
      $t
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  method new_const_1f (
    MutterCoglContext() $context,
    Str()               $name,
    Num()               $value
  ) {
    my gfloat $v = $value;

    my $mutter-cogl-attribute = cogl_attribute_new_const_1f(
      $context,
      $name,
      $v
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  method new_const_2f (
    MutterCoglContext() $context,
    Str()               $name,
    Num()               $component0,
    Num()               $component1
  ) {
    my gfloat ($c0, $c1) = ($component0, $component1);

    my $mutter-cogl-attribute = cogl_attribute_new_const_2f(
      $!mca,
      $context,
      $name,
      $c0,
      $c1
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  proto method new_const_2fv (|)
  { * }

  multi method new_const_2fv (
    MutterCoglContext() $context,
    Str()               $name,
                        @value
  ) {
    X::Mutter::COGL::InvalidNumberOfElements.new(
      routine => &?ROUTINE.^name
    ).throw unless @value.elems == 2;

    samewith( $context, $name, ArrayToCArray(gfloat, @value) );
  }
  multi method new_const_2fv (
    MutterCoglContext() $context,
    Str()               $name,
    CArray[gfloat]      $value
  ) {
    my $mutter-cogl-attribute = cogl_attribute_new_const_2fv(
      $context,
      $name,
      $value
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  proto method new_const_2x2fv (|)
  { * }

  multi method new_const_2x2fv (
    MutterCoglContext() $context,
    Str()               $name,
                        @matrix2x2,
    Int()               $transpose
  ) {
    X::Mutter::COGL::InvalidNumberOfElements.new(
      routine => &?ROUTINE.^name
    ).throw unless @matrix2x2.elems == 4;

    samewith($context, $name, ArrayToCArray(gfloat, @matrix2x2), $transpose);
  }
  multi method new_const_2x2fv (
    MutterCoglContext() $context,
    Str()               $name,
    CArray[gfloat]      $matrix2x2,
    Int()               $transpose
  ) {
    my gboolean $t = $transpose.so.Int;

    my $mutter-cogl-attribute = cogl_attribute_new_const_2x2fv(
      $context,
      $name,
      $matrix2x2,
      $t
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  method new_const_3f (
    MutterCoglContext() $context,
    Str()               $name,
    Num()               $component0,
    Num()               $component1,
    Num()               $component2
  ) {
    my gfloat ($c0, $c1, $c2) = ($component0, $component1, $component2);

    my $mutter-cogl-attribute = cogl_attribute_new_const_3f(
      $context,
      $name,
      $c0,
      $c1,
      $c2
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  proto method new_const_3fv (|)
  { * }

  multi method new_const_3fv (
    MutterCoglContext() $context,
    Str()               $name,
                        @values
  ) {
    X::Mutter::COGL::InvalidNumberOfElements.new(
      routine => &?ROUTINE.^name
    ).throw unless @values.elems == 3;

    samewith( $context, $name, ArrayToCArray(gfloat, @values) );
  }
  multi method new_const_3fv (
    MutterCoglContext() $context,
    Str()               $name,
    CArray[gfloat]      $value
  ) {
    my $mutter-cogl-attribute = cogl_attribute_new_const_3fv(
      $context,
      $name,
      $value
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  proto method new_const_3x3fv (|)
  { * }

  multi method new_const_3x3fv (
    MutterCoglContext() $context,
    Str()               $name,
                        @matrix3x3,
    Int()               $transpose
  ) {
    X::Mutter::COGL::InvalidNumberOfElements.new(
      routine => &?ROUTINE.^name
    ).throw unless @matrix3x3.elems == 9;

    samewith($context, $name, ArrayToCArray(gfloat, @matrix3x3), $transpose );
  }
  multi method new_const_3x3fv (
    MutterCoglContext() $context,
    Str()               $name,
    CArray[gfloat]      $matrix3x3,
    Int()               $transpose
  ) {
    my gboolean $t = $transpose.so.Int;

    my $mutter-cogl-attribute = cogl_attribute_new_const_3x3fv(
      $context,
      $name,
      $matrix3x3,
      $transpose
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  method new_const_4f (
    MutterCoglContext() $context,
    Str()               $name,
    Num()               $component0,
    Num()               $component1,
    Num()               $component2,
    Num()               $component3
  ) {
    my gfloat ($c0, $c1, $c2, $c3) =
      ($component0, $component1, $component2, $component3);

    my $mutter-cogl-attribute = cogl_attribute_new_const_4f(
      $context,
      $name,
      $c0,
      $c1,
      $c2,
      $c3
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  proto method new_const_4fv (|)
  { * }

  multi method new_const_4fv (
    MutterCoglContext() $context,
    Str()               $name,
                        @value
  ) {
    X::Mutter::COGL::InvalidNumberOfElements.new(
      routine => &?ROUTINE.^name
    ).throw unless @value.elems == 4;

    samewith( $context, $name, ArrayToCArray(gfloat, @value) );
  }
  multi method new_const_4fv (
    MutterCoglContext() $context,
    Str()               $name,
    CArray[gfloat]      $value
  ) {
    my $mutter-cogl-attribute = cogl_attribute_new_const_4fv(
      $context,
      $name,
      $value
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  proto method new_const_4x4fv (|)
  { * }

  multi method new_const_4x4fv (
    MutterCoglContext() $context,
    Str()               $name,
                        @matrix4x4,
    Int()               $transpose
  ) {
    X::Mutter::COGL::InvalidNumberOfElements.new(
      routine => &?ROUTINE.^name
    ).throw unless @matrix4x4.elems == 16;

    samewith($context, $name, ArrayToCArray(gfloat, @matrix4x4), $transpose);
  }
  multi method new_const_4x4fv (
    MutterCoglContext() $context,
    Str()               $name,
    CArray[gfloat]      $matrix4x4,
    Int()               $transpose
  ) {
    my gboolean $t = $transpose.so.Int;

    my $mutter-cogl-attribute = cogl_attribute_new_const_4x4fv(
      $!mca,
      $context, $name,
      $matrix4x4,
      $transpose
    );

    $mutter-cogl-attribute ?? self.bless( :$mutter-cogl-attribute ) !! Nil;
  }

  method is_attribute {
    so cogl_is_attribute($!mca);
  }

  method get_buffer  {
    cogl_attribute_get_buffer($!mca),
  }

  method get_gtype {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_attribute_get_gtype, $n, $t );
  }

  method get_normalized {
    so cogl_attribute_get_normalized($!mca);
  }

  method set_buffer (MutterCoglAttributeBuffer() $attribute_buffer) {
    cogl_attribute_set_buffer($!mca, $attribute_buffer);
  }

  method set_normalized (Int() $normalized) {
    my gboolean $n = $normalized;

    cogl_attribute_set_normalized($!mca, $n);
  }

}
