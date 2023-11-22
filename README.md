# Assignment 7

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

# Assignment 8

### Explain the difference between Navigator.push() and Navigator.pushReplacement(), accompanied by examples of the correct usage of both methods!

Navigator.push() is used to push a new route onto the navigation stack. Navigator.pushReplacement() is used when you want to push a new route onto the stack and replace the current route with the new one.
![Alt text](image.png)
![Alt text](image-1.png)

### Explain each layout widget in Flutter and their respective usage contexts!

The following layout widgets are the ones used in this assignment:
* Container is often used to control the size, padding, margin, and decoration of its child widgets.
* Align is used to align its child within its bounds.
* Padding adds padding around its child widget.
* Column is a flex container that arranges its children vertically in a single column.
* ListView is used to create a scrollable list of widgets.
* GridView is used to create a scrollable 2D array of widgets.

### List the form input elements you used in this assignment and explain why you used these input elements!

The form input element I used is the TextFormField because I only need to save my data as strings for now.

### How is clean architecture implemented in a Flutter application?

"Clean Architecture is a software design principle that promotes the separation of concerns and aims to create a modular, scalable, and testable codebase" (Medium). In flutter, clean architecture is implemented using three layers: The presentation layer handles the UI (widgets, screens, and views); The domain layer handles the business logic (use cases, entities, and business rules); The data layer handles data retrieval and storage.
Reference: https://medium.com/@samra.sajjad0001/flutter-clean-architecture-5de5e9b8d093

### How do you implement the tasks in the checklist?

* __Create at least one new page in the application, a page for adding a new item with the following requirements:__<br>
To create a new page, I created a new screen called itemlist_form.dart.
* __Use at least three input elements: name, amount, description:__<br>
I used the TextFormField layout widget for these three input elements.
* __Have a Save button:__<br>
When the save button is clicked, it validates the users input, saves the data, shows a popup widow of the data, and clears the input form so the user can add more items.
* __Each input element must not be empty:__<br>
To make sure that the input elements are not empty, I used a validator and method .isNull.
* __Each input element must contain data of the same data type as its model attribute:__<br>
To make sure that the input elements contain data of the same data type as their model attributes, I used a validator to parse the amount input to check for an integer.
* __Direct users to the new item addition form page when clicking the Add Item button on the main page:__<br>
To direct users to the new item addition form page when clicking the Add Item button on the main page, I pushed the ItemFormPage on to the navation stack with the onTap event.
* __Display data as entered in the form in a pop-up after clicking the Save button on the new item addition page:__<br>
To make the pop-up after clicking the save button, I used the showDialog function to display the data.
* __Create a drawer in the application:__<br>
To create a drawer, I used the drawer widget's header to add a title and description. The drawer child is a li
* __The drawer must have at least two options: Home and Add Item:__<br>
The drawer child is a ListView class with children ListTiles, where each ListTile has a name and navigates to their respective pages.
* __When choosing the Home option, the application will direct the user to the main page:__<br>
To achieve this, the ListTile has an onTap() event that pushes the main page onto the naviation stack.
* __When choosing the Add Item option, the application will direct the user to the new item addition form page:__<br>
Similarly, this ListTile has an onTap() event that pushes the Add Item page onto the naviation stack.

# Assignment 9

### Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?
Yes, you can retrieve JSON data without explicitly creating a model first. Creating a model before retrieving JSON data depends on whether the structure of the data is known in advance, or if you want to handle data in a more dynamic or flexible manner. However, it is better to use a model if possible.

### Explain the function of CookieRequest and explain why a CookieRequest instance needs to be shared with all components in a Flutter application.
The function of CookieRequest is to handle the cookies and tokens used for authentication of a user. CookieRequest needs to be shared with all components in a Flutter application so that the user can be identified by the server.

### Explain the mechanism of fetching data from JSON until it can be displayed on Flutter.
Fetching data from JSON in a Flutter app involves a sequential process. First, you need to make a network request using packages like http or pbp_django_auth to access JSON data from an API endpoint. Then, we need to parse the data from its JSON format into Dart objects using dart:convert's json.decode() method, transforming it into usable Dart data structures such as lists or maps. Optionally, we can create Dart classes mirroring the JSON structure to provide type safety and a clearer representation of the data, for example when we made the create items feature. Finally, utilizing Flutter widgets like ListView, GridView, Text, Image, or custom widgets, we can display this fetched and processed data within the app's UI.

