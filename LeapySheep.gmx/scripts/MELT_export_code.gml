///MELT_export_code()
//EXPORT CODE

draw_code_str += global.GUI_comment[i] + "
"

        //if get_code
            //{
            if global.GUI_type[i] = "gui_button"
            {
            if global.GUI_spr[i] = -1
                {
                draw_code_str += 
                "if MELT_drawButton("+string(global.GUI_x[i])+","+string(global.GUI_y[i])+","
                    +string(global.GUI_w[i])+","+string(global.GUI_h[i])+",'"+string(global.GUI_text[i])+"')
    {
    "+MELT_comment("//Code for what should happen when you press this '"+global.GUI_text[i]+"' button goes here")+"
    
    }

"
                }
            else
                {
                draw_code_str +=
                "if MELT_button("+sprite_get_name(global.GUI_spr[i])+", "+string(global.GUI_x[i] - global.GUI_w[i] / 2)+" , "
                    +string(global.GUI_y[i] - global.GUI_h[i] / 2)+" , "+string(global.GUI_w[i])+","+string(global.GUI_h[i]) 
                    +",'"+global.GUI_text[i] +"', -1 , 0 , '')
    {
    "+MELT_comment("//Code for what should happen when you press this '"+global.GUI_text[i]+"' button goes here")+"
    
    }

"
                }
            }
        else
        if global.GUI_type[i] = "gui_checkbox"
            {
            checkbox_var_name = MELT_string_to_variable_name(global.GUI_text[i])
            
            if checkbox_var_name = ""
            var_name = "checkbox" + string(i) + "_enabled"

            create_code_str += 
                var_name + " = 0 //Checkbox boolean variable; 1 = true, 0 = false

"
            if global.GUI_spr[i] = -1
                {
                draw_code_str += 
                "if MELT_checkbox(spr_checkbox , "+string(global.GUI_x[i] - global.GUI_w[i] / 2)+" ,"
                     +string(global.GUI_y[i] - global.GUI_h[i] / 2) +","
                    +string(global.GUI_w[i])+","+string(global.GUI_h[i])+" , "+checkbox_var_name+" ,'" 
                    + string(global.GUI_text[i]) + "')
    {
    "+MELT_comment("//You can change "+checkbox_var_name+" to the name of variable you want to enable / disable with this checkbox")+"
    "+checkbox_var_name+" = !"+checkbox_var_name+" 
    }

"
                }
            else
                {
                draw_code_str += 
                "if MELT_checkbox("+sprite_get_name(global.GUI_spr[i])+" , "+string(global.GUI_x[i] - global.GUI_w[i] / 2)+" ,"
                     +string(global.GUI_y[i] - global.GUI_h[i] / 2) +","
                    +string(global.GUI_w[i])+","+string(global.GUI_h[i])+" , checkbox_val ,'" + string(global.GUI_text[i]) + "')
    {
    "+MELT_comment("//Change checkbox_val to the name of variable you want to enable / disable with this checkbox")+"
    checkbox_val = !checkbox_val
    }

"
                }
            }
        else
        if global.GUI_type[i] = "gui_buttontab"
            {
            if string_count("tab = 0" , create_code_str) = 0
            {
            create_code_str += 
            "tab = 0

"
            }            
            
            if global.GUI_spr[i] = -1
                {
                draw_code_str += 
                "if MELT_button_tab(spr_tab,"+string(global.GUI_x[i] - global.GUI_w[i] / 2)+" , "+string(global.GUI_y[i] - global.GUI_h[i] / 2)+" , "+
                    string(global.GUI_w[i])+","+string(global.GUI_h[i])+" ,'"+string(global.GUI_text[i])+"'," +string(-1)+", 0 ,'', tab, "
                    +string(i)+" ) 
    {
    tab = "+string(i)+"
    }

"
                }
            else
                {
                draw_code_str += 
                "if MELT_button_tab("+sprite_get_name(global.GUI_spr[i])+" , "+string(global.GUI_x[i] - global.GUI_w[i] / 2)
                    +" , "+string(global.GUI_y[i] - global.GUI_h[i] / 2 ) +","+
                    string(global.GUI_w[i])+","+string(global.GUI_h[i])+",'"+string(global.GUI_text[i])+"', -1, 0 ,'', tab,"+string(i)+") 
    {
    tab = "+string(i)+"
    }

"
                }
            }
        else
        if global.GUI_type[i] = "gui_text"
            {
            t_xoff = 0
            /*
            if global.GUI_halign[i] = fa_left
            xoff = global.GUI_w[i] / 2
            if global.GUI_halign[i] = fa_right
            xoff = -global.GUI_w[i] / 2
            */
            if global.GUI_halign[i] = fa_center
            t_xoff = global.GUI_w[i] / 2
            
            draw_code_str += 
            "draw_set_color(c_black) 
draw_set_alpha(1)
MELT_draw_set_halign("+string(global.GUI_halign[i])+")
MELT_draw_set_valign("+string(global.GUI_valign[i])+")
MELT_draw_text("+string(global.GUI_x[i] - global.GUI_w[i] / 2 + t_xoff)+" , "+string(global.GUI_y[i])+",'"+string( global.GUI_text[i])+"')

" // - global.GUI_h[i] / 2
            }
        else
        if global.GUI_type[i] = "gui_input"
            {
            input_var_name = MELT_string_to_variable_name(global.GUI_text[i])
            
            if input_var_name = ''
                input_var_name = "input_str"
            
            alarm_code_str += "MELT_scr_text_cursor_alarm() //Cursor blink for text boxes
"
            
            create_code_str += "MELT_scr_cursor_alarm_init() //Initializes cursor blink for text boxes
"

            create_code_str += input_var_name + " = ''
"
            draw_code_str += 
            MELT_comment("//Replace input_string_var with the name of the string variable you want this input box to change")+
            "
"+input_var_name+" = MELT_scr_input("+string(global.GUI_x[i])+","+string(global.GUI_y[i])+","+string(global.GUI_w[i])+","+
                string(global.GUI_h[i])+","+input_var_name+",'"+string(global.GUI_text[i])+"',"+string(global.GUI_is_password[i])+","+string(i)+")

"
            }
        else
        if global.GUI_type[i] = "gui_sprite"
            {
            if global.GUI_spr[i] > -1
                {
                sprstr = sprite_get_name(global.GUI_spr[i])
                }
            else
                {
                sprstr = "<insert sprite name>"
                }
            
            draw_code_str += "MELT_draw_sprite("+sprstr+",0,"
                +string(global.GUI_x[i])+","+string(global.GUI_y[i])+","
                +string(global.GUI_w[i])+","+string(global.GUI_h[i])+")
                
"
            }
        else
        if global.GUI_type[i] = "gui_background"
            {
            draw_code_str += "MELT_draw_background("+background_get_name(global.GUI_spr[i])+","
                +string(global.GUI_x[i])+","+string(global.GUI_y[i])+","
                +string(global.GUI_w[i])+","+string(global.GUI_h[i])+")
                
"
            }
        else
        if global.GUI_type[i] = "gui_hscroll"
            {
            if string_count("scroll_sl" , create_code_str) = 0
                {
                create_code_str += "scroll_sl = -1
"
                }
            create_code_str += "global.GUI_value["+string(i)+"] = 0 //horizontal scrollbar position
            
"
            draw_code_str += "global.GUI_value["+string(i)+"] = MELT_scrollbar_horizontal("+string(global.GUI_x[i])+","+string(global.GUI_y[i])+","
                +string(global.GUI_w[i])+","+string(global.GUI_h[i])+",global.GUI_value["+string(i)+"],100,0,"+string(i)+",'')
                
"
            }
        else
        if global.GUI_type[i] = "gui_vscroll"
            {
            if string_count("scroll_sl" , create_code_str) = 0
                {
                create_code_str += "scroll_sl = -1
"
                }
            create_code_str += "global.GUI_value["+string(i)+"] = 0 //vertical scrollbar position
"
            draw_code_str += "global.GUI_value["+string(i)+"] = MELT_scrollbar_vertical("+string(global.GUI_x[i])+","+string(global.GUI_y[i])+","
                +string(global.GUI_w[i])+","+string(global.GUI_h[i])+",global.GUI_value["+string(i)+"],100,0,"+string(i)+",'')
                
"
            }
else
        if global.GUI_type[i] = "gui_progressbar"
            {
            draw_code_str += "MELT_status_bar("+string(global.GUI_x[i])+","+string(global.GUI_y[i])+","
                +string(global.GUI_w[i])+","+string(global.GUI_h[i])+","+string(global.GUI_value[i])+",100,c_red,c_lime)
                
"
            }
        else
            {
            show_message("Un Implemented GUI type: '"+global.GUI_type[i]+"'")
            /*
            draw_set_color(c_white)
            draw_rectangle(global.GUI_x[i] - global.GUI_w[i] / 2,
                global.GUI_y[i] - global.GUI_h[i] / 2 , 
                global.GUI_x[i] + global.GUI_w[i] / 2 ,
                global.GUI_y[i] + global.GUI_h[i] / 2 , 0)
            */
            }
        //draw_code_str += ""
        
        //}   
 
