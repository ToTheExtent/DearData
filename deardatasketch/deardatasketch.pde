String[] data;

void setup() {
  size(700, 400);
  data = loadStrings("mydata.txt");

  float avgSightings = calculateAverageTotal(data);
  println("Average Total Red Sightings: " + avgSightings); //not sure if this is redundant. might delete it later
}

void draw() {
  background(240);

  fill(50);
  textSize(16);
  textAlign(LEFT, TOP);
  text("Total Sightings Visualization (in progress)", 30, 20);

  // first 7 data rows (more will be added)
  int numDays = min(7, data.length - 1);
  float spacing = width / (float)(numDays + 1);
  float centerY = height / 2.0;

  for (int i = 1; i <= numDays; i++) {
    String[] pieces = split(data[i], ",");

    if (pieces.length > 2) {
      String dayName = pieces[1];                 // e.g. monday
      float sightings = Float.parseFloat(pieces[2]); // Total sightings value


      float circleDiameter = map(sightings, 30, 100, 30, 120);
      float posX = i * spacing;

      // Draw Circle
      fill(220, 60, 60, 180); // Translucent so the circles don't blend together when more variables are included
      stroke(150, 30, 30);
      strokeWeight(2);
      ellipse(posX, centerY, circleDiameter, circleDiameter);

      // Draw labels below and inside circles
      textAlign(CENTER, CENTER);
      fill(30);
      textSize(12);
      text(dayName, posX, centerY + (circleDiameter / 2) + 18);

      // Value inside the circle
      fill(255);
      textSize(13);
      text((int)sightings, posX, centerY);
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
