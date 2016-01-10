///MELT_scrollbar_horizontal_frozen(x,y,w,h,var,maxval,minval,scroll_sl,Name)
//                                  0 1 2 3 4   5      6      7         8
temp_x=argument0
temp_y=argument1
temp_w=argument2 - 64
temp_h=argument3
temp_var=argument4
temp_max=argument5
temp_min=argument6
barsize=32
a1=.2
a2=.4
c2=c_black

mx = window_mouse_get_x()
my = window_mouse_get_y()

range = temp_max - temp_min

x1 = temp_x - temp_w / 2 + ((temp_var - temp_min) / range * (temp_w )) - barsize  //temp_x-(temp_w/barsize)-temp_w/2+(temp_w/barsize)+temp_var/temp_max*(temp_w-(temp_w/barsize))
y1 = temp_y - temp_h / 2 + 1
x2 = temp_x - temp_w / 2 + ((temp_var - temp_min) / range * (temp_w)) + barsize  //temp_x+temp_w/barsize-temp_w/2+(temp_w/barsize)+temp_var/temp_max*(temp_w-(temp_w/barsize))
y2 = temp_y + temp_h / 2 - 1
//temp_x-temp_w/2
//temp_x+temp_w/2
in = 0
if inregion(mx,my,temp_x - temp_w / 2 - barsize,y1,temp_x + temp_w / 2 + barsize,y2,0)
//if inregion(mx,my,x1,y1,x2,y2)
    {
    in = 1
    if mouse_check_button_pressed(1)
        {
        scroll_sl = argument7
        if inregion(mx,my,x1,y1,x2,y2,0)
        xorig = mx - (x1 + x2)/2
        else
        xorig = 0
        }
    }
if scroll_sl=argument7
        {
        /*
        execute_string(argument4+"=(mx-temp_x)
        if "+argument4+">temp_w/2-barsize "+argument4+"=temp_w/2-barsize
        if "+argument4+"<-temp_w/2+barsize "+argument4+"=-temp_w/2+barsize
        ") ///
        */
        if mx < temp_x - temp_w / 2 // + barsize
            {
            temp_var = temp_min
            }
        else
        if mx > temp_x + temp_w / 2 // - barsize
            {
            temp_var = temp_max
            }
        else
            {
            temp_pos = ((mx - xorig - temp_x) + (temp_w - barsize) / 2) / (temp_w - barsize) * range + temp_min
            temp_var = round(temp_pos)
            }
        if temp_var < temp_min temp_var = temp_min
        if temp_var > temp_max temp_var = temp_max
                
        //temp_pos = (mx - temp_x) / temp_w
        
        //temp_var = temp_pos * 16 //(temp_pos - temp_x) / temp_w * range + temp_min
        //scrollbar_pos = 
        a1=.4
        c2=c_blue
        if mouse_check_button_released(1)
            {
            scroll_sl=-1
            }
        }
    else 
        {
        a1=.3
        c2=c_aqua
        }
    
    //BACKGROUND
    draw_set_alpha(a1)
    draw_set_color(c_dkgray)
    draw_rectangle(temp_x-temp_w/2-barsize,temp_y-temp_h/2,temp_x+temp_w/2+barsize,temp_y+temp_h/2,0)
    
    //draw_set_color(c_aqua)
    //draw_set_alpha(a2)
    //draw_rectangle(x1,y1,x2,y2,0)
    
    draw_set_alpha(1)
    //draw_sprite_stretched(spr_tab,0,x1,y1,barsize*2,temp_h)
    MELT_button_frozen(spr_tab,x1,y1,barsize*2,temp_h,"",-1,0,"")

for (var i=-10;i<10;i+=4)
    {
    draw_line((x1+x2)/2+i,temp_y-temp_h/3,(x1+x2)/2+i,temp_y+temp_h/3)
    }

draw_set_alpha(1)
draw_set_color(c_black)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
if argument8 > ""
draw_text(temp_x,temp_y-temp_h,argument8) //+": "+string(round(temp_var)) //argument8+' '+string(round(((temp_var+(temp_w)/2-barsize))/(temp_w-barsize*2)*100))+'%'

return temp_var
