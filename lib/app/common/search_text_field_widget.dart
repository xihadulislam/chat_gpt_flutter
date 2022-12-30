import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final VoidCallback? onTap;
  var color;

   SearchTextFieldWidget({
    Key? key,
    this.color,
    this.textEditingController,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _searchTextField();
  }

  Widget _searchTextField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 4, right: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      offset: const Offset(0.0, 0.50),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 60),
                          child: Scrollbar(
                            child: TextField(
                              style: const TextStyle(fontSize: 14),
                              controller: textEditingController,
                              maxLines: null,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                      "Open AI Waiting for your query..."),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap:onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(40)),
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 6)
        ],
      ),
    );
  }
}
