summon armor_stand ~ ~ ~ {NoAI:1b,Size:0b,Invulnerable:1b,Silent:1b,Small:1b,Invisible:1b,Tags:["epi_point","newest"]}
summon slime ~ ~ ~ {NoAI:1b,NoGravity:1b,Silent:1b,Size:0b,Invulnerable:1b,Tags:["epi_mob","invisible","newest"]}

#item replace entity @e[tag=epi_point,tag=newest] armor.head with minecraft:magenta_glazed_terracotta

# Set id/index for this armor stand
scoreboard players operation @e[tag=epi_point,tag=newest] epi_id = EpiGen epi_id
scoreboard players operation @e[tag=epi_point,tag=newest] epi_index = EpiGen epi_index
scoreboard players operation @e[tag=epi_point,tag=newest] epi_target = EpiGen epi_index
scoreboard players remove @e[tag=epi_point,tag=newest] epi_target 1

# Set id/index for the mob that follows this armor stand around...
scoreboard players operation @e[tag=epi_mob,tag=newest] epi_id = EpiGen epi_id
scoreboard players operation @e[tag=epi_mob,tag=newest] epi_index = EpiGen epi_index

scoreboard players add EpiGen epi_index 1

# Set epicycle data for this armor stand
execute store result score @e[tag=epi_point,tag=newest] epi_amp run data get storage minecraft:epicycle configs.working.amp[-1] 1
execute store result score @e[tag=epi_point,tag=newest] epi_freq run data get storage minecraft:epicycle configs.working.freq[-1] 1
execute store result score @e[tag=epi_point,tag=newest] epi_offset run data get storage minecraft:epicycle configs.working.offset[-1] 1
scoreboard players operation @e[tag=epi_point,tag=newest] epi_rot_y = @e[tag=epi_point,tag=newest,limit=1] epi_offset

# Remove data from the queue
data remove storage minecraft:epicycle configs.working.amp[-1]
data remove storage minecraft:epicycle configs.working.freq[-1]
data remove storage minecraft:epicycle configs.working.offset[-1]

tag @e[tag=epi_point,tag=newest] remove newest
tag @e[tag=epi_mob,tag=newest] remove newest
execute if data storage epicycle configs.working.amp[0] run function epi_draw:init_loop_a