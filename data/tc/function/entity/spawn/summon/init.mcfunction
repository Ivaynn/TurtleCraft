

# Scores
scoreboard players add $new tc.id 1
scoreboard players add $turtle_count tc.id 1
scoreboard players operation $update_id tc.tmp = $new tc.id
scoreboard players operation $update_id tc.tmp %= #100 tc.math


# Summon visual entities
execute align xyz positioned ~0.5 -1000 ~0.5 summon minecraft:block_display run function tc:entity/spawn/summon/as_block
execute align xyz positioned ~0.5 -1000 ~0.5 summon minecraft:item_display run function tc:entity/spawn/summon/as_item
execute align xyz positioned ~0.5 -1000 ~0.5 run summon minecraft:text_display ~ ~ ~ {Tags:["tc.turtle","tc.text","tc.tmp","tc.new"], billboard:"center", alignment:"center", see_through:0b, text:'{"text":""}'}
execute align xyz positioned ~0.5 -1000 ~0.5 as @e[distance=..0.1,limit=1,type=minecraft:text_display,tag=tc.text,tag=tc.new] run function tc:entity/spawn/summon/as_text


# Summon llama
execute align xyz positioned ~0.5 ~-1 ~0.5 summon minecraft:block_display run function tc:entity/spawn/summon/as_base
execute align xyz positioned ~0.5 -1000 ~0.5 summon minecraft:llama run function tc:entity/spawn/summon/as_body


# Clear tmp
scoreboard players reset $update_id tc.tmp
