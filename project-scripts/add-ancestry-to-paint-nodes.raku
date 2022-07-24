use v6;

sub MAIN (
  $file = 'lib/Mutter/Clutter/PaintNodes.pm6'
) {
  my $fio      = $file.IO;
  my $contents = $fio.slurp;

  my token classname { [ \w+ ]+ % '::' }
  my token typename  { \w+ }

  my rule classdef  {
    'class' <classname> is <classname> '{'
      'has' <typename> '$!'<[\w\-]>+ 'is implementor;'
  }

  my $matches = $contents ~~ m:g/<classdef>/;

  for $matches.map( *<classdef> ).reverse[] {
    .gist.say;
    say "{ .from } - { .to }";

    my $class-def := $contents.substr-rw( .from, ( .to - .from ) - 2 );

    my $tn = .<typename>.Str;
    $class-def = qq:to/ANCESTRY/;

    our subset { $tn }Ancestry is export of Mu
      where { $tn } | MutterClutterPaintNodeAncestry;

    { $class-def.chomp }
      submethod BUILD ( :\$mutter-clutter-spec-node ) \{
        self.set{ $tn }(\$mutter-clutter-spec-node)
          if \$mutter-clutter-spec-node;
      \}

      method set{ $tn } ({ $tn }Ancestry \$_) \{
        my \$to-parent;

        \$!mcspn = do \{
          when { $tn } \{
            \$to-parent = cast(MutterClutterPaintNode, \$_);
            \$_;
          \}

          default \{
            \$to-parent = \$_;
            cast({ $tn }, \$_);
          \}
        \}
        self.setMutterClutterPaintNode(\$to-parent);
      \}

      method Mutter::Clutter::Raw::Definitions::{ $tn }
      \{ \$!mcspn \}

      multi method new ({ $tn }Ancestry \$mutter-clutter-spec-node, :\$ref = True) \{
        return unless \$mutter-clutter-spec-node;

        my \$o = self.bless( :\$mutter-clutter-spec-node );
        \$o.ref if \$ref;
        \$o;
      \}

    ANCESTRY

  }

  $fio.rename( $fio.absolute ~ '.ancestry.bak' );
  $fio.spurt($contents);
}
