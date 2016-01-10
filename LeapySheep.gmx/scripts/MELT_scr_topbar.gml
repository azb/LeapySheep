draw_set_alpha(1)

can_click = 1

if moving_toolbar
    {
    //toolbar_x = mouse_x + xoff
    if mouse_y + yoff < 64
    toolbar_y = MELT_adjust(0 , toolbar_y)
    else
    toolbar_y = MELT_adjust(max(mouse_y + yoff , 0) , toolbar_y)
    
    if !mouse_check_button(1)
        {
        moving_toolbar = 0
        can_click = 0
        }
    }
else
    {
    if toolbar_y < 64
    toolbar_y = MELT_adjust(0 , toolbar_y)
    }

draw_set_color(c_black)
//draw_rectangle(vx + toolbar_x, vy + toolbar_y * dev_pos, vx + vw + toolbar_x, vy + dev_pos * (68 + 32 + toolbar_y), 0)

if inregion(mouse_x,mouse_y,vx + toolbar_x, vy + toolbar_y, vx + vw + toolbar_x, vy + dev_pos * 24 + toolbar_y,0)
    {
    draw_set_color(c_dkgray)
    if mouse_check_button_pressed(1)
        {
        moving_toolbar = 1
        
        xoff = toolbar_x -mouse_x
        yoff = toolbar_y - mouse_y
        
        moving = -1
        selected = -1
        }
    }

if moving_toolbar
    {
    draw_set_color(c_gray)
    }

draw_background_stretched(back_gradient,vx + toolbar_x, vy - 138 + (toolbar_y + 138) * dev_pos , room_width,142)

draw_rectangle(vx + toolbar_x, vy + dev_pos * toolbar_y, vx + vw + toolbar_x, vy + dev_pos * (24 + toolbar_y), 0)

w = 96

buttons = 0

if tab = MELT_TAB_INSERT
    {
    MELT_scr_add_button("gui_button")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 48
    /*
    MELT_scr_add_button("gui_spritelessbutton")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 48
    */
    MELT_scr_add_button("gui_buttontab")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 48
    MELT_scr_add_button("gui_checkbox")
    bwidth[buttons-1] = 48
    bheight[buttons-1] = 48
    MELT_scr_add_button("gui_input")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 48
    MELT_scr_add_button("gui_text")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 48
    MELT_scr_add_button("gui_sprite")
    bwidth[buttons-1] = 64
    bheight[buttons-1] = 64
    MELT_scr_add_button("gui_hscroll")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 32
    MELT_scr_add_button("gui_vscroll")
    bwidth[buttons-1] = 32
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_progressbar")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 48
    MELT_scr_add_button("gui_background")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    /*
    MELT_scr_add_button("gui_lives")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_inventory")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_dragdropblock")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_dragdropplacer")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_switch")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_minimap")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_chatbox")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_notifications")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_knob")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_touchjoystick")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_touchbutton")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    MELT_scr_add_button("gui_window")
    bwidth[buttons-1] = 128
    bheight[buttons-1] = 128
    */
    }

if tab = MELT_TAB_HOME
    {
    MELT_scr_add_button("New")
    //MELT_scr_add_button("Load")
    //MELT_scr_add_button("Save")
    MELT_scr_add_button("Get Code")
    MELT_scr_add_button("MeltUpdate")
    MELT_scr_add_button("Feedback")
    /*
    if show_code
        tstr = "HIDE CODE"
    else
        tstr = "SHOW CODE"
    MELT_scr_add_button(tstr)
    */
    }
if tab = MELT_TAB_EDIT
    {
    MELT_scr_add_button("Undo")
    MELT_scr_add_button("Redo")
    MELT_scr_add_button("Reset")
    MELT_scr_add_button("Select All")
    MELT_scr_add_button("Clear All")
    }

if tab = MELT_TAB_SETTINGS
    {
    MELT_scr_add_button("HSnap: "+string(hsnap))
    MELT_scr_add_button("VSnap: "+string(vsnap))
    
    draw_set_color(c_white)
    
    if MELT_checkbox_frozen(spr_checkbox , 104 + w ,-32 + (64+32 + toolbar_y)*dev_pos,32,32 , show_grid ,'Show Grid')
        show_grid = !show_grid
    if MELT_checkbox_frozen(spr_checkbox , 104 + w + 128 ,-32 + (64+32 + toolbar_y)*dev_pos,32,32 , show_beta ,'Show "Coming Soon" Features')
        show_beta = !show_beta
    
    if MELT_checkbox_frozen(spr_checkbox , 104 + w ,-32 + (64+32+32 + toolbar_y)*dev_pos,32,32 , show_all_layers ,'Show All Layers')
        show_all_layers = !show_all_layers
    
    //if !show_all_layers
    //    {
        if MELT_drawButton_frozen(104 + w + 256+128 - 64 ,-32 + (64+32+32+16 + toolbar_y)*dev_pos,32,32,"+")
            {
            layer++
            }
            draw_set_color(c_black)
        draw_text(104 + w + 256+64 - 64 ,-32 + (64+32+32+16 + toolbar_y)*dev_pos,"Layer: "+string(layer))
        if MELT_drawButton_frozen(104 + w + 256 - 64 ,-32 + (64+32+32+16 + toolbar_y)*dev_pos,32,32,"-")
            {
            layer--
            }
    //    }
    
    if MELT_checkbox_frozen(spr_checkbox , 104 + w + 360,-32 + (64+32+32 + toolbar_y)*dev_pos,32,32 , edit_all_layers ,'Edit All Layers')
        edit_all_layers = !edit_all_layers
    }
    

