# Admin function - executed by player directly at any time

scoreboard players set $egg_item_count tc.tmp 1
loot give @s loot tc:egg
scoreboard players reset $egg_item_count tc.tmp
playsound minecraft:entity.item.pickup neutral @s ~ ~ ~ 1 1.4
