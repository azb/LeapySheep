///MELT_scr_draw_interface()

create_code_str = ""
draw_code_str = ""
alarm_code_str = ""

lowest = 1000000
highest = -1000000

if show_all_layers || !global.GUI_devmode
    {
    for(i=0 ; i < global.GUIs ; i++)
        {
        if global.GUI_depth[i] < lowest
            lowest = global.GUI_depth[i]
        if global.GUI_depth[i] > highest
            highest = global.GUI_depth[i]
        }    
    }
else
    {
    lowest = layer
    highest = layer
    }

if global.GUI_devmode
{
for(z = lowest ; z <= highest ; z++)
for(i=0 ; i < global.GUIs ; i++)
if z = global.GUI_depth[i]
    {
    //RESIZING ITEMS
    if resizing = i
        {
        global.GUI_w[i] = MELT_scr_snap( abs(((mouse_x - xoff) - global.GUI_x[i]) * 2) , hsnap)
        global.GUI_h[i] = MELT_scr_snap( abs(((mouse_y - yoff) - global.GUI_y[i]) * 2) , vsnap)
        if mouse_check_button_released(1)
            resizing = -1
        
        draw_set_color(c_black)
        }
    
    MELT_moving_items()
    }
}

resize_rect_w = 24 //needed for onhover script
resize_rect_pos = resize_rect_w / 2

for(z = lowest ; z <= highest ; z++)
for(i=0 ; i < global.GUIs ; i++)
if z = global.GUI_depth[i]
    {
    if global.GUI_devmode
    MELT_item_onhover()
    
    if !global.GUI_deleted[i] = 1
    if global.GUI_page[i] = page
    //if global.GUI_depth[i] = z
        {
        //Export code
        MELT_export_code()
        
        MELT_item_right_click_options()
        draw_set_alpha(1)
        MELT_draw_list()
        
        //RESIZING RETANGLE
        if global.GUI_devmode
            MELT_item_resize_rectangle()
        }
    }

for(j=0 ; j < selected_objects ; j++)
for(i=0 ; i < global.GUIs ; i++)
if layer = global.GUI_depth[i] || show_all_layers
    {
    if selected_object[j] = i
        {
        draw_set_alpha(.5)
        draw_set_color(c_white)
        draw_rectangle(global.GUI_x[i]-global.GUI_w[i]/2,global.GUI_y[i]-global.GUI_h[i]/2,
            global.GUI_x[i]+global.GUI_w[i]/2,global.GUI_y[i]+global.GUI_h[i]/2,0)
        draw_set_alpha(1)
        }
    }

if resizing > -1
    {
    if global.GUI_spr[resizing] > -1
        {
        draw_set_color(c_red)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_text(global.GUI_x[resizing] - global.GUI_w[resizing] / 2 , global.GUI_y[resizing] + global.GUI_h[resizing] / 2 + 24 , 
            MELT_scr_paragraph_string("Note: resizing this image may look ugly. To fix this,"
                +" consider updating the image to be the same dimensions as the object. ("+string(global.GUI_w[resizing])+"x"+string(global.GUI_h[resizing])+")",256))
        }
    }

if global.GUI_devmode
    {
    if resizing = -1 && moving = -1 && selected = -1 && moving_toolbar = 0 //MELT_inregion(mouse_x,mouse_y,x1,y1,x2,y2,0)
        {
        if !inregion(mouse_x,mouse_y,toolbar_x,toolbar_y,toolbar_x+room_width,toolbar_y + 128,0)
        if mouse_check_button_pressed(1)
            {
            slx1 = mouse_x
            sly1 = mouse_y
            
            }
        }
        
    if slx1 > -1
        {
        slx2 = mouse_x
        sly2 = mouse_y
        draw_set_color(c_aqua)
        draw_set_alpha(1)
        draw_rectangle(slx1,sly1,slx2,sly2,1)
        draw_set_alpha(.4)
        draw_rectangle(slx1,sly1,slx2,sly2,0)
        draw_set_alpha(0)
        selected_objects = 0
        for(i=0 ; i < global.GUIs ; i++)
            {
            if !global.GUI_deleted[i]
            if global.GUI_page[i] = page
            if edit_all_layers || layer = global.GUI_depth[i]
            if inregion(global.GUI_x[i],global.GUI_y[i],slx1,sly1,slx2,sly2,0)
                {
                selected_object[selected_objects] = i
                selected_objects++
                }
            }
        if mouse_check_button_released(1)
            {
            slx1 = -1
            }
        //toolbar_y = 0
        }
    }
else
    {
    slx1 = -1
    selected_objects = 0
    }
