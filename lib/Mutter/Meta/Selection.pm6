use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Meta::Selection;

class Mutter::Meta::Selection {
  also does GLib::Roles::Object;

  has MetaSelection $!ms is implementor;

  method new {
    my $meta-selection = meta_selection_new();

    $meta-selection ?? self.bless( :$meta-selection ) !! Nil;
  }

  method get_mimetypes (Int() $selection_type, :$raw, :$glist = False) {
    my MetaSelectionType $s = $selection_type;

    returnGList(
      meta_selection_get_mimetypes($!ms, $s),
      True,
      Str
    );
  }

  method set_owner (Int() $selection_type, MetaSelectionSource $owner) {
    my MetaSelectionType $s = $selection_type;

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
    my MetaSelectionType $s  = $selection_type;
    my gssize            $sz = $size;

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

  method unset_owner (Int() $selection_type, MetaSelectionSource $owner) {
    my MetaSelectionType $s = $selection_type;

    meta_selection_unset_owner($!ms, $s, $owner);
  }

}
