#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertColor;
varying vec4 vertTexCoord;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float alpha;
uniform float beta;
uniform float gamma;

uniform sampler2D texture;
uniform vec2 texOffset;

void main(void) {

  vec3 UV = texture2D(texture, vertTexCoord.st).rgb;
  vec3 UVl = texture2D(texture, vertTexCoord.st + vec2(-texOffset.s, 0.0)).rgb;
  vec3 UVt = texture2D(texture, vertTexCoord.st + vec2(0.0, -texOffset.t)).rgb;
  vec3 UVr = texture2D(texture, vertTexCoord.st + vec2(+texOffset.s, 0.0)).rgb;
  vec3 UVb = texture2D(texture, vertTexCoord.st + vec2(0.0, +texOffset.t)).rgb;
  vec3 UVtl = texture2D(texture, vertTexCoord.st + vec2(-texOffset.s, -texOffset.t)).rgb;
  vec3 UVtr = texture2D(texture, vertTexCoord.st + vec2(+texOffset.s, -texOffset.t)).rgb;
  vec3 UVbr = texture2D(texture, vertTexCoord.st + vec2(+texOffset.s, +texOffset.t)).rgb;
  vec3 UVbl = texture2D(texture, vertTexCoord.st + vec2(-texOffset.s, +texOffset.t)).rgb;

  vec3 avg = (UV + UVl + UVt + UVr + UVb + UVtl + UVtr + UVbr + UVbl) / 9.0;

  float A = avg.r + avg.r * (alpha * avg.g - gamma * avg.b);
  float B = avg.g + avg.g * (beta * avg.b - alpha * avg.r);
  float C = avg.b + avg.b * (gamma * avg.r - beta * avg.g);

  gl_FragColor = vec4(clamp(A, 0.0, 1.0), clamp(B, 0.0, 1.0), clamp(C, 0.0, 1.0), 1.0);

}
