
# data merge entity @s {Tags:["tc.turtle","tc.text","tc.tmp"], billboard:"center", alignment:"center", see_through:0b, text:'{"text":""}'}
tag @s remove tc.new
scoreboard players operation @s tc.id = $new tc.id
scoreboard players operation @s tc.update_id = $update_id tc.tmp
