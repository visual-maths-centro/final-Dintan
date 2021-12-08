int n = 50;
float wRect;
float hRect;

class Cell {

  PVector position;
  PVector nearestPos;
  PVector center = new PVector(width/2, height/2);
  float radius;
  color c = color(random(150));

  Cell(float x, float y, float radius, float nx, float ny) {
    this.position = new PVector(x, y);
    this.radius = radius;
    this.nearestPos = new PVector(nx, ny);
  }

  void render() {
    noStroke();
    fill(c);

    //for ( int i = 0; i < n; i++) {
    //  for ( int j = 0; j < n; j++) {
    //    float x = wRect * i+ wRect * 0.5;
    //    float y = hRect * j + hRect * 0.5;

    //    float t = frameCount + (noise(i*0.3, j * 0.01)*(10*i)*0.002*j);
    //    //float t = frameCount + (i*2)+ (j/4)*i;

    //    float diam = osc(t, wRect * 0.5, 100) + (wRect * 0.5);
    //    //ellipse(x, y, diam, diam);
    //        ellipse(this.position.x*diam*x, this.position.y*diam*y, this.rads*2, this.radius*2);

    //  }
    //}
    ellipse(this.position.x, this.position.y, this.radius*2, this.radius*2);

    stroke(255, 80);
    strokeWeight(map(PVector.dist(position, center), 0, 540, 1, 10));
    //line(this.position.x,this.position.y,this.nearestPos.x,this.nearestPos.y);
  }
}
