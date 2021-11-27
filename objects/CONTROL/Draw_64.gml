/// @description DRAW COMMANDS
var _y = display_get_gui_height();

draw_set_halign(fa_left);

draw_text(20, 20, "Calculando o angulo entre dois vetores!!!");
draw_text(20, _y - 60, "COMANDOS: ");
draw_text(20, _y - 40, "LMB: Adicionar vetor");
draw_text(20, _y - 20, "SPACE: Recomeçar programa");

if(program_state == PROGRAM_STATE.CALC){
	draw_set_color(c_yellow);
	draw_text(20, 60, "RESULTADO");
	draw_text(20, 80, "Angulo entre vetores: " + string(ang_quad_diff));
	draw_text(20, 100, "Angulo cosseno: " + string(ang_quad_diff_cos));
	draw_text(20, 120, "Pseudoangulo cosseno: " + string(ang_quad_pseudo));

	draw_set_color(c_white);
}

draw_set_halign(fa_middle);
