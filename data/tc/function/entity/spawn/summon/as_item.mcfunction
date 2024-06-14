
data merge entity @s {Tags:["tc.turtle","tc.item","tc.tmp"], transformation:{translation:[-0.402f,-0.028f,0.028f],right_rotation:[1f,-1f,-1f,1f],left_rotation:[0f,0f,0f,1f],scale:[0.22f,0.22f,0.22f]}, item:{id:"minecraft:air",count:1b}}
scoreboard players operation @s tc.id = $new tc.id
scoreboard players operation @s tc.update_id = $update_id tc.tmp
