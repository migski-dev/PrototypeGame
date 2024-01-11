shader_type canvas_item;

uniform float height;
uniform float width;

uniform vec3 colorA;
uniform vec3 colorB;

uniform float speed; 

uniform float line_length;

void fragment() {
	float pct = sin(floor(UV.y * height) / line_length + TIME * speed) / 2.0 + 0.5;
	
	COLOR = texture(TEXTURE, UV);
	COLOR = vec4(mix(colorA,colorB, pct) + COLOR.xyz, COLOR[3]) ;
}
