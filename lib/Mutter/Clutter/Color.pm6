use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Color;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

# Boxed

class Mutter::Clutter::Color {
  also does GLib::Roles::Implementor;

  has MutterClutterColor $!mcc is implementor
    handles <red green blue alpha gist raku>;

  submethod BUILD ( :$mutter-clutter-color ) {
    $!mcc = $mutter-clutter-color;
  }

  method Clutter::Raw::Structs::MutterClutterColor
    is also<MutterClutterColor>
  { $!mcc }

  multi method new (MutterClutterColor $mutter-clutter-color) {
    $mutter-clutter-color ?? self.bless( :$mutter-clutter-color ) !! Nil;
  }
  multi method new {
    my $mutter-clutter-color = ::?CLASS.alloc;

    $mutter-clutter-color ?? self.bless( :$mutter-clutter-color ) !! Nil;
  }
  multi method new (
    Int() $red,
    Int() $green,
    Int() $blue,
    Int() $alpha
  ) {
    my gint8 ($r, $g, $b, $a)       =  ($red, $green, $blue, $alpha);
    my        $mutter-clutter-color = clutter_color_new($r, $g, $b, $a);

    $mutter-clutter-color ?? self.bless( :$mutter-clutter-color ) !! Nil;
  }

  method new_gray (Int() $val, Int() $alpha) is also<new-gray> {
    ::?CLASS.new($val, $val, $val, $alpha);
  }

  method new_from_hls (
    Num()             $hue,
    Num()             $luminance,
    Num()             $saturation,
                      :$alpha      is copy
  )
    is static
    is also<
      new-from-hls
      from_hls
      from-hls
    >
  {
    my gfloat ($h, $l, $s)           = ($hue, $luminance, $saturation);
    my         $mutter-clutter-color = ::?CLASS.alloc;

    X::Mutter::Clutter::Color::Memory.new.throw unless $mutter-clutter-color;

    if $alpha.defined {
      die '$alpha is not Int-compatible' unless $alpha.^lookup('Int');
      $alpha .= Int;
    }
    clutter_color_from_hls($mutter-clutter-color, $h, $l, $s);
    $mutter-clutter-color.alpha = $alpha if $alpha;
    self.bless( :$mutter-clutter-color );
  }

  method new_from_pixel (Int() $pixel) is static
    is also<
      new-from-pixel
      from_pixel
      from-pixel
    >
  {
    my guint $p                    = $pixel;
    my       $mutter-clutter-color = ::?CLASS.alloc;

    X::Mutter::Clutter::Color::Memory.new.throw unless $mutter-clutter-color;

    clutter_color_from_pixel($mutter-clutter-color, $p);
    self.bless( :$mutter-clutter-color );
  }

  method new_from_string (Str() $str) is static
    is also<
      new-from-string
      from_string
      from-string
    >
  {
    my $mutter-clutter-color = ::?CLASS.alloc;

    X::Clutter::Color::Memory.new.throw unless $mutter-clutter-color;

    clutter_color_from_string($mutter-clutter-color, $str);
    self.bless( :$mutter-clutter-color );
  }

  method new_from_color (MutterClutterColor() $c) is static
    is also<
      new-from-color
      from_color
      from-color
    >
  {
    my $mutter-clutter-color = MutterClutterColor.new(
      $c.red,
      $c.green,
      $c.blue,
      $c.alpha
    );

    X::ClutterColor::Memory.new.throw unless $mutter-clutter-color;

    self.bless( :$mutter-clutter-color );
  }

#   method get_static (Int() $static is copy) is static is also<get-static> {
#     die qq:to/DIE/.chomp unless $static ~~ Int || $static.^lookup('Int');
# Mutter::Clutter::Color.get_static only takes a MutterClutterStaticColor or
# Int-compatible parameter. The type passed was { $static.^name }
# DIE
#
#     $static .= Int;
#     my guint $s = $static;
#     my $mutter-clutter-color = clutter_color_get_static($s);
#
#     if $DEBUG {
#       say "S-{ MutterClutterStaticColorEnum( $static ) } - {$_}: {
#            $mutter-clutter-color."$_"() }"
#       for <red green blue alpha>;
#     }
#
#     $mutter-clutter-color ?? self.bless( :$mutter-clutter-color ) !! Nil;
#   }

