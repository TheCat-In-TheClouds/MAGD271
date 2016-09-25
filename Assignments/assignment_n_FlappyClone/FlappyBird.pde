class FlappyBird extends Game {
  Bird bird;
  private List<Pipe> pipes;
  float newPipeInterval, 
    pipeForgiveness, 
    pipeMinDifficulty, 
    pipeSpeed;
  int score;
  Background bkg;

  FlappyBird() {
    this.bird = new Bird();
    this.pipes = new ArrayList<Pipe>();
    this.pipes.add(new Pipe(this.bird.radius));
    this.newPipeInterval = 100;
    this.pipeForgiveness = 5; 
    this.pipeMinDifficulty = 10; 
    this.pipeSpeed = 3;
    this.bkg = new Background();
  }

  void draw() {
    bkg.draw();
    bird.draw();

    for (int i = pipes.size() - 1; i >= 0; --i) {
      pipes.get(i).draw();

      if (pipes.get(i).hits(bird)) {
        sm.set("Loss");
      }

      if (pipes.get(i).scoreUpdateNeeded(bird)) {
        this.score++;
        this.pipeMinDifficulty += 1;
        this.pipeForgiveness = constrain(this.pipeForgiveness - 0.5, 0, 10);
        this.pipeSpeed += 0.125;
        this.newPipeInterval = constrain(this.newPipeInterval - 2, 10, 100);
        //println("Interval : " + this.newPipeInterval);
        pipes.get(i).addedToScore = true;
      }

      if (pipes.get(i).offscreen()) {
        pipes.remove(pipes.get(i));
      }
    }

    if (frameCount % newPipeInterval == 0) {
      this.pipes.add(new Pipe(this.bird.radius, 
        this.pipeSpeed, 
        this.pipeForgiveness, 
        this.pipeMinDifficulty));
    }

    showScore();
  }

  void showScore() {
    pushStyle();
    textAlign(TOP, LEFT);
    textSize(42);
    fill(255);
    text(score, 10, 52);
    popStyle();
  }

  void onMousePressed() {
    bird.flap();
  }

  void onKeyReleased() {
  }

  void reset() {
    this.score = 0;
    this.bird = new Bird();
    this.pipes.clear();
    this.newPipeInterval = 100;
    this.pipeForgiveness = 5; 
    this.pipeMinDifficulty = 10; 
    this.pipeSpeed = 3;
  }

  Feedback feedback() {
    Feedback fb = new Feedback();
    fb.score = this.score;
    fb.elapsed = timer.elapsed();
    return fb;
  }
}