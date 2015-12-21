
[macro name=カケルなにしてる]
[nowait]
[if exp=f.昼休み]
	梶野が席に戻ってきた。
[else]
	梶野が帰りの支度をしている。
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
[表情 画像=カケル]
[モノローグ]

;種があると、強制招集が使えません。
[eval exp="var 種がある = 0;"]

*種開始

*人が集まらない休日準備
[足跡デバッグ 名前=人が集まらない休日準備]
[jump target="*人が集まらない休日準備2" cond="!足跡('人が集まらない休日準備') || 足跡('カケルは女子と仲が良い')"]
;[eval exp="種がある = 1" cond="findSeed('人が集まらない休日準備') >= 0"]
[カケルなにしてる]
[種分岐 ア=人が集まらない休日準備 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*人が集まらない休日準備2"][endif]
*本文
[モノローグ終了]
[自分]
この前の休日準備なんだけど、結局なにも進んでなくて……[next]

梶野…… 俺、実行委員だから文化祭を成功させたいんだ。[n]
休日の作業に来てくれないか？[next]

[人物 画像= カケルはあ  名前= 梶野カケル]
あー……[n]
まあ、時間があったら行ってもいいけど。[next]

[表情 画像= カケルめそらし]
[表情左遠い 画像= 女子生徒イ]
[人物右遠い 画像= 女子生徒ア 名前= 女子生徒]
梶野君！[next]

[表情 画像=カケル]

[モノローグ]
声をかけて来たのはクラスメイトの女子生徒だ。[next]
[モノローグ終了]

[人物 画像= カケルえっ  名前= 梶野カケル]
どうしたんだよ？[next]

[人物右遠い 画像= 女子生徒ア 名前= 女子生徒]
週末のカラオケ、梶野君も来るよね？[n]
みんな梶野君の歌聞きたがってるもん。[next]

[人物 画像= カケルめそらし  名前= 梶野カケル]
聞きたがってるって、そんな大したものじゃないだろ。[next]

[人物左遠い 画像= 女子生徒イ  名前= 女子生徒]
えー、梶野君歌上手くてかっこいいし、来てほしいな。[next]

[表情 画像=カケル]
[人物右遠い 画像= 女子生徒ア  名前= 女子生徒]
そうそう、隣のクラスの子達も梶野君が来るなら[n]
行くって言ってたよ。[next]

[人物 画像= カケルにこ  名前= 梶野カケル]
あー……じゃあ、行こうかな。[n]
予定も特にないし。[next]

[人物左遠い 画像= 女子生徒イ  名前= 女子生徒]
本当に！？　嬉しい！[n]
また連絡するね。[next]

[人物右消去]
[人物左消去]

[人物 画像= カケルえっ  名前= 梶野カケル]
……そういうわけだから、悪いな。[n]
平日はそれなりに参加するから。[next]

[表情 画像=カケル]
じゃあ、またな。[next]

[人物消去]

[モノローグ]
そう言うと梶野は立ち去ってしまった。[next]

いつも女子と一緒にいるし、モテるってイメージあるけど[n]
まさかここまでとはなぁ……[next]

[種入手 名前=カケルは女子と仲が良い 詳細=カケルは休日は女子と遊んで過ごしているようだ]
[足跡 名前=カケルは女子と仲が良い]

[モノローグ]
あれ、でも美園さんと付き合ってるって[n]
うわさだったよな？[next]

美園さんは梶野があんな調子でいいんだろうか。[next]
[モノローグ終了]

[return]
*人が集まらない休日準備2

*カケルは寂しい人
[足跡デバッグ 名前=カケルは寂しい人]
[jump target="*カケルは寂しい人2" cond="!足跡('カケルは寂しい人') || 足跡('カケルは友達がいない')"]
[eval exp="種がある = 1" cond="findSeed('カケルは寂しい人') >= 0"]
[カケルなにしてる]
[種分岐 ア=カケルは寂しい人 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*カケルは寂しい人2"][endif]
*本文
そう言えば美園さんが梶野のことを[n]
「寂しい人」だって言ってたな……[next]

あれはどういう意味なんだろう。[next]
[モノローグ終了]

[自分]
なあ、梶野、あのさ……[next]

[表情 画像= カケル  名前= 梶野カケル]
[人物右遠い 画像= 男子生徒イ  名前=クラスメイト]
おーい、小金井、ちょっといいかー？[next]

[モノローグ]
クラスメイトの男子が声をかけてきた。[n]
どうしたんだろう。[next]
[モノローグ終了]

[人物右遠い 画像= 男子生徒イ  名前=クラスメイト]
駅前にゲーセンが新しくできだだろ？[n]
明日の放課後、クラスの男子で行こうか、って話なんだけど。[n]
お前達、来るか？[next]

[モノローグ]
正直、文化祭準備と勉強で手一杯で俺には遊びに行く余裕がない。[n]
梶野はどうなんだろう。[next]
[モノローグ終了]

[人物左遠い 画像= 男子生徒ア  名前=クラスメイト]
小金井はともかく、梶野はやめとけよ。[n]
そもそも来ないんだから。[next]
[BGM停止 時間=3000]

[人物 画像= カケルめそらし  名前= 梶野カケル]
…………[next]

[人物左遠い 画像= 男子生徒ア  名前=クラスメイト]
どうせ女子との予定があるに決まってんだろ。[n]
いいよなあ、モテる男は。[next]

[人物 画像= カケルしゃべる  名前= 梶野カケル]
……ゲーセンとか興味ないから。[next]

[人物消去]

[モノローグ]
そう言うと梶野はどこかへ行ってしまった。[next]
[モノローグ終了]

[自分]
俺も、明日用事があるから、ごめん。[n]
誘ってくれてありがとう、じゃあな！[next]

[人物全消去]

[モノローグ]
俺も誘いを断り、梶野を追いかける。[next]
[モノローグ終了]

[場面転換]
[if exp=f.昼休み]
	[背景 画像=廊下]
[else]
	[背景 画像=廊下夕方]
[endif]
[枠]

[人物 画像= カケル  名前= 梶野カケル]
…………[next]


[モノローグ]
梶野は教室を出て廊下を歩いていた。[next]
[モノローグ終了]


[自分]
梶野、ちょっと待ってくれ！[n]
あの、今のって……[next]

[人物 画像= カケルめそらし  名前= 梶野カケル]
見ればわかっただろ、[BGM 曲=piano2-悲しい.ogg 音量=50]オレ、男から嫌われてるんだよ。[n]
別のクラスに入り浸ってるお前は知らないかもしれないけど。[next]

[自分]
嫌われるようなことしたのか……？[next]

[人物 画像= カケルえっ  名前= 梶野カケル]
知るかよ。[n]
ただ、女子と仲良いのが気に食わないんだろ。[next]

男から嫌われる、一緒に過ごすのは女子しかいない。[n]
それだけだ。[next]

[自分]
本当にそれだけの理由で男友達がいないなんて……[next]

[人物 画像= カケル  名前= 梶野カケル]
昔からそうだから。[n]
何もしなくても女子は近寄って来るし……[next]

[表情 画像=カケルめそらし]
じゃあ、オレ、行くから。[next]

[人物消去]

[種入手    名前= カケルは友達がいない   詳細= カケルはモテるように見えて友達がいないようだ 期限=10]
[足跡 名前=カケルは友達がいない]

[モノローグ]
美園さんが寂しい人だって言っていた理由がわかった気がする。[next]

女子にモテる代わりに男友達がいないのか……[n]
どうにか梶野に友達ができれば[n]
何かがうまく行くような気がするんだけど。[next]

どうしたらいいんだろう……？[next]
[モノローグ終了]

[return]
*カケルは寂しい人2

*ミドリの不安
[足跡デバッグ 名前=ミドリの不安]
[jump target="*ミドリの不安2" cond="!足跡('ミドリの不安')|| 足跡('カケルは気づいた')"]
[eval exp="種がある = 1" cond="findSeed('ミドリの不安') >= 0"]
[カケルなにしてる]
[種分岐 ア=ミドリの不安 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*ミドリの不安2"][endif]
*本文
[モノローグ終了]
[自分]
まあ、特に用があるわけでもないんだけど。[next]

[人物 画像= カケルしゃべる  名前= 梶野カケル]
小平がまた三人で勉強会したいって言ってた。[n]
明日の放課後空いてるか？[next]
[表情 画像=カケル]

[自分]
多分、大丈夫だよ。[n]
テストも近いし、対策した方がいいよな。[next]

[人物 画像= カケルにい  名前= 梶野カケル]
オレは赤点さえ取らなければそれでいいんだけどな。[next]
[表情 画像= カケル]

[自分]
あ、あのさ……[n]
美園さんのどこが好きなの？[next]

[人物 画像= カケルななんだよ  名前= 梶野カケル]
……いきなりなんだよ？[next]
[表情 画像=カケルえっ]
[自分]
いやあ、実際どうなのかなーって。[n]
美園さんって梶野の周りにいる女子とちょっと雰囲気違うから……[next]

[人物 画像= カケルにこ  名前= 梶野カケル]
……違うから、だよ。[next]

[表情 画像=カケル安らか]
外面しか見てくれないタイプの女子と違って[n]
一緒にいて安心するというか……[n]
無理しなくていいからな……[next]
[表情 画像=カケルふっ]

[モノローグ]
俺の読みはどうやら当たっていたらしい。[next]
[モノローグ終了]
[表情 画像=カケルえっ]
[自分]
でも、美園さんはそういう女子たちと[n]
梶野が遊びにいってしまうことが不安だって言ってたぞ。[next]

[人物 画像= カケル驚き  名前= 梶野カケル]
……それ、本当か？[next]

[自分]
美園さんのことを大切に思ってるなら[n]
そのあたり話し合った方がいいんじゃないか？[next]

[人物 画像= カケルしゃべる  名前= 梶野カケル]
オレとしては、女子の方から近づいてくるし、[n]
ミドリがいない時間を埋められるから[n]
それでいいか、と思ってたけど……[next]

[表情 画像= カケルはあ]
ミドリからしたら不安だったんだな。[next]

[表情 画像= カケルえっ]
ありがとな、小金井。[n]
少しミドリと話してみる。[next]
[表情 画像=カケル]

[自分]
うん、頑張れよ。[next]

[人物 画像= カケルにこ  名前= 梶野カケル]
ああ、またな。[next]

[人物消去]

[モノローグ]
[種入手 名前=カケルは気づいた 詳細=カケルはミドリを不安にさせてきたことに気が付いたらしい 期限=1]
[足跡 名前=カケルは気づいた]
これで二人の関係がよくなるといいんだけど……[n]
また話を聞いてみようかな。[next]
[モノローグ終了]
[return]
*ミドリの不安2

*絶望するミドリ
[足跡デバッグ 名前=絶望するミドリ]
[jump target="*絶望するミドリ2" cond="!足跡('絶望するミドリ') || 足跡('カケルとミドリの破局')"]
[eval exp="種がある = 1" cond="findSeed('絶望するミドリ') >= 0"]
[カケルなにしてる]
[種分岐 ア=絶望するミドリ イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*絶望するミドリ2"][endif]

[モノローグ終了]
[種入手 名前=カケルとミドリの破局 詳細=カケルとミドリは別れてしまったらしい]
[足跡 名前=カケルとミドリの破局]
[不参加 名前=ミドリ]
[eval exp="f.ミドリ栄養ドリンク = 1"]
[実績解除 名前=実績１４：ミドリの悲劇]
[return]
*絶望するミドリ2

*マリのうまくいかない毎日
[足跡デバッグ 名前=マリのうまくいかない毎日]
[jump target="*マリのうまくいかない毎日2" cond="!足跡('マリのうまくいかない毎日') || 足跡('カケルの真意')"]
[eval exp="種がある = 1" cond="findSeed('マリのうまくいかない毎日') >= 0"]
[カケルなにしてる]
[種分岐 ア=マリのうまくいかない毎日 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*マリのうまくいかない毎日2"][endif]
*本文
そう言えば貫井さんは[n]
梶野に勧められて部長になる決心をしたんだったな。[next]

梶野なら貫井さんの悩みを解決できるような[n]
情報を知ってるかもしれない。[next]
[モノローグ終了]

[自分]
あのさ、梶野って貫井さんと中学から一緒だって聞いたんだけど。[next]

[人物 画像= カケルえっ  名前= 梶野カケル]
ああ……それがどうした？[next]

[自分]
いやあ、結構仲良いのかなって思ってさ。[next]

[人物 画像= カケル  名前= 梶野カケル]
……？[next]
[表情 画像=カケルしゃべる]
……まあ、中学の時も、高校に入ってからも[n]
同じクラスになることが多かったんだよ。[next]

高校受験の時も同じ志望校だからって話す機会もあったしな。[next]
[表情 画像=カケル]
[自分]
そうか……[next]

実はさ、貫井さんからテニス部の部長の仕事が[n]
うまくいかないって相談されたんだ。[next]

貫井さんは梶野に応援されたから頑張る、みたいなことを[n]
言ってたから梶野なら何か知ってるかと思って。[next]

[人物 画像= カケルえっ  名前= 梶野カケル]
応援……？[n]
そんなつもりはなかったんだけどな。[next]

[自分]
え？[next]

[人物 画像= カケルはあ  名前= 梶野カケル]
オレとしては、貫井が悩んでるのってめずらしいから[n]
らしくない、って思ったくらいで。[next]
[表情 画像=カケルしゃべる]
確かに貫井と話はしたけど[n]
それも屋上でたまたま会ったってだけだしな。[next]
[表情 画像=カケル]
[自分]
そ、そうなのか……[next]

[人物 画像= カケルしゃべる  名前= 梶野カケル]
オレのせいで貫井に何か無理をさせているなら悪い気がするけど。[n]
でもオレもテニス部の事情のことはよく知らないから[n]
今の貫井の力にはなれないと思う。[next]

[自分]
わかった、ありがとう。[next]

[人物 画像= カケルえっ  名前= 梶野カケル]
まあ、オレも少し気にしておくよ。[next]
[表情 画像=カケルはあ]
じゃあ、行くな。[next]
[表情 画像=カケルめそらし]
[自分]
ああ、またな。[next]

[人物消去]

[種入手 名前=カケルの真意 詳細=マリが部長に立候補するのを、カケルは勧めたつもりがなかった]
[足跡 名前=カケルの真意]
[モノローグ]
なんだか貫井さんと梶野で認識が違うような気がする。[n]
貫井さんにもう一度話を聞いてみるか。[next]
[モノローグ終了]
[return]
*マリのうまくいかない毎日2

*遊園地に行こう
[足跡デバッグ 名前=遊園地に行こう]
[jump target="*遊園地に行こう2" cond="!足跡('遊園地に行こう') || 足跡('また新しく作っていけばいい')"]
[eval exp="種がある = 1" cond="findSeed('遊園地に行こう') >= 0"]
[カケルなにしてる]
[種分岐 ア=遊園地に行こう イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*遊園地に行こう2"][endif]
*本文
;----------↓ここから↓----------
※シナリオ：遊園地に行こう[next]
;----------↑ここまで↑----------
[足跡 名前=また新しく作っていけばいい]
[種入手 名前=また新しく作っていけばいい 詳細=大事なものを失っても思い出はまた新しく作っていけばいい、とカケルは言った 期限=1]
[return]
*遊園地に行こう2

*雑談
[カケルなにしてる]
[三択 ア=雑談する イ=何か他の話題は……]
[if exp=イ]
	[jump target="*雑談2"]
[endif]
[人物 名前=梶野カケル 画像=カケル]
とりとめのない会話が入ります。[next]
[人物消去]
[枠消去]
[return]
*雑談2

[nowait]これ以上会話はないみたい。[endnowait]
[if exp="種がある || f.カケル参加 || f.カケル招集"]
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
梶野、お願いがあるんだけど……[n]
放課後の文化祭準備をちょっと手伝って欲しいんだ！[next]
[人物 画像=カケルしゃべる 名前=梶野カケル]
なんだよ、またその話か。[next]
[モノローグ]
俺は粘り強く交渉した。[next]
[モノローグ終了]
[体力 変化=&招集消費]
[if exp="人員計算() > 7"]
	[人物 画像=カケルはあ 名前=梶野カケル]
	……あ、予定あるの忘れてた。[n]
	別にオレいなくても、なんとかなるだろ？[next]
	[自分]
	え、そんなあ……[next]
	[return]
[endif]
[eval exp="f.カケル招集 = 1"]
[人物 画像=カケルえっ 名前=梶野カケル]
どうせ予定もないし、少しくらいは……まあ。[next]
[自分]
よかった。ありがとう梶野！[next]
[人物消去]
[メッセージ]
次の放課後準備に、梶野カケルが手伝いに来てくれることになった。[next]
[return]
