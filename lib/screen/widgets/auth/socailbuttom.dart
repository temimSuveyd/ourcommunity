import 'package:flutter/material.dart';
/// 🔹 Social Buttons Row
class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key, this.onPressed});
final void Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Google ile giriş fonksiyonunu burada çağırabilirsiniz
            // Örneğin: SignUpControllerImp.to.signUpWithGoogle();
          },
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF5F5F5),
              elevation: 6,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadowColor: const Color(0x22000000),
            ),
            onPressed: () => onPressed!(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.asset(
                    "asset/images/google.png",
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Login with Google",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xFF444444),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
