# Executed by the player. All turtle components have tag "tc.tmp"
# Player must be holding a "writable_book"

# Input: none, just make sure the conditions above are met
# Output: storage tc:tmp book.return


# Convert string to json - this turns new lines into "\n"
data modify storage tc:tmp book.return set from entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw
execute as @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] run function tc:code/edit/change_arg/book/as_text


# Validate
function tc:code/edit/change_arg/book/validate
