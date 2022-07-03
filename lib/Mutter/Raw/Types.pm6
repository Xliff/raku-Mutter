use v6;

use GLib::Raw::Exports;
use ATK::Raw::Exports;
use GIO::Raw::Exports;
use JSON::GLib::Raw::Exports;
use Pango::Raw::Exports;
use Graphene::Raw::Exports;
use Mutter::Raw::Exports;

unit package Mutter::Raw::Types;

need GLib::Raw::Definitions;
need GLib::Raw::Enums;
need GLib::Raw::Exceptions;
need GLib::Raw::Object;
need GLib::Raw::Structs;
need GLib::Raw::Subs;
need GLib::Raw::Struct_Subs;
need GLib::Roles::Pointers;
need ATK::Raw::Definitions;
need ATK::Raw::Enums;
need ATK::Raw::Structs;
need JSON::GLib::Raw::Definitions;
need GIO::Raw::Definitions;
need GIO::Raw::Enums;
need GIO::Raw::Quarks;
need GIO::Raw::Structs;
need GIO::Raw::Subs;
need GIO::DBus::Raw::Types;
need GIO::Raw::Exports;
need Graphene::Raw::Exports;
need Pango::Raw::Definitions;
need Pango::Raw::Enums;
need Pango::Raw::Structs;
need Pango::Raw::Subs;
need Graphene::Raw::Definitions;
need Mutter::Raw::Definitions;
need Mutter::Raw::Enums;
need Mutter::Raw::Subs;
need Mutter::Raw::Structs;

BEGIN {
  glib-re-export($_) for |@glib-exports,
                         |@atk-exports,
                         |@jg-exports,
                         |@gio-exports,
                         |@pango-exports,
                         |@graphene-exports,
                         |@mutter-exports;
}
