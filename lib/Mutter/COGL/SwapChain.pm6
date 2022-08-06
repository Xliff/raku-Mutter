use v6.c;

use Method::Also;
use NativeCall;

use Mutter::Raw::Types;

use Mutter::COGL::Object;

use GLib::Roles::Implementor;

our subset MutterCoglSwapChainAncestry is export of Mu
  where MutterCoglSwapChain | MutterCoglObjectAncestry;

class Mutter::COGL::SwapChain is Mutter::COGL::Object {
  has MutterCoglSwapChain $!mcsc is implementor;

  submethod BUILD ( :$mutter-cogl-swap-chain ) {
    self.setMutterCoglSwapChain($mutter-cogl-swap-chain)
      if $mutter-cogl-swap-chain
  }

  method setMutterCoglSwapChain (MutterCoglSwapChainAncestry $_) {
    my $to-parent;

    $!mcsc = do {
      when MutterCoglSwapChain {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglSwapChain, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglSwapChain
    is also<MutterCoglSwapChain>
  { $!mcsc }

  multi method new (
    MutterCoglSwapChainAncestry  $mutter-cogl-swap-chain,
                                :$ref                     = True
  ) {
    return unless $mutter-cogl-swap-chain;

    my $o = self.bless( :$mutter-cogl-swap-chain );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-cogl-swap-chain = cogl_swap_chain_new();

    $mutter-cogl-swap-chain ?? self.bless( :$mutter-cogl-swap-chain ) !! Nil;
  }

  method is_swap_chain is also<is-swap-chain> {
    so cogl_is_swap_chain($!mcsc);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_swap_chain_get_gtype, $n, $t );
  }

  method set_has_alpha (Int() $has_alpha) is also<set-has-alpha> {
    my gboolean $h = $has_alpha.so.Int;

    cogl_swap_chain_set_has_alpha($!mcsc, $h);
  }

  method set_length (Int() $length) is also<set-length> {
    my gint $l = $length;

    cogl_swap_chain_set_length($!mcsc, $l);
  }

}


### /usr/src/mutter-42.1/cogl/cogl/cogl-swap-chain.h

sub cogl_is_swap_chain (MutterCoglSwapChain $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_swap_chain_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_swap_chain_new ()
  returns MutterCoglSwapChain
  is native(mutter-clutter)
  is export
{ * }

sub cogl_swap_chain_set_has_alpha (
  MutterCoglSwapChain $swap_chain,
  gboolean            $has_alpha
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_swap_chain_set_length (
  MutterCoglSwapChain $swap_chain,
  gint                $length
)
  is native(mutter-clutter)
  is export
{ * }
