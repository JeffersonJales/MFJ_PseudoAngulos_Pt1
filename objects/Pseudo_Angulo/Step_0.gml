/// @description INPUT
if(keyboard_check_pressed(vk_space))
	room_restart();

if(program_state == PROGRAM_STATE.GET_VECTORS){
	if(mouse_check_button_pressed(mb_left)){
		add_vector(mouse_x, mouse_y);	
	}
}