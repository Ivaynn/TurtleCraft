# execute store result score line turtlecraft.tmp run data get block ~ ~ ~ lock.components.minecraft:custom_data."turtlecraft.block".line
scoreboard players add @s turtlecraft.s.line 1

data merge storage turtlecraft:tmp {temp:{1:"data modify storage turtlecraft:tmp temp.2 set from block ~ ~ ~ lock.components.minecraft:custom_data.\"turtlecraft.block\".Instructions[",2:"",3:"].text",4:"",5:""}}
execute store result storage turtlecraft:tmp temp.2 int 1 run scoreboard players get @s turtlecraft.s.line
function turtlecraft:block/concat with storage turtlecraft:tmp temp

# tellraw @a {"nbt":"{}","storage":"turtlecraft:tmp","color": "green"}

data merge storage turtlecraft:tmp {temp:{1:"function turtlecraft:commands/",3:"",4:"",5:""},execute:1b}
execute positioned ~.5 ~1 ~.5 as @n[type=text_display] positioned ~-.5 ~-1 ~-.5 run function turtlecraft:block/concat with storage turtlecraft:tmp temp

data remove storage turtlecraft:tmp temp
data remove storage turtlecraft:tmp execute

# tellraw @a {"score":{"name":"@s","objective":"turtlecraft.s.mode"}}

execute store result score line turtlecraft.tmp run data get block ~ ~ ~ lock.components.minecraft:custom_data."turtlecraft.block".Instructions
execute if score @s turtlecraft.s.line >= line turtlecraft.tmp run scoreboard players set @s turtlecraft.s.mode 0
# execute if score @s turtlecraft.s.line >= line turtlecraft.tmp run say hi
# execute if score @s turtlecraft.s.line >= line turtlecraft.tmp run tellraw @a {"text": "reset","color": "red"}
execute if score @s turtlecraft.s.line >= line turtlecraft.tmp run scoreboard players reset @s turtlecraft.s.line
execute positioned ~.5 ~1 ~.5 as @n[type=text_display] run data merge entity @s {text:'{"text":"Done!","color":"green"}'}

scoreboard players reset line turtlecraft.tmp