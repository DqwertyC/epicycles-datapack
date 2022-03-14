# Amplitude of each epicycle, in thousandths of a block
data modify storage epicycle configs.selected.amp set value [I;1000,3000,10000]
# Angular velocity of each epicycle, in thousandths of a degree
data modify storage epicycle configs.selected.freq set value [I;2000,-1000,1000]
# Starting angle of each epicycle, in thousandths of a degree
data modify storage epicycle configs.selected.offset set value [I;-15000,45000,0]