class FlappyBird extends Game {
  Bird bird;
  private List<Pipe> pipes;
  float newPipeInterval, 
    pipeForgiveness, 
    pipeMinDifficulty, 
    pipeSpeed;
  int score;
  Background bkg;

  // 1. Create a new animation and add your frames to it.
  //    The 20 here stands for the interval before the
  //    animation is set to the next frame. The lower the
  //    interval, the faster the animation will advance
  //    through each frame.
  Animation a = new Animation("animationName", 20, 
    loadImage("fr1.png"), 
    loadImage("fr2.png"), 
    loadImage("fr3.png"), 
    loadImage("fr4.png")
    );

  FlappyBird() {
    this.bkg = new Background();

    this.bird = new Bird();

    // 2. You may have drawn your animations very large in
    //    an art program, so you want to scale them appropriately
    //    to match the collision radius of the bird. 
    a.w = this.bird.radius * 2.0;
    a.h = this.bird.radius * 2.0;

    // 3. Add the animation to the bird. Notice that if you
    //    reset the game, you're animation will no longer be
    //    on the bird.
    this.bird.addAnimation(a);

    // 4. Change the default values to suit your gameplay.
    this.newPipeInterval = 100;
    this.pipeForgiveness = 5; 
    this.pipeMinDifficulty = 10; 
    this.pipeSpeed = 3;

    this.pipes = new ArrayList<Pipe>();
    this.pipes.add(new Pipe(this.bird.radius));
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
    
    this.bird.addAnimation(a);

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