///MELT_scr_show_menu("option1|option2|option3|option4",subject)

tempstr = argument0

nm = instance_create(mouse_x,mouse_y,MELT_obj_menu)
nm.subject = argument1

with nm
    {
    tempstr = other.tempstr
    options = 1
    option[0] = ""
    
    var pos = 1
    while pos <= string_length(tempstr)
        {
        if string_char_at(tempstr , pos) = "|"
            {
            if pos < string_length(tempstr)
                {
                options++
                option[options-1] = ""
                }
            }
        else
            {
            option[options-1] += string_char_at(tempstr , pos)
            }
        pos++
        }
    }

return nm
