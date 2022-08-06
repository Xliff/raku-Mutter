use v6.c;

use NativeCall;
use Method::Also;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Display;

use Mutter::COGL::Object;

use GLib::Roles::Implementor;

our subset MutterCoglDisplayAncestry is export of Mu
  where MutterCoglDisplay | MutterCoglObjectAncestry;

class Mutter::COGL::Display {
  has MutterCoglDisplay $!mccd is implementor;

  submethod BUILD ( :$mutter-cogl-display ) {
    self.setMutterCoglDisplay($mutter-cogl-display)
      if $mutter-cogl-display
  }

  method setMutterCoglDisplay (MutterCoglDisplayAncestry $_) {
    my $to-parent;

    $!mccd = do {
      when MutterCoglDisplay {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglDisplay, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglDisplay
    is also<MutterCoglDisplay>
  { $!mccd }

  multi method new (
    MutterCoglDisplayAncestry  $mutter-cogl-display,
                              :$ref                  = True
  ) {
    return unless $mutter-cogl-display;

    my $o = self.bless( :$mutter-cogl-display );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    MutterCoglRenderer()         $renderer,
    MutterCoglOnscreenTemplate() $onscreen_template
  ) {
    cogl_display_new($renderer, $onscreen_template);
  }

  method is_display is also<is-display> {
    so cogl_is_display($!mccd);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_display_get_gtype, $n, $t );
  }

  method get_renderer ( :$raw = False ) is also<get-renderer> {
    propReturnObject(
      cogl_display_get_renderer($!mccd),
      $raw,
      |Mutter::COGL::Renderer.getTypePair
    );
  }

  method set_onscreen_template (
    MutterCoglOnscreenTemplate() $onscreen_template
  )
    is also<set-onscreen-template>
  {
    cogl_display_set_onscreen_template($!mccd, $onscreen_template);
  }

  method setup (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    cogl_display_setup($!mccd, $error);
    set_error($error);
  }

}
