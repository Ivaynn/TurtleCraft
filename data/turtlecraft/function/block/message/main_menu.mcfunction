scoreboard players set @s turtlecraft.s.page 0

tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

tellraw @s [{"text":" Server","color":"dark_aqua"},{"text":" - ","color": "gray"},{"text":"Stoped","color":"red"}]
tellraw @s "\n"

scoreboard players set mode turtlecraft.tmp 0
execute at @s as @e[type=block_display,tag=turtlecraft.server,distance=..8] if score @s turtlecraft.s.id = @n[type=player] turtlecraft.s.id at @s as @n[type=block_display] positioned ~.1 ~.1 ~.1 align xyz run execute store result score mode turtlecraft.tmp run scoreboard players get @s turtlecraft.s.mode
execute at @s as @e[type=block_display,tag=turtlecraft.server,distance=..8] if score @s turtlecraft.s.id = @n[type=player] turtlecraft.s.id at @s positioned ~.5 ~1 ~.5 as @n[type=text_display] run data merge entity @s {text:'{"text":""}'}

execute if score mode turtlecraft.tmp matches 0 run tellraw @s ["               ",{"text":"START","color":"dark_green","clickEvent": {"action": "run_command","value": "/trigger TurtleCraft set -1019"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to start","color":"gray"}]}}]
execute if score mode turtlecraft.tmp matches 1 run tellraw @s ["               ",{"text":"STOP","color":"red","clickEvent": {"action": "run_command","value": "/trigger TurtleCraft set -1019"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to stop","color":"gray"}]}}]

scoreboard players reset mode turtlecraft.tmp
function turtlecraft:block/message/bar