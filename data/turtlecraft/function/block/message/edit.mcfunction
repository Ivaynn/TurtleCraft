data modify storage turtlecraft:tmp temp set from block ~ ~ ~ lock.components.minecraft:custom_data."turtlecraft.block".Instructions

scoreboard players set @s turtlecraft.s.page 1

tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s {"text":"\n Edit Instructions ","color":"dark_aqua"}

tellraw @s ["",{"text":"      "},{"text":"1","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"First page","color":"gray"}]}},{"text":" < ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"Previous page","color":"gray"}]}},{"score":{"name":"$current_page","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" > ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"Next page","color":"gray"}]}},{"score":{"name":"$last_page","objective":"turtlecraft.tmp"},"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"Last page","color":"gray"}]}},"      ",{"text":" ✕ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"Remove line","color":"red"}]}},{"text":" ✂ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"Cut","color":"gray"}]}},{"text":" 🗍 ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"Copy","color":"gray"}]}},{"text":" 🗐 ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"Paste","color":"gray"}]}},{"text":" ↑ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"Switch up","color":"gray"}]}},{"text":" ↓ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"Switch down","color":"gray"}]}},{"text":" ❏ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -1000"},"hoverEvent":{"action":"show_text","contents":[{"text":"Toggle Numpad","color":"gray"}]}}]
tellraw @s "\n"

scoreboard players set i turtlecraft.tmp 9
function turtlecraft:block/message/lines

function turtlecraft:block/message/commands_prepare

data remove storage turtlecraft:tmp temp
function turtlecraft:block/message/bar