if tab = MELT_TAB_PAGE
    {
    for(i=0 ; i < pages ; i++)
        {
        MELT_scr_add_button("Page "+string(i+1))
        }
    MELT_scr_add_button("+New Page")
    MELT_scr_add_button("Delete Page")
    }

if tab = MELT_TAB_DESIGN
    {
    MELT_scr_add_button("Button")
    MELT_scr_add_button("Tab")
    }

bw = 100
bx = toolbar_x
if MELT_button_tab_frozen(spr_tab,bx , -32 + (32 + toolbar_y + 24)*dev_pos , bw,32 ,'Home',-1, 0 ,'', tab, MELT_TAB_HOME ) 
if can_click 
    tab = MELT_TAB_HOME
bx += bw
/*
if show_beta
{
if MELT_button_tab_frozen(spr_tab,bx , -32 + (32 + toolbar_y + 24)*dev_pos , bw,32 ,'Edit',-1, 0 ,'', tab, 6 ) 
if can_click 
    tab = 6
bx += bw
}
*/
if MELT_button_tab_frozen(spr_tab,bx , -32 + (32 + toolbar_y + 24)*dev_pos , bw,32 ,'Insert',-1, 0 ,'', tab, MELT_TAB_INSERT ) 
if can_click 
    tab = MELT_TAB_INSERT
bx += bw
if show_beta
{
if MELT_button_tab_frozen(spr_tab,bx , -32 + (32 + toolbar_y + 24)*dev_pos, bw,32 ,'Page',-1, 0 ,'', tab, MELT_TAB_PAGE ) 
if can_click 
    tab = MELT_TAB_PAGE
bx += bw
if MELT_button_tab_frozen(spr_tab,bx , -32 + (32 + toolbar_y + 24)*dev_pos, bw,32 ,'Design',-1, 0 ,'', tab, MELT_TAB_DESIGN ) 
if can_click 
    tab = MELT_TAB_DESIGN
bx += bw
}
if MELT_button_tab_frozen(spr_tab,bx , -32 + (32 + toolbar_y + 24)*dev_pos, bw,32 ,'Settings',-1, 0 ,'', tab, MELT_TAB_SETTINGS ) 
if can_click 
    tab = MELT_TAB_SETTINGS
bx += bw

draw_set_alpha(1)

bx = 0
by = 0

hash = ""

if buttons * w > room_width
    {
    toolbar_button_scroll = -mouse_x/2
    }
else
    {
    toolbar_button_scroll = 0
    }

for(i=0 ; i < buttons ; i++)
    {
    if tab = MELT_TAB_INSERT
        {
        if b_beta[i]
            {
            if MELT_button_frozen(spr_button_orange,vx+w/2+bx + toolbar_x - w / 2 - toolbar_scroll,vy-80+(80 + 70+by + 8 + toolbar_y)*dev_pos - 20 ,w
                ,80,"#"+string_replace(btext[i] , "gui_" , ""),MELT_spr_item_icons,i,"")
            if can_click
                {
                placing = btext[i]
                placing_width = bwidth[i]
                placing_height = bheight[i]
                }
            draw_set_color(c_yellow)
            draw_text_transformed(vx+bx + toolbar_x +12,vy-80+(80 + 70+by + 8 + toolbar_y)*dev_pos - 8,"Coming#Soon",.7,.7,45)
            }
        else
            {
            if MELT_button_frozen(spr_button_big,vx+w/2+bx + toolbar_x - w / 2 - toolbar_scroll,vy-80+(80 + 70+by + 8 + toolbar_y)*dev_pos - 20 ,w,
                /*64-24*/ 80,"##"+string_replace(btext[i] , "gui_" , ""),MELT_spr_item_icons,i,"")
            if can_click
                {
                placing = btext[i]
                placing_width = bwidth[i]
                placing_height = bheight[i]
                }
            }
        }
    else
    if tab = MELT_TAB_PAGE
        {
        tspr = -1
        if string_count("Page ",btext[i])
            {
            if MELT_button_tab_frozen(spr_tab,vx+w/2+bx + toolbar_x - w / 2,vy-80+(80 + 70+by + 8 + toolbar_y)*dev_pos - 20 ,w,80,"##"+btext[i],tspr,i,"",page,i)
                {
                page = i
                }
            }
        else
        if MELT_button_frozen(spr_button_big,vx+w/2+bx + toolbar_x - w / 2,vy-80+(80 + 70+by + 8 + toolbar_y)*dev_pos - 20 ,w,80,"##"+btext[i],tspr,i,"")
        if can_click
            {
            hash = btext[i]
            }
        }
    else
        {
        tspr = -1
        if tab = MELT_TAB_HOME tspr = MELT_spr_home_icons 
        if tab = MELT_TAB_SETTINGS tspr = MELT_spr_settings_icons
        if tab = MELT_TAB_EDIT tspr = MELT_spr_edit_icons
        if MELT_button_frozen(spr_button_big,vx+w/2+bx + toolbar_x - w / 2,vy-80+(80 + 70+by + 8 + toolbar_y)*dev_pos - 20 ,w,80,"##"+btext[i],tspr,i,"")
        if can_click
            {
            hash = btext[i]
            }
        }
    bx += w
    if bx > room_width // 2
        {
        bx = 0
        by += 80 //64 - 24
        }
    }
    
