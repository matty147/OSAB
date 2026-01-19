
image_speed = 0;

links = [
    "https://jkocman.github.io/OSAB-website/", // change once finished i dont know where it will be hosted
    "https://github.com/matty147/OSAB",
    "https://discord.gg/wHVXxWgwAc",
    "https://inkk-ing.itch.io/osab",
    "https://x.com/Matty_inkk"
    ];
    
icon_number = 5;

for (var i = 0; i < icon_number;i++)
{
    var _x = room_width - (sprite_width + 18) * (icon_number - i - 0.5) - 5; 
    
    var icon = instance_create_depth(_x,room_height - 25,depth,obj_menu_icons);
    icon.link = links[i];
    icon.image_index = i;
}
