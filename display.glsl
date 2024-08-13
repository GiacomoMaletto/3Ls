#pragma language glsl3

uniform vec3 pos;
uniform vec3 dir;
uniform vec3 x_dir;
uniform vec3 y_dir;
uniform sampler2D[3] t_image;
uniform bool[8] flag;

uniform mat4[3] A;

struct seq {
    int[6] i;
    float[6] T;
};

seq get_sequence (vec2 coords) {
    vec4[3] t;
    t[0] = (texture(t_image[0], coords));
    t[1] = (texture(t_image[1], coords));
    t[2] = (texture(t_image[2], coords));

    int[3] i = int[3](0, 0, 0);
    for (int j = 0; j < 3; j++) {
        if (t[j][2] < 0) {
            i[j] = 2;
        }
    }
    float minn;
    int min_j;
    seq sequence;
    for (int i = 0; i < 6; i++) { sequence.i[i] = -1; sequence.T[i] = 0.0; }

    //  = seq(int[6](-1, -1, -1, -1, -1, -1), float[6](0.0, 0.0, 0.0, 0.0, 0.0, 0.0));
    int k = 0;
    bool empty = false;
    while (!empty) {
        empty = true;
        for (int j = 0; j < 3; j++) {
            if (i[j] < 2) {
                if (empty || (!empty && t[j][ i[j] ] < minn)) {
                    empty = false;
                    minn = t[j][ i[j] ];
                    min_j = j;
                }
            }
        }
        if (!empty) {
            sequence.i[k] = min_j;
            sequence.T[k] = minn;
            i[min_j] += 1;
            k++;
        }
    }

    return sequence;
}

int evaluate(seq sequence) {
    int value = 0;
    for (int i = 0; i < 6; i++) {
        if (sequence.T[i] > 0) {
            value += sequence.i[i] + 1;
            value *= 4;
        }
    }
    return value;
}

vec4 effect(vec4 color, sampler2D tex, vec2 tc, vec2 screen_coords){
    vec3[3] c;
    c[0] = vec3(1.0, 0.0, 0.0);
    c[1] = vec3(0.0, 1.0, 0.0);
    c[2] = vec3(0.0, 0.0, 1.0);

    vec3 light = vec3(0.0, 0.0, 1.0);

    vec2[3] t;
    t[0] = (texture(t_image[0], tc)).xy;
    t[1] = (texture(t_image[1], tc)).xy;
    t[2] = (texture(t_image[2], tc)).xy;
    // return vec4(t[0][0], t[1][0], t[2][0], 1.0);

    seq s = get_sequence(tc);
    seq s_dx = get_sequence(tc + vec2(1.0, 0.0)/love_ScreenSize.xy);
    seq s_dy = get_sequence(tc + vec2(0.0, 1.0)/love_ScreenSize.xy);
    if (evaluate(s) != evaluate(s_dx) ||
        evaluate(s) != evaluate(s_dy) ||
        evaluate(s_dx) != evaluate(s_dy)) {
        if (true) return vec4(1.0, 1.0, 1.0, 1.0);
    }
    int[3] act = int[3](0, 0, 0);
    bool inside = false;
    for (int i = 0; i < 6; i++) {
        if (s.i[i] == -1) {
            if (inside) {
                float x = 2.0*tc.x - 1.0;
                float y = 1.0 - 2.0*tc.y;
                // vec3 v = normalize(dir + x*x_dir + y*y_dir);
                vec3 v = dir + x*x_dir + y*y_dir;
                vec4 X = vec4(pos + s.T[i] * v, 1.0);

                vec3 n = -normalize((A[s.i[i]] * X).xyz);
                vec3 v2 = normalize(v - 2*dot(n, v)*n);
                float bw = dot(v2, light)*0.3 + 0.7;

                vec3 col = act[0]*c[0] + act[1]*c[1] + act[2]*c[2];
                return vec4(bw*col, 1.0);
            } else {
                return vec4(0.0, 0.0, 0.0, 1.0);
            }
        }
        act[s.i[i]] = 1 - act[s.i[i]];
        int a = act[0] + 2*act[1] + 4*act[2];
        if (flag[a] != inside) {
            if (s.T[i] < 0.0) inside = !inside;
            else {
                float x = 2.0*tc.x - 1.0;
                float y = 1.0 - 2.0*tc.y;
                // vec3 v = normalize(dir + x*x_dir + y*y_dir);
                vec3 v = dir + x*x_dir + y*y_dir;
                vec4 X = vec4(pos + s.T[i] * v, 1.0);

                vec3 n = -normalize((A[s.i[i]] * X).xyz);
                vec3 v2 = normalize(v - 2*dot(n, v)*n);
                float bw = dot(v2, light)*0.3 + 0.7;

                // float bw = exp(-0.5*s.T[i]);
                if (inside) {
                    act[s.i[i]] = 1 - act[s.i[i]];
                }
                vec3 col = act[0]*c[0] + act[1]*c[1] + act[2]*c[2];
                return vec4(bw*col, 1.0);
            }
        }
    }
    return vec4(0.0, 0.0, 0.0, 1.0);
}