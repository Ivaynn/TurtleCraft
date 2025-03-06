
data merge entity @s {Tags:["turtlecraft.turtle","turtlecraft.item","turtlecraft.tmp"], transformation:{translation:[-0.402f,-0.028f,0.028f],right_rotation:[1f,-1f,-1f,1f],left_rotation:[0f,0f,0f,1f],scale:[0.88f,0.88f,0.88f]}, view_range:0f, item:{id:"minecraft:stone_button",count:1b}}
scoreboard players operation @s turtlecraft.id = $new turtlecraft.id
scoreboard players operation @s turtlecraft.update_id = $update_id turtlecraft.tmp