  method init (
    Int()             $red,
    Int()             $green,
    Int()             $blue,
    Int()             $alpha
  )
    is static
  {
    my guint8 ($r, $g, $b, $a) = ($red, $green, $blue, $alpha);
    my        $c               = ::?CLASS.alloc;

    clutter_color_init($c, $r, $g, $b, $a);
    $c;
  }

  multi method add (MutterClutterColor() $b, :$raw = False) {
    my $color = ::?CLASS.alloc;

    X::ClutterColor::Memory.new.throw unless $color;

    ::?CLASS.add($b, $color, :$raw);
  }
  multi method add (
    MutterClutterColor()  $b,
    MutterClutterColor()  $result,
                         :$raw     = False
  )
    is static
  {
    clutter_color_add($!mcc, $b, $result);

    propReturnObject($result, $raw, |self.getTypePair)
  }

  method alloc is static {
    clutter_color_alloc();
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      clutter_color_copy($!mcc),
      $raw,
      |self.getTypePair
    );
  }

  multi method darken ( :$raw = False ) {
    samewith( ::?CLASS.alloc );
  }
  multi method darken (MutterClutterColor() $result, :$raw = False) {
    clutter_color_darken($!mcc, $result);
    propReturnObject($result, $raw, |self.getTypePair);
  }

  multi method equal (MutterClutterColor() $v2) {
    ::?CLASS.equal($!mcc, $v2);
  }
  multi method equal (MutterClutterColor() $a, MutterClutterColor() $b)
    is static
  {
    clutter_color_equal($a, $b);
  }

  method !free {
    clutter_color_free($!mcc);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_color_get_type, $n, $t );
  }

  multi method hash {
    ::?CLASS.hash($!mcc);
  }
  multi method hash (MutterClutterColor() $c) is static {
    clutter_color_hash($c);
  }

  multi method interpolate (MutterClutterColor() $final, Num() $progress) {
    ::?CLASS.interpolate($!mcc, $final, $progress);
  }
  multi method interpolate (
    MutterClutterColor()  $a,
    MutterClutterColor()  $b,
    Num()                 $progress,
                         :$raw       = False
  )
    is static
  {
    return Nil unless $a && $b;

    my $color = ::?CLASS.alloc;
    return unless $color;

    my gdouble $p = $progress;

    clutter_color_interpolate($a, $b, $p, $color);

    propReturnObject($color, $raw, |self.getTypePair);
  }

  multi method lighten ( :$raw = False ) {
    self.lighten( ::?CLASS.alloc );
  }
  multi method lighten (MutterClutterColor() $result, :$raw = False) {
    ::?CLASS.lighten($!mcc, $result);
  }
  multi method lighten (
    MutterClutterColor()  $c1,
    MutterClutterColor()  $c2,
                         :$raw = False
  )
    is static
  {
    clutter_color_lighten($c1, $c2);

    propReturnObject($c2, $raw, self.getTypePair);
  }

  multi method shade (Num() $factor, :$raw = False) {
    ::?CLASS.shade($!mcc, $factor, $, :$raw);
  }
  multi method shade (
    MutterClutterColor()    $c1,
    Num()                   $factor,
                            $color,
                           :$raw     = False
  ) {
    return Nil unless $c1;

    $color //= ::?CLASS.alloc;

    return unless $color;

    my gdouble $f = $factor;
    clutter_color_shade($c1, $f, $color);

    propReturnObject($color, $raw, |self.getTypePair)
  }

  multi method subtract (MutterClutterColor() $b) {
    ::?CLASS.subtract($!mcc, $b, ::?CLASS.alloc);
  }
  multi method subtract (
    MutterClutterColor()  $a,
    MutterClutterColor()  $b,
    MutterClutterColor()  $result,
                         :$raw     = False
  ) {
    return Nil unless $a && $b;

    my $color = ::?CLASS.alloc;

    return unless $color;
    clutter_color_subtract($!mcc, $b, $result);
    propReturnObject($result, $raw, |self.getTypePair);
  }

  proto method to_hls (|)
    is also<to-hls>
  { * }

  multi method to_hls {
    ::?CLASS.to_hls($!mcc, $, $, $);
  }
  multi method to_hls (
    MutterClutterColor() $color,
                         $hue        is rw,
                         $luminance  is rw,
                         $saturation is rw
  ) {
    $color //= ::?CLASS.alloc;

    return unless $color;

    my gdouble ($h, $l, $s) = 0e0 xx 3;

    clutter_color_to_hls($color, $h, $l, $s);
    ($hue, $luminance, $saturation) = ($h, $l, $s);
  }

  method to_pixel is also<to-pixel> {
    clutter_color_to_pixel($!mcc);
  }

  method to_string is also<to-string> {
    clutter_color_to_string($!mcc);
  }

}

