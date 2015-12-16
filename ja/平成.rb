# # ja/平成
#
# ## 概要
# 今が平成何年か表示します。

def convert
  t = Time.now
  h = t.year - 1989 + 1
  "平成#{h}年#{t.month}月#{t.day}日"
end
