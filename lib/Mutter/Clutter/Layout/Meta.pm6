use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use Mutter::Clutter::ChildMeta;

use GLib::Roles::Implementor;

our subset MutterClutterLayoutMetaAncestry is export of Mu
  where MutterClutterLayoutMeta | MutterClutterChildMetaAncestry;

class Mutter::Clutter::Layout::Meta is Mutter::Clutter::ChildMeta {
  has MutterClutterLayoutMeta $!mclm is implementor;

  submethod BUILD ( :$mutter-clutter-child-meta ) {
    self.setMutterClutterChildMeta($mutter-clutter-child-meta)
      if $mutter-clutter-child-meta;
  }

  method setMutterClutterChildMeta (MutterClutterChildMetaAncestry $_) {
    my $to-parent;

    $!mclm = do {
      when MutterClutterLayoutMeta {
        $to-parent = cast(MutterClutterChildMeta, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterLayoutMeta, $_);
      }
    }
    self.setMutterClutterChildMeta($to-parent);
  }

  method Mutter::Raw::Clutter::Definitions::MutterClutterLayoutMeta
  { $!mclm }

  method new (
    MutterClutterLayoutMetaAncestry  $mutter-clutter-child-meta,
                                    :$ref                         = True
  ) {
    return Nil unless $mutter-clutter-child-meta;

    my $o = self.bless( :$mutter-clutter-child-meta );
    $o.ref if $ref;
    $o;
  }

  method get_manager ( :$raw = False ) {
    propReturnObject(
      clutter_layout_meta_get_manager($!mclm),
      $raw,
      |::('Mutter::Clutter::LayoutManager').getTypePair
    )
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_layout_meta_get_type, $n, $t );
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-layout-meta.h

sub clutter_layout_meta_get_manager (MutterClutterLayoutMeta $data)
  returns MutterClutterLayoutManager
  is native(mutter-clutter)
  is export
{ * }

sub clutter_layout_meta_get_type ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }
