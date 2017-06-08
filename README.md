# Sparkle-Demo
Sparkle-Demo，use Sparkle framework update macOS app


## 配置Xcode工程
### 拖入Sparkle.framework到工厂，注意库为动态库，所以确保 工程->target->general的embedded binaries中有Sparkle.framework
### 增加代码
#import <Sparkle/Sparkle.h>

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [SUUpdater sharedUpdater].delegate = self;
    [[SUUpdater sharedUpdater] setSendsSystemProfile:YES];
    //............
    [[SUUpdater sharedUpdater] checkForUpdatesInBackground];
}
### 修改plist
在xcode工程的info.plist中加入key SUFeedURL，值为xml存在的服务器地址，本例xml存在github服务器中，所以为https://raw.githubusercontent.com/shaojiankui/Sparkle-Demo/master/appcast.xml
github appcast.xml地址拼接规则为https://raw.githubusercontent.com/github用户名/仓库名/master/文件夹名/appcast.xml

## appcast.xml
### title
为更新标题
### item
每一条item一次更新版本

### enclosure下载地址

使用github来作为更新app的下载地址
enclosure url="https://raw.githubusercontent.com/shaojiankui/Sparkle-Demo/master/Sparkle-Demo2.0.zip" length="xxx" type="application/octet-stream" sparkle:version="19" sparkle:shortVersionString="2.0">

每一个版本下载地址样式为：https://raw.githubusercontent.com/shaojiankui/Sparkle-Demo/master/Sparkle-Demo2.0.zip 

地址拼接规则是 https://raw.githubusercontent.com/github用户名/仓库名/master/文件夹名/文件名

shortVersionString为新的版本号

length 为文件大小

### description
为升级log描述
### pubDate
发布时间


## 官方文档
https://sparkle-project.org/documentation/

