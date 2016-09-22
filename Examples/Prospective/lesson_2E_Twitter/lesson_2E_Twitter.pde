import java.util.*;
import java.io.*;

ConfigurationBuilder cb;
Twitter twitter;
List<Status> results;
Pattern p;
int screenCapIncr = 0;

void setup() {
  size(420, 420);
  background(32);
  println(dataPath(""));

  p = new Pattern(width / random(1.5, 5), height / random(1.5, 5));

  // Go to https://apps.twitter.com and manage your app Keys and Access Tokens
  // to get the values to supply to the ConfigurationBuilder.
  cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("______");
  cb.setOAuthConsumerSecret("______");
  cb.setOAuthAccessToken("______");
  cb.setOAuthAccessTokenSecret("______");

  twitter = new TwitterFactory(cb.build()).getInstance();
  results = queryTwitter(100, "#harambe");
  printResults(results, 10);
}

void draw() {
  background(32);
  p.show();
}

List<Status> queryTwitter(int tweetCount, String hashTag) {
  Query query = new Query(hashTag);
  query.setCount(tweetCount);
  List<Status> tweets = new ArrayList<Status>();
  try {
    QueryResult result = twitter.search(query);
    tweets = result.getTweets();
  } 
  catch(TwitterException te) {
    println(te);
  }
  return tweets;
}

void printResults(List<Status> rs, int limit) {
  int i = 0;
  for (Status r : rs) {
    println("TIME: " + r.getCreatedAt());
    println("TEXT: " + r.getText());
    println("FAVS: " + r.getFavoriteCount());
    println("RETWEETS: " + r.getRetweetCount() + "\r\n");
    if (i >= limit) {
      return;
    }
  }
}

void tweet(String message) {
  try {
    twitter.updateStatus(message);
  } catch(TwitterException te) {
    println(te);
  }
}

void tweet(String message, String filePath) {
  try {
    StatusUpdate update = new StatusUpdate(message);
    update.media(new File(filePath));
    twitter.updateStatus(update);
  } catch(TwitterException te) {
    println(te);
  }
}

void mouseReleased() {
  save("magd271_" + ++screenCapIncr + ".png");
  tweet("Processing sketch + twitter4j",
  sketchPath() + "\\magd271_" + screenCapIncr + ".png");
}