use v6;

sub main-context {
}

sub USAGE {
  my ($pre, %pre-opts) = (False);

  my @l = (
    do for $*USAGE.lines -> $l {
      my $line = $l;
      next unless $line.trim.chars;
      if $l ~~ /^ \s* ('<' <[A..Z]>\w+? '>') .+? $/ -> $m {
        %pre-opts{ $m[0] } = $m.Str;
        $m.gist.say;
        next;
      } else {
        $pre .= not;
      }
      if $l ~~ / '-- ' (.+?) $/ -> $m {
        if $m[0] -> $rn {
          my $realName = $rn.Str;
          $realName ~= "|{ $rn.subst('-', '_', :g) }" if $rn.contains('-');
          $line.substr-rw($m.from, $m.to - $m.from) = '';
          $line ~~ s/'<cmd>'/$realName/;
        }
      }
      $line;
    }
  );
  for @l -> $l is rw {
    for %pre-opts.keys {
      if $l.contains($_) {
        $l ~= "\n{ %pre-opts{$_} }";
      }
    }
  }
  say @l.head ~ "\n" ~ @l[1..*].sort.join("\n");
}

proto sub MAIN (|) {
  my $*data = {};

  {*}

  main-context;
}

multi sub MAIN ('sync') {
  #use GDK::Display;

  #GDK::Display::Default.sync;
}

multi sub MAIN (
  'create',
  $id,
  $CreateOpt where 'override' | 'csd' #= override | csd
) {
}

#| set-parent
multi sub MAIN ($cmd where 'set-parent' | 'set_parent', $id) {
}

#| set-parent-exported
multi sub MAIN (
  $cmd where 'set_parent_exported' | 'set-parent-exported',
  $id,
  $pid
) {

}

#| accept-focus
multi sub MAIN (
        $cmd where 'accept-focus' | 'accept_focus',
        $id,
  Bool :$take-focus!
) {
  samewith($cmd, $id, $take-focus);
}
#| accept-focus
multi sub MAIN (
       $cmd where 'accept-focus' | 'accept_focus',
       $id,
  Bool $take-focus
) {
}

#| can-take-focus
multi sub MAIN (
        $cmd where 'can-take-focus' | 'can_take_focus',
        $id,
  Bool :$take-focus!
) {
  samewith($cmd, $id, $take-focus);
}
#| can-take-focus
multi sub MAIN (
       $cmd where 'can-take-focus' | 'can_take_focus',
       $id,
  Bool $take-focus
) {
}

#| accept-take-focus
multi sub MAIN (
        $cmd where 'accept-take-focus' | 'accept_take_focus',
        $id,
  Bool :$take-focus!
) {
  samewith($cmd, $id, $take-focus);
}
#| accept-take-focus
multi sub MAIN (
       $cmd where 'accept-take-focus' | 'accept_take_focus',
       $id,
  Bool $take-focus
) {
}

multi sub MAIN ('show', $id) {
}

multi sub MAIN ('hide', $id) {
}

multi sub MAIN ('activate', $id) {
}

multi sub MAIN ('resize', Int() $width, Int() $height) {
}

multi sub MAIN ('raise', $id) {
}

multi sub MAIN ('lower', $id) {
}

multi sub MAIN ('destroy', $id) {
}

#| destroy-all
multi sub MAIN ($cmd where 'destroy-all' | 'destroy_all') {
}

multi sub MAIN ('minimize', $counter, $value) {
}

multi sub MAIN ('minimize', $id) {
}

multi sub MAIN ('maximize', $id) {
}

multi sub MAIN ('unmaximize', $id) {
}

multi sub MAIN ('fullscreen', $id) {
}

multi sub MAIN ('unfullscreen', $id) {
}

multi sub MAIN ('freeze', $id) {
}

multi sub MAIN ('thaw', $id) {
}

#| assert-size
multi sub MAIN (
  $cmd where 'assert-size' | 'assert_size',
  $id,
  $width,
  $height
) {
}

#| stop-after-next
multi sub MAIN ($cmd where 'stop-after-next' | 'stop_after_next') {
}

multi sub MAIN ('continue') {
}

multi sub MAIN ('clipboard-set', $mime-type, $text) {
}
