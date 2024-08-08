# HNG Mobile Dev: Stage Six Task  - Angry Bird Game

---
![Splash Screen](/gitfiles/screenshot1.png)

## Table of contents

- [Overview](#overview)
- [Task Requirement](#task-requirement)
- [Solution](#solution)
- [Screenshot](#screenshot)
- [Features](#features)
- [The process](#the-process)
  - [Built with](#built-with)
- [Installation](#installation)
  - [Useful resources](#useful-resources)
- [API Integration](#flame-and-forged2d)
- [UI/UX](#uiux)
- [Mobile Architecture](#mobile-architecture)
- [Future Improvements](#future-improvements)
- [APK Download](#apk-download)
- [Live Demo Link](#live-demo-link)
- [Author](#authors)
- [Contributing](#contributing)
- [License](#license)

## Overview

This is a solution to the mobile dev stage six task of building a game using flutter and flame engine.

Objectives: Develop a mobile game inspired by "Angry Birds," where players launch characters to destroy structures and defeat enemies. The game should be engaging, visually appealing, and provide a fun and challenging experience for players.

## Task Requirement

Kindly click [here](https://docs.google.com/document/u/0/d/1qiGsEeg4PW8Zi6ZddScMNLbUa1Npb2_tLr7plhoBWBM/mobilebasic) to see project brief

### Acceptance Criteria

- Use Only Necessary Third-party Dependencies: Ensure that the application is built using only the necessary third-party packages, plugins, or libraries.
- Intuitive and Adaptive UI: The application should have a user-friendly and intuitive user interface, with clear labelling and spacing.
- Project architecture: Ensure your Project’s codebase is easily understood, maintainable and scalable.
- Proper README File: it should contain proper setup instructions, app screenshots, apk download link e.t.c.

## Solution

Angry Bird is a 2D  mobile game inspired by "Angry Birds," where players launch characters to destroy structures and defeat enemies. The game is engaging, visually appealing, and provide a fun and challenging experience for players.

### Screenshot

![Onbording screen](/gitfiles/screenshot3.png)
![Enable NFC Screen](gitfiles/screenshot13.jpg)
![Optin Screen](/gitfiles/screenshot4.png)
![Error Screen](/gitfiles/screenshot5.png)
![Add New Prroduct Screen](/gitfiles/screenshot6.png)
![Write to NFC](/gitfiles/screenshot7.png)
![alt text](/gitfiles/screenshot8.png)
![alt text](/gitfiles/screenshot9.png)
![alt text](/gitfiles/screenshot11.png)
![alt text](/gitfiles/screenshot10.png)

## Features

- Gameplay Mechanics:
  - Launch Mechanism: Characters can be dragged and launched at obstacles and enemiesic.
  - The game simulates realistic movement and interactions.
  - Destructible Structures: The game include woods and bricks that can be destroyed by the launched characters.
  - Enemies: The game include enemies within the structures that players must defeat to progress.
- Levels and Progression:
  - Level Design: The game include multiple levels with increasing difficulty.
  - Scoring System: Players can earn scores by destroying characters and obstacles.
  <!-- - Unlockable Content: Provide new characters, abilities, and levels as rewards for progression. -->

## The process

### Built with

- Flutter and Dart

### Lesson learnt

Developing the Angry Bird mobile game app provided several valuable insights and lessons, both technical and non-technical, these lessons are summarized in the following bullet point:

- The value of team work and collaboration.
Developers were paired in a team of five to work together to bring this project idea to live.
- Understanding game engine of flutter
The development provided insight to flutter game engine using flame and forge2D.
<!-- - State Management
Implementing state management with the Bloc package in Flutter was essential for maintaining and updating the app's state efficiently. This pattern helped in separating the business logic from the UI, making the code more maintainable and scalable. -->
- Effective UI/UX Design
Creating a user-friendly interface involved using various Flutter widgets to provide a smooth and responsive experience. The pull-to-refresh feature and shimmer loading effect were particularly effective in improving the user experience by providing visual feedback during data loading.
<!-- - MVVM Architecture
Adopting the MVVM architecture pattern was a significant step in organizing the codebase. This architecture facilitated a clear separation of concerns, making the app easier to manage and extend. -->

## Installation

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio or Visual Studio Code: Recommended for development and testing
- A device or emulator to run the app

### Setup Instructions

1.**Clone the repository**

   ```bash
   git clone https://github.com/yourusername/angry_bird.git
   ```
  
2.**Navigate to the project directory**

 ```bash
   cd angry_bird
   ```

3.**Get the required dependencies**

   ```bash
   flutter pub get
   ```

4.**Run the app**

  ```bash
   flutter run
   ```

### Useful resources

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Also check out these links to start your first flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

## Flame and Forged2D

Flutter Flame is an open-source, community-built game engine for Flutter that helps developers build games that require collision, maps, and a game loop. It's a minimalist engine that combines the simplicity of its component system with Flutter's power.

Forge2D is a 2D physics engine for Dart that's based on the open-source Box2D physics engine. It's designed for games and can be used independently in Dart or in a Flame project.

## UI/UX

Quick Menu provides an intuitive and user-friendly interface:

- Splash Screen: Displays an icon and app name while initializing.
- Menu Screen: List of all menus cutomers can order from.
- Add item Screen: Screen for adding new meal items to the menu.

## Mobile Architecture

Angry Bird follows the MVVM (Model-View-ViewModel) architecture pattern, which separates the business logic from the UI. This architecture enhances code maintainability and testability.

Code Structure:

- Models: Defines the data structures used in the app.
- ViewModels (Providers): Manages the app's data and business logic.
- Views: Contains the UI components and screens.

## Future Improvements

- Enhanced Error Handling: Improving error handling mechanisms to provide more informative feedback to the users and developers.
- Testing: Incorporating unit and integration tests to ensure the app's reliability and catch potential issues early.
- Performance Optimization: Optimizing the app's performance, particularly in handling large datasets and images, to ensure a smooth user experience.
- User Feedback: Gathering user feedback and iterating on the app's features and design based on real-world usage.
- Scalability: Preparing the app for scalability to handle more products, users, and potential new features in the future.

## APK Download

Download the latest version of the app from the link below:

[Download APK](https://)
or
Download [here](gitfiles/angry_bird.apk)

## Live Demo Link

Try the game: [Appetize Link](https://)

## Authors

#### Uma Godwin

- Linkedin - [@godwinekeuma](https://www.linkedin.com/in/godwinekeuma)
- Email - [godwinekeuma@gmail.com](godwinekeuma@gmail.com)

#### Iyamu Wisdom

- Linkedin - [@wisdomiyamu](https://www.linkedin.com/in/lukasio)
- Email - [wisdomiyamu@gmail.com](wisdomiyamu@gmail.com)

#### Sakariyah Ibrahim Temitope  

- Linkedin - [@ibrahim-sakariyah](https://www.linkedin.com/in/ibrahim-sakariyah-071380183?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)
- Email - [ibrahimsakariyah@gmail.com](ibrahimsakariyah@gmail.com)

#### Ijeoma Ogbonna

- Linkedin - [@ogbonnaijeoma](https://www.linkedin.com/in/ijeoma-emmanuella-913050242/)
- Email - [ogbonnaijeoma871@gmail.com](ogbonnaijeoma871@gmail.com)

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Commit your changes: `git commit -m 'Add some feature'`
5. Push to the branch: `git push origin feature/your-feature-name`
6. Submit a pull request

Please ensure your code adheres to the existing code style and includes appropriate tests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
