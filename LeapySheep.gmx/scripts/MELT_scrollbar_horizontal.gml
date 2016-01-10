///MELT_scrollbar_horizontal(x,y,w,h,var,maxval,minval,scroll_sl,Name)
//                           0 1 2 3 4   5      6      7         8
temp_x=argument0
temp_y=argument1
temp_w=argument2 - 64
temp_h=argument3
temp_var=argument4
temp_max=argument5
temp_min=argument6
barsize=32
a1=.2
a2=.4
c2=c_black

var melt_exists = instance_exists(MELT_control)

if melt_exists
if MELT_control.alarm[0] = 1
    {
    //MELT INTERFACES!!!
    with MELT_control
        {
        new = MELT_scr_gui_add(argument0,argument1,argument2,argument3,"gui_hscroll")
        //global.GUI_x[new] = argument0 //+ argument3 / 2
        //global.GUI_y[new] = argument1 //+ argument4 / 2
        /*
        global.GUI_text[new] = argument5
        */
        //global.GUI_spr[new] = argument0
        }
    repeat(10)
    effect_create_above(ef_cloud,argument0+argument2/2+random(20)-10,argument1+argument3/2+random(20)-10,0,c_dkgray)
    }

var ok = 1
if melt_exists
if MELT_control.melted
ok = 0

if ok
{
return MELT_scrollbar_horizontal_frozen(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8)
}

else
return temp_var
