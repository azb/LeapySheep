
        //MOVE / MOVING ITEMS
        if moving = i
            {
            if global.GUI_hscroll_id[i] > -1
                {
                draw_set_color(c_red)
                draw_set_alpha(.5)
                if inregion(mouse_x,mouse_y,0,0,200,200,0)
                    draw_set_alpha(.75)
                
                draw_rectangle(0,0,200,200,0)
                draw_set_alpha(1)
                }
            draw_set_alpha(.5)
            draw_set_color(c_purple)
            draw_line_width(room_width / 2 , 0 , room_width / 2 , room_height , 2)
            draw_line_width(0, room_height / 2 , room_width , room_height / 2, 2)
            draw_set_alpha(1)
            
            if MELT_scr_snap(global.GUI_x[i] , hsnap) = room_width / 2
                {
                draw_set_color(c_orange)
                draw_line_width(room_width / 2, 0 , room_width / 2, room_height , 4)
                }
            if MELT_scr_snap(global.GUI_y[i] , vsnap) = room_height / 2
                {
                draw_set_color(c_orange)
                draw_line_width(0, room_height / 2 , room_width , room_height / 2, 4)
                }
            
            mx = MELT_scr_snap(mouse_x - xoff , hsnap)
            my = MELT_scr_snap(mouse_y - yoff , vsnap)
            
            global.GUI_x[i] = mx //MELT_adjust( mx , global.GUI_x[i])
            global.GUI_y[i] = my //MELT_adjust( my , global.GUI_y[i])
            
            t_xoff = mx - xorig //global.GUI_x[i]
            t_yoff = my - yorig //global.GUI_y[i]
            
            for(j=0 ; j < global.GUIs ; j++)
                {
                if moving != j
                for(z1=0 ; z1 < selected_objects ; z1++)
                    {
                    if selected_object[z1] = j
                        {
                        global.GUI_x[selected_object[z1]] = selected_xstart[z1] + t_xoff
                        global.GUI_y[selected_object[z1]] = selected_ystart[z1] + t_yoff
                        }
                    }
                }
            
            if mouse_check_button_released(1)
                {
                //global.GUI_x[i] = MELT_scr_snap(mx - xoff , hsnap)
                //global.GUI_y[i] = MELT_scr_snap(my - yoff , vsnap)
                
                for(z1=0 ; z1 < selected_objects ; z1++)
                    {
                    //if moving != selected_object[z1]
                    //if selected_object[z1] = j
                        {
                        global.GUI_x[selected_object[z1]] = selected_xstart[z1] + t_xoff
                        global.GUI_y[selected_object[z1]] = selected_ystart[z1] + t_yoff
                        }
                    }
                moving = -1
                }

            if inregion(mouse_x,mouse_y,toolbar_x,toolbar_y,toolbar_x+room_width,toolbar_y+132,0)
                {
                if mouse_y < toolbar_y + 64
                    {
                    toolbar_y_target = 0
                    }
                else
                    {
                    toolbar_y_target = room_height - 132
                    }
                
                }
            toolbar_y = MELT_adjust(toolbar_y, toolbar_y_target)
            }
    else
        {
        //if 1 = 0
        if moving > -1
            {
            if global.GUI_type[i] = "gui_hscroll"
                {
                if inregion(mouse_x,mouse_y,
                    global.GUI_x[i] - global.GUI_w[i]/2 ,
                    global.GUI_y[i] - global.GUI_h[i]/2 ,
                    global.GUI_x[i] + global.GUI_w[i]/2 ,
                    global.GUI_y[i] + global.GUI_h[i]/2 , 0 )
                    {
                    global.GUI_hscroll_id[moving] = i
                    }
                }
            if global.GUI_type[i] = "gui_vscroll"
                {
                if inregion(mouse_x,mouse_y,
                    global.GUI_x[i] - global.GUI_w[i]/2 ,
                    global.GUI_y[i] - global.GUI_h[i]/2 ,
                    global.GUI_x[i] + global.GUI_w[i]/2 ,
                    global.GUI_y[i] + global.GUI_h[i]/2 , 0 )
                    {
                    global.GUI_vscroll_id[moving] = i
                    }
                }
            }
        }
