String[] data;

void setup() {
  size(700, 500);
  data = loadStrings("mydata.txt");

  float avgSightings = calculateAverageTotal(data);
  println("Average Total Red Sightings: " + avgSightings); //not sure if this is redundant. might delete it later
}

void draw() {
  background(240);

  fill(50);
  textSize(16);
  textAlign(LEFT, TOP);
  text("Total Sightings Visualization", 30, 20);

  // first 7 data rows (more will be added)
  int numDaysPerWeek = 7;
  float spacing = width / (float)(numDaysPerWeek + 1);
  
  // Draw Circle 1
  float row1Y = 160;
  textSize(13);
  fill(80);
  textAlign(LEFT, CENTER);
  text("Week 1:", 20, row1Y - 70);

  for (int i = 1; i <= numDaysPerWeek; i++) {
    if (i < data.length) {
      String[] pieces = split(data[i], ",");
      
      if (pieces.length > 2) {
      String dayName = pieces[1];                 // e.g. monday
      float sightings = Float.parseFloat(pieces[2]); // Total sightings value


      float circleDiameter = map(sightings, 30, 100, 25, 120);
      float posX = i * spacing;

      // Draw Circle
      fill(220, 60, 60, 180); // Translucent so the circles don't blend together when more variables are included
      stroke(150, 30, 30);
      strokeWeight(2);
      ellipse(posX, row1Y, circleDiameter, circleDiameter);

      // Draw labels below and inside circles
      textAlign(CENTER, CENTER);
      fill(30);
      textSize(11);
      text(dayName, posX, row1Y + (circleDiameter / 2) + 15);

      // Value inside the circle
      fill(255);
      textSize(12);
      text((int)sightings, posX, row1Y);
    }
  }
}

// Draw Circle 2

float row2Y = 360;
textSize(13);
fill(80);
textAlign(LEFT, CENTER);
text("Week 2:", 20, row2Y - 70);

for (int i = 1; i <= numDaysPerWeek; i++) {
    int dataIndex = i + 7; // shift index to pull the second week's data
    if (dataIndex < data.length) {
      String[] pieces = split(data[dataIndex], ",");
      if (pieces.length > 2) {
        String dayName = pieces[1];                 
        float sightings = Float.parseFloat(pieces[2]); 

        float circleDiameter = map(sightings, 30, 100, 25, 120);
        float posX = i * spacing;

        fill(220, 60, 60, 180);
        stroke(150, 30, 30);
        strokeWeight(2);
        ellipse(posX, row2Y, circleDiameter, circleDiameter);

        // Labels
        textAlign(CENTER, CENTER);
        fill(30);
        textSize(11);
        text(dayName, posX, row2Y + (circleDiameter / 2) + 15);
        
        fill(255);
        textSize(12);
        text((int)sightings, posX, row2Y);
      }
    }
  }
}

float calculateAverageTotal(String[] lines) {
  float sum = 0;
  int count = 0;

  // Start 1 to skip the header
  for (int i = 1; i < lines.length; i++) {
    String[] pieces = split(lines[i], ",");
    if (pieces.length > 2) {
      sum += Float.parseFloat(pieces[2]);
      count++;
    }
  }

  return count > 0 ? sum / count : 0;
}
