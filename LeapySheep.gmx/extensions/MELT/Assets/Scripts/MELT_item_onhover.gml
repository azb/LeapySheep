//right click options list

var x1 = global.GUI_x[i] - global.GUI_w[i] / 2 
var y1 = global.GUI_y[i] - global.GUI_h[i] / 2
var x2 = global.GUI_x[i] + global.GUI_w[i] / 2
var y2 = global.GUI_y[i] + global.GUI_h[i] / 2

if global.GUI_type[i] = "gui_text"
    {
    if global.GUI_halign[i] = fa_left
        {
        x1 += global.GUI_w[i] / 2
        x2 += global.GUI_w[i] / 2
        }
    if global.GUI_halign[i] = fa_right
        {
        x1 -= global.GUI_w[i] / 2
        x2 -= global.GUI_w[i] / 2
        }
    }
    
if !MELT_inregion(mouse_x,mouse_y,global.GUI_x[i] + global.GUI_w[i] / 2 - resize_rect_pos,
                global.GUI_y[i] + global.GUI_h[i] / 2  - resize_rect_pos, 
                global.GUI_x[i] + global.GUI_w[i] / 2 + resize_rect_w - resize_rect_pos,
                global.GUI_y[i] + global.GUI_h[i] / 2 + resize_rect_w  - resize_rect_pos, 0)
if MELT_inregion(mouse_x,mouse_y,x1,y1,x2,y2,0)
    {
    if mouse_check_button_pressed(1)
    if waiting = -1
        {
        selected = i
        sl_slide = 0
        }
    if mouse_check_button_pressed(2)
        {
        //show_message("HERE")
        with MELT_obj_menu instance_destroy()
        if !instance_exists(MELT_obj_menu)
            {
            tstr = ""
            
            if global.GUI_spr[i] > -1
                {
                tstr += "reset dimensions|"
                }
            if global.GUI_type[i] = "gui_button"
                {
                tstr += "choose onclick script|"
                }
            if global.GUI_type[i] = "gui_buttontab"
                || global.GUI_type[i] = "gui_button"
                {
                tstr += "choose goto page|"
                }
            if global.GUI_type[i] = "gui_checkbox"
                {
                tstr += "choose onclick script|"
                }
            
            if global.GUI_type[i] = "gui_text"
                {
                tstr += "horizontal alignment|"
                }
            else
            if global.GUI_type[i] = "gui_input"
                {
                tstr += "horizontal alignment|password box|"
                }
            else
            if global.GUI_type[i] = "gui_background"
                {
                tstr += "change background|"
                }
            else
            if global.GUI_type[i] = "gui_hscroll" || global.GUI_type[i] = "gui_vscroll"
                {
                tstr += "change scroll maxvalue|"
                }
            else
                {
                tstr += "change sprite|"
                }
            waiting = MELT_scr_show_menu("change text|copy|delete|move down layer|move up layer|"+tstr+"copy code to clipboard|comment|cancel|","primaryNodeMenu")
            waiting_for = i
            }
        }
        
    isSl = 0
    for(var z1=0 ; z1 < selected_objects ; z1++)
        {
        if selected_object[z1] = i
            {
            isSl = 1
            }
        }
        
    if mouse_check_button_pressed(1)
    if selected_objects = 0 || isSl
    if edit_all_layers || layer = global.GUI_depth[i]
        {
        if placing = ""
        if waiting = -1
        if !inregion(mouse_x,mouse_y,toolbar_x,toolbar_y,toolbar_x+room_width,toolbar_y+128,0)
            {
            toolbar_y_target = toolbar_y
            moving = i
            xoff = mouse_x - global.GUI_x[i]
            yoff = mouse_y - global.GUI_y[i]
            for(j=0 ; j < selected_objects ; j++)
                {
                selected_xstart[j] = global.GUI_x[selected_object[j]]
                selected_ystart[j] = global.GUI_y[selected_object[j]]
                }
            xorig = mouse_x - xoff
            yorig = mouse_y - yoff
            resizing = -1
            }
        }
    }
