#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
varying vec4 vertTexCoord;
varying vec4 vertColor;

void main() {
  vec4 inColor = texture2D(texture, vertTexCoord.st);
  gl_FragColor = vec4(inColor.rgb, 1.0);
}
