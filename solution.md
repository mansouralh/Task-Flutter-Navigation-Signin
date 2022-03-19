1. Create a new project named: `sign_in`.
2. Create a folder named `pages` and inside it create your first page named `home_screen.dart`.
3. Inside `home_screen.dart` import the material package and create a stateless widget.

```dart
import 'package:flutter/material.dart';
```

4. In your stateless widget create a `Scaffold` and an `AppBar`.

```dart
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    )
  }
```

5. In your `Scaffold`'s body create a `Column` with two `TextField`'s and an `ElevatedButton`.

```dart
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Username",
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.deepPurpleAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.key,
                  color: Colors.deepPurpleAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
            ),
            onPressed: () {}
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Login"),
            ),
          )
        ],
      ),

```

6. Create 2 `TextEditingController`s one for the `password` and one for the `username`.

```dart
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
[...]
```

7. Assign your `TextEditingController`s to the `TextFields`.

```dart
children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: "Username",
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.deepPurpleAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.key,
                  color: Colors.deepPurpleAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ),
```

8. Create another page in your `pages` folder name it `signed_in.dart`.
9. Inside `signed_in.dart` import the material package and create a stateless widget.

```dart
import 'package:flutter/material.dart';
```

10. In your stateless widget create a `Scaffold` and an `AppBar`.

```dart
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
[...]
```

11. In your `Scaffold`'s body create a `Column` with a `Text` widget and an `Icon`.

```dart
body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome username"),
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 140,
            ),
          ],
        ),
      ),
```

12. Install the `go_router` package.

```dart
flutter pub add go_router
```

13. Import your package in your `main.dart` file.

```dart
import 'package:go_router/go_router.dart';
```

14. Create your routes so the `home_screen.dart` be the main screen and `signed_in.dart` on the path `/signin`.

```dart
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => SignedIn(),
      ),
    ],
  );
```

15. Replace the `MaterialApp` with a `MaterialApp.router`.

```dart
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
```

16. In your `signed_in.dart` page, create a variable to hold the `username`.

```dart
class SignedIn extends StatelessWidget {
  final username;
[...]
```

17. Generate a constructor for the `signed_in.dart` widget.

```dart
  const SignedIn({Key? key, required this.username}) : super(key: key);
```

18. In your `main.dart` `/signin` route, pass the username as a `String`.

```dart
      GoRoute(
        path: '/signin',
        builder: (context, state) => SignedIn(username: state.extra as String),
      ),
```

19. In your `home_screen.dart` `ElevatedButton` `onPressed` method, check if the `password` is equal to the String `12345` and then navigate the user to the `/signin` page and pass the `username` as extra.

```dart
            onPressed: () {
              if (passwordController.text == "12345") {
                GoRouter.of(context)
                    .push('/signin', extra: usernameController.text);
              }
            },
```

20. In your `signed_in.dart` display a welcome message in the `Text` widget with the username we got.

```dart
body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome $username"),
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 140,
            ),
          ],
        ),
      ),
```

### 🍋 No coming back

After the user is signed in, we don't want him to be able to go back to the signin form.

Open the `go_router` [docs](https://gorouter.dev/navigation) and explore the `go` method instead of the `push` method.

```dart
            onPressed: () {
              if (passwordController.text == "12345") {
                GoRouter.of(context)
                    .go('/signin', extra: usernameController.text);
              }
            },
```
