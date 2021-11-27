/// @description DRAW COMMANDS
var _y = display_get_gui_height();

draw_set_halign(fa_left);

draw_text(20, 20, "Calculando o ângulo entre dois vetores!!!");
draw_text(20, _y - 60, "COMANDOS: ");
draw_text(20, _y - 40, "LMB: Adicionar vetor");
draw_text(20, _y - 20, "SPACE: Recomeçar programa");

if(program_state == PROGRAM_STATE.CALC){
	draw_set_color(c_yellow);
	draw_text(20, 60, "RESULTADO");
	draw_text(20, 80, "Quadrante: " + string(quadrant));
	draw_text(20, 100, "Pseudo_Angulo: " + string(pseudoang_quad));
	draw_text(20, 120, "Angulo cosseno :" + string(ang_quad));

	draw_set_color(c_white);
}

draw_set_halign(fa_middle);
