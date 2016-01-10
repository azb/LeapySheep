if global.GUI_type[i] != "gui_text"
    {
    in = 0
    if edit_all_layers || layer = global.GUI_depth[i]
    if MELT_inregion(mouse_x,mouse_y,global.GUI_x[i] + global.GUI_w[i] / 2 - resize_rect_pos,
            global.GUI_y[i] + global.GUI_h[i] / 2  - resize_rect_pos, 
            global.GUI_x[i] + global.GUI_w[i] / 2 + resize_rect_w - resize_rect_pos,
            global.GUI_y[i] + global.GUI_h[i] / 2 + resize_rect_w  - resize_rect_pos, 0)
        {
        in = 1
        draw_set_color(c_white)
        
        draw_rectangle(global.GUI_x[i] + global.GUI_w[i] / 2 - resize_rect_pos,
            global.GUI_y[i] + global.GUI_h[i] / 2  - resize_rect_pos, 
            global.GUI_x[i] + global.GUI_w[i] / 2 + resize_rect_w - resize_rect_pos,
            global.GUI_y[i] + global.GUI_h[i] / 2 + resize_rect_w - resize_rect_pos, 0)
        
        draw_set_color(c_black)
        
        draw_rectangle(global.GUI_x[i] + global.GUI_w[i] / 2 - resize_rect_pos,
            global.GUI_y[i] + global.GUI_h[i] / 2 - resize_rect_pos , 
            global.GUI_x[i] + global.GUI_w[i] / 2 + resize_rect_w - resize_rect_pos ,
            global.GUI_y[i] + global.GUI_h[i] / 2 + resize_rect_w - resize_rect_pos , 1 - (resizing == i))
        
        if moving = -1
        if mouse_check_button_pressed(1)
        if !inregion(mouse_x,mouse_y,toolbar_x,toolbar_y,toolbar_x+room_width,toolbar_y+128,0)
            {
            resizing = i
            xoff = mouse_x - (global.GUI_x[i] + global.GUI_w[i] / 2)
            yoff = mouse_y - (global.GUI_y[i] + global.GUI_h[i] / 2)
            }
        
        }
        
    if in || resizing = i || selected = i || inregion(mouse_x,mouse_y,global.GUI_x[i] - global.GUI_w[i] / 2,global.GUI_y[i] - global.GUI_h[i] / 2,
        global.GUI_x[i] + global.GUI_w[i] / 2,global.GUI_y[i] + global.GUI_h[i] / 2 , 0)
    if waiting = -1
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_text(global.GUI_x[i] - global.GUI_w[i] / 2 , global.GUI_y[i] - global.GUI_h[i] / 2 -24 , 
                            string_replace(global.GUI_type[i],"gui_","")+" "+string(global.GUI_w[i])+"x"+string(global.GUI_h[i]))
        }
    }
