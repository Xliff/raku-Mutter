use v6.c;

unit package Mutter::Raw::Subs;

role AnimatablePropertyMethod is export { }

multi sub trait_mod:<is> (Method \m, :$animatable is required) is export {
  m does AnimatablePropertyMethod;
}

sub swapDashes (@a, $prefix = '') {
  @a.map({
    /$prefix (.+?)/;
    my $mn = $0.Str;
    $mn = [ $mn, $mn ~~ tr/\-_/_-/ ] if $mn.contains('-' | '_' ).so;
    |$mn
  });
}

# cw: This is supposed to return a list with both forms of dashes.

sub findMethodsWithRole (\o, \r) is export {
  o.^methods.grep( * ~~ r ).map( *.name ).&swapDashes;
}

# cw: This is supposed to return a list with both forms of dashes.
sub findMethodsWithPrefixes (\o, $prefix) is export {
  my $m = |o.^methods.map( *.name ).grep( *.starts-with($prefix) );
  $m.&swapDashes($prefix);
}
