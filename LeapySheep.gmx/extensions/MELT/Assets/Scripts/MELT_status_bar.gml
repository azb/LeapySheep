///MELT_status_bar(x,y,w,h,val,maxval,backcol,frontcol)
//                 0 1 2 3 4   5      6       7


var melt_exists = instance_exists(MELT_control)

if melt_exists
if MELT_control.alarm[0] = 1
    {
    //MELT INTERFACES!!!
    with MELT_control
        {
        new = MELT_scr_gui_add(argument0,argument1,argument2,argument3,"gui_progressbar")
        }
    repeat(10)
    effect_create_above(ef_cloud,argument1+argument3/2+random(20)-10,argument2+argument4/2+random(20)-10,0,c_dkgray)
    }


var ok = 1
if melt_exists
if MELT_control.melted
    ok = 0

if ok
    {
    draw_set_color(argument6)
    draw_rectangle(argument0-argument2/2,
                   argument1-argument3/2,
                   argument0+argument2/2,
                   argument1+argument3/2,0)
                   
    draw_set_color(argument7)
    draw_rectangle(argument0-argument2/2,
                   argument1-argument3/2,
                   argument0-argument2/2+argument4/argument5*argument2,
                   argument1+argument3/2,0)
    }
