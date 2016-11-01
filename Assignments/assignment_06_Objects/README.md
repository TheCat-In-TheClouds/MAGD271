## Programming Exquisite Corpse

### Due Date
12:30 p.m. Tuesday, November 8, 2016

### Philosophy
There is no clear line between 'individual' and 'collaborative' work in creative coding. Often, you must style your code so it is __clear__ enough for third parties to understand, __modular__ so it can easily be slotted into future projects and __extensible__ so that it can be tweaked by you and others to fit new goals. Even when you author code for individual work, you could upload it to a repository on the Internet, where it can be downloaded, tweaked and used for creative purposes other than those originally intended by someone halfway across the world. Authoring code with this in mind is not only worthwhile in its own right, but is also good practice for collaborating on a group project, where you meet at the same time and in the same place with fellow group members. The clarity, extensibility and modularity mentioned above are accomplished in Processing via [Object-Oriented Programming](https://www.youtube.com/watch?v=YcbcfkLzgvs&list=PLRqwX-V7Uu6bb7z2IJaTlzwzIg_5yvL4i), the use of custom classes and functions, the former of which can be loaded into an array or collection.

From the artistic perspective, this project allows the opportunity to aggregate simple behaviors and shapes into an object which, when grouped together with other objects can lead to complex interactions and surprising aesthetic effects.

From the scripting prospective, this project reviews basic Object-Oriented Programming.

From the project management perspective, this project explores the idea of loose collaboration and how programming principles work with division of labor.

### Directions

* Define and construct an instance of one class.
    * Create a new tab by clicking on the white arrow underneath the Run and Stop buttons.
    * Give the tab the same name as the class you intend to create. Enter `class ClassName { }`
    * Define a constructor for the class in the new tab. `class ClassName { ClassName() { } }`
    * Add functionality to the class. `class ClassName { ClassName() { } void foo() { } void bar() { } }`
    * In the main tab above setup, declare a variable of the class's data type. `ClassName myInstanceVar;`
    * Initialize the variable using the class's constructor. `void setup() { myInstanceVar = new ClassName(); }`
    * The first tab that opens when you create a new Processing sketch is your default, main sketch .pde.
        * __This is the only tab and the only .pde file that can contain void setup and void draw at global scope.__
        * __Especially when working with multiple tabs, it is better to rename your project folder and main sketch from within Processing by clicking on the white arrow by the tabs and going to Rename.__

* Ensure that the class includes functionality for:
  * Displaying a shape or image in the sketch window.
  * Some kind of animation ([translation](https://processing.org/reference/translate_.html), [rotation](https://processing.org/reference/rotate_.html), [scaling](https://processing.org/reference/scale_.html), [change in color](https://processing.org/reference/lerpColor_.html)).
  * User interaction (keyboard, mouse).

* Create an account at GitHub if you have not already.

* [Create a repository](https://help.github.com/articles/create-a-repo/) following the Magd150_F16_GettingStartedWithGitHub .pdf on D2L.

* Push the Processing sketch to the repository.

### Evaluation

Points | Description
------ | -----------
5 | Sketch runs without throwing Exceptions.
5 | The sketch has been uploaded to a GitHub repository.
10 | A class has been defined.
10 | The object created from the class is shown in the sketch window.
10 | The object is animated.
10 | The object reacts to user interaction.
50 | Total

Any media included with Processing sketches are presumed to be the work of the student unless otherwise stated. Media used from outside sources are expected to be altered substantially by the student. When media from outside sources are used, a notice of attribution at the top of the main sketch in a comment should be provided. This is not only for ethical and legal reasons, but so __you can incorporate the work you do here into your portfolio__ if you choose.
