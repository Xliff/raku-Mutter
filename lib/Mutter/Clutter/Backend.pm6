use v6.c;

use Method::Also;

use Cairo;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Backend;

#use Mutter::COGL::Context;
use Mutter::Clutter::InputMethod;
use Mutter::Clutter::Seat;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

our subset MutterClutterBackendAncestry is export of Mu
  where MutterClutterBackend | GObject;

class Mutter::Clutter::Backend {
  also does GLib::Roles::Object;

  has MutterClutterBackend $!mcb is implementor;

  submethod BUILD ( :$mutter-clutter-backend ) {
    self.setMutterClutterBackend($mutter-clutter-backend)
      if $mutter-clutter-backend;
  }

  method setMutterClutterBackend(MutterClutterBackendAncestry $_) {
    my $to-parent;

    $!mcb = do {
      when MutterClutterBackend {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterBackend, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Clutter::Definitions::MutterClutterBackend
  { $!mcb }

  method new (
    MutterClutterBackendAncestry  $mutter-clutter-backend,
                                 :$ref                     = True
  ) {
    return Nil unless $mutter-clutter-backend;

    my $o = self.bless( :$mutter-clutter-backend );
    $o.ref if $ref;
    $o;
  }

  method clutter_get_default_backend is also<clutter-get-default-backend> {
    my $mutter-clutter-backend = clutter_get_default_backend();

    $mutter-clutter-backend ?? self.bless( :$mutter-clutter-backend )
                            !! Nil
  }

  # Is originally:
  # ClutterBackend, gpointer --> void
  method font-changed is also<font_changed> {
    self.connect($!mcb, 'font-changed');
  }

  # Is originally:
  # ClutterBackend, gpointer --> void
  method resolution-changed is also<resolution_changed> {
    self.connect($!mcb, 'resolution-changed');
  }

  # Is originally:
  # ClutterBackend, gpointer --> void
  method settings-changed is also<settings_changed> {
    self.connect($!mcb, 'settings-changed');
  }

  method clear_input_method 
    is also<
      clear-input-method
      clearInputMethod
    >
  {
    self.set_input_backend(MutterClutterInputMethod);
  }

  method get_cogl_context ( :$raw = False ) is also<get-cogl-context> {
    propReturnObject(
      clutter_backend_get_cogl_context($!mcb),
      $raw,
      |Mutter::COGL::Context.getTypePair
    );
  }

  method get_default_seat ( :$raw = False ) is also<get-default-seat> {
    propReturnObject(
      clutter_backend_get_default_seat($!mcb),
      $raw,
      |Mutter::Clutter::Seat.getTypePair
    );
  }

  method get_font_options ( :$raw = False ) is also<get-font-options> {
    propReturnObject(
      clutter_backend_get_font_options($!mcb),
      $raw,
      cairo_font_options_t,
      Cairo::FontOptions
    );
  }

  method get_input_method ( :$raw = False ) is also<get-input-method> {
    propReturnObject(
      clutter_backend_get_input_method($!mcb),
      $raw,
      |Mutter::Clutter::InputMethod.getTypePair
    );
  }

  method get_resolution is also<get-resolution> {
    clutter_backend_get_resolution($!mcb);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_backend_get_type, $n, $t );
  }

  method set_font_options (cairo_font_options_t() $options)
    is also<set-font-options>
  {
    clutter_backend_set_font_options($!mcb, $options);
  }

  method set_input_method (MutterClutterInputMethod() $method)
    is also<set-input-method>
  {
    clutter_backend_set_input_method($!mcb, $method);
  }

}
