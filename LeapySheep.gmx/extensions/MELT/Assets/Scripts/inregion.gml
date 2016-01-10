//inregion(x,y,x1,y1,x2,y2,relative)
//param#        0 1 2  3  4  5  6
//@author Arthur Baney
//@version March 15 2013
//@param x: the x-coordinate of the point to check whether it's in the region
//@param y: the y-coordinate of the point to check whether it's in the region
//@param x1: the x-coordinate of the first corner of the region
//@param y1: the y-coordinate of the first corner of the region
//@param x2: the x-coordinate of the second corner of the region
//@param y2: the y-coordinate of the second corner of the region
//@param relative: whether or not x2 and y2 values are relative to x1 and y1 (if true, x2 and y2 become width and height)

rel = argument6                         //relative

if (rel)                                //if relative
    {
    xc = (argument2 + argument4 / 2);   //region x-center
    w = argument4;                      //region width
    yc = (argument3 + argument5 / 2);   //region y-center
    h = argument5;                      //region height
    
    if abs(argument0 - xc)<w/2          //check if the point's x coordinate is within the region width
    and abs(argument1 - yc)<h/2         //check if the point's y coordinate is within the region height
        {
        temp_in = true;                 //if it is in the region, return true
        }
    else
        {
        temp_in = false;                //if it's not in the region, return false
        }
    }
else                                    //if not relative
    {
    xc = (argument2 + argument4) / 2;   //region x-center
    w = abs(argument2-argument4);       //region width
    yc = (argument3 + argument5) / 2;   //region y-center
    h = abs(argument3-argument5);       //region height

    if abs(argument0 - xc)<w/2          //check if the point's x coordinate is within the region width
    and abs(argument1 - yc)<h/2         //check if the point's y coordinate is within the region height
        {
        temp_in = true;                 //if it is in the region, return true
        }
    else
        {
        temp_in = false;                //if it's not in the region, return false
        }
    }   
return temp_in;                         //return whether the point is in the region or not (true / false)
