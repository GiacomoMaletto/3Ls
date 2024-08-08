#pragma language glsl3

uniform vec3 pos;
uniform vec3 dir;
uniform vec3 x_dir;
uniform vec3 y_dir;
uniform mat4 A;

vec4 effect(vec4 color, sampler2D texture, vec2 tc, vec2 screen_coords){
    float x = 2.0*tc.x - 1.0;
    float y = 1.0 - 2.0*tc.y;
    // vec3 v = normalize(dir + x*x_dir + y*y_dir);
    vec3 v = dir + x*x_dir + y*y_dir;

    vec4 X = vec4(pos, 1.0);
    vec4 V = vec4(v, 0.0);

    float a = dot(A * V, V);
    float b = 2.0 * dot(A * V, X);
    float c = dot(A * X, X);

    float delta = b*b - 4.0*a*c;
    if (delta >= 0.0) {
        float t_plus = (-b + sqrt(delta))/(2*a);
        float t_minus = (-b - sqrt(delta))/(2*a);
        if (t_plus >= 0.0) {
            if (t_minus >= 0.0) return vec4(min(t_plus, t_minus), max(t_plus, t_minus), 0.0, 0.0);
            else return vec4(t_plus, -1.0, 0.0, 0.0);
        } else {
            if (t_minus >= 0.0) return vec4(t_minus, -1.0, 0.0, 0.0);
            else return vec4(-1.0, -1.0, 0.0, 0.0);
        }
    } else return vec4(-1.0, -1.0, 0.0, 0.0);
}