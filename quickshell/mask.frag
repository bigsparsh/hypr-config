#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float w;
    float h;
    float m;
    float r;
    vec4 col;
};

// Function to calculate distance to a rounded rectangle
float roundedBoxSDF(vec2 p, vec2 b, float r) {
    vec2 q = abs(p) - b + r;
    return min(max(q.x, q.y), 0.0) + length(max(q, 0.0)) - r;
}

void main() {
    // Transform coordinates to center (0,0)
    vec2 p = (qt_TexCoord0 * vec2(w, h)) - (vec2(w, h) * 0.5);
    
    // Size of the hole
    vec2 holeSize = vec2(w * 0.5 - m, h * 0.5 - m);
    
    // Calculate distance to the hole boundary
    float d = roundedBoxSDF(p, holeSize, r);
    
    // Smoothstep creates the anti-aliasing (smoothness)
    // d > 0 is outside the hole (draw color)
    // d < 0 is inside the hole (transparent)
    float alpha = smoothstep(-1.0, 1.0, d);
    
    fragColor = col * alpha * qt_Opacity;
}

// void main() {
//     // 1. Transform coordinates to center (0,0)
//     vec2 p = (qt_TexCoord0 * vec2(w, h)) - (vec2(w, h) * 0.5);
//
//     // 2. Define the base hole size
//     vec2 holeSize = vec2(w * 0.5 - m, h * 0.5 - m);
//
//     // 3. MODIFICATION: Shift X to the LEFT
//     // Adding to p.x moves the SDF shape to the left.
//     vec2 p_mod = p;
//     p_mod.x += m * 0.5;  // Changed from -= to +=
//
//     vec2 size_mod = holeSize;
//     size_mod.x += m * 0.5; // Keep this as addition to extend the width
//
//     // Calculate distance with modified X
//     float d = roundedBoxSDF(p_mod, size_mod, r);
//
//     float alpha = smoothstep(-1.0, 1.0, d);
//     fragColor = col * alpha * qt_Opacity;
// }
