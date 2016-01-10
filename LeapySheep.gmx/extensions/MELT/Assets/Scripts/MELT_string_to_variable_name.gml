///MELT_string_to_variable_name(string)
//formats a descriptive string into a good looking variable name
//example: turns "Enable Turn Timer" into "enable_turn_timer"

var_name = argument0

//replace all spaces with underscores
var_name = string_replace_all(var_name , " " , "_")

//make everything lowercase
var_name = string_lower(var_name)

//get rid of unwanted characters                
unwanted = "',./<>!@#$%^&*(){}[];:/?\|-"
for(var j=1 ; j < string_length(var_name) ; j++)
    {
    uc = string_char_at(var_name, j)
    if string_count(uc , unwanted) > 0
        {
        var_name = string_replace_all( var_name , uc , "")
        }
    }
    
return var_name
