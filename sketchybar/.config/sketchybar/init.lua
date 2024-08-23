---@diagnostic disable: lowercase-global
require("install.sbar")

sbar = require("sketchybar")

sbar.begin_config()
sbar.hotload(true)

require("constants")
require("default")
require("bar")
require("items")

sbar.end_config()
sbar.event_loop()
