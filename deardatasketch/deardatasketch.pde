String[] data;

void setup() {
  size(700, 700);
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

      if (pieces.length > 10) {
        String dayName = pieces[1];                 // e.g. monday
        float sightings = Float.parseFloat(pieces[2]); // Total sightings value
        float stationary = Float.parseFloat(pieces[9]);
        float moving = Float.parseFloat(pieces[10]); //using parsefloat to extract numbers

        float circleDiameter = map(sightings, 30, 100, 25, 120);
        float posX = i * spacing;

        // Draw Circle
        fill(220, 60, 60, 180); // Translucent so the circles don't blend together when more variables are included
        stroke(150, 30, 30);
        strokeWeight(2);
        ellipse(posX, row1Y, circleDiameter, circleDiameter);
        
        // Draw blue triangle in the middle
        fill(60, 120, 240);
        noStroke();
        float triSize = 10; //if there are more moving, the triangle stays up. if there's more stationary, the triangle will be upside down
        if (moving >= stationary) {
          triangle(posX, row1Y - triSize, posX - triSize, row1Y + triSize, posX + triSize, row1Y + triSize);
        } else {
          triangle(posX, row1Y + triSize, posX - triSize, row1Y - triSize, posX + triSize, row1Y - triSize);
        }

        // Draw labels below and inside circles
        textAlign(CENTER, CENTER);
        fill(30);
        textSize(11);
        text(dayName, posX, row1Y + (circleDiameter / 2) + 15);

        // Value inside the circle
        fill(255);
        textSize(12);
        text((int)sightings, posX, row1Y - 14);
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
      if (pieces.length > 10) {
        String dayName = pieces[1];
        float sightings = Float.parseFloat(pieces[2]);
        float stationary = Float.parseFloat(pieces[9]);
        float moving = Float.parseFloat(pieces[10]);

        float circleDiameter = map(sightings, 30, 100, 25, 120);
        float posX = i * spacing;

        fill(220, 60, 60, 180);
        stroke(150, 30, 30);
        strokeWeight(2);
        ellipse(posX, row2Y, circleDiameter, circleDiameter);
        
        fill(60, 120, 240);
        noStroke();
        float triSize = 10; //if there are more moving, the triangle stays up. if there's more stationary, the triangle will be upside down
        if (moving >= stationary) {
          triangle(posX, row2Y - triSize, posX - triSize, row2Y + triSize, posX + triSize, row2Y + triSize);
        } else {
          triangle(posX, row2Y + triSize, posX - triSize, row2Y - triSize, posX + triSize, row2Y - triSize);
        }

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
  
  float row3Y = 560;
  textSize(13);
  fill(80);
  textAlign(LEFT, CENTER);
  text("Week 3:", 20, row3Y - 70);

  for (int i = 1; i <= numDaysPerWeek; i++) {
    int dataIndex = i + 14;
    if (dataIndex < data.length) {
      String[] pieces = split(data[dataIndex], ",");
      if (pieces.length > 10) {
        String dayName = pieces[1];
        float sightings = Float.parseFloat(pieces[2]);
        float stationary = Float.parseFloat(pieces[9]);
        float moving = Float.parseFloat(pieces[10]);

        float circleDiameter = map(sightings, 30, 100, 25, 120);
        float posX = i * spacing;

        fill(220, 60, 60, 180);
        stroke(150, 30, 30);
        strokeWeight(2);
        ellipse(posX, row3Y, circleDiameter, circleDiameter);
        
        fill(60, 120, 240);
        noStroke();
        float triSize = 10; //if there are more moving, the triangle stays up. if there's more stationary, the triangle will be upside down
        if (moving >= stationary) {
          triangle(posX, row3Y - triSize, posX - triSize, row3Y + triSize, posX + triSize, row3Y + triSize);
        } else {
          triangle(posX, row3Y + triSize, posX - triSize, row3Y - triSize, posX + triSize, row3Y - triSize);
        }

        // Labels
        textAlign(CENTER, CENTER);
        fill(30);
        textSize(11);
        text(dayName, posX, row3Y + (circleDiameter / 2) + 15);

        fill(255);
        textSize(12);
        text((int)sightings, posX, row3Y);
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
