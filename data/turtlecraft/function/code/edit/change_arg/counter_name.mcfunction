# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Figure out name source:
# 1: default, "name"
# 2: item ID (remove namespace)
# 3: item Name (convert from json)

scoreboard players set $name_src turtlecraft.tmp 1
execute if data entity @s SelectedItem.id run scoreboard players add $name_src turtlecraft.tmp 1
execute if data entity @s SelectedItem.components."minecraft:custom_name" run scoreboard players add $name_src turtlecraft.tmp 1
execute if predicate turtlecraft:holding_book if data entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw run scoreboard players set $name_src turtlecraft.tmp 4

execute if score $name_src turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp counter_name.name set value "name"
execute if score $name_src turtlecraft.tmp matches 2 run function turtlecraft:code/edit/change_arg/counter_name_id
execute if score $name_src turtlecraft.tmp matches 3 run data modify storage turtlecraft:tmp counter_name.name set from entity @s SelectedItem.components."minecraft:custom_name"


# Get name from book
execute if score $name_src turtlecraft.tmp matches 4 run function turtlecraft:code/edit/change_arg/book/init
execute if score $name_src turtlecraft.tmp matches 4 run data modify storage turtlecraft:tmp counter_name.name set from storage turtlecraft:tmp book.return


# If name is not json, use book validation
execute if score $name_src turtlecraft.tmp matches 3 run data modify storage turtlecraft:tmp counter_name.test set string storage turtlecraft:tmp counter_name.name 0 1
execute if score $name_src turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {counter_name:{test:'"'}} run function turtlecraft:code/edit/change_arg/counter_name_validate


# Clear tmp
scoreboard players reset $name_src turtlecraft.tmp
