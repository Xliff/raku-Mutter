use v6.c;

use Method::Also;
use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::COGL::Renderer;

use Mutter::COGL::Object;

use GLib::Roles::Implementor;
use GLib::Roles::TypedBuffer;

our subset MutterCoglRendererAncestry is export of Mu
  where MutterCoglRenderer | MutterCoglObjectAncestry;

class Mutter::COGL::Renderer is Mutter::COGL::Object {
  has MutterCoglRenderer $!mcr is implementor;

  submethod BUILD ( :$mutter-cogl-renderer ) {
    self.setMutterCoglRenderer($mutter-cogl-renderer)
      if $mutter-cogl-renderer
  }

  method setMutterCoglRenderer (MutterCoglRendererAncestry $_) {
    my $to-parent;

    $!mcr = do {
      when MutterCoglRenderer {
        $to-parent = cast(MutterCoglObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterCoglRenderer, $_);
      }
    }
    self.setMutterCoglObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterCoglRenderer
    is also<MutterCoglRenderer>
  { $!mcr }

  multi method new (
    MutterCoglRendererAncestry  $mutter-cogl-renderer,
                               :$ref                   = True
  ) {
    return unless $mutter-cogl-renderer;

    my $o = self.bless( :$mutter-cogl-renderer );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-cogl-renderer = cogl_renderer_new();

    $mutter-cogl-renderer ?? self.bless( :$mutter-cogl-renderer ) !! Nil;
  }

  method add_constraint (Int() $constraint) is also<add-constraint> {
    my MutterCoglRendererConstraint $c = $constraint;

    cogl_renderer_add_constraint($!mcr, $c);
  }

  method bind_api is also<bind-api> {
    cogl_renderer_bind_api($!mcr);
  }

  method check_onscreen_template (
    MutterCoglOnscreenTemplate() $onscreen_template,
    CArray[Pointer[GError]]      $error              = gerror
  )
    is also<check-onscreen-template>
  {
    clear_error;
    cogl_renderer_check_onscreen_template($!mcr, $onscreen_template, $error);
    set_error($error);
  }

  method is_renderer is also<is-renderer> {
    so cogl_is_renderer($!mcr);
  }

  method connect (CArray[Pointer[GError]] $error = gerror) {
    clear_error;
    my $c = cogl_renderer_connect($!mcr, $error);
    set_error($error);
    $c;
  }

  method create_dma_buf (
    Int()                   $width,
    Int()                   $height,
    CArray[Pointer[GError]] $error   = gerror,
                            :$raw    = False
  )
    is also<create-dma-buf>
  {
    my gint ($w, $h) = ($width, $height);

    clear_error;
    my $db = cogl_renderer_create_dma_buf($!mcr, $width, $height, $error);
    set_error($error);

    propReturnObject($db, $raw, |Mutter::COGL::DmaBufHandle.getTypePair)
  }

  multi method dispatch (@poll_fds) {
    samewith(
      GLib::Roles::TypedBuffer[MutterCoglPollFD].new(@poll_fds).p,
      @poll_fds.elems
    );
  }
  multi method dispatch (gpointer $poll_fds, Int() $n_poll_fds) {
    my gint $n = $n_poll_fds;

    cogl_poll_renderer_dispatch($!mcr, $poll_fds, $n);
  }

  method error_quark is also<error-quark> {
    cogl_renderer_error_quark();
  }

  method foreach_output (&callback, gpointer $user_data = gpointer)
    is also<foreach-output>
  {
    cogl_renderer_foreach_output($!mcr, &callback, $user_data);
  }

  method get_driver ( :$raw = False) is also<get-driver> {
    propReturnObject(
      cogl_renderer_get_driver($!mcr),
      $raw,
      |Mutter::COGL::Driver.getTypePair
    );
  }

  method get_gtype is also<get-gtype> {
    state ($n, $t);

    unstable_get_type( self.^name, &cogl_renderer_get_gtype, $n, $t );
  }

  proto method get_info (|)
  { * }

  multi method get_info ( :$raw = False ) {
    my $pfd = newCArray( Pointer[MutterCoglPollFD] );
    my $t;

    samewith($pfd, $, $t, :$raw)
  }
  multi method get_info (
    gpointer   $poll_fds,
               $n_poll_fds is rw,
               $timeout    is rw,
              :$raw               = False
  ) {
    my gint     $n = 0;
    my gint64_t $t = 0;

    cogl_poll_renderer_get_info($!mcr, $poll_fds, $n, $t);
    ($n_poll_fds, $timeout) = ($n, $t);
    return ($poll_fds, $timeout) if $raw;

    $poll_fds = ppr($poll_fds);
    my $fa = GLib::Roles::TypedBuffer[MutterCoglPollFD].new(
      $poll_fds,
      size       => $n_poll_fds
    );

    ($fa.Array, $timeout);
  }

  method get_winsys_id is also<get-winsys-id> {
    MutterCoglWinsysIDEnum( cogl_renderer_get_winsys_id($!mcr) );
  }

  method is_dma_buf_supported is also<is-dma-buf-supported> {
    so cogl_renderer_is_dma_buf_supported($!mcr);
  }

  method remove_constraint (MutterCoglRendererConstraint() $constraint)
    is also<remove-constraint>
  {
    cogl_renderer_remove_constraint($!mcr, $constraint);
  }

  method set_driver (MutterCoglDriver() $driver) is also<set-driver> {
    cogl_renderer_set_driver($!mcr, $driver);
  }

  method set_winsys_id (Int() $winsys_id) is also<set-winsys-id> {
    my MutterCoglWinsysID $w = $winsys_id;

    cogl_renderer_set_winsys_id($!mcr, $w);
  }

}
