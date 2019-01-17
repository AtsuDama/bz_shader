import controlP5.*;
ControlP5 cp5;

Slider sAlpha;
Slider sBeta;
Slider sGamma;

PGraphics pg;
PShader ps, pass;
float alpha;
float beta;
float gamma;

void setup() {
  size(800, 800, P2D);
  pixelDensity(1);
  cp5 = new ControlP5(this);
  sAlpha = cp5.addSlider("alpha", 0.0, 1.2, 1.0, 10, 10, 200, 20);
  sBeta = cp5.addSlider("beta", 0.0, 1.2, 1.0, 10, 40, 200, 20);
  sGamma = cp5.addSlider("gamma", 0.0, 1.2, 1.0, 10, 70, 200, 20);

  alpha = sAlpha.getValue();
  beta = sBeta.getValue();
  gamma = sGamma.getValue();
  pg = createGraphics(width, height, P2D);
  pg.noSmooth();
  ps = loadShader("frag.glsl");
  pass = loadShader("pass.glsl");
  ps.set("alpha", alpha);
  ps.set("beta", beta);
  ps.set("gamma", gamma);
  pg.beginDraw();
  pg.loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y * width;
      pg.pixels[loc] = color(random(255), random(255), random(255));
    }
  }
  pg.updatePixels();
  pg.endDraw();
}

void draw() {
  alpha = sAlpha.getValue();
  beta = sBeta.getValue();
  gamma = sGamma.getValue();
  ps.set("alpha", alpha);
  ps.set("beta", beta);
  ps.set("gamma", gamma);
  pg.beginDraw();
  for (int i = 0; i < 1; i++) {
  pg.filter(ps);
  }
  pg.endDraw();
  image(pg, 0, 0, width, height);
  filter(pass);
}
