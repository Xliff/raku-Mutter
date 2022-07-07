use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Mutter::Raw::Types;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role Mutter::Clutter::Roles::Content {
  has $!mc-content;

  method roleInit-MutterClutterContent {
    return if $!mc-content;

    my \i = findProperImplementor(self.^attributes);

    $!mc-content = cast( MutterClutterContent, i.get_value(self) )
  }

  method Mutter::Raw::Definitions::MutterClutterContent
  { $!mc-content }

  proto method get_preferred_size (|)
  { * }

  multi method get_preferred_size {
    samewith($, $);
  }
  multi method get_preferred_size ($width is rw, $height is rw) {
    my gfloat ($w, $h) = 0e0 xx 2;

    clutter_content_get_preferred_size($!mc-content, $w, $h);
    ($width, $height) = ($w, $h);
  }

  method invalidate {
    clutter_content_invalidate($!mc-content);
  }

  method invalidate_size {
    clutter_content_invalidate_size($!mc-content);
  }

  method muttercluttercontent_get_type {
    state ($n, $t);

    unstable_get_type( ::?CLASS.^name, &clutter_content_get_type, $n, $t );
  }

}

our subset MutterClutterContentAncestry is export of Mu
  where MutterClutterContent | GObject;

class Mutter::Clutter::Content {
  also does GLib::Roles::Object;
  also does Mutter::Clutter::Roles::Content;

  submethod BUILD ( :$mutter-clutter-content ) {
    self.setMutterMutterClutterContent($mutter-clutter-content)
      if $mutter-clutter-content
  }

  method setMutterMutterClutterContent(
    MutterClutterContentAncestry $_
  ) {
    my $to-parent;

    $!mc-content = do {
      when MutterClutterContent {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterContent, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (
    MutterClutterContentAncestry  $mutter-clutter-content,
                                 :$ref                     = True
  ) {
    return Nil unless $mutter-clutter-content;

    my $o = self.bless( :$mutter-clutter-content );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.muttercluttercontent_get_type
  }

}

### /usr/src/mutter-42.1/clutter/clutter/clutter-content.h

sub clutter_content_get_preferred_size (
  MutterClutterContent $content,
  gfloat               $width    is rw, 
  gfloat               $height   is rw
)
  returns uint32
  is native(mutter)
  is export
{ * }

sub clutter_content_invalidate (MutterClutterContent $content)
  is native(mutter)
  is export
{ * }

sub clutter_content_invalidate_size (MutterClutterContent $content)
  is native(mutter)
  is export
{ * }

sub clutter_content_get_type ()
  returns GType
  is native(mutter)
  is export
{ * }
