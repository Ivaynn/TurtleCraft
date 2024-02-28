# Executed by the player. All turtle components have tag "tc.tmp"

# Input: none, just make sure the conditions above are met
# Output: storage tc:tmp book.return


# Convert string to json - this turns new lines into "\n"
data modify storage tc:tmp book.return set from entity @s SelectedItem.tag.pages[0]
execute as @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] run function tc:code/edit/change_arg/book/as_text


# Remove the quotes (first and last characters)
data modify storage tc:tmp book.return set string storage tc:tmp book.return 1 -1


# Iterate
data modify storage tc:tmp book.iterate set from storage tc:tmp book.return
function tc:code/edit/change_arg/book/iterate


# Clear tmp
scoreboard players reset $newline tc.tmp
scoreboard players reset $more_char tc.tmp
