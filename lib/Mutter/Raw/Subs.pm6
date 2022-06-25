use v6.c;

unit package Meta::Raw::Subs;

role AnimatablePropertyMethod is export { }

multi sub trair_mod:<is> (Method \m, :$animatable is required) {
  m does AnimatablePropertyMethod;
}

sub removeAmbiguousDashes (@a) {
  @a.grep({
    /$prefix (.+?)/;
    my $mn = $0.Str;
    $mn = [ $mn, $mn ~~ tr/\-\_/_-/ ] if $mn.contains('-' | '_' ).so;
    |$mn
  });
}

sub findMethodsWithRole (\o, \r) {
  o.^methods.grep( * ~~ r )
            .map( *.name )
            .&removeAmbiguousDashes;
}

sub findMethodsWithPrefixes (\o, $prefix) is export {
  o.^methods
   .map( *.name )
   .&removeAmbiguousDashes
}
