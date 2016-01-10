
if global.GUI_devmode
if (selected == i)
    {
    border = 3
    var x1 = global.GUI_x[i] - (global.GUI_w[i] / 2 + border * sl_slide)
    var y1 = global.GUI_y[i] - (global.GUI_h[i] / 2 + border * sl_slide)
    var x2 = global.GUI_x[i] + (global.GUI_w[i] / 2 + border * sl_slide)
    var y2 = global.GUI_y[i] + (global.GUI_h[i] / 2 + border * sl_slide)
    
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
        
    draw_set_color(c_purple)
    draw_set_alpha(sl_slide)
    
    draw_rectangle(x1,y1,x2,y2, 0)
    }

xoff = 0
yoff = 0

if !global.GUI_devmode
{
if global.GUI_hscroll_id[i] > -1
    {
    xoff = -global.GUI_value[global.GUI_hscroll_id[i]] * 2
    }
if global.GUI_vscroll_id[i] > -1
    {
    yoff = -global.GUI_value[global.GUI_vscroll_id[i]] * 2
    }
}

if global.GUI_type[i] = "gui_button"
    {
    if global.GUI_spr[i] = -1
        {
        if MELT_drawButton_frozen(global.GUI_x[i] + xoff,global.GUI_y[i] + yoff,global.GUI_w[i],global.GUI_h[i],global.GUI_text[i])
            {
            if global.GUI_gotopage[i]> -1
            if !global.GUI_devmode
                page = global.GUI_gotopage[i]
            }
        }
    else
        {
        if MELT_button_frozen(global.GUI_spr[i] , global.GUI_x[i] - global.GUI_w[i] / 2 , global.GUI_y[i] - global.GUI_h[i] / 2 , global.GUI_w[i],global.GUI_h[i] , global.GUI_text[i] , -1 , 0 , "")
            {
            if global.GUI_gotopage[i]> -1
            if !global.GUI_devmode
                page = global.GUI_gotopage[i]
            }
        }
    }
else
if global.GUI_type[i] = "gui_checkbox"
    {
    if global.GUI_spr[i] = -1
        {
        if MELT_checkbox_frozen(spr_checkbox , global.GUI_x[i] - global.GUI_w[i] / 2 , global.GUI_y[i] - global.GUI_h[i] / 2 , 
            global.GUI_w[i],global.GUI_h[i] , global.GUI_value[i] , global.GUI_text[i])
            global.GUI_value[i] =! global.GUI_value[i]
        }
    else
        {
        if MELT_checkbox_frozen(global.GUI_spr[i] , global.GUI_x[i] - global.GUI_w[i] / 2 , global.GUI_y[i] - global.GUI_h[i] / 2 , 
            global.GUI_w[i],global.GUI_h[i] , global.GUI_value[i] , global.GUI_text[i])
            global.GUI_value[i] =! global.GUI_value[i]
        }
    }
else
if global.GUI_type[i] = "gui_buttontab"
    {
    if global.GUI_spr[i] = -1
        {
        if MELT_button_tab_frozen(spr_tab,global.GUI_x[i] - global.GUI_w[i] / 2 , global.GUI_y[i] - global.GUI_h[i] / 2 , 
            global.GUI_w[i],global.GUI_h[i] ,global.GUI_text[i], -1, 0 ,"", tabval, i)
        tabval = i
        }
    else
        {
        if MELT_button_tab_frozen(global.GUI_spr[i] , global.GUI_x[i] - global.GUI_w[i] / 2 , global.GUI_y[i] - global.GUI_h[i] / 2 , 
            global.GUI_w[i],global.GUI_h[i] ,global.GUI_text[i], -1, 0 ,"", tabval, i )
        tabval = i
        }
    }
else
if global.GUI_type[i] = "gui_hscroll"
    {
    global.GUI_value[i] = MELT_scrollbar_horizontal_frozen(global.GUI_x[i], global.GUI_y[i],global.GUI_w[i], global.GUI_h[i], global.GUI_value[i] , 100,0,i,"")
    }
else
if global.GUI_type[i] = "gui_vscroll"
    {
    global.GUI_value[i] = MELT_scrollbar_vertical_frozen(global.GUI_x[i], global.GUI_y[i],global.GUI_w[i], global.GUI_h[i], global.GUI_value[i] , 100,0,i,"")
    }
