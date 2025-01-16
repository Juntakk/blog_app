<h1>Blog App</h1>

<h3>Blog App is a versatile web application designed to streamline the blogging experience for both writers and readers. With intuitive navigation, secure user authentication, and seamless integration with Firebase, this app empowers users to create, share, and explore engaging content effortlessly.</h3>

<h3>Technologies Used</h3>
<ul>
  <li><strong>Firebase Authentication</strong> – Provides secure and easy-to-implement authentication for users.</li>
  <li><strong>Firebase Firestore</strong> – A NoSQL cloud database used to store and retrieve blog data in real-time.</li>
  <li><strong>Flutter</strong> – A UI framework used to build the mobile and web interfaces for a smooth user experience.</li>
  <li><strong>BLoC Pattern</strong> – Manages the state of the app in a reactive way, ensuring scalability and testability.</li>
  <li><strong>Clean Architecture</strong> – Separates the app's layers into distinct categories like UI, business logic, and data, promoting maintainability and scalability.</li>
</ul>

<h3>Features</h3>
<ul>
  <li><strong>User Authentication</strong>: Secure login and sign-up with Firebase Authentication.</li>
  <li><strong>Blog Management</strong>: Users can read, create, and manage blog posts. Blogs are fetched dynamically from Firebase Firestore.</li>
  <li><strong>Menu View</strong>: A dynamic navigation menu that adjusts based on the authentication state, enabling easy access to various app features.</li>
  <li><strong>Real-time Data</strong>: Real-time blog updates and notifications through Firebase Firestore and Firebase Cloud Messaging.</li>
  <li><strong>State Management</strong>: BLoC pattern ensures a reactive, testable, and maintainable solution for managing state across the app.</li>
</ul>

<h3>Screenshots</h3>

<table>
  <tr>
    <td>
      <img src="lib/assets/screenshots/blog1.png" alt="Login View" width="222">
    </td>
    <td>
      <b>Login View:</b>
      <p>
        The login screen allows users to securely authenticate using their credentials. This feature is powered by 
        <b>Firebase Authentication</b>, ensuring robust security and ease of implementation. 
        The login logic follows a <b>clean architecture</b> pattern, separating UI, business logic, and data layers. 
        State management for user authentication is handled using the <b>BLoC (Business Logic Component)</b> pattern, 
        ensuring a reactive and testable implementation.
      </p>
    </td>
  </tr>
  <tr>
    <td>
      <img src="lib/assets/screenshots/blog2.png" alt="Sign Up View" width="222">
    </td>
    <td>
      <b>Sign Up View:</b>
      <p>
        The sign-up screen enables new users to register by providing necessary details like email and password. 
        <b>Firebase Authentication</b> is used for creating new user accounts and storing them in a secure backend. 
        Validation is performed on the client side, and the BLoC state management ensures smooth user experience with 
        real-time error handling. Clean architecture principles keep the code maintainable and scalable.
      </p>
    </td>
  </tr>
  <tr>
    <td>
      <img src="lib/assets/screenshots/blog3.png" alt="Blogs View" width="222">
    </td>
    <td>
      <b>Blogs View:</b>
      <p>
        This screen displays a list of blogs fetched dynamically from a backend service. The data is retrieved from 
        <b>Firebase Firestore</b>, and caching is implemented to improve performance. 
        The BLoC pattern is utilized to manage states like loading, success, and error, providing a responsive UI. 
        Each blog entry is displayed in a structured card format, adhering to clean architecture principles for data flow.
      </p>
    </td>
  </tr>
  <tr>
    <td>
      <img src="lib/assets/screenshots/blog5.png" alt="Menu View" width="222">
    </td>
    <td>
      <b>Menu View:</b>
      <p>
        The menu screen serves as a navigation hub for the app, giving users access to various features like profile management, 
        settings, and logout. It leverages the <b>Drawer Widget</b> in Flutter for a modern and intuitive design. 
        The menu options dynamically adapt based on the user's authentication state, managed through BLoC. 
        Clean architecture ensures that navigation logic is decoupled from the UI, enhancing testability.
      </p>
    </td>
  </tr>
</table>

<h3>How It Works</h3>

<h4>1. User Authentication</h4>
<p>The app allows users to securely sign up and log in using their email and password. Firebase Authentication is integrated to handle the user authentication process. Upon successful login or sign-up, users are directed to the main app interface. The authentication state is managed using the BLoC pattern, which makes it easy to handle errors, loading states, and updates.</p>

<h4>2. Blog Management</h4>
<p>After logging in, users can view and create blogs. Blogs are fetched dynamically from Firebase Firestore, where they are stored. The app implements caching to ensure quick loading of previously fetched blog data. The BLoC pattern is used to manage various app states like loading and error handling during blog fetching.</p>

<h4>3. Menu View</h4>
<p>The Menu View serves as the central navigation hub for the app. It uses the Flutter Drawer widget to provide an easy-to-use navigation sidebar. The menu options adapt based on whether the user is logged in, allowing access to features like the profile page, settings, and the logout button. The navigation logic is kept separate from the UI, following clean architecture principles to enhance maintainability and testability.</p>

<h4>4. Firebase Integration</h4>
<p>Firebase Firestore is used to store and retrieve blog posts in real-time, while Firebase Authentication ensures secure user access. The app listens for changes in the Firestore database and updates the UI accordingly, allowing users to see new blog posts as soon as they are published.</p>
