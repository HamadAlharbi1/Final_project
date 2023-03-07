import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCartWidget extends StatefulWidget {
  const CardCartWidget({
    super.key,
  });

  @override
  State<CardCartWidget> createState() => _CardCartWidgetState();
}

class _CardCartWidgetState extends State<CardCartWidget> {
  bool _isChecked = false;
  bool _iChecked = true;
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'أخذ المقاس',
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    // leading: const Icon(Icons.clear),
                    title: const Text('قياس خياطتي'),
                    onTap: () {
                      // Perform some action when Option 2 is selected
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    // leading: const Icon(Icons.clear),
                    title: const Text('قياس خياطتي'),
                    onTap: () {
                      // Perform some action when Option 2 is selected
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'قماش كوري',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      ' قماش طبيعي 100',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('السعر 250')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  color: Colors.amber,
                  width: 150,
                  height: 200,
                  child: const Text('data'),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: const Text('تفصيل الثوب'),
                          value: _iChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _iChecked = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: const Text('تفصيل الثوب'),
                          value: _isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChecked = newValue!;
                              if (_isChecked) {
                                _showBottomSheet(context);
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
