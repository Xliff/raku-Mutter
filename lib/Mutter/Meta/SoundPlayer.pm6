use v6.c;

use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Object;

class Mutter::Meta::SoundPlayer {
  also does GLib::Roles::Object;

  has MetaSoundPlayer $!msp;

  method play_from_file (
    GFile()        $file,
    Str()          $description = '',
    GCancellable() $cancellable = GCancellable;
  ) {
    meta_sound_player_play_from_file($!msp, $file, $description, $cancellable);
  }

  method play_from_theme (
    Str()          $name,
    Str()          $description = '',
    GCancellable() $cancellable = GCancellables
  ) {
    meta_sound_player_play_from_theme(
      $!msp,
      $name,
      $description,
      $cancellable
    );
  }
}


### /usr/src/mutter-42.1/src/meta/meta-sound-player.h

sub meta_sound_player_play_from_file (
  MetaSoundPlayer $player,
  GFile           $file,
  Str             $description,
  GCancellable    $cancellable
)
  is native(mutter)
  is export
{ * }

sub meta_sound_player_play_from_theme (
  MetaSoundPlayer $player,
  Str             $name,
  Str             $description,
  GCancellable    $cancellable
)
  is native(mutter)
  is export
{ * }
