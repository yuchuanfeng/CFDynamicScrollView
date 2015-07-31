# CFDynamicScrollView
模仿QQ个人资料头部动态动画
==========================
效果如下:

![image](https://github.com/yuchuanfeng/CFDynamicScrollView/blob/master/40-QQ%E4%B8%AA%E4%BA%BA%E8%B5%84%E6%96%99Tests/001.gif)

### 使用方法
    CFScrollView* scrollView = [[CFScrollView alloc] initWithFrame:frame backImage:[UIImage imageNamed:@"jay"]];
    scrollView.duration = 5;
    [self.view addSubview:scrollView];
