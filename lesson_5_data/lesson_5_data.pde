// Source for data: https://catalog.data.gov/dataset/college-scorecard

Table table;
TableRow uwWhitewater, uwMilwaukee, uwMadison;
String uwwName, uwmName, uwName;
int uwwUGs, uwmUGs, uwUGs;
float uwwUGsMapped, uwmUGsMapped, uwUGsMapped;

void setup() {
  size(720, 360);
  background(32);

  table = loadTable("collegeScorecard.csv", "header");

  uwWhitewater = table.getRow(4451);
  uwMilwaukee = table.getRow(4465);
  uwMadison = table.getRow(4464);

  uwwName = uwWhitewater.getString("INSTNM");
  uwmName = uwMilwaukee.getString("INSTNM");
  uwName = uwMadison.getString("INSTNM");

  uwwUGs = uwWhitewater.getInt("UGDS");
  uwmUGs = uwMilwaukee.getInt("UGDS");
  uwUGs = uwMadison.getInt("UGDS");
  
  println(uwwUGs);
  println(uwmUGs);
  println(uwUGs);
  
  uwwUGsMapped = map(uwwUGs, 0, 30000, 0, 100);
  uwmUGsMapped = map(uwmUGs, 0, 30000, 0, 100);
  uwUGsMapped = map(uwUGs, 0, 30000, 0, 100);
}

void draw() {
  background(32);
  stroke(255);

  text(uwwName, 40, 355);
  text(uwmName, 280, 355);
  text(uwName, 520, 355);



  ellipse(120, 60, 50, 50);
  ellipse(360, 60, 50, 50);
  ellipse(600, 60, 50, 50);
}