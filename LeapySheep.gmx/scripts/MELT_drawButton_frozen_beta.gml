///MELT_drawButton_frozen( x center , y center , width , height , text)
//                         0           1           2     3        4
border_width = 4

ret = false
draw_set_color(c_gray)

down=0

in = false

if abs( mouse_x - argument0 ) < argument2 / 2
&& abs( mouse_y - argument1 ) < argument3 / 2
    {
    in = true
    
    if mouse_check_button(1)
        {
        c_fill = c_dkgray
        c_border = c_white
        }
    else
        {
        c_fill = c_gray
        c_border = c_black
        }
    if mouse_check_button_released(1)
    ret = true
    }
else
    {
    c_fill = c_black
    c_border = c_white
    }
/*
draw_set_color(c_border)
draw_rectangle( 
    argument0 - argument2 / 2 - border_width ,
    argument1 - argument3 / 2 - border_width,
    argument0 + argument2 / 2 + border_width,
    argument1 + argument3 / 2 + border_width,
    false
    )
*/
draw_set_color(c_fill)  
draw_rectangle( 
    argument0 - argument2 / 2 ,
    argument1 - argument3 / 2 ,
    argument0 + argument2 / 2 ,
    argument1 + argument3 / 2 ,
    false
    )
draw_set_halign(fa_center)
draw_set_valign(fa_center)

draw_set_color(c_border) 

draw_text(argument0,argument1,argument4)

draw_set_color(c_yellow)
draw_text_transformed(argument0 - argument3 * .8,argument1-12,"Coming#Soon",.7,.7,45)

return ret
