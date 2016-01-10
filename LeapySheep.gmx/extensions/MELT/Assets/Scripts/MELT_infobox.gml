///MELT_infobox(text,x,y)

temp_w = string_width(argument0)
temp_h = string_height(argument0)
if argument1 = 0
    {
    temp_x = mouse_x+8
    temp_y = mouse_y+20
    }
else
    {
    temp_x=argument1
    temp_y=argument2
    }
temp_border = 4
draw_set_alpha(1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_yellow)
draw_rectangle(temp_x-temp_border,temp_y-temp_border,temp_x+string_width(argument0)+8+temp_border,
    temp_y+temp_h+temp_border,0)
draw_set_color(c_black)
draw_rectangle(temp_x-temp_border,temp_y-temp_border,temp_x+string_width(argument0)+8+temp_border,
    temp_y+temp_h+temp_border,1)
draw_set_color(c_black)
draw_text(temp_x,temp_y,argument0)
