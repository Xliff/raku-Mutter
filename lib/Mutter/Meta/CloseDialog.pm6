use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Object;

class Mutter::Meta::CloseDialog {
  also does GLib::Roles::Object;

  has MetaCloseDialog $!mcd is implementor;

  method focus {
    meta_close_dialog_focus($!mcd);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, meta_close_dialog_get_type, $n, $t );
  }

  method hide {
    meta_close_dialog_hide($!mcd);
  }

  method is_visible {
    so meta_close_dialog_is_visible($!mcd);
  }

  method response (Int() $response) {
    my MetaCloseDialogResponse $r = $response;

    meta_close_dialog_response($!mcd, $r);
  }

  method show {
    meta_close_dialog_show($!mcd);
  }

}

### /usr/src/mutter-42.1/src/meta/meta-close-dialog.h

sub meta_close_dialog_focus (MetaCloseDialog $dialog)
  is native(mutter)
  is export
{ * }

sub meta_close_dialog_hide (MetaCloseDialog $dialog)
  is native(mutter)
  is export
{ * }

sub meta_close_dialog_is_visible (MetaCloseDialog $dialog)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_close_dialog_response (
  MetaCloseDialog         $dialog,
  MetaCloseDialogResponse $response
)
  is native(mutter)
  is export
{ * }

sub meta_close_dialog_show (MetaCloseDialog $dialog)
  is native(mutter)
  is export
{ * }

sub meta_close_dialog_get_type
  returns GType
  is native(mutter)
  is export
{ * }
