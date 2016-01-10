//right clock options    
if waiting_for = i
    {
    if !instance_exists(waiting)
        {
        waiting_for = -1
        }
    else
    if waiting.object_index = MELT_obj_menu
        {
        if waiting.answer > ""
            {
            if waiting.subject = "chooseHAlignment"
                {
                switch waiting.answer
                    {
                    case "Left":
                        with waiting instance_destroy()
                        global.GUI_halign[i] = fa_left
                    break;
                    
                    case "Right":
                        with waiting instance_destroy()
                        global.GUI_halign[i] = fa_right
                    break;
                    
                    case "Center":
                        with waiting instance_destroy()
                        global.GUI_halign[i] = fa_center
                    break;
                    }
                with waiting instance_destroy()
                exit
                }
                
            if waiting.subject = "chooseVAlignment"
                {
                switch waiting.answer
                    {
                    case "Top":
                        with waiting instance_destroy()
                        global.GUI_valign[i] = fa_top
                    break;
                    
                    case "Bottom":
                        with waiting instance_destroy()
                        global.GUI_valign[i] = fa_bottom
                    break;
                    
                    case "Center":
                        with waiting instance_destroy()
                        global.GUI_valign[i] = fa_center
                    break;
                    }
                with waiting instance_destroy()
                exit
                }
            
            if waiting.subject = "choosePageNodeMenu"
                {
                global.GUI_gotopage[i] = real(string_replace(waiting.answer,"page","")) - 1
                with waiting instance_destroy()
                exit
                }
            
            if waiting.subject = "chooseSpriteNodeMenu"
                {
                for(j=0 ; j < 300 ; j++)
                    {
                    if sprite_exists(j)
                    if sprite_get_name(j) = waiting.answer
                        {
                        global.GUI_spr[i] = j
                        }
                    }
                with waiting instance_destroy()
                exit
                }
                
            if waiting.subject = "chooseBackgroundNodeMenu"
                {
                for(j=0 ; j < 300 ; j++)
                    {
                    if background_exists(j)
                    if background_get_name(j) = waiting.answer
                        {
                        global.GUI_spr[i] = j
                        }
                    }
                with waiting instance_destroy()
                exit
                }
            
            if waiting.subject = "chooseScriptNodeMenu"
                {
                for(j=0 ; j < 300 ; j++)
                    {
                    if script_exists(j)
                    if script_get_name(j) = waiting.answer
                        {
                        global.GUI_script[i] = j
                        with waiting instance_destroy()
                        exit
                        }
                    }
                }
            if waiting.subject = "primaryNodeMenu"
            switch waiting.answer
                {
                case "comment":
                    global.GUI_comment[i] = get_integer("Enter a comment to place above this item in the code:",global.GUI_comment[i])
                break;
                
                case "change scroll maxvalue":
                    global.GUI_maxvalue[i] = get_integer("Enter new max value for this scrollbar:",global.GUI_maxvalue[i])
                break;
                
                case "change text":
                    with waiting instance_destroy()
                    //waiting = MELT_scr_show_input("Enter new text for this item:")
                    global.GUI_text[i] = get_string("Enter new text for this item:",global.GUI_text[i])
                break;
                
                case "set depth":
                    with waiting instance_destroy()
                    global.GUI_depth[i] = get_integer("Enter new depth for this item:",global.GUI_depth[i])
                break;
                
                case "move down layer":
                    with waiting instance_destroy()
                    global.GUI_depth[i]--
                break;
                
                case "move up layer":
                    with waiting instance_destroy()
                    global.GUI_depth[i]++
                break;
                
                case "reset dimensions":
                    with waiting instance_destroy()
                    global.GUI_w[i] = sprite_get_width(global.GUI_spr[i])
                    global.GUI_h[i] = sprite_get_height(global.GUI_spr[i])
                break;
                
                case "copy":
                    new = MELT_scr_gui_add(global.GUI_x[i] + global.GUI_w[i] / 2,global.GUI_y[i] + global.GUI_h[i] / 2,global.GUI_w[i],global.GUI_h[i],global.GUI_type[i])
                    global.GUI_text[new] = global.GUI_text[i]
                    global.GUI_halign[new] = global.GUI_halign[i]
                    global.GUI_valign[new] = global.GUI_valign[i]
                    global.GUI_spr[new] = global.GUI_spr[i]
                    global.GUI_is_password[new] = global.GUI_is_password[i]
                    global.GUI_page[new] = global.GUI_page[i]
                    global.GUI_gotopage[new] = global.GUI_gotopage[i]
                    global.GUI_depth[new] = global.GUI_depth[i]
                    global.GUI_script[new] = global.GUI_script[i]
                    global.GUI_input_text[new] = global.GUI_input_text[i]
                    
                    //global.GUI_x[new] = global.GUI_x[i] + global.GUI_w[i] / 2
                    //global.GUI_y[new] = global.GUI_y[i] + global.GUI_h[i] / 2
                    with waiting instance_destroy()
                break;
                
                case "delete":
                    global.GUI_deleted[i] = 1
                    deleted[num_deleted] = i
                    num_deleted++
                    with waiting instance_destroy()
                break;
                
                case "choose onclick script":
                    tstr = ""
                    for(j=0 ; j < 300 ; j++)
                        {
                        if script_exists(j)
                            {
                            tstr += script_get_name(j)+"|"
                            }
                        }
                    with waiting instance_destroy()
                    waiting = MELT_scr_show_menu(tstr,"chooseScriptNodeMenu")
                break;
                
                case "choose goto page":
                    tstr = ""
                    for(j=0 ; j < pages ; j++)
                        {
                        tstr += "page "+string(j+1)+"|"
                        }
                    with waiting instance_destroy()
                    waiting = MELT_scr_show_menu(tstr,"choosePageNodeMenu")
                break;
                
                case "change sprite":
                    tstr = ""
                    for(j=0 ; j < 300 ; j++)
                        {
                        if sprite_exists(j)
                            {
                            tstr += sprite_get_name(j)+"|"
                            }
                        }
                    with waiting instance_destroy()
                    waiting = MELT_scr_show_menu(tstr,"chooseSpriteNodeMenu")
                break;
                
                case "change background":
                    tstr = ""
                    for(j=0 ; j < 300 ; j++)
                        {
                        if background_exists(j)
                            {
                            tstr += background_get_name(j)+"|"
                            }
                        }
                    with waiting instance_destroy()
                    waiting = MELT_scr_show_menu(tstr,"chooseBackgroundNodeMenu")
                break;
                
                case "copy code to clipboard":
                    ///button(spr,x,y,w,h,text,bpic,subimg,name)
                    tstr = "button("+sprite_get_name(global.GUI_spr[i])+","+string(global.GUI_x[i] - global.GUI_w[i] / 2)
                        +","+string(global.GUI_y[i] - global.GUI_h[i] / 2)+","+
                        string(global.GUI_w[i])+","+string(global.GUI_h[i])+",'"+global.GUI_text[i]+"',-1,0,'')"
                    clipboard_set_text(tstr)
                    with waiting instance_destroy()
                break;
                
                case "horizontal alignment":
                    with waiting instance_destroy()
                    tstr = "Left|Center|Right|"
                    waiting = MELT_scr_show_menu(tstr,"chooseHAlignment")
                break;
                
                case "vertical alignment":
                    with waiting instance_destroy()
                    tstr = "Top|Center|Bottom|"
                    waiting = MELT_scr_show_menu(tstr,"chooseVAlignment")
                break;
                
                case "password box":
                    with waiting instance_destroy()
                    global.GUI_is_password[i] = show_question("Make this input be a password box? (Characters entered by user into input will be hidden.)")
                    //waiting = MELT_scr_show_menu(tstr,"chooseVAlignment")
                break;
                
                case "cancel":
                    with waiting instance_destroy()
                break;
                }
            }
        }
    else
    if waiting.object_index = MELT_obj_input
        {
        if waiting.answer > ""
            {
            global.GUI_text[i] = waiting.answer
            with waiting instance_destroy()
            if global.GUI_type[i] = "gui_text"
                {
                global.GUI_w[i] = string_width(global.GUI_text[i]) + 32
                global.GUI_h[i] = string_height(global.GUI_text[i]) + 32
                }
            }
        }
    }
        
