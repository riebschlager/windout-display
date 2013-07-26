class Particle {

  PVector pos, vel, noiseVec;
  float noiseFloat;
  int lifetime, age;
  boolean isDead;
  PShape shape;
  int pixel;
  float initialRotation, finalRotation, maxScale, percent;

  public Particle(PVector _pos, int _lifetime) {
    pos = _pos;
    vel = new PVector(0,0);
    lifetime = _lifetime;
    age = 0;
    isDead = false;
    noiseVec = new PVector();
    initialRotation = random(-TWO_PI, TWO_PI);
    finalRotation = random(-TWO_PI, TWO_PI);
    maxScale = random(-1, 1);
  }

  void update() {
    percent = (float) age / (float) lifetime;
    noiseFloat = noise(pos.x * 0.0005, pos.y * 0.0005, frameCount * 0.0005);
    noiseVec.x = cos(((noiseFloat - 0.3) * TWO_PI) * 10);
    noiseVec.y = sin(((noiseFloat - 0.3) * TWO_PI) * 10);
    vel.add(noiseVec);
    vel.div(3);
    pos.add(vel);
    age++;
    if (percent == 1f) {
      isDead = true;
    }
  }

  void draw() {  
    canvas.fill(pixel, map(percent, 0, 1, 150, 0));
    canvas.noStroke();
    shape.resetMatrix();
    shape.scale(maxScale * percent);
    shape.rotate(map(percent, 0, 1, initialRotation, finalRotation));
    canvas.shape(shape, pos.x - width / 2, pos.y - height / 2);
  }
}

