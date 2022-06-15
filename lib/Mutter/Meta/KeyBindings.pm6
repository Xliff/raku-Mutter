use v6.7;

use Mutter::Raw::Types;
use Mutter::Meta::Raw::KeyBindings;

class Mutter::Meta::KeyBindings {
  has MutterKeyBinding $!mkb is implementor;

  method get_mask {
    meta_key_binding_get_mask($!mkb);
  }

  method get_modifiers {
    meta_key_binding_get_modifiers($!mkb);
  }

  method get_name {
    meta_key_binding_get_name($!mkb);
  }

  method is_builtin {
    so meta_key_binding_is_builtin($!mkb);
  }

  method is_reversed {
    so meta_key_binding_is_reversed($!mkb);
  }

  method set_custom_handler (
    Str()    $name,
             &handler,
    gpointer $user_data = gpointer,
             &free_data
  )
    is static
  {
    meta_keybindings_set_custom_handler(
      $name,
      &handler,
      $user_data,
      &free_data
    );
  }
}
