///MELT_status_bar_frozen(x,y,w,h,val,maxval,backcol,frontcol)
//                        0 1 2 3 4   5      6       7

draw_set_alpha(1)

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
               
