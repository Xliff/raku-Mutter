use v6.c;

use Mutter::Raw::Types;
use Mutter::Raw::Clutter::Script;

our subset MutterClutterScriptAncestry is export of Mu
  where MutterClutterScript | GObject;

class Mutter::Clutter::Script {
  has MutterClutterScript $!mcs is implementor;

  submethod BUILD ( :$mutter-clutter-script ) {
    self.setMutterClutterScript($mutter-clutter-script)
      if $mutter-clutter-script
  }

  method setMutterClutterScript (MutterClutterScriptAncestry $_) {
    my $to-parent;
    $!mcs = do {
      when MutterClutterScript {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(MutterClutterScript, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Mutter::Raw::Definitions::MutterClutterScript
    is also<MutterClutterScript>
  { $!mcs }

  multi method new (
    MutterClutterActorAncestry  $mutter-clutter-script,
                               :$ref                    = True
  ) {
    return Nil unless $mutter-clutter-script;

    my $o = self.bless( :$mutter-clutter-script );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $mutter-clutter-script = clutter_script_new();

    $mutter-clutter-script ?? self.bless( :$mutter-clutter-script ) !! Nil;
  }

  proto method add_search_paths (|)
  { * }

  multi method add_search_paths (@paths) {
    samewith( ArrayToCArray(Str, @paths), @paths.elems )
  }
  multi method add_search_paths (CArray[Str] $paths, Int() $n_paths) {
    my gsize $n = $n_paths;

    clutter_script_add_search_paths($!mcs, $paths, $n);
  }

  method clutter_get_script_id {
    clutter_get_script_id($!mcs);
  }

  method connect_signals (gpointer $user_data = gpointer) {
    clutter_script_connect_signals($!mcs, $user_data);
  }

  method connect_signals_full (&func, gpointer $user_data = gpointer) {
    clutter_script_connect_signals_full($!mcs, &func, $user_data);
  }

  method ensure_objects {
    clutter_script_ensure_objects($!mcs);
  }

  method error_quark is static {
    clutter_script_error_quark($!mcs);
  }

  method get_object (Str() $name, :$raw = False, :\type = GLib::Object) {
    propReturnObject(
      clutter_script_get_object($!mcs, $name),
      $raw,
      |type-pair.getTypePair
    );
  }

  method get_objects (Str() $first_name) {
    clutter_script_get_objects($!mcs, $first_name);
  }

  method get_translation_domain {
    clutter_script_get_translation_domain($!mcs);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &clutter_script_get_type, $n, $t );
  }

  method get_type_from_name (Str() $type_name) {
    clutter_script_get_type_from_name($!mcs, $type_name);
  }

  method list_objects {
    clutter_script_list_objects($!mcs);
  }

  method load_from_data (
    Str()                   $data,
    Int()                   $length,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    my gssize $l = $length;

    clear_error;
    my $ret = clutter_script_load_from_data($!mcs, $data, $length, $error);
    set_error($error);
    $ret;
  }

  method load_from_file (
    Str()                   $filename,
    CArray[Pointer[GError]] $error     = gerror
  ) {
    clear_error;
    my $ret = clutter_script_load_from_file($!mcs, $filename, $error);
    set_error($error);
    $ret;
  }

  method load_from_resource (
    Str()                   $resource_path,
    CArray[Pointer[GError]] $error          = gerror
  ) {
    clear_error;
    my $ret = clutter_script_load_from_resource($!mcs, $resource_path, $error);
    set_error($error);
    $ret;
  }

  method lookup_filename (Str() $filename) {
    clutter_script_lookup_filename($!mcs, $filename);
  }

  method set_translation_domain (Str() $domain) {
    clutter_script_set_translation_domain($!mcs, $domain);
  }

  method unmerge_objects (Int() $merge_id) {
    my guint $m = $merge_id;

    clutter_script_unmerge_objects($!mcs, $m);
  }

}
