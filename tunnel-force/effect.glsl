// Created by: Tibor Szász
// Title: Tunnel force

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359	

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
uniform float u_volume;

float divisions = 3.;
float modulationDepth = 1.5 * u_volume;

vec4 gradient(float f)
{
    vec4 c = vec4(0);
	f = mod(f, 2.);
    for (int i = 0; i < 4; i++) {
        c[i] = pow(0.912 + 0.896 * tan( ( 4.792 + 0.8 * u_volume ) * (f + -2.304 * float(i)/-3.402)), 10.);
    }
    return c;
}

float offset(float th)
{
    return modulationDepth * sin(divisions * th) * sin(u_time);
}

vec4 tunnel(float th, float radius)
{
	return gradient(offset(th + .25 * u_time) + 3. * log(3.*radius) - u_time) + gradient(offset(th + .125 * u_time) + 2.5 * log(3.*radius) - u_time);
}

void main()
{
    vec2 p = -0.5 + gl_FragCoord.xy / u_resolution.xy;
    p.x *= u_resolution.x/u_resolution.y;
	gl_FragColor = tunnel(atan(p.y, p.x), length(p));
	//gl_FragColor = gradient(length(p));
}
