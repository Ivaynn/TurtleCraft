# Executed by the player. All turtle components have tag "turtlecraft.tmp"
# Player must be holding a "writable_book"

# Input: none, just make sure the conditions above are met
# Output: storage turtlecraft:tmp book.return


# Convert string to json - this turns new lines into "\n"
data modify storage turtlecraft:tmp book.return set from entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw
execute as @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] run function turtlecraft:code/edit/change_arg/book/as_text


# Validate
function turtlecraft:code/edit/change_arg/book/validate
