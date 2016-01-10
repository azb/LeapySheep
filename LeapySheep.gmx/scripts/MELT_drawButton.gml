///MELT_drawButton( x center , y center , width , height , text)
//                 0           1           2     3        4
border_width = 4
draw_set_alpha(1)
ret = false
draw_set_color(c_gray)

var melt_exists = instance_exists(MELT_control)

if melt_exists
if MELT_control.alarm[0] = 1
    {
    //MELT INTERFACES!!!
    with MELT_control
        {
        new = MELT_scr_gui_add(mouse_x,mouse_y,argument2,argument3,"gui_button")
        global.GUI_text[new] = argument4
        global.GUI_x[new] = argument0
        global.GUI_y[new] = argument1
        }
    repeat(10)
    effect_create_above(ef_cloud,argument0+random(20)-10,argument1+random(20)-10,0,c_dkgray)
    }

down=0

var ok = 1
if melt_exists
if MELT_control.melted
ok = 0

in = false

if ok
{
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
}
    
return ret
