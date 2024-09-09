//this comment made from the PCC Mac Classroom
//today is the first day to use these examples

int boxsize = 50; //instantiate and assign an integer value as the size of the grid box. 
int cols, rows; //instantiate variables for how many columns and rows to draw in the grid 

void setup() { //built-in method of processing that only runs once at start
    size(601, 601); //set the screen size to 600 pixels width and 600 pixels height
    cols = width / boxsize; //use the canvas width to calculate how many columns there will be
    rows = height / boxsize; //use the canvas height to calculate how many rows there will be

    //draws the black grid squares at every 100 width and height in the grid
    fill(255);//set drawing color to black for the grid boxes
    stroke(0);//set the stroke outline to 0 which makes it invisible
    for (int i = 0; i < cols; i++) {//repeat column loop until end of all columns
        for (int j = 0; j < rows; j++) {//repeat row loop until end of all rows
            int x = i * boxsize; //starting point of x for drawing the grid box 
            int y = j * boxsize;//starting point of y for drawing the grid box
            rect(x, y, boxsize, boxsize);//draw a grid box 
        }
    }

    //like above but draws the red circle at every 100 width and height in the grid
    fill(255, 0, 0);
    stroke(0);
    // *** See Note at the end of program
    for (int i = 0; i < (int) ((width + 100) / 100); i++) {//loop until end of all the canvas separated by 100 pixels which is our column width
        for (int j = 0; j < (int) ((height + 100) / 100); j++) {//loop until end of all the canvas separated by 100 pixels which is our row height
            circle((float) i * 100, (float) j * 100, 10); //draws a circle of width 10
        }
    }
}

void draw() {//built-in processing method that runs with every frame

}

void mouseClicked() {//built-in processing method that runs when the mouse is used to click on the screen
    println(mouseX, mouseY);//print a single line with x and y coordinates in the output console at the location of the mouse click
}

// ***This function uses the (cast) function of the Java programming language to convert floats to integers and integers to floats. Casting is necessary because some functions require parameters to be of a certain data type or else there will be a compile time error and the program will not run.
