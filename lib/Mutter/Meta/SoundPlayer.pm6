use v6.c;

use Method::Also;
use NativeCall;

use Mutter::Raw::Types;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

our subset MutterMetaSoundPlayerAncestry is export of Mu
  where MutterMetaSoundPlayer | GObject;

class Mutter::Meta::SoundPlayer {
  also does GLib::Roles::Object;

  has MutterMetaSoundPlayer $!msp is implementor;

  submethod BUILD ( :$meta-sound-player ) {
    self.setMutterMetaSoundPlayer($meta-sound-player)
      if $meta-sound-player
  }

  method setMutterMetaSoundPlayer (MutterMetaSoundPlayerAncestry $_) {
    my $to-parent;

    $!msp = do {
      when MutterMetaSoundPlayer {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterMetaSoundPlayer, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Clutter::Raw::Definitions::MutterMetaSoundPlayer
    is also<MutterMetaSoundPlayer>
  { $!msp }

  multi method new (
    MutterMetaSoundPlayerAncestry  $meta-sound-player,
                                  :$ref                = True
  ) {
    return unless $meta-sound-player;

    my $o = self.bless( :$meta-sound-player );
    $o.ref if $ref;
    $o;
  }

  method play_from_file (
    GFile()        $file,
    Str()          $description = '',
    GCancellable() $cancellable = GCancellable;
  )
    is also<play-from-file>
  {
    meta_sound_player_play_from_file($!msp, $file, $description, $cancellable);
  }

  method play_from_theme (
    Str()          $name,
    Str()          $description = '',
    GCancellable() $cancellable = GCancellable
  )
    is also<play-from-theme>
  {
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
  MutterMetaSoundPlayer $player,
  GFile                 $file,
  Str                   $description,
  GCancellable          $cancellable
)
  is native(mutter)
  is export
{ * }

sub meta_sound_player_play_from_theme (
  MutterMetaSoundPlayer $player,
  Str                   $name,
  Str                   $description,
  GCancellable          $cancellable
)
  is native(mutter)
  is export
{ * }
