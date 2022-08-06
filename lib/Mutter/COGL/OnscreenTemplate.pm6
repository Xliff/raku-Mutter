use v6.c;

use Method::Also;

use NativeCall;

use Mutter::Raw::Types;

use Mutter::COGL::Object;

use GLib::Roles::Implementor;

our subset MutterCoglOnscreenTemplateAncestry is export of Mu
  where MutterCoglOnscreenTemplate | MutterCoglObjectAncestry;

class Mutter::COGL::OnscreenTemplate is Mutter::COGL::Object {
  has MutterCoglOnscreenTemplate $!mcot is implementor;

  submethod BUILD ( :$mutter-cogl-onscreen ) {
    self.setMutterCoglOnscreenTemplate($mutter-cogl-onscreen)
      if $mutter-cogl-onscreen
  }

  method setMutterCoglOnscreenTemplate (MutterCoglOnscreenTemplateAncestry $_) {
    my $to-parent;

    $!mcot = do {
      when MutterCoglOnscreenTemplate {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglOnscreenTemplate, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglOnscreenTemplate
    is also<MutterCoglOnscreenTemplate>
  { $!mcot }

  multi method new (
    MutterCoglOnscreenTemplateAncestry  $mutter-cogl-onscreen,
                                       :$ref                   = True
  ) {
    return unless $mutter-cogl-onscreen;

    my $o = self.bless( :$mutter-cogl-onscreen );
    $o.ref if $ref;
    $o;
  }
  multi method new (MutterCoglSwapChain() $swap_chain) {
    my $mutter-cogl-onscreen = cogl_onscreen_template_new($swap-chain);

    $mutter-cogl-onscreen ?? self.bless( :$mutter-cogl-onscreen ) !! Nil;
  }

  method is_onscreen_template is also<is-onscreen-template> {
    so cogl_is_onscreen_template($!mcot);
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &cogl_onscreen_template_get_gtype,
      $n.
      $t
    );
  }

  method set_samples_per_pixel (Int() $n) is also<set-samples-per-pixel> {
    my gint $nn = $n;

    cogl_onscreen_template_set_samples_per_pixel($!mcot, $nn);
  }

  method set_stereo_enabled (Int() $enabled) is also<set-stereo-enabled> {
    my gboolean $e = $enabled.so.Int;

    cogl_onscreen_template_set_stereo_enabled($!mcot, $e);
  }

}

### /usr/src/mutter-42.1/cogl/cogl/cogl-onscreen-template.h

sub cogl_is_onscreen_template (MutterCoglOnscreenTemplate $object)
  returns uint32
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_template_get_gtype ()
  returns GType
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_template_new (MutterCoglSwapChain $swap_chain)
  returns MutterCoglOnscreenTemplate
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_template_set_samples_per_pixel (
  MutterCoglOnscreenTemplate $onscreen_template,
  gint                       $n
)
  is native(mutter-clutter)
  is export
{ * }

sub cogl_onscreen_template_set_stereo_enabled (
  MutterCoglOnscreenTemplate $onscreen_template,
  gboolean                   $enabled
)
  is native(mutter-clutter)
  is export
{ * }
