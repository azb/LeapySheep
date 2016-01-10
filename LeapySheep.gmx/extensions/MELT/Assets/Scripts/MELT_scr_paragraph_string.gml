///MELT_scr_paragraph_string(str,w)
//arguments                  0   1

temp_str1=argument0
temp_charpos=1
temp_str2=''
temp_str3=''

repeat(string_length(temp_str1))
{
temp_char=string_char_at(temp_str1,temp_charpos)
if temp_char=' ' 
    {
    if string_width(temp_str3)>argument1-16
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

return temp_str2
