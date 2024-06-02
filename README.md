# Kinject (Dependency Injection)

It is a simple wrapper on **Inherited Widget**. 

## Single instance injection

To provide just a single instance to a widget tree
you can use **Kinject** widget.

```dart
Kinject(
  factory: (context) => const LoginBloc(),
  builder: (context) {
    return Scaffold(
      body: SafeArea(
      child: Center(
        child: ElevatedButton(
        onPressed: context.resolve<LoginBloc>().login,
        child: const Text('Log in'),
              ),
            ),
          ),
        );
    },
);
```

## Multi-instance injection and inter-dependency

To provide multiple instances and provide dependency between them
**ProxyInject** class and **Kinjects** widget can be used.

```dart

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Kinjects(
      kinjects: [
        ProxyKinject<AuthDataSource>((_) => AuthDataSourceImpl()),
        ProxyKinject<AuthRepository>(
          (context) => AuthRepositoryImpl(
            context.resolve<AuthDataSource>(),
          ),
        ),
        ProxyKinject<LoginBloc>(
          (context) => LoginBloc(
            context.resolve<AuthRepository>(),
          ),
        ),
      ],
      builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: ElevatedButton(
                onPressed: context.resolve<LoginBloc>().login,
                child: const Text('Log in'),
              ),
            ),
          ),
        );
      },
    );
  }
}
```

## Singleton and Factory initialization

**Kinject** gives flexibility to a developer to adjust instance as Singleton or Factory.
If you want to initialize Singleton class for all app, you can provide instance of this class above the 
**MaterialApp**. Or, if you want to initialize instance as factory, you can adjust it with the help of
subtrees based providing.

### KinjectObserver

You can enable **KinjectObserver** for your app to track initialize and dispose events.

At first, you should configure your own subclass:

```dart
final class AppKinjectObserver implements KinjectObserver {
  @override
  void onCreate(Kinject instance) {
    debugPrintThrottled('${instance.type} initialized');
  }

  @override
  void onDispose(Kinject instance) {
    debugPrintThrottled('${instance.type} disposed');
  }
}
```

And, with the help of the following command, you can configure observer:

```dart
Kinject.observer = AppKinjectObserver();
```

---

## Maintainers

[Kanan Yusubov](https://www.linkedin.com/in/thisisyusub/)
