# -*- coding: undecided -*-
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    url = 'https://qiita.com/api/v1/tags/RubyMotion/items'
    BW::HTTP.get(url) do |response|
      if response.ok?
        json = BW::JSON.parse(response.body.to_s)
        json.each do |data|
          p "======================================="
          p "タイトル: #{data["title"]}"
          p "更新日: #{data["updated_at_in_words"]}"
          p "ユーザ: #{data["user"]["url_name"]}"
          p "======================================="
        end
      else
        p response.error_message
      end
    end
    true
  end
end
