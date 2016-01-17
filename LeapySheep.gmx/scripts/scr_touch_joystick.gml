///scr_touch_joystick(x,y,r,jid)

jx = 0
jy = 0

//global.mx[i]
//global.my[i]

inCircle = 0

for(i=0 ; i < global.mice ; i++)
    {
    //If current mouse is in circle or this joystick is selected
    if point_distance(mouse_x-view_xview[0],mouse_y-view_yview[0],argument0,argument1) < argument2 || jdown[argument3] == i
        {
        if global.mdown[i] //|| jdown[argument3] == i
            {
            inCircle = 1
            if point_distance(mouse_x-view_xview[0],mouse_y-view_yview[0],argument0,argument1) > argument2
                {
                dir = -point_direction(argument0,argument1,mouse_x-view_xview[0],mouse_y-view_yview[0])
                //mouse_x = argument0 + cos(degtorad(dir)) * argument2
                //mouse_y = argument1 + sin(degtorad(dir)) * argument2
                }
            jx = adjust(jx , ((mouse_x-view_xview[0]) - argument0) / argument2)
            jy = adjust(jy , ((mouse_y-view_yview[0]) - argument1) / argument2)
            jdown[argument3] = i
            }
        
        if jdown[argument3] > -1
        if global.mreleased[jdown[argument3]]
            {
            jdown[argument3] = -1
            //show_message("We are all good down here Huston")
            }
        
        break;
        }
    
    }
    
if point_distance(jx,jy,0,0) > 1
    {
    var dir = point_direction(0,0,jx,jy)
    jx = lengthdir_x( 1 , dir )
    jy = lengthdir_y( 1 , dir )
    }

/*
if jx > 1 jx = 1
if jx < -1 jx = -1
if jy > 1 jy = 1
if jy < -1 jy = -1
*/
//if inCircle
    draw_set_color(c_dkgray)
//else
//    draw_set_color(c_ltgray)

/*
if inCircle
    {
    draw_circle(argument0,argument1,argument2,1)

    draw_set_color(c_black)
    draw_circle(global.mx[i],global.my[i],argument2/2,0)
    draw_set_color(c_white)
    draw_circle(global.mx[i],global.my[i],argument2/2,1)
    }
    
else
    {
    draw_set_color(c_black)
    draw_circle(argument0,argument1,argument2/2,0)
    draw_set_color(c_white)
    draw_circle(argument0,argument1,argument2/2,1)
    }
*/
//draw_set_color(c_white)
//draw_text(argument0,argument1,mreleased[jdown[argument3] - 1])

return inCircle;
