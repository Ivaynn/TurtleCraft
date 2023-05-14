
data merge entity @s {Tags:["tc.turtle","tc.block","tc.tmp"], transformation:{scale:[0.75f,0.75f,0.75f], translation:[-0.375f,-0.375f,-0.375f]}, block_state:{Name:"minecraft:observer"}}
scoreboard players operation @s tc.id = $new tc.id
scoreboard players operation @s tc.update_id = $update_id tc.tmp
