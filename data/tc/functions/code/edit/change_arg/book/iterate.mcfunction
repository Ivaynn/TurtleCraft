# Executed by the player. All turtle components have tag "tc.tmp"


# Get the last 2 characters of the string (to check if they are "\n")
data modify storage tc:tmp book.test set string storage tc:tmp book.iterate -2


# Remove the last character of the string - if this fails, the string is empty
execute store success score $more_char tc.tmp run data modify storage tc:tmp book.iterate set string storage tc:tmp book.iterate 0 -1
execute if score $more_char tc.tmp matches 0 run return 0


# Check if the iterate string ends with a new line (extra \ to escape the first \)
execute store success score $newline tc.tmp if data storage tc:tmp {book:{test:"\\n"}}


# If it does, remove another character and update the string to save
execute if score $newline tc.tmp matches 1 run data modify storage tc:tmp book.iterate set string storage tc:tmp book.iterate 0 -1
execute if score $newline tc.tmp matches 1 run data modify storage tc:tmp book.return set from storage tc:tmp book.iterate


# Continue to the next iteration (if the function returns early, this doesn't run)
function tc:code/edit/change_arg/book/iterate
