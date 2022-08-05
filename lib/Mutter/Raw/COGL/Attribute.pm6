use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::COGL::Attribute;

### /usr/src/mutter-42.1/cogl/cogl/cogl-attribute.h

sub cogl_is_attribute (MutterCoglAttribute $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_get_buffer (MutterCoglAttribute $attribute)
  returns MutterCoglAttributeBuffer
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_get_normalized (MutterCoglAttribute $attribute)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new (
  MutterCoglAttributeBuffer $attribute_buffer,
  Str                       $name,
  size_t                    $stride,
  size_t                    $offset,
  gint                      $components,
  MutterCoglAttributeType   $type
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new_const_1f (
  MutterCoglContext $context,
  Str               $name,
  gfloat            $value
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new_const_2f (
  MutterCoglContext $context,
  Str               $name,
  gfloat            $component0,
  gfloat            $component1
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new_const_2fv (
  MutterCoglContext $context,
  Str               $name,
  CArray[gfloat]    $value   is rw
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new_const_2x2fv (
  MutterCoglContext $context,
  Str               $name,
  CArray[gfloat]    $matrix2x2 is rw,
  gboolean          $transpose
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new_const_3f (
  MutterCoglContext $context,
  Str               $name,
  gfloat            $component0,
  gfloat            $component1,
  gfloat            $component2
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new_const_3fv (
  MutterCoglContext $context,
  Str               $name,
  CArray[gfloat]    $value
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new_const_3x3fv (
  MutterCoglContext $context,
  Str               $name,
  CArray[gfloat]    $matrix3x3 is rw,
  gboolean          $transpose
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new_const_4f (
  MutterCoglContext $context,
  Str               $name,
  gfloat            $component0,
  gfloat            $component1,
  gfloat            $component2,
  gfloat            $component3
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new_const_4fv (
  MutterCoglContext $context,
  Str               $name,
  CArray[gfloat]    $value
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_new_const_4x4fv (
  MutterCoglContext $context,
  Str               $name,
  CArray[gfloat]    $matrix4x4,
  gboolean          $transpose
)
  returns MutterCoglAttribute
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_set_buffer (
  MutterCoglAttribute       $attribute,
  MutterCoglAttributeBuffer $attribute_buffer
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_attribute_set_normalized (
  MutterCoglAttribute $attribute,
  gboolean            $normalized
)
  is native(mutter-clutter)
  is export
{ * }
