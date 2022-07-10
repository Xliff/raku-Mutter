use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::BindingPool;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterClutterBindingPoolAncestry is export of Mu
  where MutterClutterBindingPool | GObject;

class Mutter::Clutter::BindingPool {
  also does GLib::Roles::Object;

  has MutterClutterBindingPool $!mcbp is implementor;

  submethod BUILD ( :$mutter-clutter-binding-pool ) {
    self.setBindingPool($mutter-clutter-binding-pool)
      if $mutter-clutter-binding-pool;
  }

  method setBindingPool(MutterClutterBindingPoolAncestry $_) {
    my $to-parent;

    $!mcbp = do {
      when MutterClutterBindingPool {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterBindingPool, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterBindingPool
    is also<MutterClutterBindingPool>
  { $!mcbp }

  multi method new (
    MutterClutterBindingPoolAncestry  $mutter-binding-pool,
                                     :$ref                  = True
  ) {
    return unless $mutter-binding-pool;

    my $o = self.bless( :$mutter-binding-pool );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $name) is static {
    my $mutter-clutter-binding-pool = clutter_binding_pool_new($name);

    $mutter-clutter-binding-pool ?? self.bless( :$mutter-clutter-binding-pool )
                                 !! Nil;
  }

  method find (Str() $name) is static {
    my $mutter-clutter-binding-pool = clutter_binding_pool_find($name);

    $mutter-clutter-binding-pool ?? self.bless( :$mutter-clutter-binding-pool )
                                 !! Nil;
  }

  method activate (Int() $key_val, Int() $modifiers, GObject() $gobject) {
    my guint                     $k = $key_val;
    my MutterClutterModifierType $m = $modifiers;

    clutter_binding_pool_activate($!mcbp, $k, $m, $gobject);
  }

  method block_action (Str() $action_name) is also<block-action> {
    clutter_binding_pool_block_action($!mcbp, $action_name);
  }

  method find_action (Int() $key_val, Int() $modifiers) is also<find-action> {
    my guint                     $k = $key_val;
    my MutterClutterModifierType $m = $modifiers;

    clutter_binding_pool_find_action($!mcbp, $k, $m);
  }

  # method get_for_class {
  #   clutter_binding_pool_get_for_class($!mcbp);
  # }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_binding_pool_get_type, $n, $t );
  }

  method install_action (
    Str()    $action_name,
    Int()    $key_val,
    Int()    $modifiers,
             &callback,
    gpointer $data          = gpointer,
             &notify        = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<install-action>
  {
    my guint                     $k = $key_val;
    my MutterClutterModifierType $m = $modifiers;

    clutter_binding_pool_install_action(
      $!mcbp,
      $action_name,
      $k,
      $m,
      &callback,
      $data,
      &notify
    );
  }

  method install_closure (
    Str()      $action_name,
    Int()      $key_val,
    Int()      $modifiers,
    GClosure() $closure
  )
    is also<install-closure>
  {
    my guint                     $k = $key_val;
    my MutterClutterModifierType $m = $modifiers;

    clutter_binding_pool_install_closure(
      $!mcbp,
      $action_name,
      $k,
      $m,
      $closure
    );
  }

  method override_action (
    Int()     $key_val,
    Int()     $modifiers,
    gpointer  $callback,
    gpointer  $data       = gpointer,
              &notify     = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<override-action>
  {
    my guint                     $k = $key_val;
    my MutterClutterModifierType $m = $modifiers;

    clutter_binding_pool_override_action(
      $!mcbp,
      $k,
      $m,
      $callback,
      $data,
      &notify
    );
  }

  method override_closure (
    Int()      $key_val,
    Int()      $modifiers,
    GClosure() $closure
  )
    is also<override-closure>
  {
    my guint                     $k = $key_val;
    my MutterClutterModifierType $m = $modifiers;

    clutter_binding_pool_override_closure($!mcbp, $k, $m, $closure);
  }

  method remove_action (Int() $key_val, Int() $modifiers) is also<remove-action> {
    my guint                     $k = $key_val;
    my MutterClutterModifierType $m = $modifiers;

    clutter_binding_pool_remove_action($!mcbp, $k, $m);
  }

  method unblock_action (Str() $action_name) is also<unblock-action> {
    clutter_binding_pool_unblock_action($!mcbp, $action_name);
  }

}
