#pragma language glsl3

uniform vec3 pos;
uniform vec3 dir;
uniform vec3 x_dir;
uniform vec3 y_dir;
uniform sampler2D t_image1;
uniform sampler2D t_image2;
uniform sampler2D t_image3;
uniform bool[8] flag;

struct seq {
    int[6] i;
    float[6] T;
};

seq get_sequence (vec2 coords) {
    vec2[3] t;
    t[0] = (texture(t_image1, coords)).xy;
    t[1] = (texture(t_image2, coords)).xy;
    t[2] = (texture(t_image3, coords)).xy;

    int[3] i;
    i[0] = 0; i[1] = 0; i[2] = 0;
    float minn;
    int min_j;
    seq sequence;
    for (int i = 0; i < 6; i++) { sequence.i[i] = -1; sequence.T[i] = 0.0; }

    //  = seq(int[6](-1, -1, -1, -1, -1, -1), float[6](0.0, 0.0, 0.0, 0.0, 0.0, 0.0));

    bool empty = false;
    while (!empty) {
        empty = true;
        for (int j = 0; j < 3; j++) {
            if (i[j] < 2 && t[j][ i[j] ] >= 0) {
                if (empty || (!empty && t[j][ i[j] ] < minn)) {
                    empty = false;
                    minn = t[j][ i[j] ];
                    min_j = j;
                }
            }
        }
        if (!empty) {
            sequence.i[ i[0] + i[1] + i[2] ] = min_j;
            sequence.T[ i[0] + i[1] + i[2] ] = minn;
            i[min_j] += 1;
        }
    }

    return sequence;
}

int evaluate(seq sequence) {
    int value = 0;
    for (int i = 0; i < 6; i++) {
        value += sequence.i[i] + 1;
        value *= 4;
    }
    return value;
}

vec4 effect(vec4 color, sampler2D tex, vec2 tc, vec2 screen_coords){
    // t_image2;
    // t_image3;
    // seq sequence = get_sequence(tc);
        vec3[3] c;
        c[0] = vec3(1.0, 0.0, 0.0);
        c[1] = vec3(0.0, 1.0, 0.0);
        c[2] = vec3(0.0, 0.0, 1.0);

    vec2[3] t;
    t[0] = (texture(t_image1, tc)).xy;
    t[1] = (texture(t_image2, tc)).xy;
    t[2] = (texture(t_image3, tc)).xy;
    // return vec4(t[0][0], t[1][0], t[2][0], 1.0);

    seq s = get_sequence(tc);
    seq s_dx = get_sequence(tc + vec2(1.0, 0.0)/love_ScreenSize.xy);
    seq s_dy = get_sequence(tc + vec2(0.0, 1.0)/love_ScreenSize.xy);
    if (evaluate(s) != evaluate(s_dx) ||
        evaluate(s) != evaluate(s_dy) ||
        evaluate(s_dx) != evaluate(s_dy)) {
        return vec4(1.0, 1.0, 1.0, 1.0);
    } else {
        int[3] act = int[3](0, 0, 0);
        for (int i = 0; i < 6; i++) {
            if (s.i[i] == -1) return vec4(0.0, 0.0, 0.0, 1.0);
            act[s.i[i]] = 1 - act[s.i[i]];
            int a = act[0] + 2*act[1] + 4*act[2];
            if (flag[a]) {
                float bw = exp(-0.5*s.T[i]);
                vec3 col = act[0]*c[0] + act[1]*c[1] + act[2]*c[2];
                return vec4(bw*col, 1.0);
            }
        }
        return vec4(0.0, 0.0, 0.0, 1.0);
        // vec3[3] c;
        // c[0] = vec3(1.0, 0.0, 0.0);
        // c[1] = vec3(0.0, 1.0, 0.0);
        // c[2] = vec3(0.0, 0.0, 1.0);
        // if (s.i[0] == -1) {
        //     return vec4(0.0, 0.0, 0.0, 1.0);
        // } else {
        //     // float bw = exp(-0.2*t[0][0]);
        //     float bw = exp(-0.5*s.T[0]);
        //     return vec4(bw*c[s.i[0]], 1.0);
        // }
    }

    // return vec4(sequence.i[0] / 3.0, 0.0, 0.0, 1.0);

    // vec2[3] t;
    // t[0] = (texture(t_image1, tc)).xy;
    // t[1] = (texture(t_image2, tc)).xy;
    // t[2] = (texture(t_image3, tc)).xy;

    // int[3] i;
    // i[0] = 0; i[1] = 0; i[2] = 0;
    // float minn;
    // int min_j;
    // // seq sequence;
    // int[6] sequence_i;
    // float[6] sequence_T;
    // for (int i = 0; i < 6; i++) { sequence_i[i] = -1; sequence_T[i] = 0.0; }

    //  = seq(int[6](-1, -1, -1, -1, -1, -1), float[6](0.0, 0.0, 0.0, 0.0, 0.0, 0.0));

    // bool empty = false;
    // while (!empty) {
    //     empty = true;
    //     for (int j = 0; j < 3; j++) {
    //         if (i[j] < 2 && t[j][ i[j] ] >= 0) {
    //             if (empty || (!empty && t[j][ i[j] ] < minn)) {
    //                 empty = false;
    //                 minn = t[j][ i[j] ];
    //                 min_j = j;
    //             }
    //         }
    //     }
    //     if (!empty) {
    //         // sequence_i[ i[0] + i[1] + i[2] ] = min_j;
    //         // sequence_T[ i[0] + i[1] + i[2] ] = minn;
    //         i[min_j] += 1;
    //     }
    // }
    // return vec4(i[0] / 10.0, i[1] / 10.0, i[2] / 10.0, 1.0);
    // if (i[0] == 0) return vec4(0.0, 0.0, 0.0, 1.0);
    // else return vec4(1.0, 1.0, 1.0, 1.0);

    // vec3[3] c;
    // c[0] = vec3(1.0, 0.0, 0.0);
    // c[1] = vec3(0.0, 1.0, 0.0);
    // c[2] = vec3(0.0, 0.0, 1.0);
    // vec3 col = c[ sequence.i[0] ];

    // // float bw = sequence.T[0]; //exp(-0.2*sequence.T[0]);
    // vec4 d = texture(t_image1, tc);
    // float bw = d[0] * 100.0;
    // // return d;
    // // return (vec4(col*bw, 1));
    // return (vec4(bw, bw, bw, 1.0));
}