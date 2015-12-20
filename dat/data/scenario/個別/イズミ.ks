
[macro name=イズミなにしてる]
[nowait]
[if exp=f.昼休み]
	本多さんが教室に戻ってきた。
[else]
	本多さんが帰りの支度をしている。
[endif]
[endnowait]
[endmacro]

[場面転換]
[if exp=f.昼休み]
	[背景 画像=教室]
	[BGM 曲=05日常.ogg 音量=50 ループ]
[else]
	[背景 画像=教室夕方]
	[BGM 曲=夕暮れ.ogg 音量=50 ループ]
[endif]
[枠]
[表情 画像=イズミ]
[モノローグ]

;種があると、強制招集が使えません。
[eval exp="var 種がある = 0;"]

*種開始

*イズミは頑固
[足跡デバッグ 名前=イズミは頑固]
[jump target="*イズミは頑固2" cond="!足跡('イズミは頑固') || 足跡('イズミの交友関係')"]
[eval exp="種がある = 1" cond="findSeed('イズミは頑固') >= 0"]
[イズミなにしてる]
[種分岐 ア=イズミは頑固 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*イズミは頑固2"][endif]
*本文
本多さんがこの前の休日準備のことを反省するかもって[n]
小平は言っていたけど……[next]
[モノローグ終了]

[自分]
本多さん。[n]
ちょっといいかな？[next]

[人物 名前=本多イズミ 画像=イズミしゃべる]
ん？ [姓]じゃん。[n]
どうしたの？[next]
[表情 画像=イズミふーん]

[自分]
あのさ、文化祭についてなんだけど。[next]

[人物 名前=本多イズミ 画像=イズミはあ]
ああ、そのこと。[n]
ごめんね、この間は。[n]
ウチもカッとなっちゃってさ。[next]
[表情 画像=イズミうーん]

[自分]
いや、それはいいんだ。[next]

[表情 画像=イズミふーん]
やっぱり考え直してもらえないかな？ [n]
文化祭に参加してほしいんだけど。[next]

このままじゃ人員が集まらなくて……[n]
正直困ってるんだ。[next]

[人物 名前=本多イズミ 画像=イズミめそらし]
……悪い、[姓]。[next]

[表情 画像=イズミはあ]
別にアンタが嫌いなわけじゃないけど、[n]
ウチの考えは変わらないね。[next]

文化祭の作業を全員にやらせるなんて考えないほうがいいよ。[n]
それがお互いのためだと思うし。[next]

[表情 画像=イズミやれやれ]
食い下がられても無駄だからね。[n]
早いとこ諦めた方がいいんじゃない？[next]
[表情 画像=イズミめそらし]

[自分]
……やっぱり手ごわいな、本多さんは。[next]

[人物 名前=本多イズミ 画像=イズミへえ]
は？[next]
[表情 画像=イズミふーん]

[自分]
いや、小平から聞いたんだ。[n]
本多さんは頑固で気分屋だから、説得するのは大変だって。[next]

[人物 名前=本多イズミ 画像=イズミ仕方ない]
そうだね、[n]
ヨッシーからよく言われるわ。[n]
まるで職人気質の頑固オヤジのようだって。[next]
[表情 画像=イズミふーん]

[自分]
まあ、だからと言って諦めた訳じゃない……[n]
俺も頑固に誘うから。[next]

頑固オヤジの本多さんでも[n]
折れて参加しようって思うくらいにね。[next]

[人物 名前=本多イズミ 画像=イズミへえ]
……変な奴だね、[姓]は。[next]
[表情 画像=イズミやったぜ]
でも気に入った、[n]
アンタ結構言うじゃない。[next]

[自分]
え？[next]

[人物 名前=本多イズミ 画像=イズミおい]
みんな、すげー気ばっかり遣って話してさ。[n]
反対するにも、なんか色々理由つけてくるし。[next]

ウチのこと気に食わないなら[n]
陰でごちゃごちゃしないで[n]
はっきりそう言えばいいのに。[next]

そういう回りくどいの、[n]
見ててめっちゃイラつくんだよ。[next]
[表情 画像=イズミふふふ]
でもアンタ、[n]
思ってること結構ズケズケ言ってくるじゃん。[next]
[表情 画像=イズミやったぜ]
頑固オヤジなんて、[n]
面と向かって女の子に言う？ 普通。[next]

[自分]
ご、ごめん！ [n]
よく考えなくても結構失礼だったね……。[next]

[人物 名前=本多イズミ 画像=イズミしゃべる]
いや、別にいいよ。[n]
気にしてないし。[next]
[表情 画像=イズミ]
[モノローグ]
そう話す本多さんは[n]
心なしか楽しそうに微笑んでいる。[next]
[モノローグ終了]

[人物 名前=本多イズミ 画像=イズミしゃべる]
[姓]。[n]
全体に参加したいとは思わないけど、[n]
アンタに個人的に協力することはできるよ。[next]

なんかあったらウチのところに話しに来なよ。[n]
アドバイスくらいなら出せるかもしれないから。[next]
[表情 画像=イズミ]
[自分]
ホント！？[next]

[人物 名前=本多イズミ 画像=イズミしゃべる]
話聞いてたらそのうち[n]
文化祭も面白そうだなって[n]
心変わりするかもしれないじゃん。[next]
[表情 画像=イズミ悪だくみ]
ウチ気まぐれのところあるからさ。[n]
せいぜい頑張って[n]
ウチのこと折ってみせなよ。[next]
[表情 画像=イズミ]

[自分]
うん！ ありがとう、本多さん！[next]

[自分]
（なんだ、本多さん、案外わかる人じゃん）[next]
[人物消去]
[モノローグ]
でも、人付き合いで色々摩擦を抱えてそうだな……[n]
陰でごちゃごちゃ言われるのはイラつく、か……。[next]

ムードメーカーな感じだけど[n]
桜さん以外に仲がいい人っているのだろうか。[next]

……また本多さんに聞いてみようかな。[next]
[モノローグ終了]

[無限種入手 名前=イズミの交友関係 詳細=イズミと仲がいい人って誰？ 期限=10]
[足跡 名前=イズミの交友関係]
[return]
*イズミは頑固2


*イズミの交友関係
[足跡デバッグ 名前=イズミの交友関係]
[jump target="*イズミの交友関係2" cond="!足跡('イズミの交友関係') || 足跡('イズミの特技')"]
[eval exp="種がある = 1" cond="findSeed('イズミの交友関係') >= 0"]
[イズミなにしてる]
[種分岐 ア=イズミの交友関係 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*イズミの交友関係2"][endif]
*本文
[モノローグ終了]
[自分]
そういえば本多さんってさ、[n]
普段クラスの皆と遊んだりしてるの？[next]

[人物 名前=本多イズミ 画像=イズミへえ]
え？ どうしたの急に？[next]
[表情 画像=イズミふーん]

[自分]
いや、ちょっと気になっただけだよ。[n]
いつも小平や桜さんと[n]
一緒にいるイメージあるから。[next]

[人物 名前=本多イズミ 画像=イズミへえ]
ふーん、そっか。[n]
まあ、まゆゆやヨッシーとは[n]
よくつるんでるね。[next]

特にまゆゆとは休日も一緒に遊んだりするよ。[n]
でも他にそんなに付き合いはないかなぁ？[next]
[表情 画像=イズミ]

[自分]
なんか意外だよなぁ。[n]
本多さんと桜さんって全然タイプ違うじゃないか。[n]
あと小平も。[next]

一緒のグループに属してる感じしないのに、[n]
実際は三人とも結構仲良いんだよな。[n]
それが不思議で……。[next]

[人物 名前=本多イズミ 画像=イズミしゃべる]
はは。確かによく不思議がられるわ。[n]
でもさ、面白くて可愛いじゃん。[n]
まゆゆもヨッシーも。[next]
[表情 画像=イズミ]

[自分]
そ、そうかな……？[next]

[モノローグ]
正直今まで、まともにクラスにいなかったから[n]
よく分からない。[next]
[モノローグ終了]

[人物 名前=本多イズミ 画像=イズミふふふ]
そうだよ、ヨッシーはいっつも変なことしか言わないし。[n]
しかもそれ天然でやってるから余計面白いじゃん。[n]
イジり甲斐あって飽きないんだよね。[next]
[表情 画像=イズミしゃべる]
まゆゆはまゆゆで[n]
何考えてるか分からないと思えば[n]
急に突拍子もないこと言い始めるし。[next]

しかもあのふわふわしてて[n]
地に足ついてない感じが可愛いんだよねー。[n]
なんかこう、世話してあげたくなっちゃう。[next]
[表情 画像=イズミ]

[自分]
そ、そっか……。[n]
（なんというか、二人のことおもちゃにしてないか……？）[next]

[人物 名前=本多イズミ 画像=イズミにっ]
あとさ、まゆゆによくお菓子作ってあげるんだけど、[n]
あの子めちゃくちゃ美味しそうに[n]
食べてくれるんだよねー。[next]
[表情 画像=イズミやったぜ]
作ってる側としては悪い気しないし。[n]
作り甲斐あるってもんよ。[next]
[表情 画像=イズミ]

[自分]
へぇ……[n]
っていうか本多さん、お菓子作り得意なんだ？[next]
[人物 名前=本多イズミ 画像=イズミおい]
そうだけど？[n]
何？ ウチにそういう女の子っぽいの[n]
似合わないって言いたいワケ？[next]
[表情 画像=イズミうーん]

[自分]
ち、違うよ！[n]
ただ何となくイメージ湧かないなあって。[next]

[人物 名前=本多イズミ 画像=イズミやれやれ]
いや結局似合ってないってことじゃん！ [n]
いいけどさ別に。[next]
[表情 画像=イズミへえ]
小さい頃、母さんに教えてもらってから[n]
ずっとハマってるんだ。[n]
休みの日に時間があれば作ってるよ。[next]
[表情 画像=イズミしゃべる]
クッキーとかケーキとかが焼き上がる[n]
あの匂いがたまんないんだよねー。[next]
[表情 画像=イズミやったぜ]
ハロウィンとバレンタインの時には[n]
ちゃんと持ってきてあげるからさ。[n]
楽しみにしてなよ〜。[next]
[表情 画像=イズミ]

[自分]
うん、楽しみにしてるよ。[next]

[モノローグ]
お菓子作りについてあれこれ話す本多さんは、[n]
今までに見たことないくらい[n]
楽しそうな笑顔を浮かべていた。[next]

どこか冷めた印象があったけど、[n]
彼女にも夢中になれるものがあるんだと、[n]
なんだか少し嬉しくなった。[next]
[モノローグ終了]
[人物消去]

[種入手 名前=イズミの特技 詳細=イズミはお菓子作りが得意]
[足跡 名前=イズミの特技]
[枠消去]
[return]
*イズミの交友関係2

*イズミとマユ
[足跡デバッグ 名前=イズミとマユ]
[jump target="*イズミとマユ2" cond="!足跡('イズミとマユ') || 足跡('マユの趣味')"]
[eval exp="種がある = 1" cond="findSeed('イズミとマユ') >= 0"]
[イズミなにしてる]
[種分岐 ア=イズミとマユ イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*イズミとマユ2"][endif]
*本文
[モノローグ終了]
[自分]
小平から聞いたんだけど、[n]
本多さんって桜さんと仲良いんだよね？[next]
[人物 画像=イズミへえ 名前=本多イズミ]
まゆゆ？[n]
うん、そうだね。[n]
よく一緒に遊んでるよ。[next]

それがどうかした？[next]
[自分]
なんか、意外な組み合わせだなーと思ってさ。[n]
ほら、本多さんと桜さんって[n]
全然タイプ違うじゃん。[next]

二人で遊ぶって言っても、[n]
何するんだろう、って不思議だったから。[next]
[人物 画像=イズミしゃべる 名前=本多イズミ]
あー、まあそうだよねー。[n]
ウチと違って、[n]
まゆゆって相当変わった子だからねー。[next]
[表情 画像=イズミ]
[自分]
あ、ああ、うん……。[n]
（俺から見れば、本多さんも十分[n]
　変わり者の部類に入るけど……）[next]
[人物 画像=イズミふふふ 名前=本多イズミ]
まゆゆとはよく、服見に行ったりするかなー。[next]
[表情 画像=イズミ]
[自分]
服？[next]
[人物 画像=イズミへえ 名前=本多イズミ]
うん。[n]
まゆゆってさ、なんか[n]
ファッションとかに興味あるみたいだよ。[next]
[表情 画像=イズミにっ]
しかも結構いいセンスしてるから、[n]
一緒にコーディネートするの楽しいんだよね。[next]
[自分]
へえ……[n]
桜さんがねぇ……。[n]
（ファッションなんてあまり興味ないように見えてた）[next]
[人物 画像=イズミしゃべる 名前=本多イズミ]
詳しく知りたいなら本人に聞いてみなよ。[n]
面白い話が聞けるかもよ。[next]
[自分]
う、うん。[n]
機会があったらね。[next]
[種入手 名前=マユの趣味 詳細=マユはファッションに興味があるらしい]
[足跡 名前=マユの趣味]
[return]
*イズミとマユ2

*カレンの本音
[足跡デバッグ 名前=カレンの本音]
[jump target="*カレンの本音2" cond="!足跡('カレンの本音') || 足跡('マユへのお願い')"]
[eval exp="種がある = 1" cond="findSeed('カレンの本音') >= 0"]
[イズミなにしてる]
[種分岐 ア=カレンの本音 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*カレンの本音2"][endif]
*本文
せっかくだし、[n]
桜さんにも文化祭に参加してほしい。[next]

けど、どうすれば[n]
説得できるんだろう……？[next]

桜さんと仲のいい本多さんに聞けば[n]
何か分かるかもしれない！[next]
[モノローグ終了]

[自分]
本多さん。[next]

[人物 画像=イズミふーん 名前=本多イズミ]
ん？[next]

[自分]
桜さんって、どうすればクラス企画に参加してくれると思う？[next]

[人物 画像=イズミおい 名前=本多イズミ]
はあ？[n]
何なのいきなり。[next]

まゆゆはコスプレ大会の方で忙しいの。[n]
そんな何かしたところで、来てくれるわけないじゃん。[next]
[表情 画像=イズミめそらし]
[自分]
でも、どうしても参加してほしいんだ！[n]
……恋ヶ窪さんもそう言ってたし。[next]

[人物 画像=イズミやれやれ 名前=本多イズミ]
あの女、[n]
まだそんなこと言って……[next]
[表情 画像=イズミふーん]
[自分]
違うんだ！[n]
いつもの協調性とか団結とか、そういうのじゃなくて！[next]

恋ヶ窪さんが、来てくれたら嬉しい、って……！[next]

[人物 画像=イズミへえ 名前=本多イズミ]
……？[next]

[自分]
この間、桜さんのコスプレ写真、[n]
恋ヶ窪さんに見てもらったんだ。[next]
[表情 画像=イズミふーん]
そしたら、すっごく可愛いって言ってて。[next]

店員の衣装づくりに協力してくれたら、[n]
助かるし楽しいだろうなぁって。[n]
……そう、言ってたんだ。[next]

[人物 画像=イズミうーん 名前=本多イズミ]
…………。[next]

[自分]
今まで義務感でしか動いてなかったあの子が[n]
そんなこと言うなんて、珍しいって思ったんだよ。[next]

それに、桜さんにとっても、いいチャンスだと思うんだ。[next]

だから……。[next]

[人物 画像=イズミはあ 名前=本多イズミ]
……ごめん[姓]、[n]
ウチちょっとウソついてた。[next]
[表情 画像=イズミうーん]
[自分]
え？[next]

[人物 画像=イズミはあ 名前=本多イズミ]
まゆゆがコスプレ大会で来られないほど忙しい、って言ったけど、[n]
本当は、スケジュール的には参加できないことはないと思う。[next]

ただ、あの子、[n]
大人数で協力して何かすることが、どうしても苦手なんだ。[next]
[表情 画像=イズミうーん]
[自分]
苦手？[next]

[人物 画像=イズミやれやれ 名前=本多イズミ]
今まで、グループ活動で[n]
頑張ろうって思っても、色々やらかしてばかりでさ。[next]
[表情 画像=イズミはあ]
何も仕事できなくて、[n]
周りに迷惑かけてるって……[next]

そう感じてたみたい。[next]

実際、去年の文化祭でも、[n]
クラス企画で全然仕事できなかったこと、気にしてたんだよね。[next]
[表情 画像=イズミうーん]
[自分]
そうなんだ……。[next]

[人物 画像=イズミうーん 名前=本多イズミ]
うん……。[next]
[表情 画像=イズミへえ]
あの子は、自分は役に立てるようなものを持ってない、[n]
クラス企画に参加したところで、みんなの足ひっぱるだけ、[n]
そんな風に言ってた。[next]

だから、それなら自分が楽しい方にだけ[n]
集中すればいいんじゃない？ って、[n]
まゆゆに言ったんだ。[next]
[表情 画像=イズミはあ]
去年もいい思い出なかったんだし、[n]
なら無理してやる必要もないかなって。[n]

[自分]
…………。[next]

[人物 画像=イズミ仕方ない 名前=本多イズミ]
でも……[n]
なんか、大きなお世話だったみたいだね。[next]
[表情 画像=イズミふーん]
[自分]
本多さん……。[next]

[人物 画像=イズミへえ 名前=本多イズミ]
まゆゆに言ってあげなよ、[n]
力を貸してほしいって。[next]

ウチから言うより、[n]
文化祭に関わってるアンタたちから言った方が[n]
説得力ある気がするよ？[next]
[表情 画像=イズミしゃべる]
それに、[n]
恋ヶ窪さんが褒めてたって言えば、[n]
あの子も嬉しいだろうし。[next]

今までまゆゆにそんなこと言ってきたの、[n]
ウチくらいしかいなかったからさ。[next]
[表情 画像=イズミ]
[自分]
本多さん……、ありがとう！[n]
言ってみるよ！[next]

[種入手 名前=マユへのお願い 詳細=文化祭に参加してほしい]
[足跡 名前=マユへのお願い]
[return]
*カレンの本音2

*イズミへの不満
[足跡デバッグ 名前=イズミへの不満]
[jump target="*イズミへの不満2" cond="!足跡('イズミへの不満') || 足跡('イズミの不満')"]
[eval exp="種がある = 1" cond="findSeed('イズミへの不満') >= 0"]
[イズミなにしてる]
[種分岐 ア=イズミへの不満 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*イズミへの不満2"][endif]

[無限種入手 名前=イズミの不満 詳細=イズミはカレンの陰口が気に入らない]
[足跡 名前=イズミの不満]
[return]
*イズミへの不満2

*カケルは友達がいない
[足跡デバッグ 名前=カケルは友達がいない]
[jump target="*カケルは友達がいない2" cond="!足跡('カケルは友達がいない') || 足跡('カケルの女遊び')"]
[eval exp="種がある = 1" cond="findSeed('カケルは友達がいない') >= 0"]
[イズミなにしてる]
[種分岐 ア=カケルは友達がいない イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*カケルは友達がいない2"][endif]

[種入手 名前=カケルの女遊び 詳細=カケルには遊んでくれる女子はいるみたいだし、問題ないか]
[足跡 名前=カケルの女遊び]
[return]
*カケルは友達がいない2

*雑談
[イズミなにしてる]
[三択 ア=雑談する イ=何か他の話題は……]
[if exp=イ]
	[jump target="*雑談2"]
[endif]
[人物 名前=本多イズミ 画像=イズミ]
とりとめのない会話が入ります。[next]
[人物消去]
[枠消去]
[return]
*雑談2

[nowait]これ以上会話はないみたい。[endnowait]
[if exp="種がある || f.イズミ参加 || f.イズミ招集 || f.イズミ不参加"]
	[next]
[else]
	[eval exp="var 呼ぶ = '放課後の文化祭準備に呼ぶ (' + 招集消費 + ')'"]
	[二択 ア=&呼ぶ イ=呼ばない]
	[jump target="*強制招集" cond=ア]
[endif]
[cm]
[jump target="*種開始"]


*強制招集
[モノローグ終了]
[自分]
本多さん、お願いがあるんだけど……[n]
放課後の文化祭準備をちょっと手伝って欲しいんだ！[next]
[人物 画像=イズミ説明 名前=本多イズミ]
はあ……アンタもしつこいね。[next]
[モノローグ]
俺は粘り強く交渉した。[next]
[モノローグ終了]
[体力 変化=&招集消費]
[if exp="人員計算() > 7"]
	[人物 画像=イズミ仕方ない 名前=本多イズミ]
	……今日は気がのらないね。[n]
	別に、人がいないってわけじゃないでしょ？[next]
	[自分]
	えええ、そんなあ……[next]
	[return]
[endif]
[eval exp="f.イズミ招集 = 1"]
[人物 画像=イズミへえ 名前=本多イズミ]
ま、最近は気分悪くないし、ちょっと手伝ってみるか。[next]
[自分]
よかった。ありがとう本多さん！[next]
[人物消去]
[メッセージ]
次の放課後準備に、本多イズミが手伝いに来てくれることになった。[next]
[return]
