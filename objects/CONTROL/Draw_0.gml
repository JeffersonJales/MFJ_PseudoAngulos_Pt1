/// @description DRAW VECTORS

/// Draw MIDDLE
draw_line(mid_room_x, 0, mid_room_x, room_height);
draw_line(0, mid_room_y, room_width, mid_room_y);
draw_circle(mid_room_x, mid_room_y, 5, false);

if(program_state == PROGRAM_STATE.GET_VECTORS)
	draw_arrow(mid_room_x, mid_room_y, mouse_x, mouse_y, arrow_size);
	
var point_arr;
for(var i = 0; i < ds_list_size(points); i++){
	point_arr = points[| i];
	draw_arrow(mid_room_x, mid_room_y, point_arr[0], point_arr[1], arrow_size);
}