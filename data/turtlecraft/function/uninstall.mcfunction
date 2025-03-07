# Removes EVERYTHING and stops turtlecraft:main (by removing the turtlecraft.options scoreboard)

tellraw @a ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"This data pack has been uninstalled. Use ","color":"gray"},{"text":"/reload","color":"dark_aqua","clickEvent":{"action":"suggest_command","value":"/reload"}},{"text":" to reinstall. To completely remove, delete it from this world's ","color":"gray"},{"text":"datapacks","color":"dark_aqua"},{"text":" folder before using ","color":"gray"},{"text":"/reload","color":"dark_aqua","clickEvent":{"action":"suggest_command","value":"/reload"}},{"text":" again. Turtles in loaded chunks have been removed and their items were dropped. Turtles in unloaded chunks stopped working but can't be removed.\n","color":"gray"}]

execute as @e[type=minecraft:llama,tag=turtlecraft.body] run function turtlecraft:entity/remove/init
kill @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle]

execute in minecraft:overworld run forceload remove 10028 10028
execute in minecraft:the_nether run forceload remove 10028 10028
execute in minecraft:the_end run forceload remove 10028 10028

scoreboard objectives remove turtlecraft.id
scoreboard objectives remove turtlecraft.update_id
scoreboard objectives remove turtlecraft.line
scoreboard objectives remove turtlecraft.timer
scoreboard objectives remove turtlecraft.fuel
scoreboard objectives remove TurtleCraft
scoreboard objectives remove turtlecraft.math
scoreboard objectives remove turtlecraft.tmp
scoreboard objectives remove turtlecraft.options
scoreboard objectives remove turtlecraft.relog
scoreboard objectives remove turtlecraft.msg
scoreboard objectives remove turtlecraft.page
scoreboard objectives remove turtlecraft.numpad
scoreboard objectives remove turtlecraft.version
