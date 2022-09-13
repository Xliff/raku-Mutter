use v6.c;

class Mutter::Meta::Later {
  also does GLib::Roles::Object;

  has MetaLaters $!later is implementor;

  method add (
    Int()    $when,
             &func,
    gpointer $user_data = gpointer
             &notify    = %DEFAULT-CALLBACKS<GDestroyNotify>
  ) {
    my MetaLaterType $w = $when;

    meta_laters_add($!ml, $w, &func, $user_data, &notify);
  }

  # cw: 'is static' is not dispatch level, so we drop back to type smileys.
  method add (
    ::?CLASS:U

             &func,
    gpointer $data   = gpointer,
             &notify = %DEFAULT-CALLBACKS<GDestroyNotify>
  ) {
    meta_later_add(&func, $data, &notify);
  }

  # cw: 'is static' is not dispatch level, so we drop back to type smileys.
  multi method remove (::?CLASS:U Int() $later_id) {
    my guint $l = $later_id;

    meta_later_remove($!ml);
  }

  multi method remove (gint $later_id) {
    my guint $l = $later_id;

    meta_laters_remove($!ml, $l);
  }

}

### /usr/src/mutter-42.1/src/meta/meta-later.h

sub meta_later_add (
  MetaLaterType $when,
                &func (gpointer --> gint),  #= GSourceFunc
  gpointer      $data,
                &notify
)
  returns guint
  is native(mutter)
  is export
{ * }

sub meta_laters_add (
  MetaLaters    $laters,
  MetaLaterType $when,
                &func (gpointer --> gint),  #= GSourceFunc
  gpointer      $user_data,
                &notify
)
  returns gint
  is native(mutter)
  is export
{ * }

sub meta_laters_remove (MetaLaters $laters, gint $later_id)
  is native(mutter)
  is export
{ * }

sub meta_later_remove (guint $later_id)
  is native(mutter)
  is export
{ * }
