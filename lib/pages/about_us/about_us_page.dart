import 'package:flutter/material.dart';
import 'package:flutter_application_1/common_ui/web/webview_page.dart';
import 'package:flutter_application_1/common_ui/web/webview_widget.dart';
import 'package:flutter_application_1/route/route_utils.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final htmlContent = r'''<![CDATA[
        <h2>网站内容</h2>
        <p>本网站每天新增20~30篇优质文章，并加入到现有分类中，力求整理出一份优质而又详尽的知识体系，闲暇时间不妨上来学习下知识；除此以外，并为大家提供平时开发过程中常用的工具以及常用的网址导航。</p>
        <p>当然这只是我们目前的功能，未来我们将提供更多更加便捷的功能…</p>
        <p>如果您有任何好的建议：</p>
            <br/>关于网站排版
            <br/>关于新增常用网址以及工具
            <br/>未来你希望增加的功能等
        <p>可以在 <a href="https://github.com/hongyangAndroid/wanandroid" target="_blank">https://github.com/hongyangAndroid/xueandroid</a> 项目中以issue的形式提出，我将及时跟进。</p>
        <p>如果您希望长期关注本站，可以加入我们的QQ群：<b>123456789</b></p>
        <h2>源码位置</h2>
        <p>本软件开源，如果你发现任何错误，不要犹豫，马上点击<a href="https://github.com/wangzailfm/wanandroidclient" target="_blank">GitHub</a>，在上面发起<b>issue</b>或者提交<b>pull request</b>。</p>
    ]]>''';
  String _versionName = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getVersion();
    });
  }

  Future getVersion() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    _versionName = info.version;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于我们'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/ic_launcher.png',
              width: 70.r,
              height: 70.r,
            ),
            Text('v$_versionName'),
            SizedBox(width: double.infinity),
            Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Html(
                data: htmlContent,
                onLinkTap: (
                  String? url,
                  Map<String, String> attributes,
                  element,
                ) {
                  RouteUtils.push(
                    context,
                    WebViewPage(
                        loadResource: url ?? '',
                        webViewType: WebViewType.URL,
                        showTitle: true,
                        title: '关于我们'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
