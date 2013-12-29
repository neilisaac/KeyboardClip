// Clip to attach Apple bluetooth keyboard (2 AA battery version) to
// Apple bluetooth (magic somethingorother) touchpad
// by Neil Isaac <isaac.neil@gmail.com> 28 Dec. 2013

// Length of the clip (distance from left side to right side)
// 75mm for the long clip, 10mm for the end clips
length = 10;

// The radius of the battery holder
// Adjust as needed for a snug fit
inner_radius = 9;

// Thickness of the cylindrical shell
// Adjust for structure and print quality
thickness = 2;

// Radius of the notch for the rubber pads
notch_radius = 1.1;

// Length of the flat part on top of the battery holder 
cover_length = 11;

// Length of the straight part for support under the battery holder
curl_length = 5.5;

// Bump on the bottom as a support
bump_radius = 1.5;

// Pen holder height
// Set to 0 to remove
pen_height = 5;

outer_radius = inner_radius + thickness;

difference(){

union(){

// Main cylinder
cylinder(length, outer_radius, outer_radius);

// Bump to add support for the notch
translate([-outer_radius, 0, 0])
cylinder(length, bump_radius, bump_radius);

}

// Cut out the middle
cylinder(length, inner_radius, inner_radius);

// Cut out notch for the rubber pad
translate([-inner_radius, 0, 0])
#cylinder(length, notch_radius, notch_radius);

// Cut out 1/4 of the circle
cube([outer_radius, outer_radius, length]);

}

// Flat cover on top 
translate([inner_radius, 0, 0])
cube([thickness, cover_length, length]);

// Extra support underneath
translate([0, inner_radius, 0])
cube([curl_length, thickness, length]);

// Close pen holder
translate([outer_radius - thickness / sqrt(2), 0, 0])
rotate([0, 0, -45])
#cube([pen_height, thickness, length]);

// Far pen holder
translate([outer_radius, cover_length - sqrt(2) * thickness, 0])
rotate([0, 0, 45])
#cube([pen_height, thickness, length]);
