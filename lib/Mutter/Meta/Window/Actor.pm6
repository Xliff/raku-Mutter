use v6.c;

use Mutter::Meta::Raw::Types;
use Mutter::Meta::Raw::Window::Actor;

use GLib::Roles::Object;

class Mutter::Window::Actor {
  also does GLib::Roles::Object;

  method freeze {
    meta_window_actor_freeze($!mwa);
  }

  method get_image (cairo_rectangle_int_t $clip, :$raw = Fase) {
    propReturnObject(
      meta_window_actor_get_image($!mwa, $clip),
      $raw,
      (Cairo::cairo_surface_t, Cairo::Surface)
    )
  }

  method get_meta_window ( :$raw = False ) {
    propReturnObject(
      meta_window_actor_get_meta_window($!mwa),
      $raw,
      |Mutter::Meta::Window.getTypePair
    );
  }

  method get_texture ( :$raw = False ) {
    propReturnObject(
      meta_window_actor_get_texture($!mwa),
      $raw,
      |Mutter::Meta::ShapedTexture.getTypePair
    );
  }

  method is_destroyed {
    so meta_window_actor_is_destroyed($!mwa);
  }

  method paint_to_content (
    MetaRectangle()         $clip,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear-error;
    my $mw = meta_window_actor_paint_to_content($!mwa, $clip, $error),
    set_error($error);
    propReturnObject($mw, $raw, |Mutter::Clutter::Content.getTypePair)
  }

  method sync_visibility {
    meta_window_actor_sync_visibility($!mwa);
  }

  method thaw {
    meta_window_actor_thaw($!mwa);
  }

}
