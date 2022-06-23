use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GIO::InputStream;

class Mutter::Meta::Selection::Source {
  has MetaSelectionSource $!mss is implementor;

  method get_mimetypes ( :$raw = False, :$glist = False) {
    returnGList(
      meta_selection_source_get_mimetypes($!mss),
      $raw,
      $glist,
      Str
    );
  }

  method is_active {
    so meta_selection_source_is_active($!mss);
  }

  proto method read_async (|)
  { * }

  multi method read_async (
    Str             $mimetype,
                    &callback,
    gpointer        $user_data   = gpointer,
    GCancellable() :$cancellable = GCancellable\
  ) {
    samewith(
      $mimetype,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method read_async (
    Str            $mimetype,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data = gpointer
  ) {
    meta_selection_source_read_async(
      $!mss,
      $mimetype,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method read_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $is = meta_selection_source_read_finish($!mss, $result, $error);
    set_error($error);

    propReturnObject($is, $raw, |GIO::InputStream.getTypePair)
  }
}


### /usr/src/mutter-42.1/src/meta/meta-selection-source.h

sub meta_selection_source_get_mimetypes (MetaSelectionSource $source)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_selection_source_is_active (MetaSelectionSource $source)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_selection_source_read_async (
  MetaSelectionSource $source,
  Str                 $mimetype,
  GCancellable        $cancellable,
                      &callback (MetaSelectionSource, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is native(mutter)
  is export
{ * }

sub meta_selection_source_read_finish (
  MetaSelectionSource     $source,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GInputStream
  is native(mutter)
  is export
{ * }
