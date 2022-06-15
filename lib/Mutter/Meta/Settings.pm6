use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Object;

class Mutter::Meta::Settings {
  also does GLib::Roles::Object;

  method get_font_dpi {
    meta_settings_get_font_dpi($!ms);
  }

  method get_ui_scaling_factor {
    meta_settings_get_ui_scaling_factor($!ms);
  }

}

### /usr/src/mutter-42.1/src/meta/meta-settings.h

sub meta_settings_get_font_dpi (MetaSettings $settings)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_settings_get_ui_scaling_factor (MetaSettings $settings)
  returns gint
  is native(mutter)
  is export
{ * }
