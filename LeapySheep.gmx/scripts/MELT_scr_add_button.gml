///scr_add_button(btext)

if string_count(".",argument0) > 0
    {
    if show_beta
        {
        btext[buttons] = string_replace(argument0, "." , "")
        b_beta[buttons] = 1
        buttons++
        }
    }
else
    {
    b_beta[buttons] = 0
    btext[buttons] = argument0
    buttons++
    }
