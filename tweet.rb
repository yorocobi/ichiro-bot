# coding:utf-8
require 'rubygems'
require 'twitter'

class Tweet

  def initialize
    @text = <<-EOF.split("\n")
ICHIRO-MONDOW「テーマ：前進」　Q.ゴール　A.設定しない
ICHIRO-MONDOW「テーマ：前進」　Q.言葉　A.行動には及ばない
ICHIRO-MONDOW「テーマ：前進」　Q.試行錯誤　A.前進するためには
ICHIRO-MONDOW「テーマ：前進」　Q.思考　A.止めてはならないもの
ICHIRO-MONDOW「テーマ：前進」　Q.労力　A.惜しまない
考える労力を惜しむと、前に進むことを、止めてしまうことになります。
ICHIRO-MONDOW「テーマ：成功」　Q.歌舞伎　A.伝統
ICHIRO-MONDOW「テーマ：成功」　Q.願い事　A.僕はしないです
ICHIRO-MONDOW「テーマ：成功」　Q.満足　A.（笑いながら）ないかぁー 僕はたくさんしたいですねぇ
ICHIRO-MONDOW「テーマ：成功」　Q.評価　A.無視は出来ないですけれども 強く感じすぎない
成功とはあいまいなもの、他人が思う成功を、追い求める必要はありません。
ICHIRO-MONDOW「テーマ：プレッシャー」　Q.フィギュアスケート選手　A.妖精
ICHIRO-MONDOW「テーマ：プレッシャー」　Q.野球選手　A.遅いヤツもいる [場内笑い]
ICHIRO-MONDOW「テーマ：プレッシャー」　Q.失敗　A.チャンス
ICHIRO-MONDOW「テーマ：プレッシャー」　Q.プレッシャー　A.苦しいものですけど 気持ち良くもありますね
プレッシャーのかかる感じはたまりません。僕にとっては最高ですよね、ものすごく苦しいですけど。
ICHIRO-MONDOW「テーマ：追求」　Q.一発芸　A.できれば関わりたくない [場内さらに笑い]
ICHIRO-MONDOW「テーマ：追求」　Q.悪戦苦闘　A.[溜め息] 仕事
ICHIRO-MONDOW「テーマ：追求」　Q.理想　A.自分だけのもの
決して人が求める理想を求めません、人が笑って欲しい時に笑いません、自分が笑いたいから笑います。
ICHIRO-MONDOW「テーマ：ヒット」　Q.スラムダンク　A.流川君 [場内笑い]
ICHIRO-MONDOW「テーマ：ヒット」　Q.262本　A.馬鹿げた数字
ICHIRO-MONDOW「テーマ：ヒット」　Q.常識　A.わかりづらい
ICHIRO-MONDOW「テーマ：ヒット」　Q.ヒット　A.相手にダメージを 与えるもの
ヒットをたくさん打つようになってからは、甘い球を待てなくなりました。むずかしい球が来るまで、待つという姿勢になりました。
ICHIRO-MONDOW「テーマ：動機」　Q.出会い　A.人生を左右するもの
ICHIRO-MONDOW「テーマ：動機」　Q.家庭環境　A.その人の人格の 基本 それを作る ものかな
ICHIRO-MONDOW「テーマ：動機」　Q.お金　A.初めは モチベーションになるもの
ICHIRO-MONDOW「テーマ：動機」　Q.モチベーション　A.野球が好きである
モチベーションは、野球が好きだということです。
言葉とは『何を言うか』ではなく『誰が言うか』に尽きる。その『誰が』に値する生き方をしたい。
EOF

    Twitter.configure do |config|
      config.consumer_key       = 'KBdBLvdSM9Ue1DAzgxjMsw'
      config.consumer_secret    = '5MegGpZOZDJU0umUskEVxQsN96VgNyRseVn1WTcrhA'
      config.oauth_token        = '1567250413-sVXX0p77Fay2N3kvbvNwhP6OLo2lgBCFn0ubpNE'
      config.oauth_token_secret = 'ONQ1k9ZjlsYxDO2L13wa1VSuKnAmzeBqDqOYnAeDi8w'
    end
  end

  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end

  def daily_tweet
    tweet = @text[Time.now.day - 1]
    update(tweet)
  end

  private
  def update(tweet)
    return nil unless tweet

    begin
      Twitter.update(tweet.chomp)
    rescue => ex
      nil # todo
    end
  end

end