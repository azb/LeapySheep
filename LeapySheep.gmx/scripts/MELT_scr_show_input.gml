///scr_show_input(input text)

nm = instance_create(room_width / 2,room_height / 2,MELT_obj_input)

with nm
    {
    text = argument0
    }

return nm
