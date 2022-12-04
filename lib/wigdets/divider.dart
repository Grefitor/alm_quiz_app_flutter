import 'package:flutter/material.dart';

class ContentDivider extends StatelessWidget {
  final String dividerText;
  const ContentDivider({Key? key, this.dividerText = 'OR'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          const Expanded(child: Divider(),),
          const SizedBox(width: 10,),
          Text(dividerText,
            style: TextStyle(
              color: Colors.black.withOpacity(.4),
            ),
          ),
          const SizedBox(width: 10,),
          const Expanded(child: Divider(),),
        ],
      ),
    );
  }
}
