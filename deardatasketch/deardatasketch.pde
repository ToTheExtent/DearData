String[] data;

void setup() {
  size(500, 400);
  // Load the red sightings data file
  data = loadStrings("mydata.txt");

  // I'm not what it means to return a value so I print the average on the console
  float avgSightings = calculateAverageTotal(data);
  println("Average Total Red Sightings: " + avgSightings);
}

void draw() {
  background(240);
  fill(50);
  textSize(11);

  // Display the data rows on the canvas
  for (int i = 0; i < data.length; i++) {
    text(data[i], 20, 25 + (i * 18));
  }
}

float calculateAverageTotal(String[] lines) {
  float sum = 0;
  int count = 0;

  // Start from index 1 to skip the header
  for (int i = 1; i < lines.length; i++) {
    String[] pieces = split(lines[i], ",");
    if (pieces.length > 2) {
      sum += Float.parseFloat(pieces[2]);
      count++;
    }
  }

  return count > 0 ? sum / count : 0;
}
