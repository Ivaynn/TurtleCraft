# Removes EVERYTHING and stops tc:main (by removing the tc.options scoreboard)

tellraw @a  ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"This data pack has been uninstalled. Use ","color":"gray"},{"text":"/reload","color":"dark_aqua","clickEvent":{"action":"suggest_command","value":"/reload"}},{"text":" to reinstall. To completely remove, delete it from this world's ","color":"gray"},{"text":"datapacks","color":"dark_aqua"},{"text":" folder before using ","color":"gray"},{"text":"/reload","color":"dark_aqua","clickEvent":{"action":"suggest_command","value":"/reload"}},{"text":" again. Turtles in loaded chunks have been removed and their items were dropped. Turtles in unloaded chunks stopped working but can't be removed.\n","color":"gray"}]

execute as @e[type=minecraft:llama,tag=tc.body] run function tc:entity/remove/init
kill @e[type=#tc:turtle_parts,tag=tc.turtle]

execute in minecraft:overworld run forceload remove 10028 10028
execute in minecraft:the_nether run forceload remove 10028 10028
execute in minecraft:the_end run forceload remove 10028 10028

scoreboard objectives remove tc.id
scoreboard objectives remove tc.update_id
scoreboard objectives remove tc.line
scoreboard objectives remove tc.timer
scoreboard objectives remove tc.fuel
scoreboard objectives remove tc.trigger
scoreboard objectives remove tc.math
scoreboard objectives remove tc.tmp
scoreboard objectives remove tc.options
scoreboard objectives remove tc.relog
scoreboard objectives remove tc.msg
scoreboard objectives remove tc.page
scoreboard objectives remove tc.numpad
