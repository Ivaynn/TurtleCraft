# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Conditions: argument id 1 and player is holding a writable book with content
execute unless score $argument turtlecraft.tmp matches 1 run return 0
execute unless data entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw run return run data modify storage turtlecraft:tmp list_start[-1].A.comment set value ""


# Get data
data modify storage turtlecraft:tmp book.return set from entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw


# Validate
function turtlecraft:code/edit/change_arg/book/validate


# Save
data modify storage turtlecraft:tmp list_start[-1].A.comment set from storage turtlecraft:tmp book.return


# Clear tmp
data remove storage turtlecraft:tmp book.return
scoreboard players reset $more_char turtlecraft.tmp
