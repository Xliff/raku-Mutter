use v6.c;

use GLib::Raw::Definitions;
use Mutter::Raw::Definitions;

unit package Mutter::Raw::Meta::Selection;

### /usr/src/mutter-42.1/src/meta/meta-selection.h

sub meta_selection_get_mimetypes (
  MetaSelection     $selection,
  MetaSelectionType $selection_type
)
  returns GList
  is native(mutter)
  is export
{ * }

sub meta_selection_new (MetaDisplay $display)
  returns MetaSelection
  is native(mutter)
  is export
{ * }

sub meta_selection_set_owner (
  MetaSelection       $selection,
  MetaSelectionType   $selection_type,
  MetaSelectionSource $owner
)
  is native(mutter)
  is export
{ * }

sub meta_selection_transfer_async (
  MetaSelection     $selection,
  MetaSelectionType $selection_type,
  Str               $mimetype,
  gssize            $size,
  GOutputStream     $output,
  GCancellable      $cancellable,
                    &callback (MetaSelection, GAsyncResult, gpointer),
  gpointer          $user_data
)
  is native(mutter)
  is export
{ * }

sub meta_selection_transfer_finish (
  MetaSelection           $selection,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub meta_selection_unset_owner (
  MetaSelection       $selection,
  MetaSelectionType   $selection_type,
  MetaSelectionSource $owner
)
  is native(mutter)
  is export
{ * }
