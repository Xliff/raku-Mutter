use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

# parent: MutterMetaSelectionSource

# Move owner-changed from Selection?

class Mutter::Meta::SelectionSourceMemory {
  has MutterMetaSelectionSourceMemory $!mssm is implementor;

  multi method new (Str() $mime-type, GBytes() $content) {
    my $meta-memory-selection = meta_selection_source_memory_new(
      $mime-type,
      $content
    );

    $meta-memory-selection ?? self.bless( :$meta-memory-selection ) !! Nil;
  }

}


### /usr/src/mutter-42.1/src/meta/meta-selection-source-memory.h

sub meta_selection_source_memory_new (Str $mimetype, GBytes $content)
  returns MutterMetaSelectionSourceMemory
  is native(mutter-clutter)
  is export
{ * }
