# -*- coding: utf-8 -*-
class QiitaViewController < UITableViewController
  def viewDidLoad
    super

    @feed = nil
    self.navigationItem.title = "Qiita RM Reader"
    self.view.backgroundColor = UIColor.whiteColor

    url = "https://qiita.com/api/v1/tags/RubyMotion/items"

    BW::HTTP.get(url) do |response|
      if response.ok?
        @feed = BW::JSON.parse(response.body.to_str)
        view.reloadData
      else
        App.alert(response.error_message)
      end
    end
  end

  def tableView(tableView, numberOfRowsInSection:section)
    if @feed.nil?
      return 0
    else
      @feed.size
    end
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    60
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier('cell') || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:'cell')
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    label = UILabel.alloc.init
    label.frame = CGRectMake(5, 40, 200, 30)
    label.font = UIFont.fontWithName("AppleGothic",size:14)
    label.text = @feed[indexPath.row]["title"]
    label.textAlignment = UITextAlignmentCenter
    cell.addSubview(label)



    image_path = @feed[indexPath.row]["user"]["profile_image_url"]

    image_src = NSData.dataWithContentsOfURL(NSURL.URLWithString(image_path))
    image = UIImage.imageWithData(image_src)

    image_view = UIImageView.alloc.initWithImage(image)
    image_view.frame = CGRectMake(5, 5, 30, 30)
    cell.addSubview(image_view)
    return cell
  end
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    WebViewController.new.tap do |c|
      c.item = @feed[indexPath.row]
      self.navigationController.pushViewController(c, animated:true)
    end
  end
end
