# coding:utf-8
require 'rubygems'
require 'twitter'

class Tweet

  def initialize
    @text = <<-EOF.split("\n")
少しずつ前に進んでいるという感覚は、人間としてすごく大事。 #名言 #ichiro_Yankees
僕は決して「打率4割」とは言わないんです。6割の失敗は許してやるわ、と。いつもそう言っているんです。 #名言 #ichiro_Yankees
ちいさいことをかさねることが、とんでもないところに行くただひとつの道。 #名言 #ichiro_Yankees
しっかりと準備もしていないのに、目標を語る資格はない。 #名言 #ichiro_Yankees
他人の記録を塗り替えるのは７割、８割の力でも可能だが、自分の記録を塗り替えるには１０以上の力が必要だ！ #名言 #ichiro_Yankees
考える労力を惜しむと、前に進むことを、止めてしまうことになります。 #名言 #ichiro_Yankees
現役中に、過去のことを懐かしんではいけません。 #名言 #ichiro_Yankees
自分の限界を見てから、バットを置きたい。 #名言 #ichiro_Yankees
何年、野球をやっても、勉強することがあるのです。 #名言 #ichiro_Yankees
はじめから、今があったわけではありません。状況は少しずつ変えていけるものです。 #名言 #ichiro_Yankees
成功とはあいまいなもの、他人が思う成功を、追い求める必要はありません。 #名言 #ichiro_Yankees
どんな状況でも、一定のラインをクリアするのが、プロです。 #名言 #ichiro_Yankees
準備というのは、言い訳の材料となり得るものを排除していく、そのために考え得るすべてのことをこなしていく。 #名言 #ichiro_Yankees
ぼくは天才ではありません。なぜかというと自分が、どうしてヒットを打てるかを説明できるからです。 #名言 #ichiro_Yankees
ぼくのプレイヤーとしての評価は、ディフェンスや走塁をぬきにしては測れない。どの部分も人より秀でているわけではないし、すべてはバランスと考えています。 #名言 #ichiro_Yankees
プレッシャーのかかる感じはたまりません。僕にとっては最高ですよね、ものすごく苦しいですけど。 #名言 #ichiro_Yankees
本物でないものは、すぐに見破られます。 #名言 #ichiro_Yankees
決して人が求める理想を求めません、人が笑って欲しい時に笑いません、自分が笑いたいから笑います。 #名言 #ichiro_Yankees
ICHIRO-MONDOW「テーマ：ヒット」　Q.スラムダンク　A.流川君　Q.262本　A.馬鹿げた数字（本当は照れ隠し！イチローだけの大切な数字！）　Q.常識　A.わかりづらい　Q.ヒット　A.相手にダメージを 与えるもの　 #名言 #ichiro_Yankees
常に、先の事を予測する習慣をつけることが大事。　 #名言 #ichiro_Yankees
驚かれているなら、まだまだです。驚かれないようになりたいです。　 #名言 #ichiro_Yankees
努力せずに何かできるようになる人のことを、天才というのなら、僕はそうじゃない。努力した結果、何かができるようになる人のことを、天才というのなら、僕はそうだと思う。　 #名言 #ichiro_Yankees
ヒットをたくさん打つようになってからは、甘い球を待てなくなりました。むずかしい球が来るまで、待つという姿勢になりました。　 #名言 #ichiro_Yankees
ICHIRO-MONDOW「テーマ：動機」　Q.出会い　A.人生を左右するもの　Q.家庭環境　A.その人の人格の基本。それを作るものかな。　Q.お金　A.初めはモチベーションになるもの　Q.モチベーション　A.野球が好きである　 #名言 #ichiro_Yankees
苦悩というものは、前進したいって思いがあって、それを乗り越えられる可能性のある人にしか訪れない。だから苦悩とは、飛躍なんです。　 #名言 #ichiro_Yankees
世の中の常識を少しでも変えるっていうことは、人間としての生き甲斐でもありますから。　 #名言 #ichiro_Yankees
嫌いな言葉ならありますよ。「成功」この言葉、嫌いです。　 #名言 #ichiro_Yankees
モチベーションは、野球が好きだということです。　 #名言 #ichiro_Yankees
言葉とは『何を言うか』ではなく『誰が言うか』に尽きる。その『誰が』に値する生き方をしたい。　 #名言 #ichiro_Yankees
今自分がやっていることが、好きであるかどうか。　 #名言 #ichiro_Yankees
「たのしんでやれ」とよく言われますが、ぼくにはその意味がわかりません。　 #名言 #ichiro_Yankees
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