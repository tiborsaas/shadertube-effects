// Created by inigo quilez - iq/2014
// Title: Slimy wall
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.						    

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359	

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
uniform float u_volume;

vec3 shape( in vec2 p )
{
	p *= 2.0;

	vec3 s = vec3( 0.0 );
	vec2 z = p;
	for( int i=0; i<8; i++ ) 
	{
        // transform		
		z += cos(z.yx + cos(z.yx + cos(z.yx + 0.5*u_time) ) );

        // orbit traps
		float d = dot( z-p, z-p ); 
		s.x += 1.0/(1.0+d);
		s.y +=  mix( 5.448/d, d, smoothstep( -0.5, 0.5, cos(.5*u_time)) );
		s.z += sin(atan(z.y-p.y,z.x-p.x));
	}
	return s / 8.0 + 6.0 * u_volume;
}

void main() 
{
	vec2 pc = (2.680 * gl_FragCoord.xy - u_resolution.xy) / min(u_resolution.y,u_resolution.x);

	vec2 pa = pc + vec2(0.04,0.0);
	vec2 pb = pc + vec2(0.0,0.4);
	
    // shape (3 times for diferentials)	
	vec3 sc = shape( pc );
	vec3 sa = shape( pa );
	vec3 sb = shape( pb );

    // color	
	vec3 col = mix( vec3(0.053,0.013,0.100), vec3(1.373,1.600,0.019), sc.x );
	col = mix( col, col.zxy, smoothstep(-0.5,0.5,cos(0.5*u_time)) );
	col *= 0.15*sc.y;
	col += 0.4*abs(sc.z) - 0.1;

    // light	
	vec3 nor = normalize( vec3( sa.x-sc.x, 0.01, sb.x-sc.x ) );
	float dif = clamp(0.5 + 0.5*dot( nor,vec3(0.5773) ),0.0,1.0);
	col *= 1.0 + 0.7*dif*col;
	col += 0.620 * pow(nor.y,128.0);

    // vignetting	
	col *= 1.0 - 0.1*length(pc);
	
	gl_FragColor = vec4( col, 1.0 );
}

