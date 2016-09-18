// 1. Processing has some functions like hour(),
//    minute(), month(), second(), year().

// 2. They're not very helpful. The problem is that
//    there's no sweet-spot between oversimplistic
//    measures of time and overly complex measures.
//    Between different traditional calendars in use,
//    globalization necessitating the internationalization
//    of time stamps, time zones, creating a good
//    dateTime is much more complex than it first seems.

// 3. I'll use Java's time library, although there are
//    like debates about which library is best. See
//    https://docs.oracle.com/javase/tutorial/datetime/TOC.html
import java.time.*;
import java.time.format.*;

// Dates without time
LocalDate now;
LocalDate birthday;

// Periods between dates
Period age;

// Formatting dates to make them easier to read.
// See https://docs.oracle.com/javase/8/docs/api/java/time/format/DateTimeFormatter.html
// for more information on how to format the date the way you want it.
DateTimeFormatter format = DateTimeFormatter.ofPattern("EEEE, MMMM d, yyyy");

void setup() {
  now = LocalDate.now();
  println(now);
  println(now.format(format));
  
  birthday = LocalDate.of(1985, Month.FEBRUARY, 28);
  println(birthday);
  println(birthday.format(format));
  
  age = Period.between(birthday, now);
  println(age.getYears()); 
}