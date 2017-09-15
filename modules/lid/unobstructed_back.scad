include <laserscad.scad>
include <lasercut.scad>

include <../case_dimensions.scad>
use <io_cutouts.scad>

module bezel_io_cover(bezel_io_cover_y=0) {
    lpart("bezel_io_cover", [x+2*t, bezel_io_cover_y+2*t]) {
        translate([t,t,0])
            difference() {
                lasercutoutSquare(
                    thickness=t,
                    x=x,
                    y=bezel_io_cover_y+t,
                    finger_joints=[
                        [DOWN,0,2],
                        [LEFT,1,2],
                        [RIGHT,0,2]
                    ]);
                translate([0,bezel_io_cover_y,0]) {
                    // IO/power jacks, if desired
                    if (cutouts_for_io_jacks)
                        io_cutouts(t=t);
                    
//                        // panel screws in the back
//                        for (xpos = [panel_screw_x, x-panel_screw_x]) {
//                            translate([xpos,-panel_screw_back_y,-dif])
//                            cylinder(r=panel_screw_r + 0.5*jack_r_padding, h=t+2*dif);
//                        }
                }
            }
            
        // fix holes in finger joints
        cube(t);
        translate([x+t,0,0])
            cube(t);
    }
}


module lid_back(lid_back_z=0) {
    lpart("lid_back", [x+2*t, lid_back_z+2*t])
        translate([t,t,0])
            lasercutoutSquare(thickness=t, x=x, y=lid_back_z,
                finger_joints=[
                    [UP,0,6],
                    [DOWN,1,2],
                    [LEFT,0,1],
                    [RIGHT,1,1]
                ]);
}

module lid_top(top_y=0) {
    lpart("lid_top", [x+2*t, top_y+2*t])
        translate([t,t,0]) {            
            lasercutoutSquare(thickness=t, x=x, y=top_y,
                finger_joints=[
                    [DOWN,1,6],
                    [UP,1,6],
                    [LEFT,1,4],
                    [RIGHT,0,4]
                ]);
        }
}