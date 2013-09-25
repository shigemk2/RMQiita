# -*- coding: utf-8 -*-
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds).tap do |window|
      window.rootViewController = UINavigationController.alloc.initWithRootViewController(QiitaViewController.new)
      window.makeKeyAndVisible
    end
    true
  end
end