class Mutter::Clutter::Color::ParamSpec {
  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_param_color_get_type, $n, $t );
  }

  method new (
    Str()                $name,
    Str()                $nick,
    Str()                $blurb,
    MutterClutterColor() $default_value,
    Int()                $flags
  ) {
    my GParamFlags $f = $flags;

    clutter_param_spec_color($name, $nick, $blurb, $default_value, $f);
  }
}


class Mutter::Clutter::Color::Value {
  has $!mccv is built handles <
    GLib::Raw::Definitions::GValue
    GValue
    get_type
  >;

  method new {
    self.bless(
      mccv => GLib::Value.new( Mutter::Clutter::Color.get_type);
    )
  }

  method color ( :$raw = False ) is rw {
    Proxy.new:
      FETCH => -> $                          { self.get_color(:$raw) },
      STORE => -> $, MutterClutterColor() \v { self.set_color(v)     };
  }

  method get_color ( :$raw = False ) is also<get-color> {
    propReturnObject(
      clutter_value_get_color($!mccv),
      $raw,
      |Mutter::Clutter::Color.getTypePair
    );
  }

  method set_color (MutterClutterColor() $color) is also<set-color> {
    clutter_value_set_color($!mccv, $color);
  }

}

package Mutter::Clutter::Color::Package {
  our $MUTTER_CLUTTER_COLOR_White           is export;
  our $MUTTER_CLUTTER_COLOR_Black           is export;
  our $MUTTER_CLUTTER_COLOR_Red             is export;
  our $MUTTER_CLUTTER_COLOR_DarkRed         is export;
  our $MUTTER_CLUTTER_COLOR_Green           is export;
  our $MUTTER_CLUTTER_COLOR_DarkGreen       is export;
  our $MUTTER_CLUTTER_COLOR_Blue            is export;
  our $MUTTER_CLUTTER_COLOR_DarkBlue        is export;
  our $MUTTER_CLUTTER_COLOR_Cyan            is export;
  our $MUTTER_CLUTTER_COLOR_DarkCyan        is export;
  our $MUTTER_CLUTTER_COLOR_Magenta         is export;
  our $MUTTER_CLUTTER_COLOR_DarkMagenta     is export;
  our $MUTTER_CLUTTER_COLOR_Yellow          is export;
  our $MUTTER_CLUTTER_COLOR_DarkYellow      is export;
  our $MUTTER_CLUTTER_COLOR_Gray            is export;
  our $MUTTER_CLUTTER_COLOR_DarkGray        is export;
  our $MUTTER_CLUTTER_COLOR_LightGray       is export;
  our $MUTTER_CLUTTER_COLOR_Butter          is export;
  our $MUTTER_CLUTTER_COLOR_LightButter     is export;
  our $MUTTER_CLUTTER_COLOR_DarkButter      is export;
  our $MUTTER_CLUTTER_COLOR_Orange          is export;
  our $MUTTER_CLUTTER_COLOR_LightOrange     is export;
  our $MUTTER_CLUTTER_COLOR_DarkOrange      is export;
  our $MUTTER_CLUTTER_COLOR_Chocolate       is export;
  our $MUTTER_CLUTTER_COLOR_LightChocolate  is export;
  our $MUTTER_CLUTTER_COLOR_DarkChocolate   is export;
  our $MUTTER_CLUTTER_COLOR_Chameleon       is export;
  our $MUTTER_CLUTTER_COLOR_LightChameleon  is export;
  our $MUTTER_CLUTTER_COLOR_DarkChameleon   is export;
  our $MUTTER_CLUTTER_COLOR_SkyBlue         is export;
  our $MUTTER_CLUTTER_COLOR_LightSkyBlue    is export;
  our $MUTTER_CLUTTER_COLOR_DarkSkyBlue     is export;
  our $MUTTER_CLUTTER_COLOR_Plum            is export;
  our $MUTTER_CLUTTER_COLOR_LightPlum       is export;
  our $MUTTER_CLUTTER_COLOR_DarkPlum        is export;
  our $MUTTER_CLUTTER_COLOR_ScarletRed      is export;
  our $MUTTER_CLUTTER_COLOR_LightScarletRed is export;
  our $MUTTER_CLUTTER_COLOR_DarkScarletRed  is export;
  our $MUTTER_CLUTTER_COLOR_Aluminium1      is export;
  our $MUTTER_CLUTTER_COLOR_Aluminium2      is export;
  our $MUTTER_CLUTTER_COLOR_Aluminium3      is export;
  our $MUTTER_CLUTTER_COLOR_Aluminium4      is export;
  our $MUTTER_CLUTTER_COLOR_Aluminium5      is export;
  our $MUTTER_CLUTTER_COLOR_Aluminium6      is export;
  our $MUTTER_CLUTTER_COLOR_Transparent     is export;

  INIT {
    $MUTTER_CLUTTER_COLOR_White            = Mutter::Clutter::Color.new(0xff, 0xff, 0xff, 0xff),   # white
    $MUTTER_CLUTTER_COLOR_Black            = Mutter::Clutter::Color.new(0x00, 0x00, 0x00, 0xff),   # black
    $MUTTER_CLUTTER_COLOR_Red              = Mutter::Clutter::Color.new(0xff, 0x00, 0x00, 0xff),   # red
    $MUTTER_CLUTTER_COLOR_DarkRed          = Mutter::Clutter::Color.new(0x80, 0x00, 0x00, 0xff),   # dark red
    $MUTTER_CLUTTER_COLOR_Green            = Mutter::Clutter::Color.new(0x00, 0xff, 0x00, 0xff),   # green
    $MUTTER_CLUTTER_COLOR_DarkGreen        = Mutter::Clutter::Color.new(0x00, 0x80, 0x00, 0xff),   # dark green
    $MUTTER_CLUTTER_COLOR_Blue             = Mutter::Clutter::Color.new(0x00, 0x00, 0xff, 0xff),   # blue
    $MUTTER_CLUTTER_COLOR_DarkBlue         = Mutter::Clutter::Color.new(0x00, 0x00, 0x80, 0xff),   # dark blue
    $MUTTER_CLUTTER_COLOR_Cyan             = Mutter::Clutter::Color.new(0x00, 0xff, 0xff, 0xff),   # cyan
    $MUTTER_CLUTTER_COLOR_DarkCyan         = Mutter::Clutter::Color.new(0x00, 0x80, 0x80, 0xff),   # dark cyan
    $MUTTER_CLUTTER_COLOR_Magenta          = Mutter::Clutter::Color.new(0xff, 0x00, 0xff, 0xff),   # magenta
    $MUTTER_CLUTTER_COLOR_DarkMagenta      = Mutter::Clutter::Color.new(0x80, 0x00, 0x80, 0xff),   # dark magenta
    $MUTTER_CLUTTER_COLOR_Yellow           = Mutter::Clutter::Color.new(0xff, 0xff, 0x00, 0xff),   # yellow
    $MUTTER_CLUTTER_COLOR_DarkYellow       = Mutter::Clutter::Color.new(0x80, 0x80, 0x00, 0xff),   # dark yellow
    $MUTTER_CLUTTER_COLOR_Gray             = Mutter::Clutter::Color.new(0xa0, 0xa0, 0xa4, 0xff),   # gray
    $MUTTER_CLUTTER_COLOR_DarkGray         = Mutter::Clutter::Color.new(0x80, 0x80, 0x80, 0xff),   # dark gray
    $MUTTER_CLUTTER_COLOR_LightGray        = Mutter::Clutter::Color.new(0xc0, 0xc0, 0xc0, 0xff),   # light gray
    $MUTTER_CLUTTER_COLOR_Butter           = Mutter::Clutter::Color.new(0xed, 0xd4, 0x00, 0xff),   # butter
    $MUTTER_CLUTTER_COLOR_LightButter      = Mutter::Clutter::Color.new(0xfc, 0xe9, 0x4f, 0xff),   # butter light
    $MUTTER_CLUTTER_COLOR_DarkButter       = Mutter::Clutter::Color.new(0xc4, 0xa0, 0x00, 0xff),   # butter dark
    $MUTTER_CLUTTER_COLOR_Orange           = Mutter::Clutter::Color.new(0xf5, 0x79, 0x00, 0xff),   # orange
    $MUTTER_CLUTTER_COLOR_LightOrange      = Mutter::Clutter::Color.new(0xfc, 0xaf, 0x3e, 0xff),   # orange light
    $MUTTER_CLUTTER_COLOR_DarkOrange       = Mutter::Clutter::Color.new(0xce, 0x5c, 0x00, 0xff),   # orange dark
    $MUTTER_CLUTTER_COLOR_Chocolate        = Mutter::Clutter::Color.new(0xc1, 0x7d, 0x11, 0xff),   # chocolate
    $MUTTER_CLUTTER_COLOR_LightChocolate   = Mutter::Clutter::Color.new(0xe9, 0xb9, 0x6e, 0xff),   # chocolate light
    $MUTTER_CLUTTER_COLOR_DarkChocolate    = Mutter::Clutter::Color.new(0x8f, 0x59, 0x02, 0xff),   # chocolate dark
    $MUTTER_CLUTTER_COLOR_Chameleon        = Mutter::Clutter::Color.new(0x73, 0xd2, 0x16, 0xff),   # chameleon
    $MUTTER_CLUTTER_COLOR_LightChameleon   = Mutter::Clutter::Color.new(0x8a, 0xe2, 0x34, 0xff),   # chameleon light
    $MUTTER_CLUTTER_COLOR_DarkChameleon    = Mutter::Clutter::Color.new(0x4e, 0x9a, 0x06, 0xff),   # chameleon dark
    $MUTTER_CLUTTER_COLOR_SkyBlue          = Mutter::Clutter::Color.new(0x34, 0x65, 0xa4, 0xff),   # sky blue
    $MUTTER_CLUTTER_COLOR_LightSkyBlue     = Mutter::Clutter::Color.new(0x72, 0x9f, 0xcf, 0xff),   # sky blue light
    $MUTTER_CLUTTER_COLOR_DarkSkyBlue      = Mutter::Clutter::Color.new(0x20, 0x4a, 0x87, 0xff),   # sky blue dark
    $MUTTER_CLUTTER_COLOR_Plum             = Mutter::Clutter::Color.new(0x75, 0x50, 0x7b, 0xff),   # plum
    $MUTTER_CLUTTER_COLOR_LightPlum        = Mutter::Clutter::Color.new(0xad, 0x7f, 0xa8, 0xff),   # plum light
    $MUTTER_CLUTTER_COLOR_DarkPlum         = Mutter::Clutter::Color.new(0x5c, 0x35, 0x66, 0xff),   # plum dark
    $MUTTER_CLUTTER_COLOR_ScarletRed       = Mutter::Clutter::Color.new(0xcc, 0x00, 0x00, 0xff),   # scarlet red
    $MUTTER_CLUTTER_COLOR_LightScarletRed  = Mutter::Clutter::Color.new(0xef, 0x29, 0x29, 0xff),   # scarlet red light
    $MUTTER_CLUTTER_COLOR_DarkScarletRed   = Mutter::Clutter::Color.new(0xa4, 0x00, 0x00, 0xff),   # scarlet red dark
    $MUTTER_CLUTTER_COLOR_Aluminium1       = Mutter::Clutter::Color.new(0xee, 0xee, 0xec, 0xff),   # aluminium 1
    $MUTTER_CLUTTER_COLOR_Aluminium2       = Mutter::Clutter::Color.new(0xd3, 0xd7, 0xcf, 0xff),   # aluminium 2
    $MUTTER_CLUTTER_COLOR_Aluminium3       = Mutter::Clutter::Color.new(0xba, 0xbd, 0xb6, 0xff),   # aluminium 3
    $MUTTER_CLUTTER_COLOR_Aluminium4       = Mutter::Clutter::Color.new(0x88, 0x8a, 0x85, 0xff),   # aluminium 4
    $MUTTER_CLUTTER_COLOR_Aluminium5       = Mutter::Clutter::Color.new(0x55, 0x57, 0x53, 0xff),   # aluminium 5
    $MUTTER_CLUTTER_COLOR_Aluminium6       = Mutter::Clutter::Color.new(0x2e, 0x34, 0x36, 0xff),   # aluminium 6
    $MUTTER_CLUTTER_COLOR_Transparent      = Mutter::Clutter::Color.new(0x00, 0x00, 0x00, 0x00)    #  transparent 
  }
}
