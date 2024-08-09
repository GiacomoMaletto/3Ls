#pragma language glsl3

uniform vec2 center;
uniform float zoom;
uniform mat4[3] A;
uniform vec2 wh;
uniform bool[8] flag;

vec3 gen_z(vec2 lambda) {
    return vec3(1.0 - lambda.x - lambda.y, lambda.x, lambda.y);
}

float det(vec3 z, int[3] bits) {
    return determinant(z[0]*A[0]*bits[0] + z[1]*A[1]*bits[1] + z[2]*A[2]*bits[2]);
}

vec4 effect(vec4 color, sampler2D tex, vec2 tc, vec2 screen_coords){
    vec3[3] c;
    c[0] = vec3(1.0, 0.0, 0.0);
    c[1] = vec3(0.0, 1.0, 0.0);
    c[2] = vec3(0.0, 0.0, 1.0);

    vec2 lambda = (2.0*tc - vec2(1.0, 1.0))*vec2(wh.x/wh.y, -1)/zoom + center;
    vec3 z = gen_z(lambda);

    float dx = 2/(zoom*wh.y);
    float dy = -dx;

    vec2 lambda_dx = lambda + vec2(dx, 0.0);
    vec3 z_dx = gen_z(lambda_dx);

    vec2 lambda_dy = lambda + vec2(0.0, dy);
    vec3 z_dy = gen_z(lambda_dy);

    for (int i = 0; i < 8; i++) {
        if (flag[i]) {
            int[3] bits;
            bits[0] = i % 2;
            bits[1] = (i/2) % 2;
            bits[2] = (i/4) % 2;

            int[3] sig;
            sig[0] = 2*bits[0] - 1;
            sig[1] = 2*bits[1] - 1;
            sig[2] = 2*bits[2] - 1;

            float d = det(z, sig);
            float d_dx = det(z_dx, sig);
            float d_dy = det(z_dy, sig);

            if (d*d_dx < 0 || d*d_dy < 0 || d_dx*d_dy < 0) {

                vec3 col = bits[0]*c[0] + bits[1]*c[1] + bits[2]*c[2];
                return vec4(col, 1.0);
            }
        }
    }
    if (0 <= z.x && 0 <= z.y && 0 <= z.z) {
        return vec4(0.4, 0.4, 0.4, 1.0);
    }
    return vec4(0.1, 0.1, 0.1, 1.0);
}