///MELT_checkbox_frozen(spr,x,y,w,h,var,name)//
//                      0   1 2 3 4 5     6
draw_set_color(c_black)
temp_subimg=argument5

temp_str=argument6

down=0 draw_set_alpha(1)
draw_sprite_stretched_ext(argument0,0,argument1,argument2,argument3,argument4,c_white,1)

if mouse_x>argument1 if mouse_y>argument2 
if mouse_x<argument1+argument3 if mouse_y<argument2+argument4 
{
if mouse_check_button_released(1) {down=1} else down=0
if mouse_check_button(1)
{draw_sprite_stretched_ext(argument0,2,argument1,argument2,argument3,argument4,c_white,1)}
else {draw_sprite_stretched_ext(argument0,1,argument1,argument2,argument3,argument4,c_white,1)}

}
draw_set_halign(fa_left) draw_set_valign(fa_center)
draw_text(argument1+argument3+8,argument2+argument4/2,argument6)

draw_sprite_stretched_ext(argument0,3+temp_subimg,argument1,argument2,argument3,argument4,c_white,1)

return down
/*
if down=1
return !temp_subimg
else
return temp_subimg
