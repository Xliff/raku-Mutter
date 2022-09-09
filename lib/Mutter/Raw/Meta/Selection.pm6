use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use Mutter::Raw::Definitions;
use Mutter::Raw::Enums;

unit package Mutter::Raw::Meta::Selection;

### /usr/src/mutter-42.1/src/meta/meta-selection.h

sub meta_selection_get_mimetypes (
  MutterMetaSelection     $selection,
  MutterMetaSelectionType $selection_type
)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_selection_new (MutterMetaDisplay $display)
  returns MutterMetaSelection
  is native(mutter)
  is export
{ * }

sub meta_selection_set_owner (
  MutterMetaSelection       $selection,
  MutterMetaSelectionType   $selection_type,
  MutterMetaSelectionSource $owner
)
  is native(mutter)
  is export
{ * }

sub meta_selection_transfer_async (
  MutterMetaSelection     $selection,
  MutterMetaSelectionType $selection_type,
  Str                     $mimetype,
  gssize                  $size,
  GOutputStream           $output,
  GCancellable            $cancellable,
                          &callback (
                            MutterMetaSelection,
                            GAsyncResult,
                            gpointer
                          ),
  gpointer                $user_data
)
  is native(mutter)
  is export
{ * }

sub meta_selection_transfer_finish (
  MutterMetaSelection     $selection,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_selection_unset_owner (
  MutterMetaSelection       $selection,
  MutterMetaSelectionType   $selection_type,
  MutterMetaSelectionSource $owner
)
  is native(mutter)
  is export
{ * }
