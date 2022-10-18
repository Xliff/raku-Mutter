use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Object;

role Mutter::Meta::Roles::CloseDialog {
  has MutterMetaCloseDialog $!mcd is implementor;

  method roleInit-MutterMetaCloseDialog {
    return if $!mcd;

    my \i = findProperImplementor(self.^attributes);
    $!mcd = cast( MutterMetaCloseDialog, i.get_value(self) )
  }

  method Mutter::Raw::Definition::MutterMetaCloseDialog
  { $!mcd }

  method MutterMetaRawCloseDialog {
  { $!mcd }

  method focus {
    meta_close_dialog_focus($!mcd);
  }

  method metaclosedialog_get_type {
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

class Mutter::Meta::CloseDialog {
  also does GLib::Roles::Object;
  also does Mutter::Meta::Roles::CloseDialog;

  submethod BUILD ( :$mutter-meta-close-dialog ) {
    self.setMutterMetaCloseDialog($mutter-meta-close-dialog)
      if $mutter-meta-close-dialog;
  }

  method setMutterMetaCloseDialog(MutterMetaCloseDialogAncestry $_) {
    my $to-parent;

    $!mcc = do {
      when MutterMetaCloseDialog {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaCloseDialog, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (
    MutterMetaCloseDialogAncestry  $mutter-meta-close-dialog,
                                  :$ref                       = True
  ) {
    return Nil unless $mutter-meta-close-dialog;

    my $o = self.bless( :$mutter-meta-close-dialog );
    $o.ref if $ref;
    $o;
  }

  method get_type is also<get-type> {
    self.metaclosedialog_get_type
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
