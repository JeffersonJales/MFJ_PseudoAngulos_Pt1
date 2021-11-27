/// @description INIT

enum PROGRAM_STATE { GET_VECTORS, CALC }
program_state = PROGRAM_STATE.GET_VECTORS;


points = ds_list_create();
vectors = ds_list_create();

mid_room_x = room_width / 2;
mid_room_y = room_height / 2;

arrow_size = 20;

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
		ang_dot = arccos(ang_dot);					// resultado para radianos
		ang_dot = radtodeg(ang_dot);				// radianos para angulo
		
		/// Calculando o angulo via produto vetorial
		var _cross = vectors[| 0][0] * vectors[| 1][1] - vectors[| 0][1] * vectors[| 1][0];
		ang_cross = _cross / (_len_a * _len_b);
		ang_cross = arcsin(ang_cross);
		ang_cross = radtodeg(ang_cross);
	
	}
}

vector_length = function(a, b){
	return sqrt(power(a, 2) + power(b, 2));
}
