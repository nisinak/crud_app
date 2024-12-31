# todo_app
Here’s a `README.md` CRUD Post app:
# CRUD Post App

A Flutter application that demonstrates CRUD operations using the Bloc state management pattern. 
The app fetches posts from a REST API, supports creating new posts, editing existing ones, deleting posts, and filtering posts by ID.

## Features

- Fetch Posts: Retrieve a list of posts from an external API.
- Create Post: Add new posts with a title and description.
  Click the floating action button , bottom sheet will come , you can add and save
- Edit Post: Update the details of an existing post.
 Click on the post item on the post list and it will naviagte to edit page , then edit update
- Delete Post:Remove a post with a confirmation dialog.
 long press on the post item delete confirmation alert will come, you can choose from it
- Search by ID: Filter posts by their unique ID.
 Search bar on the top post list, search by id on submit
- State Management: Implements Bloc for efficient state management.

## Installation

### Clone the Repository
```bash
git clone https://github.com/nisinak/crud_app.git
cd crud-post-app
```

### Install Dependencies
Run the following command to fetch all the required dependencies:

flutter pub get


## Running the App

1. Connect a physical device or start an emulator.
2. Run the app with:

   flutter run
3. The app should launch and display the list of posts.


## Project Structure

- `bloc/`: Contains Bloc logic for managing state and events.
    - `post_bloc.dart`
    - `post_event.dart`
    - `post_state.dart`
- `models/`: Includes the `PostModel` for data representation.
- `repository/`: Handles API calls and data interaction.
- `screens/`: Contains UI for the app.
    - `home_screen.dart`
    - `edit_post_screen.dart`
- `widgets/`: Reusable widgets like `PostItem`.

