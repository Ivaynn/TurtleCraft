# Executed by the player. All turtle components have tag "tc.tmp"


# Get the last characters of the string (reset on new iteration to avoid issues)
data modify storage tc:tmp book.last1 set value ""
data modify storage tc:tmp book.last2 set value ""
data modify storage tc:tmp book.last1 set string storage tc:tmp book.iterate -1
data modify storage tc:tmp book.last2 set string storage tc:tmp book.iterate -2


# Remove the last character of the string - if this fails, the string is empty
execute store success score $more_char tc.tmp run data modify storage tc:tmp book.iterate set string storage tc:tmp book.iterate 0 -1


# ERROR: First line is empty (no more characters and the previous iteration was a new line)
execute if score $more_char tc.tmp matches 0 if score $newline tc.tmp matches 1 run scoreboard players set $newline tc.tmp -1


# ERROR: The string contains "{" (causes json errors when displaying the interpreted string)
execute if data storage tc:tmp {book:{last1:"{"}} run scoreboard players set $newline tc.tmp -1


# Return early. For newline == -1 (errors), return a default string "_"
execute if score $newline tc.tmp matches -1 run data modify storage tc:tmp book.return set value "_"
execute if score $newline tc.tmp matches -1 run return 0
execute if score $more_char tc.tmp matches 0 run return 0


# If the string ends with a new line (extra \ to escape the first \), remove another character and update the return string
execute store success score $newline tc.tmp if data storage tc:tmp {book:{last2:"\\n"}}
execute if score $newline tc.tmp matches 1 run data modify storage tc:tmp book.iterate set string storage tc:tmp book.iterate 0 -1
execute if score $newline tc.tmp matches 1 run data modify storage tc:tmp book.return set from storage tc:tmp book.iterate


# Continue to the next iteration (if the function returns early, this doesn't run)
function tc:code/edit/change_arg/book/iterate
