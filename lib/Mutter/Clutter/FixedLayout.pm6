use v6.c;

use Method::Also;

use NativeCall;

use Mutter::Raw::Types;

use Mutter::Clutter::LayoutManager;

use GLib::Roles::Implementor;

our subset MutterClutterFixedLayoutAncestry is export of Mu
  where MutterClutterFixedLayout | MutterClutterLayoutManagerAncestry;

class Mutter::Clutter::FixedLayout is Mutter::Clutter::LayoutManager {
  has MutterClutterFixedLayout $!mcfl is implementor;

  submethod BUILD ( :$mutter-clutter-fixed-layout ) {
    self.setMutterClutterFixedLayout($mutter-clutter-fixed-layout)
      if $mutter-clutter-fixed-layout;
  }

  method setMutterClutterFixedLayout (MutterClutterFixedLayoutAncestry $_) {
    my $to-parent;

    $!mcfl = do {
      when MutterClutterFixedLayout {
        $to-parent = cast(MutterClutterLayoutManager, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterFixedLayout, $_);
      }
    }
    self.setMutterClutterLayoutManager($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterFixedLayout
    is also<MutterClutterFixedLayout>
  { $!mcfl }

  multi method new (
    MutterClutterFixedLayoutAncestry  $mutter-clutter-fixed-layout,
                                     :$ref                          = True
  ) {
    return unless $mutter-clutter-fixed-layout;

    my $o = self.bless( :$mutter-clutter-fixed-layout );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-fixed-layout = clutter_fixed_layout_new();

    $mutter-clutter-fixed-layout ?? self.bless( :$mutter-clutter-fixed-layout )
                                 !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_fixed_layout_get_type, $n, $t );
  }
}

### /usr/src/mutter-42.1/clutter/clutter/clutter-fixed-layout.h

sub clutter_fixed_layout_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }

sub clutter_fixed_layout_new ()
  returns MutterClutterFixedLayout
  is native(mutter)
  is export
{ * }
