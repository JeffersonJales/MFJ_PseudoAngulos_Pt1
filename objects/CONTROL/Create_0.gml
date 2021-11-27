/// @description INIT

enum PROGRAM_STATE { GET_VECTORS, CALC }
program_state = PROGRAM_STATE.GET_VECTORS;


points = ds_list_create();
vectors = ds_list_create();

mid_room_x = room_width / 2;
mid_room_y = room_height / 2;

arrow_size = 20;

pseudo_ang_dot = 0;
ang_dot_cos = 0;
ang_dot = 0;

ang_cross = 0;

add_vector = function(_x, _y){
	var _vec2 = [_x, _y];
	ds_list_add(points, _vec2);
	ds_list_add(vectors, [mid_room_x - _x, mid_room_y - _y]);
	
	if(ds_list_size(vectors) > 1){
		program_state = PROGRAM_STATE.CALC;
		
		/// Calculando o tamanho dos vetores
		var _len_a = vector_length(vectors[| 0][0], vectors[| 0][1]);
		var _len_b = vector_length(vectors[| 1][0], vectors[| 1][1]);
		
		/// Calculando o angulo via produto escalar
		var _dot = dot_product(vectors[| 0][0], vectors[| 0][1], vectors[| 1][0], vectors[| 1][1]);
		ang_dot = _dot / (_len_a * _len_b); // resultado do cosseno
		ang_dot_cos = ang_dot;
		pseudo_ang_dot = 1 - ang_dot;	
		
		ang_dot = arccos(ang_dot);					// resultado para radianos
		ang_dot = radtodeg(ang_dot);				// radianos para angulo

		
		/// Calculando o angulo via produto vetorial
		var _cross = vectors[| 0][0] * vectors[| 1][1] - vectors[| 0][1] * vectors[| 1][0];
		ang_cross = _cross / (_len_a * _len_b);
		ang_cross = arcsin(ang_cross);
		ang_cross = radtodeg(ang_cross);
	}
}


/// Tecnica do quadrado
quadrant = 0;
pseudoang_quad = 0;
ang_quad = 0;
quad_size = 300;
add_vector_quad = function(_x, _y){
	var _vec2 = [_x, _y];
	ds_list_add(points, _vec2);
	ds_list_add(vectors, [mid_room_x - _x, mid_room_y - _y]);
	program_state = PROGRAM_STATE.CALC;

	ang_quad = point_direction(mid_room_x, mid_room_y, _x, _y);
	quadrant = ang_quad div 45;
	pseudoang_quad = cos(degtorad(ang_quad));
}

ang_quad_pseudo = 0;
ang_quad_diff = 0;
ang_quad_diff_cos = 0;
add_vector_diff = function(_x, _y){
	var _vec2 = [_x, _y];
	ds_list_add(points, _vec2);
	ds_list_add(vectors, [mid_room_x - _x, mid_room_y - _y]);
	
	if(ds_list_size(vectors) > 1){
		program_state = PROGRAM_STATE.CALC;
		var _dir1 = point_direction(mid_room_x, mid_room_y, points[| 0][0], points[| 0][1]);
		var _dir2 = point_direction(mid_room_x, mid_room_y, points[| 1][0], points[| 1][1]);
		var _diff = angle_difference(_dir1, _dir2);
		ang_quad_diff = _diff;
		ang_quad_diff_cos = cos(degtorad(_diff));
		ang_quad_pseudo = 1 - ang_quad_diff_cos;
	}
	
}


vector_length = function(a, b){
	return sqrt(power(a, 2) + power(b, 2));
}
