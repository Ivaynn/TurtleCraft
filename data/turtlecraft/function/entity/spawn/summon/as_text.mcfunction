
# data merge entity @s {Tags:["turtlecraft.turtle","turtlecraft.text","turtlecraft.tmp"], billboard:"center", alignment:"center", see_through:0b, text:'{"text":""}'}
tag @s remove turtlecraft.new
scoreboard players operation @s turtlecraft.id = $new turtlecraft.id
scoreboard players operation @s turtlecraft.update_id = $update_id turtlecraft.tmp
