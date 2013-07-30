ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<PShape> shapes = new ArrayList<PShape>();
SVGLoader svgl;
PGraphics canvas;
Palettes palettes;
color[] colors;
PFont font;

void setup() {
  noCursor();
  background(255);
  svgl = new SVGLoader();
  svgl.loadVectors(shapes, this.sketchPath + "/data/vector/", 500, "retro");
  size(1920, 1080);
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
  palettes = new Palettes();
  colors = palettes.colors.get(0);
  font = loadFont("HelveticaNeue-CondensedBold-14.vlw");
  textFont(font);
}

void changeColors() {
  palettes.nextColor();
  colors = palettes.colors.get(palettes.currentPalette);
}

void startOver() {
  particles.clear();
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw() {
  if (frameCount % 2000 == 0) {
    changeColors();
    startOver();
  }
  if (particles.size() < 30) {
    Particle p = new Particle(new PVector(width/2 + random(-600, 600), height/2 + random(-200, 200)), (int) random(150, 500));
    p.shape = shapes.get((int) random(shapes.size()));
    p.pixel = colors[(int) random(colors.length)];
    particles.add(p);
  }
  canvas.beginDraw();
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = (Particle) particles.get(i);
    p.update();
    for (float turn = 0; turn < TWO_PI; turn += TWO_PI / 6) {
      canvas.pushMatrix();
      canvas.translate(width / 2, height / 2);
      canvas.rotate(turn);
      p.draw();
      canvas.popMatrix();
    }
    if (p.isDead) particles.remove(i);
  }
  canvas.endDraw();
  image(canvas, 0, 0);
  fill(0);
  rect(0, 1040, 1920, 40);
  fill(255);
  text("Generative Artwork by Chris Riebschlager - Create your own artwork tonight! Stop by the touch screen and create a piece like this", 40, 1060);
}

