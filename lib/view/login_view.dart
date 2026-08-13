import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // ---------------- Property ----------------

  late TextEditingController idController; // ★ ID 입력값 관리
  late TextEditingController passwordController; // ★ Password 입력값 관리

  // ---------------- initState ----------------

  @override
  void initState() {
    super.initState();

    // ★ TextField Controller 초기화
    idController = TextEditingController();
    passwordController = TextEditingController();
  }

  // ---------------- dispose ----------------

  @override
  void dispose() {
    // ★ Controller 정리
    idController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  // ---------------- Functions ----------------

  // ★ ID 또는 Password를 입력하지 않았을 때 Snackbar
  void showEmptySnackbar() {
    Get.snackbar(
      '경고',
      'ID와 비밀번호를 입력하세요',

      // ★ 왼쪽에 포켓볼 이미지
      icon: Image.asset(
        'images/backround.png',
        width: 40,
        height: 40,
      ),

      // ★ 위에서 Snackbar가 내려오도록 설정
      snackPosition: SnackPosition.TOP,

      // ★ 빨간색 배경
      backgroundColor: Colors.red,

      // ★ 글자색
      colorText: Colors.white,

      // ★ Snackbar가 보이는 시간
      duration: const Duration(seconds: 2),
    );
  }

  // ★ ID / Password가 회원정보와 일치하지 않을 때 Snackbar
  void showLoginFailSnackbar() {
    Get.snackbar(
      '경고',
      'ID와 비밀번호가 일치하지 않습니다.',

      // ★ 왼쪽에 포켓볼 이미지
      icon: Image.asset(
        'images/backround.png',
        width: 40,
        height: 40,
      ),

      // ★ 위에서 Snackbar가 내려오도록 설정
      snackPosition: SnackPosition.TOP,

      // ★ 빨간색 배경
      backgroundColor: Colors.red,

      // ★ 글자색
      colorText: Colors.white,

      // ★ Snackbar가 보이는 시간
      duration: const Duration(seconds: 2),
    );
  }

  // ★ 로그인 성공 Dialog
  void showLoginSuccessDialog(String loginId) {
    Get.defaultDialog(
      title: '로그인 완료',

      content: Column(
        children: [
          // ★ 로그인한 ID를 Dialog에 출력
          Text(
            '환영합니다 $loginId님!',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // ★ OK 버튼 대신 포켓볼 이미지를 클릭
          GestureDetector(
            onTap: () {
              // ★ 기존 입력값 삭제
              idController.clear();
              passwordController.clear();

              // ★ Dialog 닫기
              Get.back();

              // ★ RegionView로 이동하면서
              // 로그인한 ID도 같이 전달
              Get.offNamed(
                '/region',
                arguments: loginId,
              );
            },

            child: Image.asset(
              'images/backround.png',
              width: 70,
              height: 70,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Build ----------------

  @override
  Widget build(BuildContext context) {
    // ★ main.dart의 ColorScheme 가져오기
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ★ 로그인 화면 이미지
              Image.asset(
                'images/backround.png',
                width: 150,
                height: 150,
              ),

              const SizedBox(height: 30),

              // ★ LOGIN 제목
              Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),

              const SizedBox(height: 30),

              // ★ ID 입력
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  labelText: 'ID',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // ★ Password 입력
              TextField(
                controller: passwordController,

                // ★ 입력한 비밀번호 가리기
                obscureText: true,

                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              // ★ LOGIN 버튼
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    // ★ 사용자가 입력한 ID
                    String loginId = idController.text.trim();

                    // ★ 사용자가 입력한 Password
                    String loginPassword =
                        passwordController.text.trim();

                    // ① ★ ID / Password 중 하나라도 입력하지 않은 경우
                    if (loginId.isEmpty ||
                        loginPassword.isEmpty) {
                      showEmptySnackbar();
                      return;
                    }

                    // ② ★★★★★★★★★★★★★★★★★★★★★★★
                    //
                    // 다음 단계에서
                    // GetStorage에 저장된 회원정보를 가져와서
                    //
                    // loginId
                    // loginPassword
                    //
                    // 와 비교
                    //
                    // 일치하지 않으면:
                    //
                    // showLoginFailSnackbar();
                    // return;
                    //
                    // ★★★★★★★★★★★★★★★★★★★★★★★


                    // ③ ★ 현재는 로그인 성공 Dialog 테스트
                    showLoginSuccessDialog(loginId);
                  },

                  child: const Text('LOGIN'),
                ),
              ),

              const SizedBox(height: 10),

              // ★ 회원가입 페이지로 이동
              TextButton(
                onPressed: () async {
                  // ★ SignupView로 이동
                  await Get.toNamed('/signup');

                  // ★ 회원가입 페이지에서 돌아오면
                  // 기존 로그인 입력값 삭제
                  idController.clear();
                  passwordController.clear();
                },

                child: const Text(
                  'Go to Register',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}