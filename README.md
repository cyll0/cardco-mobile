# Assignment 6

### What are the main differences between stateless and stateful widget in Flutter?
Stateless widgets only have one unchanging state. Stateful widgets have more than one state, which allows them to maintain and update their internal state.

### Explain all widgets that you used in this assignment.
* MaterialApp: This is the root widget for a Flutter application.
* MyHomePage: Is a statelesswidget
* ItemCard: Is a stateless widget
* SingleChildScrollView: A widget that provides a scrollable view for its child, allowing you to scroll through content that doesn't fit on the screen.
* Padding: A widget used to add padding (empty space) around its child widgets to control their spacing and layout.
* Column: A layout widget that arranges its children in a vertical column, one below the other.
* Text: A widget used to display text in your app. You can customize the text's style, color, and more using properties like textAlign, style, and textDirection.
* GridView: A widget that creates a scrollable grid of items. It's useful for displaying a collection of widgets in a grid layout.
* GridView.count: A specific variation of the GridView widget that creates a grid with a fixed number of columns.
* Material: A basic rectangular material design widget that is often used as the background for other widgets, such as cards.
* Inkwell: A widget used to make its child interactive by adding ink splash effects when it's tapped.
* SnackBar: A widget that displays a brief message at the bottom of the screen. It's often used for showing notifications or alerts to the user.
* Icon: A widget for displaying icons from the material design icon set or custom icons using IconData.
* Container: A versatile widget for creating a rectangular visual element that can be used to contain other widgets. It's often used for layout and styling purposes.
* AppBar: A widget representing the app bar at the top of the screen, typically used for navigation and displaying the app's title and actions.
* Scaffold: A basic structure for an app's UI that provides common visual elements like app bars, drawers, and a floating action button. It helps organize the app's layout.

### How do you implement the tasks in the checklist?

* __Create a new Flutter application with the inventory theme:__<br>
To create a Flutter application I used the command flutter create cardco, and navigated to it with cd cardco. Then I initialized the local git repository and linked it to the remote one.
* __Create 3 simple buttons with icon and text:__<br>
The MyHomePage class creates a Scaffold that includes an app bar and a GridView for displaying the card buttons. The GridView uses the CardItem objects to create a grid of buttons, and the ItemCard class defines the appearance and behavior of each button within the grid.
* __Create a SnackBar with texts__<br>
  When a button is tapped, an InkWell is used to provide visual feedback, and a SnackBar is displayed at the bottom of the screen, showing a message indicating which button was clicked.
