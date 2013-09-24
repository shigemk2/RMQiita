# -*- coding: utf-8 -*-
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    qiita_controller = QiitaViewController.alloc.initWithNibName(nil, bundle: nil)
    @window.rootViewController = qiita_controller
    true
  end
end