### Explain the authentication mechanism from entering account data on Flutter to Django authentication completion and the display of menus on Flutter.
In the Flutter app's LoginPage, users input their credentials, triggering a POST request via CookieRequest to Django's login endpoint. Upon successful authentication in Django (authenticate and auth_login), the backend sends a JSON response containing user details and a success message with a status code of 200. This prompts navigation to the MyHomePage in Flutter, displaying a welcome SnackBar. Failed authentication triggers an error dialog in Flutter, displaying an appropriate message for incorrect credentials or a disabled account, indicated by a status code of 401 from the Django backend. This workflow illustrates the interaction between the Flutter frontend and Django backend for user authentication, managing access to the app based on the validation of user credentials on the server side.

### List all the widgets you used in this assignment and explain their respective functions.
The new widgets I used in this assignment are:
1. Provider: A widget from the provider package that supplies a value (in this case, an instance of CookieRequest) to its descendants. It helps manage state and share data across the widget tree.
2. LoginPage: Represents the screen where users input their login credentials.
3. SizedBox: A widget used to introduce space between widgets, creating vertical spacing between elements in the Column.
4. ElevatedButton: Represents the login button, triggering the authentication process when pressed.
5. Row: Arranges its children in a horizontal row, used to display a message and a 'Register' button horizontally.
6. TextButton: Represents the 'Register' button, allowing users to navigate to the registration page.
7. FutureBuilder: A widget that helps in building a widget tree based on a future's snapshot state. It asynchronously fetches data and rebuilds the UI accordingly.
8. Center: A layout widget used to center its child widget within itself.
9. CircularProgressIndicator: A widget displaying a circular progress indicator, indicating that data is being fetched or loaded.
10. Form: A widget used to create a form with form fields for user input.
11. GlobalKey<FormState>: A key that uniquely identifies the associated Form widget and allows for form validation and manipulation.

### Explain how you implement the checklist above step by step! (not just following the tutorial).
* __Create a login page in the Flutter project:__<br>
In login.dart, the main() function initializes the app with LoginApp as the root widget. The LoginApp widget sets up the app's theme and starts with the LoginPage. The LoginPage widget, a stateful widget, manages the login page's state, handling text input for username and password via TextEditingController. It displays a Scaffold containing a title in the app bar, two input fields for username and password, an elevated login button, and a 'Register' button to navigate to the registration page. The login button triggers an asynchronous process to authenticate the user with an API call using CookieRequest. Upon successful login, it navigates to MyHomePage and displays a message using a SnackBar. In case of a failed login attempt, it shows an alert dialog with an error message.

* __Integrate the Django authentication system with the Flutter project:__<br>
To integrate the Django authentication system with the Flutter project, I created a new app called authentication inside my django project. Here, I wrote the login and logout functions in authentication/views.py. Finally, I routed these functions in authentication/urs.py

* __Create a custom model according to your Django application project:__<br>
To create a custom model according to my Django application project, I converted my JSON data into a dart model using Quicktype. Then, I created a folder "models" and a file "item.dart" to place my new custom model.

* __Create a page containing a list of all items available at the JSON endpoint in Django that you have deployed:__<br>
ItemPage is a Stateful widget responsible for displaying a list of items fetched from a remote server. Inside the build method, a Scaffold widget sets up the page structure with an AppBar and Drawer, displaying the title "Item" in the app bar with specific color configurations. The body of the Scaffold utilizes a FutureBuilder to asynchronously fetch items from an API endpoint using fetchItem method. The fetchItem function uses context.watch<CookieRequest>() from the provider package to obtain the authentication token and then performs an HTTP GET request to retrieve data from 'http://127.0.0.1:8000/json/'. It processes the response JSON data into a list of Item objects using the Item.fromJson constructor. The FutureBuilder manages the asynchronous operation and builds the UI based on the received data. If the data is still being fetched (snapshot.data == null), it displays a loading indicator (CircularProgressIndicator). Once the data is available, it constructs a ListView.builder displaying each item in a scrollable list. Each item in the list is a clickable InkWell widget, navigating to an ItemDetailPage when tapped, passing the selected Item object to display its details. Inside the ItemDetailPage, details such as the item's name, amount, description, and date added are displayed within a styled container using Text widgets.

* __Create a detail page for each item listed on the Item list page:__<br>
The ItemDetailPage widget is responsible for displaying detailed information about a specific Item. The page layout is structured within a Scaffold, featuring an AppBar with the title 'Item Detail'. The body comprises a Column widget, arranging multiple Text widgets vertically to exhibit various attributes of the Item object. These details are accessed through the item object's fields. Additionally, there's an ElevatedButton prompting 'Back to Items', offering navigation back to the preceding page when clicked, by Navigator.pop(context).