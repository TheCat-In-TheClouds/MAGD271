class Actor {
  KeyListener kl;
  PVector pos, scale, 
    walk, gravity, jump;
  float walkSpeed, gForce, accel = 1.1;
  boolean grounded, ducking, jumping, walking;
  int jumpStart, jumpDuration = 600, jumpEnd;
  StateMachine<Animation> animator;
  Animation idleAnim, walkAnim, jumpAnim;

  Actor() {
    kl = new KeyListener(UP, DOWN, LEFT, RIGHT);

    scale = new PVector(min(width, height) / 8.0, min(width, height) / 8.0);
    pos = new PVector(width / 2.0, height / 2.0);

    walkSpeed = max(width, height) / 205.0;
    gForce = walkSpeed / 2.0;
    walk = PVector.mult(VECTOR_E, walkSpeed);
    gravity = PVector.mult(VECTOR_S, gForce);
    jump = PVector.mult(VECTOR_N, gForce * 5);

    idleAnim = new Animation("Idle", 10, 
      loadImage("idle01.png"), 
      loadImage("idle02.png"), 
      loadImage("idle03.png"), 
      loadImage("idle04.png"));
    walkAnim = new Animation("Walk", 10, 
      loadImage("walk01.png"), 
      loadImage("walk02.png"), 
      loadImage("walk03.png"), 
      loadImage("walk04.png"));
    jumpAnim = new Animation("Jump", 10, 
      loadImage("jump01.png"), 
      loadImage("jump02.png"), 
      loadImage("jump03.png"), 
      loadImage("jump04.png"));
    animator = new StateMachine<Animation>(
      idleAnim, 
      walkAnim, 
      jumpAnim
      );
    imageMode(CENTER);
  }

  void draw() {
    gravity();
    move();
    animator.current.onSustain(this.pos.x, this.pos.y, this.scale.x, this.scale.y);

    if (grounded && walking) {
      animator.set("Walk");
    } else if (jumping) {
      animator.set("Jump");
    } else {
      animator.set("Idle");
    }
  }

  void gravity() {
    if (this.pos.y < elevation) {
      this.gravity.mult(accel);
      this.pos.add(gravity);
    } else {
      jumping = false;
      gravity = PVector.mult(VECTOR_S, gForce);
    }
  }

  void move() {

    if (kl.get(LEFT) || kl.get(RIGHT)) {
      this.walking = true;
      if (kl.get(LEFT) && this.pos.x > 0) {
        this.pos.sub(walk);
      }
      if (kl.get(RIGHT) && this.pos.x < width) {
        this.pos.add(walk);
      }
    } else {
      this.walking = false;
    }

    if (kl.get(UP)) {
      if (grounded) {
        jumping = true;
        jumpStart = millis();
        jumpEnd = jumpStart + jumpDuration;
      }
    }

    if (jumping) {
      if (millis() < jumpEnd) {
        pos.add(jump);
      } else {
        jumping = false;
      }
    }

    grounded = this.pos.y >= elevation;
  }

  void keyPressed(KeyEvent e) {
    kl.keyPressed(e);
  }

  void keyReleased(KeyEvent e) {
    kl.keyReleased(e);
  }
}