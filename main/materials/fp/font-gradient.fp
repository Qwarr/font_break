varying mediump vec2 var_texcoord0;
varying lowp vec4 var_face_color;
varying lowp vec4 var_outline_color;
varying lowp vec4 var_shadow_color;

uniform lowp vec4 texture_size_recip;
uniform lowp sampler2D texture_sampler;

uniform lowp vec4 color1;
uniform lowp vec4 color2;

vec3 gradient_mode()
{
    lowp float gradient_value_y = fract(var_texcoord0.y / texture_size_recip.w);
    lowp vec3  color_a          = color1.rgb;
    lowp vec3  color_b          = color2.rgb;

    return mix(color_a,color_b,gradient_value_y);
}

void main()
{
    lowp vec4  cache_sample  = texture2D(texture_sampler, var_texcoord0.xy);
    lowp vec3 gradient_norml = gradient_mode();

    gl_FragColor = vec4(gradient_norml,1.0) * cache_sample.x;
}