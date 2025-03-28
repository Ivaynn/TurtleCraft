

# Scores
scoreboard players add $new turtlecraft.id 1
scoreboard players add $turtle_count turtlecraft.id 1
scoreboard players operation $update_id turtlecraft.tmp = $new turtlecraft.id
scoreboard players operation $update_id turtlecraft.tmp %= #100 turtlecraft.math


# Summon visual entities
execute align xyz positioned ~0.5 -1000 ~0.5 summon minecraft:block_display run function turtlecraft:entity/spawn/summon/as_block
execute align xyz positioned ~0.5 -1000 ~0.5 summon minecraft:item_display run function turtlecraft:entity/spawn/summon/as_item
execute align xyz positioned ~0.5 -1000 ~0.5 run summon minecraft:text_display ~ ~ ~ {Tags:["turtlecraft.turtle","turtlecraft.text","turtlecraft.tmp","turtlecraft.new"], billboard:"center", alignment:"center", see_through:0b, text:{"text":""}}
execute align xyz positioned ~0.5 -1000 ~0.5 as @e[distance=..0.1,limit=1,type=minecraft:text_display,tag=turtlecraft.text,tag=turtlecraft.new] run function turtlecraft:entity/spawn/summon/as_text


# Summon llama
execute align xyz positioned ~0.5 ~-1 ~0.5 summon minecraft:block_display run function turtlecraft:entity/spawn/summon/as_base
execute align xyz positioned ~0.5 -1000 ~0.5 summon minecraft:llama run function turtlecraft:entity/spawn/summon/as_body


# Clear tmp
scoreboard players reset $update_id turtlecraft.tmp
