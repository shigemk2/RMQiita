class WebViewController < UIViewController
  attr_accessor :item

  def viewDidLoad
    super
    self.navigationItem.title = self.item["title"]
    @webview = UIWebView.new.tap do |v|
      v.frame = self.view.bounds
      v.scalesPageToFit = true
      v.loadHTMLString(self.item["body"], baseURL:nil)
      v.delegate = self
      view.addSubview(v)
    end
  end
end
