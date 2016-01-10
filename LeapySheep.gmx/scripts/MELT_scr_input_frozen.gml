///MELT_scr_input_frozen(xcenter,ycenter,w,h,strvar,deftext,pswrdbx,sln)
//                       0       1       2 3 4      5       6       7
inputx=argument0
inputy=argument1
inputwidth=argument2
inputheight=argument3
inputvar=argument4
inputdeftext=argument5
inputpass=argument6
slid = argument7
    
if sln = slid
{
//scr_touch_keyboard()
draw_set_color(c_aqua)
inputvar = keyboard_string
}
else
draw_set_color(c_ltgray)

draw_rectangle(inputx-inputwidth/2+2,inputy-inputheight/2+2,inputx+inputwidth/2-2,inputy+inputheight/2-2,0)

draw_set_color(c_black)
draw_rectangle(inputx-inputwidth/2+2,inputy-inputheight/2+2,inputx+inputwidth/2-2,inputy+inputheight/2-2,1)

if sln = slid
draw_set_color(c_aqua)
//else
//draw_set_color(c_black)
//draw_rectangle(inputx-inputwidth/2+2,inputy-inputheight/2+2,inputx+inputwidth/2-2,inputy+inputheight/2-2,1)

if mouse_check_button_pressed(1) || mouse_check_button_released(1)
//if !scr_in_mouse_zone()
    {
    if MELT_inregion(mouse_x,mouse_y,inputx-inputwidth/2-2,inputy-inputheight/2-2,inputx+inputwidth/2+2,inputy+inputheight/2+2,0)
        {
        sln = slid
        keyboard_string = inputvar
        }
    else
        {
        if sln = slid
            sln = -1
        }
    }
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_black)
if sln = slid
    {
    if inputpass
        {
        var tstr = ""
        repeat(string_length(inputvar))
            {
            tstr += "*"
            }
        draw_text(inputx,inputy,tstr+cb)
        }
    else
        {
        draw_text(inputx,inputy,inputvar+cb)
        }
    }
else
    {
    if inputvar > ""
        {
        draw_set_color(c_black)
        //draw_text(inputx,inputy,inputvar)
        if inputpass
            {
            var tstr = ""
            repeat(string_length(inputvar))
                {
                tstr += "*"
                }
            draw_text(inputx,inputy,tstr)
            }
        else
            {
            draw_text(inputx,inputy,inputvar)
            }
        }
    else
        {
        draw_set_color(c_gray)
        draw_text(inputx,inputy,inputdeftext)
        }
    }

return inputvar
/*
if sln=argument7 
{
draw_set_color(c_aqua) draw_set_alpha(.8)
draw_rectangle(inputx-inputwidth/2+2,inputy-inputheight/2+2,inputx+inputwidth/2-2,inputy+inputheight/2-2,1)
}
else
if inregion(mouse_x,mouse_y,inputx-inputwidth/2-2,inputy-inputheight/2-2,inputx+inputwidth/2+2,inputy+inputheight/2+2,0)
{
draw_set_color(c_aqua) draw_set_alpha(.3)
draw_rectangle(inputx-inputwidth/2-2,inputy-inputheight/2-2,inputx+inputwidth/2+2,inputy+inputheight/2+2,0)
}
draw_set_alpha(1)
draw_set_color(c_gray)
//Top gray
draw_rectangle(inputx-inputwidth/2-2,inputy-inputheight/2-2,inputx+inputwidth/2+2,inputy-inputheight/2,0)
//Bottom gray
draw_rectangle(inputx-inputwidth/2-2,inputy+inputheight/2,inputx+inputwidth/2+2,inputy+inputheight/2+2,0)
//Left gray
draw_rectangle_color(inputx-inputwidth/2-2,inputy-inputheight/2-2,inputx-inputwidth/2,inputy,c_gray,c_gray,c_white,c_white,0)
//Right gray
draw_rectangle_color(inputx+inputwidth/2+2,inputy-inputheight/2-2,inputx+inputwidth/2,inputy,c_gray,c_gray,c_white,c_white,0)


draw_set_color(c_black)
draw_rectangle(inputx-inputwidth/2-2,inputy-inputheight/2-2,inputx+inputwidth/2+2,inputy+inputheight/2+2,1)
draw_rectangle(inputx-inputwidth/2,inputy-inputheight/2,inputx+inputwidth/2,inputy+inputheight/2,1)
draw_set_halign(0)

if inregion(mouse_x,mouse_y,inputx-inputwidth/2-2,inputy-inputheight/2-2,inputx+inputwidth/2+2,inputy+inputheight/2+2,0)
{
//if inregion(mouse_xpre,mouse_ypre,inputx-inputwidth/2-2,inputy-inputheight/2-2,inputx+inputwidth/2+2,inputy+inputheight/2+2,0)
 //{} else 
 if mouse_check_button_pressed(1)
 {sln=argument7 execute_string('keyboard_string='+inputvar)}
 }
 else
 {
 if mouse_check_button_pressed(1)
 if sln=argument7
 {sln=-1}
 }
if sln=argument7
{
draw_set_valign(fa_top)
if keyboard_check_pressed(vk_enter)
keyboard_string+='#'
if inputpass=1
{
tempstr=''
while string_length(tempstr)<string_length(keyboard_string)
tempstr+='x'
draw_text(inputx-inputwidth/2+4,inputy-inputheight/2+2,tempstr+cb)
}
else
{
draw_text(inputx-inputwidth/2+4,inputy-inputheight/2+2,keyboard_string+cb)
}
execute_string(inputvar+'=keyboard_string')
if keyboard_check(vk_control)
if keyboard_check_pressed(ord('V'))
{keyboard_string+=clipboard_get_text()}
}
 else 
{
draw_set_valign(fa_top)
execute_string('inputok=0 if '+inputvar+'>"" inputok=1')
if inputok=1
    {
    if inputpass=1 
    {
    tempstr=''
    execute_string("while string_length(tempstr)<string_length("+inputvar+")
    tempstr+='x'")
    //draw_text(inputx-inputwidth/2+4,inputy-inputheight/2,tempstr+cb)
    execute_string('draw_text('+string(inputx-inputwidth/2+4)+','+string(inputy-inputheight/2)+'+2,"'+tempstr+'")')
    }
    if inputpass=0
    execute_string('draw_text('+string(inputx-inputwidth/2+4)+','+string(inputy-inputheight/2)+'+2,'+inputvar+')')
    }
 else 
draw_text(inputx-inputwidth/2+4,inputy-inputheight/2+2,inputdeftext) 
}
