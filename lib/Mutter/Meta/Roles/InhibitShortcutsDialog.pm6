use v6.c;

use Method::Also;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role Mutter::Meta::Roles::InhibitShortcutsDialog {
  has MutterMetaInhibitShortcutsDialog $!mmd is implementor;

  method Mutter::Clutter::Raw::Definitions::MutterMetaInhibitShortcutsDialog
    is also<MutterMetaInhibitShortcutsDialog>
  { $!mmd }

  method hide {
    meta_inhibit_shortcuts_dialog_hide($!mmd);
  }

  method response (Int() $response) {
    my MutterMetaInhibitShortcutsDialogResponse $r = $response;

    meta_inhibit_shortcuts_dialog_response($!mmd, $r);
  }

  method show {
    meta_inhibit_shortcuts_dialog_show($!mmd);
  }

}

our subset MutterMetaInhibitShortcutsDialogAncestry is export of Mu
  where MutterMetaInhibitShortcutsDialog | GObject;

class Mutter::Meta::InhibitShortcutsDialog {
  also does GLib::Roles::Object;
  also does Mutter::Meta::Roles::InhibitShortcutsDialog;

  submethod BUILD ( :$object-var ) {
    self.setMutterMetaInhibitShortcutsDialog($object-var)
      if $object-var
  }

  method setMutterMetaInhibitShortcutsDialog (
    MutterMetaInhibitShortcutsDialogAncestry $_
  ) {
    my $to-parent;

    $!mmd = do {
      when MutterMetaInhibitShortcutsDialog {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaInhibitShortcutsDialog, $_);
      }
    }
    self!setObject($to-parent);
  }

  multi method new (
    MutterMetaInhibitShortcutsDialogAncestry  $object-var,
                                             :$ref         = True
  ) {
    return unless $object-var;

    my $o = self.bless( :$object-var );
    $o.ref if $ref;
    $o;
  }

}


### /usr/src/mutter-42.1/src/meta/meta-inhibit-shortcuts-dialog.h

sub meta_inhibit_shortcuts_dialog_hide (
  MutterMetaInhibitShortcutsDialog $dialog
)
  is native(mutter-clutter)
  is export
{ * }

sub meta_inhibit_shortcuts_dialog_response (
  MutterMetaInhibitShortcutsDialog         $dialog,
  MutterMetaInhibitShortcutsDialogResponse $response
)
  is native(mutter-clutter)
  is export
{ * }

sub meta_inhibit_shortcuts_dialog_show (
  MutterMetaInhibitShortcutsDialog $dialog
)
  is native(mutter-clutter)
  is export
{ * }
