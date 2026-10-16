String [] data;

void setup () {
  size(400, 400);
  data = loadStrings("mydata.txt");
}

void draw() {
  for (int i=0; i<data.length; i++) {
    text(data[i], 10, 10+(i*10));
  }
}
