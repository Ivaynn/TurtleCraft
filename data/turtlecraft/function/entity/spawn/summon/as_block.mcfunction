
data merge entity @s {Tags:["turtlecraft.turtle","turtlecraft.block","turtlecraft.tmp"], transformation:{scale:[0.75f,0.75f,0.75f], translation:[-0.375f,-0.375f,-0.375f]}, block_state:{Name:"minecraft:observer"}}
scoreboard players operation @s turtlecraft.id = $new turtlecraft.id
scoreboard players operation @s turtlecraft.update_id = $update_id turtlecraft.tmp
