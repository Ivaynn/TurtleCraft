
data merge entity @s {Tags:["tc.turtle","tc.base","tc.tmp"]}
scoreboard players operation @s tc.id = $new tc.id
scoreboard players operation @s tc.update_id = $update_id tc.tmp
