use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Clutter::PageTurnEffect;

### /usr/src/mutter-42.1/clutter/clutter/clutter-page-turn-effect.h

sub clutter_page_turn_effect_get_angle (MutterClutterPageTurnEffect $effect)
  returns gdouble
  is native(mutter)
  is export
{ * }

sub clutter_page_turn_effect_get_period (MutterClutterPageTurnEffect $effect)
  returns gdouble
  is native(mutter)
  is export
{ * }

sub clutter_page_turn_effect_get_radius (MutterClutterPageTurnEffect $effect)
  returns gfloat
  is native(mutter)
  is export
{ * }

sub clutter_page_turn_effect_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_page_turn_effect_new (
  gdouble $period,
  gdouble $angle,
  gfloat  $radius
)
  returns MutterClutterEffect
  is native(mutter)
  is export
{ * }

sub clutter_page_turn_effect_set_angle (
  MutterClutterPageTurnEffect $effect,
  gdouble                     $angle
)
  is native(mutter)
  is export
{ * }

sub clutter_page_turn_effect_set_period (
  MutterClutterPageTurnEffect $effect,
  gdouble                     $period
)
  is native(mutter)
  is export
{ * }

sub clutter_page_turn_effect_set_radius (
  MutterClutterPageTurnEffect $effect,
  gfloat                      $radius
)
  is native(mutter)
  is export
{ * }
