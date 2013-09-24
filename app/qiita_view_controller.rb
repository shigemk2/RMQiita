# -*- coding: utf-8 -*-
class QiitaViewController < UIViewController
  def viewDidLoad
    super

    self.title = "Qiita"
    self.view.backgroundColor = UIColor.whiteColor

    @data = []
    @feed = nil

    url = 'https://qiita.com/api/v1/tags/RubyMotion/items'
    BW::HTTP.get(url) do |response|
      if response.ok?
        @feed = BW::JSON.parse(response.body.to_s)
        @feed.each do |data|
          @data << data["title"]
          # p "======================================="
          # p "タイトル: #{data["title"]}"
          # p "更新日: #{data["updated_at_in_words"]}"
          # p "ユーザ: #{data["user"]["url_name"]}"
          # p "======================================="
        end
      else
        App.alert(response.error_message)
      end

      @table = UITableView.alloc.initWithFrame(self.view.bounds)
      @table.dataSource = self

      self.view.addSubview @table
    end
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end
    cell.textLabel.text = @data[indexPath.row]

    cell
  end
end
