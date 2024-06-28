# Executed by the player. All turtle components have tag "tc.tmp"


# Conditions: argument id 1 and player is holding a writable book with content
execute unless score $argument tc.tmp matches 1 run return 0
execute unless data entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw run return run data modify storage tc:tmp list_start[-1].A.comment set value ""


# Convert string to json - this turns new lines into "\n"
data modify storage tc:tmp book.return set from entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw
execute as @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] run function tc:code/edit/change_arg/book/as_text


# Validate
function tc:code/edit/change_arg/book/validate


# Save
data modify storage tc:tmp list_start[-1].A.comment set from storage tc:tmp book.return


# Clear tmp
data remove storage tc:tmp book.return
scoreboard players reset $newline tc.tmp
scoreboard players reset $more_char tc.tmp
