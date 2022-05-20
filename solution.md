1.  Install the `go_router` package.

```dart
flutter pub add go_router
```

2. Import your package in your `main.dart` file.

```dart
import 'package:go_router/go_router.dart';
```

3. Create your routes so the `home_screen.dart` be the main screen and `signed_in.dart` on the path `/signin`.

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

4. Replace the `MaterialApp` with a `MaterialApp.router`.

```dart
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
```

5. In your `signed_in.dart` page, create a variable to hold the `username`.

```dart
class SignedIn extends StatelessWidget {
  final username;
[...]
```

6. Generate a constructor for the `signed_in.dart` widget.

```dart
  const SignedIn({Key? key, required this.username}) : super(key: key);
```

7. In your `main.dart` `/signin` route, pass the username as a `String`.

```dart
      GoRoute(
        path: '/signin',
        builder: (context, state) => SignedIn(username: state.extra as String),
      ),
```

8. In your `home_screen.dart` `ElevatedButton` `onPressed` method, check if the `password` is equal to the String `12345` and then navigate the user to the `/signin` page and pass the `username` as extra.

```dart
            onPressed: () {
              if (passwordController.text == "12345") {
                GoRouter.of(context)
                    .push('/signin', extra: usernameController.text);
              }
            },
```

9. In your `signed_in.dart` display a welcome message in the `Text` widget with the username we got.

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
