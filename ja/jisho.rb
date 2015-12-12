# Please return the Image object in the "def convert"

def convert
  text = Popup.input("word?")
  text = URI.encode_www_form_component(text)
  
  <<EOS
  ウィズダム
  mkwisdom://jp.monokakido.mkwisdom/search?text=#{text}
  
  大辞林
  mkdaijirin://jp.monokakido.daijirin/search?text=#{text}
  
  Weblio
  http://ejje.weblio.jp/content/#{text}
  
  Wikipedia(ja)
  #{wikipedia(text, "ja")}
  
  Wikipedia(en)
  #{wikipedia(text)}
  
  Google翻訳
  http://translate.google.co.jp/?hl=ja#ja/en/#{text}
EOS
end

def wikipedia(text, country = 'en')
  "http://#{country}.wikipedia.org/wiki/#{text}"
end
