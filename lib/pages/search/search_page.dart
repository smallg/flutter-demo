import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/search/search_vm.dart';
import 'package:flutter_application_1/route/route_utils.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final String? keyword;

  const SearchPage({super.key, this.keyword});

  @override
  State createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController inputController;
  SearchViewModel viewModel = SearchViewModel();

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController(text: widget.keyword ?? '');
    viewModel.search(widget.keyword);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _searchBar(
                onBack: () {
                  RouteUtils.pop(context);
                },
                onCancel: () {
                  inputController.text = '';
                  viewModel.clear();
                },
                onSubmit: (value) {
                  viewModel.search(value);
                  // Hide device keyboard
                  // Method 1
                  // SystemChannels.textInput.invokeMethod("TextInput.hide");
                  // Method 2
                  FocusScope.of(context).unfocus();
                },
              ),
              Consumer<SearchViewModel>(builder: (context, vm, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: vm.searchList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return _listItem(
                          vm.searchList?[index].title ?? '', () {});
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItem(String? title, GestureTapCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.r,
              color: Colors.black12,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Html(
          data: title ?? '',
          style: {
            'html': Style(
              fontSize: FontSize(15.sp),
            ),
          },
        ),
      ),
    );
  }

  Widget _searchBar({
    GestureTapCallback? onBack,
    GestureTapCallback? onCancel,
    ValueChanged<String>? onSubmit,
  }) {
    return Container(
      color: Colors.teal,
      height: 50.h,
      width: double.infinity,
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Image.asset('assets/images/icon_back.png',
                width: 35.r, height: 35.r),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(6.r),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                onSubmitted: onSubmit,
                controller: inputController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 10.w),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.r),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.r),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          GestureDetector(
            onTap: onCancel,
            child: Text(
              '取消',
              style: TextStyle(fontSize: 13.sp, color: Colors.white),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
    );
  }
}
