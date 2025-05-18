shader_type canvas_item;

uniform vec2 scroll_offset = vec2(0.0, 0.0);
uniform vec2 texture_size = vec2(1920.0, 1920.0); // match your grass tile size

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
    vec2 uv = UV + scroll_offset / texture_size;
    COLOR = texture(TEXTURE, fract(uv));
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
