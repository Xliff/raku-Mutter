use v6.c;

use NativeCall;
use Method::Also;

use Cairo;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Actor;

use GLib::GList;
use Graphene::Point;
use Graphene::Size;
use Graphene::Rect;

use Mutter::Clutter::Action;
use Mutter::Clutter::ActorBox;
use Mutter::Clutter::Color;
use Mutter::Clutter::Constraint;
use Mutter::Clutter::Effect;
use Mutter::Clutter::LayoutManager;
use Mutter::Clutter::PaintVolume;
use Mutter::Clutter::Transition;
#use Mutter::Clutter::Vertex;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

use Mutter::Clutter::Roles::Animatable;
# use Mutter::Clutter::Roles::Container;
# use Mutter::Clutter::Roles::Content;
# use Mutter::Clutter::Roles::Scriptable;
# use Mutter::Clutter::Roles::Signals::Actor;
# use Mutter::Clutter::Roles::Signals::Generic;

our subset MutterClutterActorAncestry is export of Mu
  where MutterClutterAnimatable | MutterClutterContainer |
        MutterClutterScriptable | MutterClutterActor     | GObject;

my (@animatables, @set-methods, @add-methods, %properties);

class Mutter::Clutter::Actor {
  also does GLib::Roles::Object;
  also does Mutter::Clutter::Roles::Animatable;
  # also does Mutter::Clutter::Roles::Container;
  # also does Mutter::Clutter::Roles::Scriptable;
  # also does Mutter::Clutter::Roles::Signals::Actor;
  # also does Mutter::Clutter::Roles::Signals::Generic;

  has MutterClutterActor $!mca is implementor;

  submethod BUILD (:$mutter-clutter-actor) {
    self.setMutterClutterActor($mutter-clutter-actor)
      if $mutter-clutter-actor;
  }

  method Mutter::Raw::Definitions::MutterClutterActor
    is also<MutterClutterActor>
  { $!mca }

  method setMutterClutterActor (MutterClutterActorAncestry $actor) {
    my $to-parent;
    $!mca = do given $actor {
      when MutterClutterActor      {
        $to-parent = cast(GObject, $_);
        $_;
      }

      when MutterClutterAnimatable { $!mc-anim = $_; proceed; }
      #when MutterClutterScriptable { $!mcs     = $_; proceed; }
      #when MutterClutterContainer  { $!mcc     = $_; proceed; }

      when MutterClutterAnimatable |
           MutterClutterContainer  |
           MutterClutterScriptable
      {
        $to-parent = cast(GObject, $_);
        cast(MutterClutterActor, $_);
      }

      default {
        $to-parent = $_;
        cast(MutterClutterActor, $_);
      }
    }

    self!setObject($to-parent);
    self.roleInit-MutterClutterAnimatable;
    self.roleInit-MutterClutterContainer;
    self.roleInit-MutterClutterScriptable;
  }

  multi method new (
    MutterClutterActorAncestry  $mutter-clutter-actor,
                               :$ref                   = True
  ) {
    return Nil unless $mutter-clutter-actor;

    my $o = self.bless( :$mutter-clutter-actor );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-actor = clutter_actor_new();

    $mutter-clutter-actor ?? self.bless( :$mutter-clutter-actor ) !! Nil;
  }

