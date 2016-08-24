// Source for data: https://catalog.data.gov/dataset/college-scorecard

// Library imported to format floats as currency.
import java.text.NumberFormat;

Table table;
TableRow uwWhitewater, uwMilwaukee, uwMadison;
String uwwName, uwmName, uwName;
int uwwUGs, uwmUGs, uwUGs;
float uwwUGsMapped, uwmUGsMapped, uwUGsMapped;
color uww = #502D7F, uwm = #FFBD00, uw = #B70101;
int uwwDebtLoad, uwmDebtLoad, uwDebtLoad;
float uwwDLMapped, uwmDLMapped, uwDLMapped;

// This is more of a Java-centric solution to formatting numbers
// as a currency. For Processing's simpler functions, see nfs(), nfc()
// and nf().
NumberFormat currency = NumberFormat.getCurrencyInstance();

void setup() {
  size(720, 330);
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

  uwwUGsMapped = map(uwwUGs, 0, 30000, 0, 100);
  uwmUGsMapped = map(uwmUGs, 0, 30000, 0, 100);
  uwUGsMapped = map(uwUGs, 0, 30000, 0, 100);

  uwwDebtLoad = uwWhitewater.getInt("GRAD_DEBT_MDN_SUPP");
  uwmDebtLoad = uwMilwaukee.getInt("GRAD_DEBT_MDN_SUPP");
  uwDebtLoad = uwMadison.getInt("GRAD_DEBT_MDN_SUPP");

  uwwDLMapped = map(uwwDebtLoad, 0, 26000, 0, 100);
  uwmDLMapped = map(uwmDebtLoad, 0, 26000, 0, 100);
  uwDLMapped = map(uwDebtLoad, 0, 26000, 0, 100);
}

void draw() {
  background(32);
  noStroke();

  fill(255);
  text(uwwName, 40, 15);
  text(uwmName, 280, 15);
  text(uwName, 520, 15);

  fill(uww);
  ellipse(120, 90, uwwUGsMapped, uwwUGsMapped);
  fill(uwm);
  ellipse(360, 90, uwmUGsMapped, uwmUGsMapped);
  fill(uw);
  ellipse(600, 90, uwUGsMapped, uwUGsMapped);

  fill(255);
  text("Undergraduates: " + nfc(uwwUGs), 40, 160);
  text("Undergraduates: " + nfc(uwmUGs), 280, 160);
  text("Undergraduates: " + nfc(uwUGs), 520, 160);

  fill(uww);
  ellipse(120, 240, uwwDLMapped, uwwDLMapped);
  fill(uwm);
  ellipse(360, 240, uwmDLMapped, uwmDLMapped);
  fill(uw);
  ellipse(600, 240, uwDLMapped, uwDLMapped);

  fill(255);
  text("Debt Load: " + currency.format(uwwDebtLoad), 40, 320);
  text("Debt Load: " + currency.format(uwmDebtLoad), 280, 320);
  text("Debt Load: " + currency.format(uwDebtLoad), 520, 320);
}