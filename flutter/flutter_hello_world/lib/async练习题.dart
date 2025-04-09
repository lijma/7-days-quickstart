/**
 *  练习题 https://dart.dev/codelabs/async-await
 *  第1部分：addHello()
    addHello()编写一个带有单个参数的函数String。
    addHello()返回其String前面带有 的参数'Hello '。
    示例：addHello('Jon')返回'Hello Jon'.
    第2部分：greetUser()
    greetUser()编写一个不带参数的函数。
    要获取用户名，greetUser()请调用提供的异步函数fetchUsername()。
    greetUser()addHello()通过调用、向其传递用户名并返回结果来为用户创建问候语。
    示例：如果fetchUsername()返回'Jenny'，则 greetUser()返回'Hello Jenny'。
 */


// Part 1
addHello(String user) {
  return " Hello $user";
}

// Part 2
// You can call the provided async function fetchUsername()
// to return the username.
greetUser() async {
   var username = await fetchUsername();
   return addHello(username);
}

Future<String> fetchUsername() async {
  return Future.delayed(Duration(seconds: 3),() => "marvin");
}

// Part 3
// You can call the provided async function logoutUser()
// to log out the user

void main() async {
  print(await greetUser());
}