else
if global.GUI_type[i] = "gui_input"
    {
    global.GUI_input_text[i] = MELT_scr_input_frozen(global.GUI_x[i], global.GUI_y[i],global.GUI_w[i],global.GUI_h[i],
        global.GUI_input_text[i],global.GUI_text[i],global.GUI_is_password[i],i)
    }
else
if global.GUI_type[i] = "gui_text"
    {
    draw_set_color(c_black)
    draw_set_alpha(1)
    MELT_draw_set_halign(global.GUI_halign[i])
    MELT_draw_set_valign(global.GUI_valign[i])
    /*
    if global.GUI_halign[i] = fa_left
        tx = global.GUI_x[i] - global.GUI_w[i] / 2 
    
    if global.GUI_halign[i] = fa_right
        tx = global.GUI_x[i] + global.GUI_w[i] / 2 
    
    if global.GUI_halign[i] = fa_center
        tx = global.GUI_x[i]
    */
    //tx = global.GUI_x[i]
    
    draw_text(global.GUI_x[i] , global.GUI_y[i], global.GUI_text[i])
    }
else
if global.GUI_type[i] = "gui_sprite"
    {
    if global.GUI_spr[i] > -1
        tspr = global.GUI_spr[i]
    else
        tspr = spr_button
        
    t_xoff = -global.GUI_w[i]/2 //-sprite_get_width(tspr) + sprite_get_xoffset(tspr)
    t_yoff = -global.GUI_h[i]/2 //-sprite_get_height(tspr) + sprite_get_yoffset(tspr)
    if global.GUI_w[i] != 0
        hscale = 1 //sprite_get_width(tspr) / global.GUI_w[i]
    if global.GUI_h[i] != 0
        vscale = 1 //sprite_get_height(tspr) / global.GUI_h[i]
    
    draw_sprite_stretched(tspr,0,global.GUI_x[i]+t_xoff*hscale,global.GUI_y[i]+t_yoff*vscale,global.GUI_w[i],global.GUI_h[i])
    }
else
if global.GUI_type[i] = "gui_background"
    {
    if global.GUI_spr[i] > -1
        tspr = global.GUI_spr[i]
    else
        tspr = -1
        
    t_xoff = -global.GUI_w[i]/2 //-sprite_get_width(tspr) + sprite_get_xoffset(tspr)
    t_yoff = -global.GUI_h[i]/2 //-sprite_get_height(tspr) + sprite_get_yoffset(tspr)
    if global.GUI_w[i] != 0
        hscale = 1 //sprite_get_width(tspr) / global.GUI_w[i]
    if global.GUI_h[i] != 0
        vscale = 1 //sprite_get_height(tspr) / global.GUI_h[i]
    if tspr > -1
    draw_background_stretched(tspr,global.GUI_x[i]+t_xoff*hscale,global.GUI_y[i]+t_yoff*vscale,global.GUI_w[i],global.GUI_h[i])
    else
        {
        draw_set_color(c_white)
        draw_rectangle(global.GUI_x[i] - global.GUI_w[i] / 2,
        global.GUI_y[i] - global.GUI_h[i] / 2 , 
        global.GUI_x[i] + global.GUI_w[i] / 2 ,
        global.GUI_y[i] + global.GUI_h[i] / 2 , 0)
        }
    }
else
if global.GUI_type[i] = "gui_progressbar"
    {
    MELT_status_bar_frozen(global.GUI_x[i], global.GUI_y[i],global.GUI_w[i], global.GUI_h[i],50,100,c_red,c_lime)
    }
else
    {
    draw_set_color(c_white)
    draw_rectangle(global.GUI_x[i] - global.GUI_w[i] / 2,
        global.GUI_y[i] - global.GUI_h[i] / 2 , 
        global.GUI_x[i] + global.GUI_w[i] / 2 ,
        global.GUI_y[i] + global.GUI_h[i] / 2 , 0)
    }

if global.GUI_devmode
    {    
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
    if edit_all_layers || layer = global.GUI_depth[i]
        {
        draw_set_color(c_white)
        draw_rectangle(x1-1,y1-1,x2+1,y2+1,1)
        draw_set_color(c_black)
        draw_rectangle(x1,y1,x2,y2,1)
        if MELT_inregion(mouse_x,mouse_y,x1,y1,x2,y2,0)
            {
            draw_set_color(c_purple)
            if mouse_check_button(1)
                draw_set_alpha(.4)
            else
                draw_set_alpha(.4)
            
            draw_rectangle(x1, y1 , x2 , y2 , 0)
            draw_set_alpha(1)
            }
        }
    }
