use v6.c;

use Mutter::Raw::Types;
use Mutter::Meta::Raw::Background::Content;

class Mutter::Meta::Background::Content {
  has MetaBackgroundContent $!mbc is implementor;

  method new (MetaDisplay $display, Int() $monitor) {
    my gint $m = $monitor;

    my $meta-display = meta_background_content_new($!mbic, $m);

    $meta-display ?? self.bless( :$meta-display ) !! Nil;
  }

  method set_background (MetaBackground() $background) {
    meta_background_content_set_background($!mbic, $background);
  }

  method set_gradient (Int() $enabled, Int() $height, Num() $tone_start) {
    my gboolean $e = $enabled;
    my gint     $h = $height;
    my gdouble  $t = $tone_start;

    meta_background_content_set_gradient($!mbic, $e, $h, $t);
  }

  method set_rounded_clip_bounds (graphene_rect_t() $bounds) {
    meta_background_content_set_rounded_clip_bounds($!mbic, $bounds);
  }

  method set_rounded_clip_radius (Num() $radius) {
    my gfloat $r = $radius;

    meta_background_content_set_rounded_clip_radius($!mbic, $r);
  }

  method set_vignette (Int() $enabled, Num() $brightness, Num() $sharpness) {
    my gboolean  $e      = $enabled;
    my gdouble  ($b, $s) = ($brightness, $sharpness);

    meta_background_content_set_vignette($!mbic, $e, $b, $s);
  }
}
