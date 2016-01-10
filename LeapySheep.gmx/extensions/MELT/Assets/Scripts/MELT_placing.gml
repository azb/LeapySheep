if placing > ""
    {
    mx = MELT_scr_snap(mouse_x,hsnap)
    my = MELT_scr_snap(mouse_y,vsnap)
    
    draw_set_color(c_purple)
    draw_rectangle(mx - placing_width / 2,my - placing_height / 2 , 
        mx + placing_width / 2,my + placing_height / 2 , 0)
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_color(c_black)
    draw_text(mx,my,string_replace(placing,"gui_",""))
    
    if mouse_check_button_pressed(2)
        {
        placing = ""
        }

    if mouse_check_button_pressed(1)
        {
        new = MELT_scr_gui_add(MELT_scr_snap(mouse_x,hsnap),MELT_scr_snap(mouse_y,vsnap),placing_width,placing_height,placing)
        //if placing = "gui_button" || placing = "gui_buttontab" || placing = "gui_input"
        placing = ""
        }
    }
