title_index += 0.35
if (title_index >= 2)
    title_index = frac(title_index)
image_index = title * 2 + title_index
paletteselect = 0
vsp -= 1
y = ystart + vsp
if (alpha > 0)
    alpha -= 0.05
else
    instance_destroy()
