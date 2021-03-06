module Emojify
  def self.emojify(content)
    content.to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        %(<img alt="#$1" src="/images/emoji/#{emoji.image_filename}" style="vertical-align:middle"/>)
      else
        match
      end
    end.html_safe if content.present?
  end
end
