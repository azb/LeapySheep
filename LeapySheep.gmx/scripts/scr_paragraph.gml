///scr_paragraph(str,x,y,w,txtcolor)
//arguments     0   1 2 3 4

temp_str1=argument0
temp_charpos=1
temp_str2=''
temp_str3=''

repeat(string_length(temp_str1))
{
temp_char=string_char_at(temp_str1,temp_charpos)
if temp_char=' ' 
    {
    if string_width(temp_str3)>argument3-16
        {
        temp_str2+='#'
        temp_str3=''
        }
    else
        {
        temp_str2+=temp_char
        temp_str3+=temp_char
        }
    }
else
    {
    temp_str2+=temp_char
    temp_str3+=temp_char
    }
temp_charpos+=1
}
draw_set_color(argument4)
draw_text(argument1,argument2,temp_str2)
