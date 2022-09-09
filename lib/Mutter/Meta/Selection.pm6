use v6.c;

use NativeCall;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Selection;

use GLib::GList;

use GLib::Roles::Object;
use GLib::Roles::Implementor;
use Mutter::Meta::Roles::Signals::Selection;

class Mutter::Meta::Selection {
  also does GLib::Roles::Object;
  also does Mutter::Meta::Roles::Signals::Selection;

  has MutterMetaSelection $!ms is implementor;

  method new (MutterMetaDisplay() $display) {
    my $meta-selection = meta_selection_new($display);

    $meta-selection ?? self.bless( :$meta-selection ) !! Nil;
  }

  method owner-changed {
    self.connect-owner-changed($!ms);
  }

  method get_mimetypes (Int() $selection_type, :$raw, :$glist = False) {
    my MutterMetaSelectionType $s = $selection_type;

    returnGList(
      meta_selection_get_mimetypes($!ms, $s),
      True,
      Str
    );
  }

  method set_owner (Int() $selection_type, MutterMetaSelectionSource $owner) {
    my MutterMetaSelectionType $s = $selection_type;

    meta_selection_set_owner($!ms, $selection_type, $owner);
  }

  proto method transfer_async (|)
  { * }

  multi method transfer_async (
    Int()            $selection_type,
    Str()            $mimetype,
    GOutputStream()  $output,
                     &callback,
    gpointer         $user_data        = gpointer,
    Int()           :$size             = -1,
    GCancellable()  :$cancellable      = GCancellable
  ) {
    samewith(
      $selection_type,
      $mimetype,
      $size,
      $output,
      $cancellable,
      &callback,
      $user_data
    )
  }
  multi method transfer_async (
    Int()           $selection_type,
    Str()           $mimetype,
    Int()           $size,
    GOutputStream() $output,
    GCancellable()  $cancellable,
                    &callback,
    gpointer        $user_data        = gpointer
  ) {
    my MutterMetaSelectionType $s  = $selection_type;
    my gssize                  $sz = $size;

    meta_selection_transfer_async(
      $!ms,
      $s,
      $mimetype,
      $sz,
      $output,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method transfer_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $rv = so meta_selection_transfer_finish($!ms, $result, $error);
    set_error($error);
    $rv;
  }

  method unset_owner (
    Int()                       $selection_type,
    MutterMetaSelectionSource() $owner
  ) {
    my MutterMetaSelectionType $s = $selection_type;

    meta_selection_unset_owner($!ms, $s, $owner);
  }

}
