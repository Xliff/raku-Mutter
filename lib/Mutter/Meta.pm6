use v6.c;

use NativeCall;

use Method::Also;

use Mutter::Raw::Types;

class Meta {
  also does GLib::Roles::StaticClass;

  method restart (
    Str()               $message,
    MutterMetaContext() $context
  ) {
    meta_restart($message, $context);
  }

  method is_restart is also<is-restart> {
    so meta_is_restart();
  }

  method exit (Int $code) {
    my MutterMetaExitCode $c = $code;

    meta_exit($c);
  }
}

### /usr/src/mutter-42.1/src/meta/main.h

sub meta_restart (Str $message, MutterMetaContext $context)
  is native(mutter)
  is export
{ * }

sub meta_is_restart
  is native(mutter)
  is export
{ * }

sub meta_exit (MutterMetaExitCode $code)
  is native(mutter)
  is export
{ * }
