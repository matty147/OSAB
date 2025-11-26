

if (loader.all_playes_dead)
{
    instance_destroy();
}


if (!global.pause)
{
    t = (t + increment) mod 360;
    shift = amplitude * dsin(t);
    
    //clone the movement from the object's speed and direction
    yy += vspeed;
    y = yy + shift; //vertical wave motion
    
    x -= x_speed;
}