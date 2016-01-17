global.mice = 5
for(i=0 ; i < global.mice ; i++)
    {
    global.mdown[i] = device_mouse_check_button(i,1)
    global.mpressed[i] = device_mouse_check_button_pressed(i,1)
    global.mreleased[i] = device_mouse_check_button_released(i,1)
    global.mx[i] = device_mouse_x(i)
    global.my[i] = device_mouse_y(i)
    }
