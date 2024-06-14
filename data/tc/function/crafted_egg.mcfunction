# Triggered by an advancement
advancement revoke @s only tc:craft_egg


# This function gets executed once for every item crafted
# When shift-clicking, it runs up to 64 times in one tick
clear @s minecraft:knowledge_book[minecraft:custom_data={tc:"craft_book"}]
loot give @s loot tc:egg
