int timer = 0;
ArrayList<Cell> cells;


void setup(){
  size(800,800);
  background(0);
  cells = new ArrayList<Cell>();
  Cell centerCell = new Cell(width / 2.0, height / 2.0, 30, width / 2.0, height / 2.0); 
  cells.add(centerCell);
}

void draw(){
  background(255);
  
  if(timer > 1){
    newCell();
    timer = 0;
  }
  
  cell();
  
  
  timer++;
}



void newCell(){
  PVector rPos = new PVector(random(width),random(height));
  PVector newPos = new PVector();
  float cellDist = width + height;
  PVector getNearestCell = new PVector();
  float cellR = osc(frameCount,1,20)+0.5*9;
  float getNearestCellR = 0;

  for (int i = 0; i < cells.size(); i++) {
    Cell cellLength = cells.get(i);
    PVector lastPos = new PVector(cellLength.position.x, cellLength.position.y);
    float newDist = lastPos.dist(rPos);
    if(newDist < cellDist){
      cellDist = newDist;
      getNearestCell.x = lastPos.x;
      getNearestCell.y = lastPos.y;
      getNearestCellR = cellLength.radius;
    }
  }
  
  
 newPos = rPos.copy();
 newPos.sub(getNearestCell);
 
  float Rad = cellR + getNearestCellR;
  float rangeBetweenCells = Rad/cellDist;
 

  
  cells.add(new Cell(getNearestCell.x+newPos.x*rangeBetweenCells, getNearestCell.y+newPos.y*rangeBetweenCells, cellR, getNearestCell.x, getNearestCell.y)); 

}

void cell(){
  for (Cell actualCell : cells) {
    actualCell.render();
  }
}

float osc(float x, float amp, float period) {
  return amp* sin(x* (TWO_PI / period));
}

void keyPressed(){
  saveFrame("fractarGrowth-##.png");
}
