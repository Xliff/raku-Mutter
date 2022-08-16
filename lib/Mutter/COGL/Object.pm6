use v6.c;

use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Object;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset MutterCoglObjectAncestry is export of Mu
  where MutterCoglObject | GObject;

class Mutter::COGL::Object {
  also does GLib::Roles::Object;

  has MutterCoglObject $!mco is implementor;

  submethod BUILD ( :$mutter-cogl-object ) {
    self.setMutterCoglObject($mutter-cogl-object)
      if $mutter-cogl-object
  }

  method setMutterCoglObject (MutterCoglObjectAncestry $_) {
    my $to-parent;

    $!mco = do {
      when MutterCoglObject {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglObject, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglObject
  { $!mco }

  multi method new (
    MutterCoglObjectAncestry  $mutter-cogl-object,
                             :$ref                 = True
  ) {
    return unless $mutter-cogl-object;

    my $o = self.bless( :$mutter-cogl-object );
    $o.ref if $ref;
    $o;
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_object_get_gtype, $n, $t );
  }

  method get_user_data (MutterCoglUserDataKey() $key) is also<get-user-data> {
    cogl_object_get_user_data($!mco, $key);
  }

  method ref {
    cogl_object_ref($!mco);
    self;
  }

  method set_user_data (
    MutterCoglUserDataKey() $key,
    gpointer                $user_data = gpointer,
                            &destroy   = %DEFAULT-CALLBACKS<GDestroyNotify>
  ) 
    is also<set-user-data>
  {
    cogl_object_set_user_data($!mco, $key, $user_data, &destroy);
  }

  method unref {
    cogl_object_unref($!mco);
  }

}
