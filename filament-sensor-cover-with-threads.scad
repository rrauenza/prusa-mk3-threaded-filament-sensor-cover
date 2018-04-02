// PRUSA iteration4
// Filament sensor cover
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// Modifications by Rich Rauenzahn to add M6x5.75mm threads to top for
// bowden connection.

// Depends on http://dkprojects.net/openscad-threads/
use <threads.scad>;

module part()
{
    // height of threads in mm
    threads = 5.75;
    // thread size
    thread_size = 6.0;
    // ptfe height is 9.8mm
    ptfe = 9.80;
            
    difference()
    {
        union()
            {   
                // base shape:
                translate([-6,50,-30.5]) cube([24,3,36]);
                
                // main cylinder:
                translate([0,60+threads,-17]) 
                    rotate([90,0,0]) 
                    cylinder(r=4.2+0.33, h=9.8+threads, $fn=30); 
                // cone cap for main cylinder.  Don't need it:
                // translate([0,61.5,-17]) rotate([90,0,0]) cylinder(r1=3, r2=4.2, h=1.5, $fn=30); 
            }
            
            //
            // mounting screws
            //
            
            translate([12,60,-12]) rotate([90,0,0]) cylinder(r=1.6,h = 20, $fn=30); 
            translate([-1,60,-24.5]) rotate([90,0,0]) cylinder(r=1.6,h = 20, $fn=30); 
                
            translate([12,54.5,-12]) rotate([90,0,0]) cylinder(r=3.1,h = 3, $fn=30); 
            translate([-1,54.5,-24.5]) rotate([90,0,0]) cylinder(r=3.1,h = 3, $fn=30); 

            //
            // filament guide
            //
            
            // threads
            translate([0,60+threads,-17]) 
                rotate([90,0,0]) 
                metric_thread(diameter=thread_size, internal=true, length=threads, $fn=30); 
                   
            // Main hole for ptfe
            // XXX: not sure why need to +1 to break top surface.
            translate([0,50+9.8+threads+1,-17])
                rotate([90,0,0])
                cylinder(r=2.2,h=9.8+threads+1, $fn=30); 
                
            // Filament hole, we don't need.
            //translate([0,61,-17])
            //    rotate([90,0,0])
            //    cylinder(r=1,h = 20, $fn=30);     
            // reversed cone at cone cap we don't need:
            // translate([0,62.5,-17]) rotate([90,0,0]) cylinder(r2=1.2, r1=3,h = 3, $fn=30);     
            
            // Cut cone at bottom.
            translate([0,53.9,-17])
                rotate([90,0,0])
                cylinder(r1=2.2, r2=3,h=4, $fn=30);     
                    
            // nice edges    
            translate([19,50,-40]) rotate([0,0,45]) cube([10,10,50]);
            translate([-9,49,-38]) rotate([0,0,45]) cube([6,5,50]);
            translate([-8,56.5,-39]) rotate([45,0,0]) cube([50,10,10]);
            translate([-8,56.5,-1]) rotate([45,0,0]) cube([50,10,10]);


        translate([14,50.4,0]) rotate([90,180,0]) linear_extrude(height = 0.6) 
        { text("rjr-1",font = "helvetica:style=Bold", size=4, center=true); }
    }
}


difference() {
    rotate([90,0,0]) part();
    // Uncomment to make cut away view.
    //translate([0,0,40])
    //  cube([40,40,40]);
}