/*toolbar_scroll = MELT_scrollbar_horizontal_frozen(512,144,1024,16,toolbar_scroll,100,0,0,'')

if in 
    {
    slx1 = -1
    }
*/
if can_click
    {
    if hash = "MeltUpdate"
        {
        url_open("https://dl.dropboxusercontent.com/u/1795990/ArthursGames/GUIMELT/MeltUpdate.html")
        }
    if string_count("Page ",hash) > 0
        {
        page = real(hash)
        }
    if hash = "+New Page"
        {
        pages++
        }
    if hash = "Delete Page"
        {
        if pages > 1
        pages--
        }
    if string_count("HSnap",hash) > 0
        {
        
        waiting = MELT_scr_show_menu("2|4|8|16|32|64|128|256|custom","hsnap")
        waiting.y += 16
        waiting.subject = "hsnap"
        }
    if string_count("VSnap",hash) > 0
        {
        
        waiting = MELT_scr_show_menu("2|4|8|16|32|64|128|256|custom","vsnap")
        waiting.y += 16
        waiting.subject = "vsnap"
        }
    
    if hash = "Get Code"
        {
        get_code = 1
        create_code_str = ""
        draw_code_str = ""
        alarm[1] = 2
        }
    
    if hash = "New"
        {
        if show_question("Delete everything?")
        global.GUIs = 0
        }
    
    if hash = "Feedback"
        {
        url_open("http://goo.gl/forms/FeCXeBxfyy");
        //webpage_open("http://goo.gl/forms/FeCXeBxfyy")
        }
    }

if waiting > -1
if instance_exists(waiting)
if waiting.answer > ""
    {
    switch waiting.subject
        {
        case "hsnap":
            if real(waiting.answer) > 0
                {
                hsnap = real(waiting.answer)
                }
            else
                if waiting.answer = "custom"
                    {
                    waiting = MELT_scr_show_input("Enter horizontal snap incrementation: (pixels, default is 16)")
                    
                    waiting.subject = "hsnap"
                    }
            with waiting instance_destroy()
        break;
        
        case "vsnap":
            if real(waiting.answer) > 0
                {
                vsnap = real(waiting.answer)
                }
            else
                if waiting.answer = "custom"
                    {
                    waiting = MELT_scr_show_input("Enter vertical snap incrementation: (pixels, default is 16)")
                    
                    waiting.subject = "vsnap"
                    }
            with waiting instance_destroy()
        break;
        }
    }

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_text(8 + toolbar_x,4-32+(32 + toolbar_y)*dev_pos,"GUIMELT "+version)

//vx+vw-32 + toolbar_x
if MELT_button_frozen(spr_button,room_width-32 + toolbar_x,vy-32+(32 + toolbar_y)*dev_pos ,32,24,"X",-1,0,"")
//if can_click
    {
    global.GUI_devmode = 0
    }

/*
if show_code
    tstr = "HIDE CODE"
else
    tstr = "SHOW CODE"

if MELT_drawButton_frozen(vx+vw-w/2-w + toolbar_x,vy-32+(70 + 8 + toolbar_y)*dev_pos,128,32,tstr)
if can_click
    {
    show_code = !show_code
    }

if MELT_drawButton_frozen(vx+vw-w/2-w*2.5 + toolbar_x,vy-32+(70 + 8 + toolbar_y)*dev_pos,128,32,"COPY CODE")
if can_click
    {
    get_code = 1
    create_code_str = ""
    draw_code_str = ""
    alarm[1] = 2
    }

if MELT_drawButton_frozen(vx+vw-w/2 + toolbar_x,vy-32+(70 + 8 + toolbar_y)*dev_pos,64,32,"close")
if can_click
    {
    global.GUI_devmode = 0
    }
*/
    
/*
if MELT_drawButton(vx+w/2,vy-32+70*dev_pos + 8,w,64-24,"button")
    {
    placing = "gui_button"
    }
if MELT_drawButton(vx+w+w/2,vy-32+70*dev_pos + 8,w,64-24,"checkbox")
    {
    placing = "gui_checkbox"
    }
if MELT_drawButton(vx+w*2+w/2,vy-32+70*dev_pos + 8,w,64-24,"input")
    {
    placing = "gui_input"
    }
if MELT_drawButton(vx+w*3+w/2,vy-32+70*dev_pos + 8,w,64-24,"text box")
    {
    placing = "gui_textbox"
    }
