import controlP5.*;
ControlP5 cp5;
//import gifAnimation.*;

Slider sAlpha;
Slider sBeta;
Slider sGamma;

PGraphics pg;
PShader ps, pass;
float alpha;
float beta;
float gamma;

//GifMaker gifExport;

void setup() {
  size(800, 800, P2D);
  pixelDensity(1);
  frameRate(60);
  cp5 = new ControlP5(this);
  sAlpha = cp5.addSlider("Alpha")
              .setRange(0.0, 2.0)
              .setPosition(10, 10)
              .setSize(200, 20)
              .setValue(1.0);
  sBeta = cp5.addSlider("Beta")
             .setRange(0.0, 2.0)
             .setPosition(10, 40)
             .setSize(200, 20)
             .setValue(1.0);
  sGamma = cp5.addSlider("Gamma")
              .setRange(0.0, 2.0)
              .setPosition(10, 70)
              .setSize(200, 20)
              .setValue(1.0);
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
  initialize();
  //captureSetup();
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
  //capture();
}

void initialize() {
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

//setup for video capture (gif)
//void captureSetup() {
//  gifExport = new GifMaker(this, "gif/example.gif");
//  gifExport.setRepeat(0);
//  gifExport.setQuality(1);
//  gifExport.setDelay(40);
//}

//video capture
//void capture() {
//  if (frameCount <= 150) {
//    gifExport.addFrame();
//  } else {
//    gifExport.finish();
//  }
//}

void keyPressed() {
  if (key == 'r') {
    initialize();
  }
}
