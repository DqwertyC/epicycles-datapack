data modify storage epicycle controls.was_running set from storage epicycle controls.running
execute if data storage epicycle controls.was_running run data remove storage epicycle controls.running
execute unless data storage epicycle controls.was_running run data modify storage epicycle controls.running set value 1b
data remove storage epicycle controls.was_running