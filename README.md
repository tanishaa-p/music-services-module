# music_services_module_assignment

## Screen Recording:

Pixel 7 Pro Emulator:


https://github.com/user-attachments/assets/d0d68392-c366-45b1-806d-b7752a84a12c



Pixel 2 Emulator (responsiveness and scrollable ListView):


https://github.com/user-attachments/assets/f910fe85-2aae-473f-a4b6-cb4063d8aa44



## App Apk :

https://github.com/tanishaa-p/music-services-module/releases/download/v1.0.0/app-release.apk

## Folder structure:
- `music_services_module_assignment/`
  - `assets/`
    - `background/` : for service card background images  
    - `bottomNav/` : for bottom navigation bar icon images
    - `icons/` : for service card icon images

  - `lib/`
    - `models/`: data models like `ServiceModel`, `NavItemModel`.
    - `repositories/`: firestore data fetching logic.
    - `services/`: dependency injection setup using get_it.
    - `view_models/`: State management and business logic.
    - `views/`: Main screen views (`HomeScreen`, `ServiceDetailScreen`).
    - `widgets/`: Reusable UI components (e.g., `ServiceCard`, `CustomBottomNavBar`).
  
  - `firebase_options.dart`: Auto-generated Firebase configuration for all platforms.

  - `main.dart`: App entry point and Firebase initialization.

  - `pubspec.yaml`: Declares dependencies and assets.


## Approach

- **Data Storage:** Service data (title, description, icon asset path, background asset path, order) and bottom navigation items are stored in Firebase Firestore. They are rendered dynamically on execution of application without being hard-coded, thus reducing code base and leading to more scalable solutions
![img.png](img.png)

- **Assets:** Images are stored locally in `assets/` and referenced dynamically via Firestore.

- **State Management:** Uses Provider with MVVM architecture; view models fetch from repositories.

- **UI:**
  - Service cards and navigation bar load dynamically from Firestore.
  - Responsive design with `MediaQuery`.
  Test: Pixel 2 API 34 emulator
![Screenshot_1748138010](https://github.com/user-attachments/assets/a0606c74-300e-4764-ba73-ceda2bd9c1c1)

Pixel 7 Pro API 34 emulator:
![Screenshot_1748138305](https://github.com/user-attachments/assets/43a25bbd-548f-4291-a2e3-bbf5da883ece)


  - Custom made bottom navigation bar to incorporate custom logos and semi-circle indicator (for current active page).
  - Stateful HomeScreen widget to navigate across pages from navigation bar.
  - Uses `SafeArea` and `SingleChildScrollView` for proper scrollable layout.

- **Error Handling:** Displays retry on Firestore errors.

- **Build:** Asset registration and dependency injection with GetIt.

---
  Thank you for reviewing the assignment!

