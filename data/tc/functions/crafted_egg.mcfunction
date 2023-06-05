# Triggered by an advancement
advancement revoke @s only tc:craft_egg
advancement revoke @s only tc:craft_egg_deep

recipe take @s tc:turtle_egg
recipe take @s tc:deepslate_egg

playsound minecraft:entity.item.pickup neutral @s ~ ~ ~ 1 1.4


# Get number of eggs equal to crafted item count
execute store result score $egg_item_count tc.tmp run clear @s minecraft:knowledge_book
loot give @s loot tc:egg
scoreboard players reset $egg_item_count tc.tmp
