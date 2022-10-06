package = "moonscript-template"
version = "dev-1"
source  = {
  url = "https://github.com/wauterboi/moonscript-template"
}
description = {
  author    = "wauterboi"
  homepage  = "https://github.com/" ..
    description.author ..
    "/" ..
    description.package,
  license   = "GNU General Public License v3.0"
}
dependencies = {
  "moonscript ~> 0.5",
  "ldoc ~> 1.4.6"
}
build = {
  type = "make",
  build_variables = {
    CFLAGS      = "$(CFLAGS)",
    LIBFLAG     = "$(LIBFLAG)",
    LUA_LIBDIR  = "$(LUA_LIBDIR)",
    LUA_BINDIR  = "$(LUA_BINDIR)",
    LUA_INCDIR  = "$(LUA_INCDIR)",
    LUA         = "$(LUA)",
    MOONC       = "moonc"
  },
  install_variables = {
    INST_PREFIX   = "$(PREFIX)",
    INST_BINDIR   = "$(BINDIR)",
    INST_LIBDIR   = "$(LIBDIR)",
    INST_LUADIR   = "$(LUADIR)",
    INST_CONFDIR  = "$(CONFDIR)"
  }
}
