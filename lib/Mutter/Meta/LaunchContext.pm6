use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GIO::LaunchContext;

class Mutter::Meta::LaunchContext is GIO::LaunchContext {
  has MetaLaunchContext $!mlc is implementor;

  method set_timestamp (Int() $timestamp) {
    my uint32_t $t = $timestamp;

    meta_launch_context_set_timestamp($!mlc, $t);
  }

  method set_workspace (MetaWorkspace() $workspace) {
    meta_launch_context_set_workspace($!mlc, $workspace);
  }

}


### /usr/src/mutter-42.1/src/meta/meta-launch-context.h

sub meta_launch_context_set_timestamp (
  MetaLaunchContext $context,
  uint32_t          $timestamp
)
  is native(mutter)
  is export
{ * }

sub meta_launch_context_set_workspace (
  MetaLaunchContext $context,
  MetaWorkspace     $workspace
)
  is native(mutter)
  is export
{ * }
