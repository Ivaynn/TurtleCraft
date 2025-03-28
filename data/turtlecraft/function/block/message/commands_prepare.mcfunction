data merge storage turtlecraft:tmp {commands:[],torender:[[]]}
function #turtlecraft:command

# execute store result score commands turtlecraft.tmp run data get storage turtlecraft:tmp commands
function turtlecraft:block/message/commands
scoreboard players set symbols turtlecraft.tmp 34
scoreboard players set lines turtlecraft.tmp 0

tellraw @s ["                                                     ",{"text":"1 < 1 > 1","color":"gray"}]

tellraw @s [{"nbt":"torender[0]","storage":"turtlecraft:tmp","interpret":true}]
tellraw @s [{"nbt":"torender[1]","storage":"turtlecraft:tmp","interpret":true}]
tellraw @s [{"nbt":"torender[2]","storage":"turtlecraft:tmp","interpret":true}]
tellraw @s [{"nbt":"torender[3]","storage":"turtlecraft:tmp","interpret":true}]
# tellraw @s [{"nbt":"torender","storage":"turtlecraft:tmp","interpret":true}]

# tellraw @s ["\n",{"nbt":"torender","storage":"turtlecraft:tmp","interpret":false}]
# tellraw @s ["\n",{"nbt":"toproces","storage":"turtlecraft:tmp","interpret":false}]

scoreboard players reset symbols turtlecraft.tmp
scoreboard players reset chars turtlecraft.tmp
scoreboard players reset lines turtlecraft.tmp
data remove storage turtlecraft:tmp torender
data remove storage turtlecraft:tmp commands