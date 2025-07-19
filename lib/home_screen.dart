import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_basic/search_provider.dart';
import 'package:riverpod_basic/temp/validators.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:1.0),
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width * 0.91,
                        padding: const EdgeInsets.fromLTRB(1, 1, 1, 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.transparent,
                        ),
                        child: TextFormField(
                          focusNode: searchFocusNode,
                          onChanged: (value) {
                            ref.read(searchProvider.notifier).setSearch(value);
                          },
                          controller: searchController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFD3C3F4),
                            contentPadding: EdgeInsets.all(8.0),
                            isDense: false,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            hintText: 'Search',
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          validator: InputValidators.emailValidator,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  final searchText = ref.watch(searchProvider);
                  return Text(searchText.query);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