  # Type: float
  method x is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('x', $gv);
      }
    );
  }

  # Type: float
  method y is rw is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('y', $gv);
      }
    );
  }

  # Type: graphene_point_t
  method position ( :$raw = False) is rw  is g-property {
    my $gv = GLib::Value.new( Graphene::Point.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('position', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Graphene::Point.getTypePair
        );
      },
      STORE => -> $, graphene_point_t() $val is copy {
        $gv.object = $val;
        self.prop_set('position', $gv);
      }
    );
  }

  # Type: float
  method height is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('height', $gv);
      }
    );
  }

  # Type: float
  method width is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('width', $gv);
      }
    );
  }

  # Type: GrapheneSize
  method size ( :$raw = False) is rw  is g-property {
    my $gv = GLib::Value.new( Graphene::Size.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('size', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Graphene::Size.getTypePair
        );
      },
      STORE => -> $, graphene_size_t() $val is copy {
        $gv.object = $val;
        self.prop_set('size', $gv);
      }
    );
  }

  # Type: float
  method fixed-x is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fixed-x', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('fixed-x', $gv);
      }
    );
  }

  # Type: float
  method fixed-y is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fixed-y', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('fixed-y', $gv);
      }
    );
  }

  # Type: boolean
  method fixed-position-set is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fixed-position-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('fixed-position-set', $gv);
      }
    );
  }

  # Type: float
  method min-width is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-width', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('min-width', $gv);
      }
    );
  }

  # Type: float
  method min-height is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-height', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('min-height', $gv);
      }
    );
  }

  # Type: float
  method natural-width is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('natural-width', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('natural-width', $gv);
      }
    );
  }

  # Type: float
  method natural-height is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('natural-height', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('natural-height', $gv);
      }
    );
  }

  # Type: boolean
  method min-width-set is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-width-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('min-width-set', $gv);
      }
    );
  }

  # Type: boolean
  method min-height-set is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('min-height-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('min-height-set', $gv);
      }
    );
  }

  # Type: boolean
  method natural-width-set is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('natural-width-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('natural-width-set', $gv);
      }
    );
  }

  # Type: boolean
  method natural-height-set is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('natural-height-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('natural-height-set', $gv);
      }
    );
  }

  # Type: MutterActorBox
  method allocation ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::ActorBox.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('allocation', $gv);
        propReturnObject(
          $gv.boxed,
          $raw,
          |Mutter::Clutter::ActorBox.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'allocation does not allow writing'
      }
    );
  }

  # Type: ClutterColor
  method background-color ( :$raw = False )
    is also<background_color>
    is g-property
    is rw
  {
    my $gv = GLib::Value.new( Mutter::Clutter::Color.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('background-color', $gv);
        propReturnObject(
          $gv.boxed,
          $raw,
          |Mutter::Clutter::Color.getTypePair
        );
      },
      STORE => -> $, MutterClutterColor() $val is copy {
        $gv.boxed = $val;
        self.prop_set('background-color', $gv);
      }
    );
  }

  # Type: MutterRequestMode
  method request-mode is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterRequestMode)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('request-mode', $gv);
        MutterClutterRequestModeEnum(
          $gv.valueFromEnum(MutterClutterRequestMode)
        )
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(MutterClutterRequestMode) = $val;
        self.prop_set('request-mode', $gv);
      }
    );
  }

  # Type: float
  method z-position is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('z-position', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('z-position', $gv);
      }
    );
  }

  # Type: uint
  method opacity is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('opacity', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('opacity', $gv);
      }
    );
  }

  # Type: MutterOffscreenRedirect
  method offscreen-redirect is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::typeFromEnum(MutterClutterOffscreenRedirect)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('offscreen-redirect', $gv);
        MutterClutterOffscreenRedirectEnum(
          $gv.valueFromEnum(MutterClutterOffscreenRedirect)
        );
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterOffscreenRedirect) = $val;
        self.prop_set('offscreen-redirect', $gv);
      }
    );
  }

  # Type: boolean
  method visible is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('visible', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('visible', $gv);
      }
    );
  }

  # Type: boolean
  method mapped is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('mapped', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'mapped does not allow writing'
      }
    );
  }

  # Type: boolean
  method realized is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('realized', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'realized does not allow writing'
      }
    );
  }

  # Type: boolean
  method reactive is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('reactive', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('reactive', $gv);
      }
    );
  }

  # Type: boolean
  # method has-clip is rw  is g-property {
  #   my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
  #   Proxy.new(
  #     FETCH => sub ($) {
  #       self.prop_get('has-clip', $gv);
  #       $gv.boolean;
  #     },
  #     STORE => -> $, Int() $val is copy {
  #       warn 'has-clip does not allow writing'
  #     }
  #   );
  # }

  # Type: graphene_rect_t
  method clip-rect ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Graphene::Rect.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('clip-rect', $gv);
        propReturnObject(
          $gv.value,
          $raw,
          |Graphene::Rect.getTypePair
        );
      },
      STORE => -> $, graphene_rect_t() $val is copy {
        $gv.value = $val;
        self.prop_set('clip-rect', $gv);
      }
    );
  }

  # Type: string
  method name is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('name', $gv);
      }
    );
  }

  # Type: graphene_point_t
  method pivot-point ( :$raw = False) is rw  is g-property {
    my $gv = GLib::Value.new( Graphene::Point.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pivot-point', $gv);
        propReturnObject(
          $gv.value,
          $raw,
          |Graphene::Point.getTypePair
        );
      },
      STORE => -> $, graphene_point_t() $val is copy {
        $gv.value = $val;
        self.prop_set('pivot-point', $gv);
      }
    );
  }

  # Type: float
  method pivot-point-z is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pivot-point-z', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('pivot-point-z', $gv);
      }
    );
  }

  # Type: double
  method scale-x is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('scale-x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('scale-x', $gv);
      }
    );
  }

  # Type: double
  method scale-y is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('scale-y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('scale-y', $gv);
      }
    );
  }

  # Type: double
  method scale-z is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('scale-z', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('scale-z', $gv);
      }
    );
  }

  # Type: double
  method rotation-angle-x is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation-angle-x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation-angle-x', $gv);
      }
    );
  }

  # Type: double
  method rotation-angle-y is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation-angle-y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation-angle-y', $gv);
      }
    );
  }

  # Type: double
  method rotation-angle-z is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation-angle-z', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation-angle-z', $gv);
      }
    );
  }

  # Type: float
  method translation-x is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('translation-x', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('translation-x', $gv);
      }
    );
  }

  # Type: float
  method translation-y is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('translation-y', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('translation-y', $gv);
      }
    );
  }

  # Type: float
  method translation-z is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('translation-z', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('translation-z', $gv);
      }
    );
  }

  # Type: MutterMatrix
  method transform ( :$raw = False) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Matrix.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('transform', $gv);
        propReturnObject(
          $gv.value,
          $raw,
          |Mutter::Clutter::Matrix.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        $gv.value = $val;
        self.prop_set('transform', $gv);
      }
    );
  }

  # Type: boolean
  method transform-set is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('transform-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'transform-set does not allow writing'
      }
    );
  }

  # Type: MutterMatrix
  method child-transform ( :$raw = False) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Matrix.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('child-transform', $gv);
        propReturnObject(
          $gv.value,
          $raw,
          |Mutter::Clutter::Matrix.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        $gv.value = $val;
        self.prop_set('child-transform', $gv);
      }
    );
  }

  # Type: boolean
  method child-transform-set is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('child-transform-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'child-transform-set does not allow writing'
      }
    );
  }

  # Type: boolean
  method show-on-set-parent is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('show-on-set-parent', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-on-set-parent', $gv);
      }
    );
  }

  # Type: boolean
  method clip-to-allocation is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('clip-to-allocation', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('clip-to-allocation', $gv);
      }
    );
  }

  # Type: MutterTextDirection
  method text-direction is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterTextDirection)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('text-direction', $gv);
        MutterClutterTextDirectionEnum(
          $gv.valueFromEnum(MutterClutterTextDirection)
        );
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterTextDirection) = $val;
        self.prop_set('text-direction', $gv);
      }
    );
  }

  # Type: boolean
  # method has-pointer is rw  is g-property {
  #   my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
  #   Proxy.new(
  #     FETCH => sub ($) {
  #       self.prop_get('has-pointer', $gv);
  #       $gv.boolean;
  #     },
  #     STORE => -> $, Int() $val is copy {
  #       warn 'has-pointer does not allow writing'
  #     }
  #   );
  # }

  # Type: MutterAction
  method actions is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Action.get_type );
    Proxy.new(
      FETCH => sub ($) {
        warn 'actions does not allow reading' if $DEBUG;
        0;
      },

      STORE => -> $, MutterClutterAction() $val is copy {
        $gv.object = $val;
        self.prop_set('actions', $gv);
      }
    );
  }

  # Type: MutterConstraint
  method constraints is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Constraint.get_type );
    Proxy.new(
      FETCH => sub ($) {
        warn 'constraints does not allow reading' if $DEBUG;
        0;
      },

      STORE => -> $, MutterClutterConstraint() $val is copy {
        $gv.value = $val;
        self.prop_set('constraints', $gv);
      }
    );
  }

  # Type: MutterEffect
  method effect is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Effect.get_type );
    Proxy.new(
      FETCH => sub ($) {
        warn 'effect does not allow reading' if $DEBUG;
        0;
      },

      STORE => -> $, MutterClutterEffect() $val is copy {
        $gv.value = $val;
        self.prop_set('effect', $gv);
      }
    );
  }

  # Type: MutterLayoutManager
  method layout-manager ( :$raw = False) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::LayoutManager.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('layout-manager', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::LayoutManager.getTypePair
        );
      },
      STORE => -> $, MutterClutterLayoutManager() $val is copy {
        $gv.object = $val;
        self.prop_set('layout-manager', $gv);
      }
    );
  }

  # Type: float
  method margin-top is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('margin-top', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('margin-top', $gv);
      }
    );
  }

  # Type: float
  method margin-bottom is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('margin-bottom', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('margin-bottom', $gv);
      }
    );
  }

  # Type: float
  method margin-left is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('margin-left', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('margin-left', $gv);
      }
    );
  }

  # Type: float
  method margin-right is rw  is g-property is animatable {
    my $gv = GLib::Value.new( G_TYPE_FLOAT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('margin-right', $gv);
        $gv.float;
      },
      STORE => -> $, Num() $val is copy {
        $gv.float = $val;
        self.prop_set('margin-right', $gv);
      }
    );
  }

  # Type: boolean
  method background-color-set is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('background-color-set', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'background-color-set does not allow writing'
      }
    );
  }

  # Type: MutterActor
  method first-child ( :$raw = False) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Actor.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('first-child', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Actor.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'first-child does not allow writing'
      }
    );
  }

  # Type: MutterActor
  method last-child ( :$raw = False) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Actor.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('last-child', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Actor.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'last-child does not allow writing'
      }
    );
  }

  # Type: MutterContent
  method content ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::Content.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('content', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |Mutter::Clutter::Content.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        $gv.object = $val;
        self.prop_set('content', $gv);
      }
    );
  }

  # Type: MutterContentGravity
  method content-gravity is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterContentGravity)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('content-gravity', $gv);
        MutterClutterContentGravityEnum(
          $gv.valueFromEnum(MutterClutterContentGravity)
        );
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterContentGravity) = $val;
        self.prop_set('content-gravity', $gv);
      }
    );
  }

  # Type: MutterActorBox
  method content-box ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( Mutter::Clutter::ActorBox.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('content-box', $gv);
        propReturnObject(
          $gv.boxed,
          $raw,
          |Mutter::Clutter::ActorBox.getTypePair
        );
      },
      STORE => -> $,  $val is copy {
        warn 'content-box does not allow writing'
      }
    );
  }

  # Type: MutterScalingFilter
  method minification-filter is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterScalingFilter)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('minification-filter', $gv);
        MutterClutterScalingFilterEnum(
          $gv.valueFromEnum(MutterClutterScalingFilter)
        );
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterScalingFilter) = $val;
        self.prop_set('minification-filter', $gv);
      }
    );
  }

  # Type: MutterScalingFilter
  method magnification-filter is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterScalingFilter)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('magnification-filter', $gv);
        MutterClutterScalingFilterEnum(
          $gv.valueFromEnum(MutterClutterScalingFilter)
        );
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(MutterClutterScalingFilter) = $val;
        self.prop_set('magnification-filter', $gv);
      }
    );
  }

  # Type: MutterContentRepeat
  method content-repeat is rw  is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterContentRepeat)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('content-repeat', $gv);
        MutterClutterContentRepeatEnum(
          $gv.valueFromEnum(MutterClutterContentRepeat)
        );
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(MutterClutterContentRepeat) = $val;
        self.prop_set('content-repeat', $gv);
      }
    );
  }

  method x-align is also<x_align> is rw is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterActorAlign)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x-align', $gv);
        MutterClutterContentRepeatEnum(
          $gv.valueFromEnum(MutterClutterActorAlign)
        );
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(MutterClutterActorAlign) = $val;
        self.prop_set('x-align', $gv);
      }
    );
  }

  method x-expand is also<x_expand> is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x-expand', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('x-expand', $gv);
      }
    );
  }

  method y-expand is also<y_expand> is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y-expand', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('y-expand', $gv);
      }
    );
  }

  method y-align is also<y_align> is rw is g-property {
    my $gv = GLib::Value.new(
      GLib::Value.typeFromEnum(MutterClutterActorAlign)
    );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y-align', $gv);
        MutterClutterContentRepeatEnum(
          $gv.valueFromEnum(MutterClutterActorAlign)
        );
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(MutterClutterActorAlign) = $val;
        self.prop_set('y-align', $gv);
      }
    );
  }

  method margins is rw {
    Proxy.new:
      FETCH => sub ($) {
        (
          self.margin-top,
          self.margin-left,
          self.margin-right,
          self.margin-bottom
        )
      },
      STORE => -> $, Num() $val {
        my gfloat $v = $val;
        (
          self.margin-top,
          self.margin-left,
          self.margin-right,
          self.margin-bottom
        ) = $val xx 4;
      }
  }

  # Is originally:
  #   MutterClutterActor,
  #   MutterClutterActorBox,
  #   MutterClutterAllocationFlags,
  #   gpointer
  #   --> void
  method allocation-changed is also<allocation_changed> {
    self.connect-allocation-changed($!mca);
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method button-press-event is also<button_press_event> {
    self.connect-clutter-event($!mca, 'button-press-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method button-release-event is also<button_release_event> {
    self.connect-clutter-event($!mca, 'button-release-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method captured-event is also<captured_event> {
    self.connect-clutter-event($!mca, 'captured-event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method destroy {
    self.connect($!mca, 'destroy');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method enter-event is also<enter_event> {
    self.connect-clutter-event($!mca, 'enter-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method event {
    self.connect-clutter-event($!mca, 'event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method hide {
    self.connect($!mca, 'hide');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method key-focus-in is also<key_focus_in> {
    self.connect($!mca, 'key-focus-in');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method key-focus-out is also<key_focus_out> {
    self.connect($!mca, 'key-focus-out');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method key-press-event is also<key_press_event> {
    self.connect-clutter-event($!mca, 'key-press-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method key-release-event is also<key_release_event> {
    self.connect-clutter-event($!mca, 'key-release-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method leave-event is also<leave_event> {
    self.connect-clutter-event($!mca, 'leave-event');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method motion-event is also<motion_event> {
    self.connect-clutter-event($!mca, 'motion-event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method paint {
    self.connect($!mca, 'paint');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterActor, gpointer --> void
  method parent-set is also<parent_set> {
    self.connect-parent-set($!mca);
  }

  # Is originally:
  # MutterClutterActor, MutterClutterColor, gpointer --> void
  method pick {
    self.connect-pick($!mca);
  }

  # Is originally:
  # void, void
  method queue-redraw {
    self.connect($!mca, 'queue-redraw');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method queue-relayout is also<queue_relayout> {
    self.connect($!mca, 'queue-relayout');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method realize {
    self.connect($!mca, 'realize');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method resource-scale-changed {
    self.connect($!mca, 'resource-scale-changed');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method scroll-event is also<scroll_event> {
    self.connect-clutter-event($!mca, 'scroll-event');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method show {
    self.connect($!mca, 'show');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method stage-views-changed {
    self.connect($!mca, 'stage-views-changed');
  }

  # Is originally:
  # MutterClutterActor, MutterClutterEvent, gpointer --> gboolean
  method touch-event is also<touch_event> {
    self.connect-clutter-event($!mca, 'touch-event');
  }

  # Is originally:
  # MutterClutterActor, gchar, gboolean, gpointer --> void
  method transition-stopped is also<transition_stopped> {
    self.connect-transition-stopped($!mca);
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method transitions-completed is also<transitions_completed> {
    self.connect($!mca, 'transitions-completed');
  }

  # Is originally:
  # MutterClutterActor, gpointer --> void
  method unrealize {
    self.connect($!mca, 'unrealize');
  }

  method add_child (MutterClutterActor() $child) {
    clutter_actor_add_child($!mca, $child);
  }

  method add_transition (Str $name, MutterClutterTransition() $transition) {
    clutter_actor_add_transition($!mca, $name, $transition);
  }

  method allocate (MutterClutterActorBox() $box) {
    clutter_actor_allocate($!mca, $box);
  }

  method allocate_align_fill (
    MutterClutterActorBox() $box,
    Num()                   $x_align,
    Num()                   $y_align,
    Int()                   $x_fill,
    Int()                   $y_fill,
  )
    is also<allocate-align-fill>
  {
    my gdouble ($xa, $ya)  = ($x_align, $y_align);
    my gboolean ($xf, $yf) = ($x_fill, $y_fill).map( *.so.Int);

    clutter_actor_allocate_align_fill($!mca, $box, $xa, $ya, $xf, $yf);
  }

  method allocate_available_size (
    Num() $x,
    Num() $y,
    Num() $available_width,
    Num() $available_height
  )
    is also<allocate-available-size>
  {
    my gfloat ($xx, $yy, $aw, $ah)
      = ($x, $y, $available_width, $available_height);

    clutter_actor_allocate_available_size($!mca, $xx, $yy, $aw, $ah);
  }

  method allocate_preferred_size (Num() $x, Num() $y) {
    my gfloat ($xx, $yy);

    clutter_actor_allocate_preferred_size($!mca, $xx, $yy);
  }

  method apply_relative_transform_to_point (
    MutterClutterActor() $ancestor,
    graphene_point3d_t() $point,
    graphene_point3d_t() $vertex
  )
    is also<apply-relative-transform-to-point>
  {
    clutter_actor_apply_relative_transform_to_point(
      $!mca,
      $ancestor,
      $point,
      $vertex
    );
  }

  method apply_transform_to_point (
    graphene_point3d_t() $point,
    graphene_point3d_t() $vertex
  )
    is also<apply-transform-to-point>
  {
    clutter_actor_apply_transform_to_point($!mca, $point, $vertex);
  }

  method bind_model (
    GListModel() $model,
                 &create_child_func,
    gpointer     $user_data          = gpointer,
                 &notify             = $DEFAULT-GDESTROY-NOTIFY
  )
    is also<bind-model>
  {
    clutter_actor_bind_model(
      $!mca,
      $model,
      &create_child_func,
      $user_data,
      &notify
    );
  }

  method bind_model_with_properties (
    GListModel() $model,
    Int()        $child_type,
    Str()        $first_model_property
  )
    is also<bind-model-with-properties>
  {
    my GType $c = $child_type;

    # May require a helper func!
    clutter_actor_bind_model_with_properties(
      $!mca,
      $model,
      $child_type,
      $first_model_property
    );
  }

  method contains (MutterClutterActor() $descendant) {
    clutter_actor_contains($!mca, $descendant);
  }

  method continue_paint (MutterClutterPaintContext() $paint_context)
    is also<continue-paint>
  {
    clutter_actor_continue_paint($!mca, $paint_context);
  }

  method continue_pick (MutterClutterPickContext() $pick_context)
    is also<continue-pick>
  {
    clutter_actor_continue_pick($!mca, $pick_context);
  }

  method create_pango_context ( :$raw = False )
    is also<create-pango-context>
  {
    propReturnObject(
      clutter_actor_create_pango_context($!mca),
      $raw,
      |Pango::Context.getTypePair
    );
  }

  method create_pango_layout (Str() $text, :$raw = False)
    is also<create-pango-layout>
  {
    propReturnObject(
      clutter_actor_create_pango_layout($!mca, $text),
      $raw,
      |Pango::Context.getTypePair
    );
  }

  method emit_destroy is also<emit-destroy> {
    clutter_actor_destroy($!mca);
  }

  method destroy_all_children is also<destroy-all-children> {
    clutter_actor_destroy_all_children($!mca);
  }

  method emit-event (MutterClutterEvent() $event, Int() $capture)
    is also<emit_event>
  {
    my gboolean $c = $capture.so.Int;

    clutter_actor_event($!mca, $event, $capture);
  }

  method get_abs_allocation_vertices (graphene_point3d_t $verts) {
    clutter_actor_get_abs_allocation_vertices($!mca, $verts);
  }

  method get_accessible ( :$raw = False ) is also<get-accessible> {
    propReturnObject(
      clutter_actor_get_accessible($!mca),
      $raw,
      |ATK::Object.getTypePair
    );
  }

  method get_allocation_box (MutterClutterActorBox() $box) {
    clutter_actor_get_allocation_box($!mca, $box);
  }

  proto method get_background_color (|)
    is also<get-background-color>
  { * }

  multi method get_background_color ( :$raw = False ) {
    samewith($, :$raw);
  }
  multi method get_background_color ($color is rw, :$raw = False) {
    $color = MutterClutterColor.new;

    clutter_actor_get_background_color($!mca, $color);

    propReturnObject($color, $raw, |Mutter::Clutter::Color.getTypePair)
  }

  method get_child_at_index (Int() $index, :$raw = False)
    is also<get-child-at-index>
  {
    my gint $i = $index;

    propReturnObject(
      clutter_actor_get_child_at_index($!mca, $i),
      $raw,
      |self.getTypePair
    )
  }

  # ...

  method get_child_transform (graphene_matrix_t() $transform) {
    clutter_actor_get_child_transform($!mca, $transform);
  }

  method get_children ( :$glist = False, :$raw = False )
    is also<
      get-children
      children
    >
  {
    returnGList(
      clutter_actor_get_children($!mca),
      $raw,
      $glist,
      |self.getTypePair
    );
  }

  proto method get_clip (|)
    is also<get-clip>
  { * }

  multi method get_clip {
    samewith($, $, $, $);
  }
  multi method get_clip (
    $xoff   is rw,
    $yoff   is rw,
    $width  is rw,
    $height is rw
  ) {
    my num32 ($xo, $yo, $w, $h) = 0e0 xx 4;

    clutter_actor_get_clip($!mca, $xo, $yo, $w, $h);
    ($xoff, $yoff, $width, $height) = ($xo, $yo, $w, $h);
  }

  method get_clip_to_allocation
    is also<get-clip-to-allocation>
  {
    clutter_actor_get_clip_to_allocation($!mca);
  }

  method get_content ( :$raw = False ) is also<get-content> {
    propReturnObject(
      clutter_actor_get_content($!mca),
      $raw,
      |Mutter::Clutter::Content.getTypePair
    );
  }

  method get_content_box (MutterClutterActorBox() $box)
    is also<get-content-box>
  {
    clutter_actor_get_content_box($!mca, $box);
  }

  method get_content_gravity is also<get-content-gravity> {
    MutterClutterContentGravityEnum( clutter_actor_get_content_gravity($!mca) );
  }

  method get_content_repeat is also<get-content-repeat> {
    MutterClutterContentRepeatEnum( clutter_actor_get_content_repeat($!mca) );
  }

  method get_content_scaling_filters (
    MutterClutterScalingFilter() $min_filter,
    MutterClutterScalingFilter() $mag_filter
  )
    is also<get-content-scaling-filters>
  {
    clutter_actor_get_content_scaling_filters($!mca, $min_filter, $mag_filter);
  }

  method get_default_paint_volume (:$raw = False)
    is also<
      get-default-paint-volume
      default_paint_volume
      default-paint-volume
    >
  {
    propReturnObject(
      clutter_actor_get_default_paint_volume($!mca),
      $raw,
      |Mutter::Clutter::PaintVolume.getTypePair
    );
  }

  method get_easing_delay is also<get-easing-delay> {
    clutter_actor_get_easing_delay($!mca);
  }

  method get_easing_duration is also<get-easing-duration> {
    clutter_actor_get_easing_duration($!mca);
  }

  method get_easing_mode is also<get-easing-mode> {
    MutterClutterAnimationModeEnum( clutter_actor_get_easing_mode($!mca) );
  }

  method get_first_child (:$raw = False) is also<get-first-child> {
    propReturnObject(
      clutter_actor_get_first_child($!mca),
      $raw,
      |self.getTypePair
    );
  }

  proto method get_fixed_position (|)
  { * }

  multi method get_fixed_position {
    samewith($, $);
  }
  multi method get_fixed_position ($x is rw, $y is rw) {
    my gfloat ($xx, $yy) = 0e0 xx 2;

    clutter_actor_get_fixed_position($!mca, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  method get_fixed_position_set is also<get-fixed-position-set> {
    clutter_actor_get_fixed_position_set($!mca);
  }

  method get_flags
    is also<
      get-flags
      flags
    >
  {
    MutterClutterActorFlagsEnum( clutter_actor_get_flags($!mca) );
  }

  method get_height is also<get-height> {
    clutter_actor_get_height($!mca);
  }

  method get_last_child ( :$raw = False ) is also<get-last-child> {
    propReturnObject(
      clutter_actor_get_last_child($!mca),
      $raw,
      |self.getTypePair
    );
  }

  method get_layout_manager ( :$raw = False ) is also<get-layout-manager> {
    propReturnObject(
      clutter_actor_get_layout_manager($!mca),
      $raw,
      |Mutter::Clutter::LayoutManager.getTypePair
    );
  }

  method get_margin (MutterClutterMargin() $margin) is also<get-margin> {
    clutter_actor_get_margin($!mca, $margin);
  }

  method get_margin_bottom is also<get-margin-bottom> {
    clutter_actor_get_margin_bottom($!mca);
  }

  method get_margin_left is also<get-margin-left> {
    clutter_actor_get_margin_left($!mca);
  }

  method get_margin_right is also<get-margin-right> {
    clutter_actor_get_margin_right($!mca);
  }

  method get_margin_top is also<get-margin-top> {
    clutter_actor_get_margin_top($!mca);
  }

  method get_n_children
    is also<
      get-n-children
      n_children
      n-children
      elems
    >
  {
    clutter_actor_get_n_children($!mca);
  }

  method get_name is also<get-name> {
    clutter_actor_get_name($!mca);
  }

  method get_next_sibling (:$raw = False)
    is also<
      get-next-sibling
      next_sibling
      next-sibling
    >
  {
    propReturnObject(
      clutter_actor_get_next_sibling($!mca),
      $raw,
      |self.getTypePair
    );
  }

  method get_offscreen_redirect is also<get-offscreen-redirect> {
    MutterClutterOffscreenRedirectEnum(
      clutter_actor_get_offscreen_redirect($!mca)
    );
  }

  method get_opacity {
    clutter_actor_get_opacity($!mca);
  }

  method get_opacity_override {
    clutter_actor_get_opacity_override($!mca);
  }

  method get_paint_box (MutterClutterActorBox() $box) {
    clutter_actor_get_paint_box($!mca, $box);
  }

  method get_paint_opacity
    is also<
      get-paint-opacity
      paint_opacity
      paint-opacity
    >
  {
    clutter_actor_get_paint_opacity($!mca);
  }

  method get_paint_visibility
    is also<
      get-paint-visibility
      paint_visibility
      paint-visibility
    >
  {
    clutter_actor_get_paint_visibility($!mca);
  }

  method get_paint_volume (:$raw = False)
    is also<
      get-paint-volume
      paint_volume
      paint-volume
    >
  {
    propReturnObject(
      clutter_actor_get_paint_volume($!mca),
      $raw,
      |Mutter::Clutter::PaintVolume.getTypePair
    );
  }

  method get_pango_context (:$raw = False)
    is also<
      get-pango-context
      pango_context
      pango-context
    >
  {
    propReturnObject(
      clutter_actor_get_pango_context($!mca),
      $raw,
      |Pango::Context.getTypePair
    );
  }

  method get_parent (:$raw = False)
    is also<
      get-parent
      parent
    >
  {
    propReturnObject(
      clutter_actor_get_parent($!mca),
      $raw,
      |self.getTypePair
    );
  }

  multi method get_pivot_point {
    samewith($, $);
  }
  multi method get_pivot_point ($pivot_x is rw, $pivot_y is rw)
    is also<get-pivot-point>
  {
    my gfloat ($px, $py) = 0e0 xx 2;

    clutter_actor_get_pivot_point($!mca, $px, $py);
    ($pivot_x, $pivot_y) = ($px, $py);
  }

  method get_pivot_point_z is also<get-pivot-point-z> {
    clutter_actor_get_pivot_point_z($!mca);
  }

  proto method get_position (|)
      is also<get-position>
    { * }

  multi method get_position {
    samewith($, $);
  }
  multi method get_position ($x is rw, $y is rw) {
    my gfloat ($xx, $yy) = 0e0 xx 2;

    clutter_actor_get_position($!mca, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  proto method get_preferred_height (|)
    is also<get-preferred-height>
  { * }

  multi method get_preferred_height (Num() $for_width) {
    samewith($for_width, $, $);
  }
  multi method get_preferred_height (
    Num() $for_width,
          $min_height_p     is rw,
          $natural_height_p is rw
  ) {
    my gfloat ($fw, $mh, $nh) = ($for_width, 0e0, 0e0);

    clutter_actor_get_preferred_height($!mca, $fw, $mh, $nh);
    ($min_height_p, $natural_height_p) = ($mh, $nh);
  }

  proto method get_preferred_size (|)
    is also<get-preferred-size>
  { * }

  multi method get_preferred_size {
    samewith($, $, $, $);
  }
  multi method get_preferred_size (
    $min_width_p      is rw,
    $min_height_p     is rw,
    $natural_width_p  is rw,
    $natural_height_p is rw
  ) {
    my gfloat ($mw, $mh, $nw, $nh) = 0e0 xx 4;

    clutter_actor_get_preferred_size($!mca, $mw, $mh, $nw, $nh);
    ($min_width_p, $min_height_p, $natural_width_p, $natural_height_p) =
      ($mw, $mh, $nw, $nh);
  }

  proto method get_preferred_width (|)
    is also<get-preferred-width>
  { * }

  multi method get_preferred_width (Num() $for_height) {
    samewith($for_height, $, $);
  }
  multi method get_preferred_width (
    Num() $for_height,
    $min_width_p       is rw,
    $natural_width_p   is rw
  ) {
    my ($fh, $mw, $nw) = ($fh, 0e0, 0e0);

    clutter_actor_get_preferred_width($!mca, $fh, $mw, $nw);
    ($min_width_p, $natural_width_p) = ($mw, $nw);
  }

  method get_previous_sibling (:$raw = False)
    is also<
      get-previous-sibling
      previous_sibling
      previous-sibling
    >
  {
    propReturnObject(
      clutter_actor_get_previous_sibling($!mca),
      $raw,
      |self.getTypePair
    );
  }

  method get_reactive {
    so clutter_actor_get_reactive($!mca);
  }

  method get_request_mode {
    MutterClutterRequestModeEnum( clutter_actor_get_request_mode($!mca) );
  }

  method get_resource_scale {
    clutter_actor_get_resource_scale($!mca);
  }

  method get_rotation_angle (
    Int() $axis # ClutterRotateAxis $axis
  )
    is also<get-rotation-angle>
  {
    my guint $a = $axis;

    clutter_actor_get_rotation_angle($!mca, $a);
  }

  proto method get_scale (|)
    is also<get-scale>
  { * }

  multi method get_scale {
    samewith($, $);
  }
  multi method get_scale (
    $scale_x is rw,
    $scale_y is rw
  ) {
    my gdouble ($sx, $sy) = 0e0 xx 2;

    clutter_actor_get_scale($!mca, $sx, $sy);
    ($scale_x, $scale_y) = ($sx, $sy);
  }

  method get_scale_z is also<get-scale-z> {
    clutter_actor_get_scale_z($!mca);
  }

  proto method get_size (|)
    is also<get-size>
  { * }

  multi method get_size {
    samewith($, $);
  }
  multi method get_size (
    $width  is rw,
    $height is rw
  ) {
    my gfloat ($w, $h) = 0e0 xx 2;

    clutter_actor_get_size($!mca, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_stage (:$raw = False)
    is also<
      get-stage
      stage
    >
  {
    propReturnObject(
      clutter_actor_get_stage($!mca),
      $raw,
      |Mutter::Clutter::Stage.getTypePair
    );
  }

  method get_text_direction {
    MutterClutterTextDirectionEnum(
      clutter_actor_get_text_direction($!mca)
    );
  }

  method get_transform (graphene_matrix_t $transform) {
    clutter_actor_get_transform($!mca, $transform);
  }

  method get_transformed_extents (graphene_rect_t $rect) {
    clutter_actor_get_transformed_extents($!mca, $rect);
  }

  method get_transformed_paint_volume (
    MutterClutterActor()  $relative_to_ancestor,
                         :$raw                   = False
  )
    is also<get-transformed-paint-volume>
  {
    propReturnObject(
      clutter_actor_get_transformed_paint_volume(
        $!mca,
        $relative_to_ancestor
      ),
      $raw,
      |Mutter::Clutter::PaintVolume.getTypePair
    );
  }

  proto method get_transformed_position (|)
    is also<get-transformed-position>
  { * }

  multi method get_transformed_position {
    samewith($, $);
  }
  multi method get_transformed_position (
    $x is rw,
    $y is rw
  ) {
    my gfloat ($xx, $yy) = 0e0 xx 2;

    clutter_actor_get_transformed_position($!mca, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  proto method get_transformed_size (|)
    is also<get-transformed-size>
  { * }

  multi method get_transformed_size {
    samewith($, $);
  }
  multi method get_transformed_size (
    $width  is rw,
    $height is rw
  ) {
    my gfloat ($w, $h) = 0e0 xx 2;

    clutter_actor_get_transformed_size($!mca, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method get_transition (Str() $name, :$raw = False) is also<get-transition> {
    propReturnObject(
      clutter_actor_get_transition($!mca, $name),
      $raw,
      |Mutter::Clutter::Transition.getTypePair
    );
  }

  proto method get_translation (|)
    is also<get-translation>
  { * }

  multi method get_translation {
    samewith($, $, $);
  }
  multi method get_translation (
    $translate_x is rw,
    $translate_y is rw,
    $translate_z is rw
  ) {
    my gfloat ($tx, $ty, $tz) = 0e0 xx 3;

    clutter_actor_get_translation($!mca, $tx, $ty, $tz);
    ($translate_x, $translate_y, $translate_z) = ($tx, $ty, $tz);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_actor_get_type, $n, $t );
  }

  method get_width is also<get-width> {
    clutter_actor_get_width($!mca);
  }

  method get_x is also<get-x> {
    clutter_actor_get_x($!mca);
  }

  method get_x_align is also<get-x-align> {
    clutter_actor_get_x_align($!mca);
  }

  method get_x_expand is also<get-x-expand> {
    clutter_actor_get_x_expand($!mca);
  }

  method get_y is also<get-y> {
    clutter_actor_get_y($!mca);
  }

  method get_y_align is also<get-y-align> {
    clutter_actor_get_y_align($!mca);
  }

  method get_y_expand is also<get-y-expand> {
    clutter_actor_get_y_expand($!mca);
  }

  method get_z_position is also<get-z-position> {
    clutter_actor_get_z_position($!mca);
  }

  method grab_key_focus is also<grab-key-focus> {
    clutter_actor_grab_key_focus($!mca);
  }

  method has_accessible is also<has-accessible> {
    so clutter_actor_has_accessible($!mca);
  }

  method has_allocation is also<has-allocation> {
    so clutter_actor_has_allocation($!mca);
  }

  method has_clip is also<has-clip> {
    so clutter_actor_has_clip($!mca);
  }

  method has_key_focus is also<has-key-focus> {
    so clutter_actor_has_key_focus($!mca);
  }

  method has_mapped_clones is also<has-mapped-clones> {
    so clutter_actor_has_mapped_clones($!mca);
  }

  method has_overlaps is also<has-overlaps> {
    so clutter_actor_has_overlaps($!mca);
  }

  method has_pointer is also<has-pointer> {
    so clutter_actor_has_pointer($!mca);
  }

  method hide_actor is also<hide-actor> {
    clutter_actor_hide($!mca);
  }

  method inhibit_culling {
    clutter_actor_inhibit_culling($!mca);
  }

  method insert_child_above (
    MutterClutterActor() $child,
    MutterClutterActor() $sibling
  ) {
    clutter_actor_insert_child_above($!mca, $child, $sibling);
  }

  method insert_child_at_index (MutterClutterActor() $child, Int() $index) {
    my gint $i = $index;

    clutter_actor_insert_child_at_index($!mca, $child, $i);
  }

  method insert_child_below (
    MutterClutterActor() $child,
    MutterClutterActor() $sibling
  ) {
    clutter_actor_insert_child_below($!mca, $child, $sibling);
  }

  method invalidate_paint_volume {
    clutter_actor_invalidate_paint_volume($!mca);
  }

  method invalidate_transform {
    clutter_actor_invalidate_transform($!mca);
  }

  method is_in_clone_paint is also<is-in-clone-paint> {
    so clutter_actor_is_in_clone_paint($!mca);
  }

  method is_mapped is also<is-mapped> {
    so clutter_actor_is_mapped($!mca);
  }

  method is_realized is also<is-realized> {
    so clutter_actor_is_realized($!mca);
  }

  method is_rotated is also<is-rotated> {
    so clutter_actor_is_rotated($!mca);
  }

  method is_scaled is also<is-scaled> {
    so clutter_actor_is_scaled($!mca);
  }

  method is_visible is also<is-visible> {
    so clutter_actor_is_visible($!mca);
  }

  method map {
    clutter_actor_map($!mca);
  }

  method move_by (Num() $dx, Num() $dy) is also<move-by> {
      my gfloat ($ddx, $ddy) = ($dx, $dy);

      clutter_actor_move_by($!mca, $ddx, $ddy);
    }

  method needs_expand (Int() $orientation) {
    my MutterClutterOrientation $o = $orientation;

    clutter_actor_needs_expand($!mca, $o);
  }

  method emit_paint (MutterClutterPaintContext() $paint_context)
    is also<emit-paint>
  {
    clutter_actor_paint($!mca, $paint_context);
  }

  # ...

  method peek_stage_views {
    clutter_actor_peek_stage_views($!mca);
  }

  method emit_pick (MutterClutterPickContext() $pick_context)
    is also<emit-pick>
  {
    clutter_actor_pick($!mca, $pick_context);
  }

  method pick_box (
    MutterClutterPickContext() $pick_context,
    MutterClutterActorBox()    $box
  ) {
    clutter_actor_pick_box($!mca, $pick_context, $box);
  }

  method queue_redraw_actor is also<queue-redraw-actor> {
    clutter_actor_queue_redraw($!mca);
  }

  method queue_redraw_with_clip (cairo_rectangle_int_t() $clip)
    is also<queue-redraw-actor-with-clip>
  {
    clutter_actor_queue_redraw_with_clip($!mca, $clip);
  }

  method queue_relayout_actor is also<queue-relayout-actor> {
    clutter_actor_queue_relayout($!mca);
  }

  method realize-actor is also<realize_actor> {
    clutter_actor_realize($!mca);
  }

  method remove_all_children is also<remove-all-children> {
    clutter_actor_remove_all_children($!mca);
  }

  method remove_all_transitions is also<remove-all-transitions> {
    clutter_actor_remove_all_transitions($!mca);
  }

  method remove_child (MutterClutterActor() $child) is also<remove-child> {
    clutter_actor_remove_child($!mca, $child);
  }

  method remove_clip is also<remove-clip> {
    clutter_actor_remove_clip($!mca);
  }

  method remove_transition (Str() $name) is also<remove-transition> {
    clutter_actor_remove_transition($!mca, $name);
  }

  method replace_child (
    MutterClutterActor() $old_child,
    MutterClutterActor() $new_child
  )
    is also<replace-child>
  {
    clutter_actor_replace_child($!mca, $old_child, $new_child);
  }

  method restore_easing_state is also<restore-easing-state> {
    clutter_actor_restore_easing_state($!mca);
  }

  method save_easing_state is also<save-easing-state> {
    clutter_actor_save_easing_state($!mca);
  }

  method set_allocation (MutterClutterActorBox() $box)
    is also<set-allocation>
  {
    clutter_actor_set_allocation($!mca, $box);
  }

  method set_background_color (MutterClutterColor() $color)
    is also<set-background-color>
  {
    clutter_actor_set_background_color($!mca, $color);
  }

  method set_child_above_sibling (
    MutterClutterActor() $child,
    MutterClutterActor() $sibling
  )
    is also<set-child-above-sibling>
  {
    clutter_actor_set_child_above_sibling($!mca, $child, $sibling);
  }

  method set_child_at_index (MutterClutterActor() $child, Int() $index)
    is also<set-child-at-index>
  {
    my gint $i = $index;

    clutter_actor_set_child_at_index($!mca, $child, $i);
  }

  method set_child_below_sibling (
    MutterClutterActor() $child,
    MutterClutterActor() $sibling
  ) {
    clutter_actor_set_child_below_sibling($!mca, $child, $sibling);
  }

  method set_child_transform (graphene_matrix_t $transform)
    is also<set-child-transform>
  {
    clutter_actor_set_child_transform($!mca, $transform);
  }

  method set_clip (
    Num() $xoff,
    Num() $yoff,
    Num() $width,
    Num() $height
  )
    is also<set-clip>
  {
    my gfloat ($xo, $yo, $w, $h) = ($xoff, $yoff, $width, $height);

    clutter_actor_set_clip($!mca, $xo, $yo, $w, $h);
  }

  method set_clip_to_allocation (Int() $clip_set)
    is also<set-clip-to-allocation>
  {
    my gboolean $c = $clip_set.so.Int;

    clutter_actor_set_clip_to_allocation($!mca, $c);
  }

  method set_content (MutterClutterContent() $content) is also<set-content> {
    clutter_actor_set_content($!mca, $content);
  }

  method set_content_gravity (
    Int() $gravity
  )
    is also<set-content-gravity>
  {
    my MutterClutterContentGravity $g = $gravity;

    clutter_actor_set_content_gravity($!mca, $g);
  }

  method set_content_repeat (Int() $repeat) {
    my MutterClutterContentRepeat $r = $repeat;

    clutter_actor_set_content_repeat($!mca, $r);
  }

  method set_content_scaling_filters (
    Int() $min_filter,
    Int() $mag_filter
  )
    is also<set-content-scaling-filters>
  {
    my MutterClutterScalingFilter ($mnf, $mgf) = ($min_filter, $mag_filter);

    clutter_actor_set_content_scaling_filters($!mca, $mnf, $mgf);
  }

  method set_easing_delay (Int() $msecs) is also<set-easing-delay> {
    my guint $ms = $msecs;

    clutter_actor_set_easing_delay($!mca, $ms);
  }

  method set_easing_duration (Int() $msecs) is also<set-easing-duration> {
    my guint $ms = $msecs;

    clutter_actor_set_easing_duration($!mca, $ms);
  }

  method set_easing_mode (Int() $mode) {
    my MutterClutterAnimationMode $m = $mode;

    clutter_actor_set_easing_mode($!mca, $m);
  }

  method set_fixed_position_set (Int() $is_set)
    is also<set-fixed-position-set>
  {
    my gboolean $is = $is_set.so.Int;

    clutter_actor_set_fixed_position_set($!mca, $is);
  }

  method set_flags (Int() $flags) {
    my MutterClutterActorFlags $f = $flags;

    clutter_actor_set_flags($!mca, $flags);
  }

  method set_height (Num() $height) is also<set-height> {
    my gfloat $h = $height;

    clutter_actor_set_height($!mca, $h);
  }

  method set_layout_manager (MutterClutterLayoutManager() $manager) {
    clutter_actor_set_layout_manager($!mca, $manager);
  }

  method set_margin (MutterClutterMargin() $margin) is also<set-margin> {
    clutter_actor_set_margin($!mca, $margin);
  }

  method set_margin_bottom (Num() $margin) is also<set-margin-bottom> {
    my gfloat $m = $margin;

    clutter_actor_set_margin_bottom($!mca, $m);
  }

  method set_margin_left (Num() $margin) is also<set-margin-left> {
    my gfloat $m = $margin;

    clutter_actor_set_margin_left($!mca, $m);
  }

  method set_margin_right (Num() $margin) is also<set-margin-right> {
    my gfloat $m = $margin;

    clutter_actor_set_margin_right($!mca, $m);
  }

  method set_margin_top (Num() $margin) is also<set-margin-top> {
    my gfloat $m = $margin;

    clutter_actor_set_margin_top($!mca, $m);
  }

  method set_name (Str() $name) {
    clutter_actor_set_name($!mca, $name);
  }

  method set_offscreen_redirect (Int() $redirect)
    is also<set-offscreen-redirect>
  {
    my MutterClutterOffscreenRedirect $r = $redirect;

    clutter_actor_set_offscreen_redirect($!mca, $r);
  }

  method set_opacity (Int() $opacity) is also<set-opacity> {
    my guint8 $o = $opacity;

    clutter_actor_set_opacity($!mca, $o);
  }

  method set_opacity_override (Int() $opacity) is also<set-opacity-override> {
    my gint $o = $opacity;

    clutter_actor_set_opacity_override($!mca, $o);
  }

  method set_pivot_point (Num() $pivot_x, Num() $pivot_y)
    is also<set-pivot-point>
  {
    my gfloat ($px, $py) = ($pivot_x, $pivot_y);

    clutter_actor_set_pivot_point($!mca, $px, $py);
  }

  method set_pivot_point_z (Num() $pivot_z) is also<set-pivot-point-z> {
    my gfloat $pz = $pivot_z;

    clutter_actor_set_pivot_point_z($!mca, $pivot_z);
  }

  proto method set_position (|)
    is also<set-position>
  { * }

  multi method set_position (Num() $x, Num() $y)  {
    my gfloat ($xx, $yy) = ($x, $y);

    clutter_actor_set_position($!mca, $xx, $yy);
  }

  method set_reactive (Int() $reactive) is also<set-reactive> {
    my gboolean $r = $reactive.so.Int;

    clutter_actor_set_reactive($!mca, $r);
  }

  method set_request_mode (Int() $mode) is also<set-request-mode> {
    my MutterClutterRequestMode $m = $mode;

    clutter_actor_set_request_mode($!mca, $m);
  }

  method set_rotation_angle (Int() $axis, Num() $angle)
    is also<set-rotation-angle>
  {
    my MutterClutterRotateAxis $a  = $axis;
    my gdouble                 $an = $angle;

    clutter_actor_set_rotation_angle($!mca, $a, $an);
  }

  method set_scale (Num() $scale_x, Num() $scale_y)
    is also<set-scale>
  {
    my gdouble ($sx, $sy) = ($scale_x, $scale_y);

    clutter_actor_set_scale($!mca, $sx, $sy);
  }

  method set_scale_z (Num() $scale_z) is also<set-scale-z> {
    my gdouble $sz = $scale_z;

    clutter_actor_set_scale_z($!mca, $sz);
  }

  method set_size (Num() $width, Num() $height) is also<set-size> {
    my gfloat ($w, $h) = ($width, $height);

    clutter_actor_set_size($!mca, $w, $h);
  }

  method set_text_direction (Int() $text_dir) {
    my MutterClutterTextDirection $t = $text_dir;

    clutter_actor_set_text_direction($!mca, $t);
  }

  method set_transform (graphene_matrix_t $transform) {
    clutter_actor_set_transform($!mca, $transform);
  }

  method set_translation (
    Num() $translate_x,
    Num() $translate_y,
    Num() $translate_z
  )
    is also<set-translation>
  {
    my gfloat ($tx, $ty, $tz) = ($translate_x, $translate_y, $translate_z);

    clutter_actor_set_translation($!mca, $tx, $ty, $tz);
  }

  method set_width (Num() $width) is also<set-width> {
    my gfloat $w = $width;

    clutter_actor_set_width($!mca, $w);
  }

  method set_x (Num() $x) is also<set-x> {
    my gfloat $xx = $x;

    clutter_actor_set_x($!mca, $xx);
  }

  method set_x_align (Int() $x_align) is also<set-x-align> {
    my MutterClutterActorAlign $xa = $x_align;

    clutter_actor_set_x_align($!mca, $xa);
  }

  method set_x_expand (Num() $expand) is also<set-x-expand> {
    my gboolean $e = $expand.so.Int;

    clutter_actor_set_x_expand($!mca, $e);
  }

  method set_y (Num() $y) is also<set-y> {
    my gfloat $yy = $y;

    clutter_actor_set_y($!mca, $yy);
  }

  method set_y_align (Int() $y_align) {
    my MutterClutterActorAlign $ya = $y_align;

    clutter_actor_set_y_align($!mca, $ya);
  }

  method set_y_expand (Int() $expand) is also<set-y-expand> {
    my gboolean $e = $expand.so.Int;

    clutter_actor_set_y_expand($!mca, $e);
  }

  method set_z_position (Num() $z_position) is also<set-z-position> {
    my gfloat $zp = $z_position;

    clutter_actor_set_z_position($!mca, $zp);
  }

  method should_pick (MutterClutterPickContext $pick_context) {
    clutter_actor_should_pick($!mca, $pick_context);
  }

  method show_actor is also<show-actor> {
    clutter_actor_show($!mca);
  }

  proto method transform_stage_point (|)
      is also<transform-stage-point>
    { * }

  multi method transform_stage_point (Num() $x, Num() $y) {
    samewith($x, $y, $, $);
  }
  multi method transform_stage_point (
    Num() $x,
    Num() $y,
          $x_out is rw,
          $y_out is rw
  ) {
    my gfloat ($xx, $yy, $xo, $yo) = ($x, $y, 0e0, 0e0);

    clutter_actor_transform_stage_point($!mca, $xx, $yy, $xo, $yo);
    ($x_out, $y_out) = ($xo, $yo);
  }

  method uninhibit_culling is also<uninhibit-culling> {
    clutter_actor_uninhibit_culling($!mca);
  }

  method unmap {
    clutter_actor_unmap($!mca);
  }

  method unrealize_actor is also<unrealize-actor> {
    clutter_actor_unrealize($!mca);
  }

  method unset_flags (Int() $flags) is also<unset-flags> {
    my MutterClutterActorFlags $f = $flags;

    clutter_actor_unset_flags($!mca, $f);
  }

  # ACTIONS

  method add_action (MutterClutterAction() $action) is also<add-action> {
    clutter_actor_add_action($!mca, $action);
  }

  method add_actions (*@actions) is also<add-actions> {
    for @actions {
      unless $_ ~~ Clutter::Action || .^lookup('ClutterAction') {
        die 'actions value must only contain Clutter::Action compatible types!'
      }
      self.add_action($_);
    }
  }

  method add_action_with_name (Str() $name, MutterClutterAction() $action)
    is also<
      add-action-with-name
      add_action_by_name
      add-action-by-name
    >
  {
    clutter_actor_add_action_with_name($!mca, $name, $action);
  }

  method add_actions_with_name (*@actions)
    is also<
      add-actions-with-name
      add_actions_by_name
      add-actions-by-name
    >
  {
    unless .[1] ~~ Clutter::Action || .[1].^lookup('ClutterAction') {
      die qq:to/DIE/;
        'constraints-with-name' value must only contain Clutter::Action {''
        }compatible types
        DIE
    }
    say "Action: { .[0] }" if $DEBUG;
    self.add-action-with-name(|$_);
  }

  method clear_actions is also<clear-action> {
    clutter_actor_clear_actions($!mca);
  }

  method get_action (Str() $name, :$raw = False) is also<get-action> {
    propReturnObject(
      clutter_actor_get_action($!mca, $name),
      $raw,
      |Mutter::Clutter::Action.getTypePair
    );
  }

  method get_actions (:$glist = False, :$raw = False) is also<get-actions> {
    propReturnObject(
      clutter_actor_get_actions($!mca),
      $raw,
      $glist,
      |Mutter::Clutter::Action.getTypePair
    )
  }

  method has_actions is also<has-action> {
    so clutter_actor_has_actions($!mca);
  }

  method remove_action (MutterClutterAction() $action) is also<remove-action> {
    clutter_actor_remove_action($!mca, $action);
  }

  method remove_action_by_name (Str() $name) is also<remove-action-by-name> {
    clutter_actor_remove_action_by_name($!mca, $name);
  }

  # CONSTRAINTS

  method add_constraints (*@constraints) is also<add-constraints> {
    for @constraints {
      die "\@constraints must contain only Mutter::Clutter::Constraint {
           '' }compatible values"
      unless [||](
        $_ ~~ MutterClutterConstraint,
        .^lookup('MutterClutterConstraint')
      );
    }

    self.add_constraint($_) for @constraints;
  }

  method add_constraint (MutterClutterConstraint() $constraint)
    is also<add-constraint>
  {
    clutter_actor_add_constraint($!mca, $constraint);
  }

  method add_constraint_with_name (
    Str()                     $name,
    MutterClutterConstraint() $constraint
  )
    is also<
      add-constraint-with-name
      add_constraint_by_name
      add-constraint-by-name
    >
  {
    clutter_actor_add_constraint_with_name($!mca, $name, $constraint);
  }

  method add_constraints_with_name (*@constraints)
    is also<
      add-constraints-with-name
      add_constraints_by_name
      add-constraints-by-name
    >
  {
    # Turn back into proper pairs
    for @constraints.rotor(2) {
      die "'constraints-with-name' value must only contain {
          '' }MutterClutterConstraint compatible types"
      unless .[1] ~~ MutterClutterConstraint ||
             .[1].^lookup('ClutterConstraint').elems;

      say "Constraint: { .[0] }" if $DEBUG;
      self.add-constraint-with-name(|$_);
    }
  }

  method clear_constraints {
    clutter_actor_clear_constraints($!mca);
  }

  method get_constraint (Str() $name, :$raw = False) is also<get-constraint> {
    propReturnObject(
      clutter_actor_get_constraint($!mca, $name),
      $raw,
      |Mutter::Clutter::Constraint.getTypePair
    )
  }

  method get_constraints (:$raw = False, :$glist = False)
    is also<get-constraints>
  {
    returnGList(
      clutter_actor_get_constraints($!mca),
      $raw,
      $glist,
      |Mutter::Clutter::Constraint.getTypePair
    );
  }

  method has_constraints is also<has-constraints> {
    so clutter_actor_has_constraints($!mca);
  }

  method remove_constraint (MutterClutterConstraint() $constraint)
    is also<remove-constraint>
  {
    clutter_actor_remove_constraint($!mca, $constraint);
  }

  method remove_constraint_by_name (Str() $name)
    is also<remove-constraint-by-name>
  {
    clutter_actor_remove_constraint_by_name($!mca, $name);
  }

  # EFFECTS

  method add_effect (MutterClutterEffect() $effect) is also<add-effect> {
    clutter_actor_add_effect($!mca, $effect);
  }

  method add_effect_with_name (Str() $name, MutterClutterEffect() $effect)
    is also<
      add-effect-with-name
      add_effect_by_name
      add-effect-by-name
    >
  {
    clutter_actor_add_effect_with_name($!mca, $name, $effect);
  }

  method clear_effects {
    clutter_actor_clear_effects($!mca);
  }

  # This is a method for Mutter::Clutter::Effect
  # method clutter_effect_queue_repaint {
  #   clutter_effect_queue_repaint($!mca);
  # }

  method get_effect (Str() $name, :$raw = False) is also<get-effect> {
    propReturnObject(
      clutter_actor_get_effect($!mca, $name),
      $raw,
      |Mutter::Clutter::Effect.getTypePair
    );
  }

  method get_effects (:$glist = False, :$raw = False) is also<get-effects> {
    returnGList(
      clutter_actor_get_effects($!mca),
      $raw,
      $glist,
      |Mutter::Clutter::Effect.getTypePair
    );
  }

  method has_effects is also<has-effects> {
    so clutter_actor_has_effects($!mca);
  }

  method remove_effect (MutterClutterEffect() $effect) is also<remove-effect> {
    clutter_actor_remove_effect($!mca, $effect);
  }

  method remove_effect_by_name (Str() $name) is also<remove-effect-by-name> {
    clutter_actor_remove_effect_by_name($!mca, $name);
  }

}

class Mutter::Clutter::Actor::Iter {
  has MutterClutterActorIter $!mcai is implementor;

  submethod BUILD ( :$mutter-actor-iter ) {
    $!mcai = $mutter-actor-iter;
  }

  method init (MutterClutterActor() $root) {
    my $mutter-actor-iter = clutter_actor_iter_init($root);

    $mutter-actor-iter ?? self.bless( :$mutter-actor-iter ) !! Nil;
  }

  method destroy {
    clutter_actor_iter_destroy($!mcai);
  }

  method is_valid {
    so clutter_actor_iter_is_valid($!mcai);
  }

  multi method next ( :$raw = False ) {
    samewith( newCArray(MutterClutterActor), :$raw )
  }
  multi method next (CArray[MutterClutterActor] $child, :$raw = False) {
    clutter_actor_iter_next($!mcai, $child);
    propReturnObject( ppr($child), $raw, |self.getTypePair );
  }

  multi method prev ( :$raw = False ) {
    samewith( newCArray(MutterClutterActor), :$raw )
  }
  multi method prev (CArray[MutterClutterActor] $child, :$raw = False) {
    clutter_actor_iter_prev($!mcai, $child);
    propReturnObject( ppr($child), $raw, |self.getTypePair );
  }

  method remove {
    clutter_actor_iter_remove($!mcai);
  }
}

use GLib::Object::Type;
use GLib::Class::Object;

BEGIN {
  @animatables = Mutter::Clutter::Actor.&findMethodsWithRole(
    AnimatablePropertyMethod
  );
  @set-methods = Mutter::Clutter::Actor.&findMethodsWithPrefixes('set_');
  @add-methods = Mutter::Clutter::Actor.&findMethodsWithPrefixes('add_');
  say "Mutter::Clutter::Actor - { +@animatables } animatables, {
         +@set-methods } set methods, and { +@add-methods } add methods";
}

INIT {
  unless %*ENV<P6_GLIB_COMPILE_PROCESS> {
    my $o = GLib::Object.new(Mutter::Clutter::Actor.get-type);
    %properties = $o.getClass.getProperties;
    my $np = %properties.elems;
    say "Clutter::Actor - { $np } property entr{ $np == 1 ?? 'y' !! 'ies' }";
  }
}
