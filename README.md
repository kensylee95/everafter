[Note: some features might not be present because this app is still in development. Once complete this readMe would be updated]



Overview
Everafter is a Flutter-based mobile application designed to bring people together, facilitating connections that can potentially last a lifetime. With intuitive swipe-based interactions and robust matching algorithms, Everafter aims to create meaningful relationships in today's fast-paced world. This README provides comprehensive information about the app's features, installation instructions, and more.

Features
1. User Authentication: Secure sign-up and login functionality ensure users' privacy and security.
2. Profile Creation: Users can build personalized profiles, including uploading photos and providing information about themselves.
3. Swipe Interface: Everafter employs a swipe-based mechanism for users to express interest in others by swiping right or pass by swiping left.
4. Matching Algorithm: Advanced matching algorithms suggest compatible profiles based on user preferences and interests.
5. Real-time Messaging: Once a match is made, users can engage in real-time conversations within the app.
6. Geolocation: Optional geolocation features enable users to discover potential matches nearby.
7. Push Notifications: Users receive instant notifications for new matches, messages, and other relevant activities.
8. Customization: Users can adjust their settings, including age and distance preferences, to tailor their experience.

Technologies Used
- Flutter: The entire app is built using Flutter, allowing for seamless deployment on both Android and iOS platforms.
- Firebase: Firebase Authentication ensures secure user authentication, while Firestore serves as the backend database for storing user data and managing messaging functionality.
- Geolocation Services: Integration with geolocation services enables proximity-based matching.
- Push Notifications: Firebase Cloud Messaging (FCM) is integrated for delivering push notifications.

Installation
1. Clone the repository to your local machine:
   ```
   git clone https://github.com/kensylee95/everafter.git
   ```
2. Navigate to the project directory:
   ```
   cd everafter
   ```
3. Ensure Flutter is installed. If not, follow the official Flutter installation guide: Flutter Installation Guide
4. Install dependencies:
   ```
   flutter pub get
   ```
5. Configure Firebase:
   - Create a new Firebase project on the Firebase console: Firebase Console
   - Follow the Firebase setup instructions for Android and iOS platforms.
   - Download the google-services.json (for Android) and GoogleService-Info.plist (for iOS) configuration files and place them in the appropriate directories in your Flutter project.
6. Run the app:
   ```
   flutter run
   ```

Contributing
Contributions to Everafter are welcomed! If you'd like to contribute, please fork the repository and submit a pull request with your changes.

License
Everafter is licensed under the MIT License.

Disclaimer
Everafter is developed for educational purposes and as a demonstration of Flutter app development. It is not intended for commercial use or deployment to production environments without thorough testing and proper security considerations.

Contact
For inquiries or support, please contact kingsleyumenze@gmail.com

Acknowledgments
- Acknowledge any libraries, tutorials, or resources that were instrumental in the development of Everafter.
