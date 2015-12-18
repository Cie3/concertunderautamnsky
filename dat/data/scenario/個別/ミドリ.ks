[足跡デバッグ 名前=カケルは気づいた]
[jump target="*カケルは気づいた" cond="足跡('カケルは気づいた') && !足跡('カケルミドリ参加')"]

[足跡デバッグ 名前=カケルとミドリの破局]
[jump target="*カケルとミドリの破局" cond="足跡('カケルとミドリの破局')"]

[macro name=ミドリなにしてる]
[nowait]
美園さんが教室で携帯をいじっている。
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
[表情 画像=ミドリうーん]
[モノローグ]

;種があると、強制招集が使えません。
[eval exp="var 種がある = 0;"]

*雑談
[ミドリなにしてる]
[三択 ア=雑談する イ=何か他の話題は……]
[if exp=イ]
	[jump target="*雑談2"]
[endif]
[人物 名前=美園ミドリ 画像=ミドリ]
とりとめのない会話が入ります。[next]
[人物消去]
[枠消去]
[return]
*雑談2

*人が集まらない休日準備
[足跡デバッグ 名前=人が集まらない休日準備]
[jump target="*人が集まらない休日準備2" cond="!足跡('人が集まらない休日準備')"]
[jump target="*人が集まらない休日準備2" cond="!足跡('カケルは女子と仲が良い')"]
[jump target="*人が集まらない休日準備2" cond="足跡('ミドリの戸惑い')"]
[eval exp="種がある = 1" cond="findSeed('人が集まらない休日準備') >= 0"]
[nowait]
[ミドリなにしてる]
[種分岐 ア=人が集まらない休日準備 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*人が集まらない休日準備2"][endif]
*本文
[モノローグ終了]
[自分]
あの……美園さん、ちょっといいかな？[next]

[人物 画像= ミドリぎくっ  名前= 美園ミドリ]
え……[n]
どうしたの[姓]君……？[next]
[表情 画像=ミドリうーん]

[自分]
俺、文化祭のクラス実行委員だから[n]
やっぱり美園さんにも休日も準備に来てほしいんだけど……[next]

せっかく喫茶店ってアイディア出したの美園さんだしさ。[next]

[人物 画像= ミドリそれが  名前= 美園ミドリ]
私も行きたいんだけど……[n]
カレンにも悪いし……[next]

[表情 画像=ミドリめそらし]
[モノローグ]
そう言ったきり美園さんは黙ってしまった。[n]
何か言い淀んでいるようにも見える。[next]
[モノローグ終了]
[表情 画像=ミドリうーん]

[自分]
大変なら無理はしなくていいけど俺は待ってるから。[next]

[人物 画像= ミドリ苦笑  名前= 美園ミドリ]
……うん、できるだけ参加できるように私も頑張るね。[next]

じゃあ、またね、[姓]君。[next]

[人物消去]

[種入手    名前=ミドリの戸惑い    詳細=ミドリは何か理由があって来られないようだ  ]
[足跡 名前=ミドリの戸惑い]

[モノローグ]
美園さんが来られない理由は何だろう？[n]
この前は梶野と一緒に帰ってしまったけど……[next]

梶野、と言えば美園さんは梶野と付き合ってるってうわさだけど[n]
全然二人の雰囲気が違う……？[next]

まあ、それは良いとして[n]
確か美園さんは恋ヶ窪さんの名前を出していたな……[n]
同じ実行委員でもあるし、恋ヶ窪さんにも聞いてみようか。[next]
[モノローグ終了]

[return]
*人が集まらない休日準備2

*ミドリの事情
[足跡デバッグ 名前=ミドリの事情]
[jump target="*ミドリの事情2" cond="!足跡('ミドリの事情') || 足跡('カケルは寂しい人')"]
[eval exp="種がある = 1" cond="findSeed('ミドリの事情') >= 0"]
[nowait]
[ミドリなにしてる]
[種分岐 ア=ミドリの事情 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*ミドリの事情2"][endif]
*本文
[モノローグ終了]
[自分]
美園さん、ちょっといいかな？[next]

[人物 画像= ミドリぎくっ  名前= 美園ミドリ]
どうしたの、[姓]くん？[next]

[自分]
……この前、美園さんと恋ヶ窪さんが話しているところ[n]
見ちゃったんだけど。[next]

[人物 画像= ミドリ黙る  名前= 美園ミドリ]
…………！！[next]

[自分]
(なんだか戸惑っているみたいだな……)[next]

[表情 画像=ミドリうーん]
恋ヶ窪さんが一方的に怒っているように見えたけど[n]
美園さんはそれで良かったの？[next]

俺、美園さんの話も聞きたい、って思って……[next]

[人物 画像= ミドリ苦笑  名前= 美園ミドリ]
えっと……[next]

[モノローグ]
美園さんを責めるつもりが俺には無いことがわかったからか[n]
少しほっとした表情になった。[next]

[モノローグ終了]

[人物 画像= ミドリはあ  名前= 美園ミドリ]
……カレンの言うことが正しいのはわかってるの。[next]

それに、カケル君には私以外にも沢山の女の子がいて、[n]
私なんて本当は要らないのかもしれない。[next]

[自分]
じゃあ、どうして……[next]

[人物 画像= ミドリ断言  名前= 美園ミドリ]
でもね、カケル君は、本当はとても寂しい人なの……！！[next]

[モノローグ]
いつも自信がなさそうに話す美園さんが[n]
めずらしくはっきりとそう言った。[next]
[モノローグ終了]

[人物 画像= ミドリそれが  名前= 美園ミドリ]
だから私が一緒にいてあげないといけないの……[next]

[自分]
そっか……わかった。[next]

[人物 画像= ミドリ発言  名前= 美園ミドリ]
[姓]くん……？[next]

[自分]
俺から梶野に文化祭準備に来るように声かけてみるよ。[n]
そしたら美園さんも準備に来られるんじゃないかな？[next]

[人物 画像= ミドリ苦笑  名前= 美園ミドリ]
あ、ありがとう……！[next]

じゃあ、私、そろそろ行くね。[next]

[自分]
うん、またね。[next]

[人物消去]

[種入手    名前=カケルは寂しい人    詳細=ミドリはカケルのことを「寂しい人」だと言った  ]
[足跡 名前=カケルは寂しい人]

[モノローグ]
梶野を準備に来させるって言ったものの[n]
どうしたらいいんだろう……[next]

それに美園さんが梶野のことを[n]
「寂しい人」だって言っていたのも気になる。[next]
[モノローグ終了]

[return]
*ミドリの事情2

*カケルの友達
[足跡デバッグ 名前=カケルの友達]
[jump target="*カケルの友達2" cond="!足跡('カケルの友達') || 足跡('ミドリの不安')"]
[eval exp="種がある = 1" cond="findSeed('カケルの友達') >= 0"]
[nowait]
[ミドリなにしてる]
[種分岐 ア=カケルの友達 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*カケルの友達2"][endif]
*本文
[モノローグ終了]
[自分]
美園さん、実はこの間……[next]

[モノローグ]
俺は美園さんに梶野と小平と勉強会をしたことを話した。[n]
そして梶野が俺達のことを友達だと言ったことも……[next]
[モノローグ終了]

[人物 画像= ミドリ発言  名前= 美園ミドリ]
そっか……小金井くんのおかげだったんだ……[next]

[自分]
え？[next]

[人物 画像= ミドリそれが  名前= 美園ミドリ]
カケルくんが、他の女の子のところに行かなくなったの。[next]

[表情 画像= ミドリ苦笑]
この前、私が一緒に帰れなかった日に[n]
誰と帰ったの？ って聞いたら[n]
小平君だって言うからびっくりしちゃったな。[next]
[表情 画像= ミドリ]

[自分]
へえ……小平が……[next]

でも、これで梶野に友達ができたわけだし[n]
もう「寂しく」はないんじゃないかな。[next]

[人物 画像= ミドリそれが  名前= 美園ミドリ]
……どうなんだろう、そもそも私が[n]
「寂しい人」だって思い込んでただけなのかも。[next]
[表情 画像= ミドリめそらし]

[自分]
どうしてそう思うの？[n]

[人物 画像= ミドリ苦笑  名前= 美園ミドリ]
ほら、カケル君って顔だちが整ってるから[n]
女の子たちにとても人気があって……[next]

おしゃれ好きなお姉さんたちのおかげで[n]
ファッションセンスもあるし、[n]
歌も上手いし……[next]

[表情 画像= ミドリそれが]
そういうかっこよさ目当ての女の子達のことが[n]
実は嫌いじゃなかったり、その子たちと[n]
一緒に居る方が楽しかったりするのかなぁって……[next]

[表情 画像= ミドリ悲しい]
カケル君は何で私を選んでくれたんだろう……[next]

[自分]
きっと、友達がいないことや寂しがりなところを[n]
見抜いてくれる人だったからじゃないかな。[n]
見た目じゃない、本心を見てくれるというか……[next]

あはは、俺、何を言ってるんだろう。[next]

[人物 画像= ミドリはあ  名前= 美園ミドリ]
そうだったらいいんだけど……[next]

[表情 画像= ミドリ苦笑]
でも、こんなこと、[n]
カケルくんに友達ができなかったら話せなかったかも。[next]

ちょっとでも不安を口にしたら[n]
カケルくんが離れていきそうで……[next]

聞いてくれてありがとう、小金井君。[next]

[自分]
いや、俺は何もしてないよ。[next]

[人物 画像= ミドリ  名前= 美園ミドリ]
ううん、ちょっと楽になった気がするから……[n]
じゃあ、またね。[next]

[人物消去]

[モノローグ]
[種入手    名前=ミドリの不安 詳細=カケルが他の女の子と遊ぶ方が楽しいのかもしれない……と]
[足跡 名前=ミドリの不安]

よく考えたら、美園さんから梶野への気持ちは聞いたけど[n]
梶野から美園さんへの気持ちは聞いてないな……[next]

梶野は美園さんのことをどう思ってるんだろう？[n]
少し話を聞いてみようか。[next]
[モノローグ終了]

[return]
*カケルの友達2

*カケルの女遊び
[足跡デバッグ 名前=カケルの女遊び]
[jump target="*カケルの女遊び2" cond="!足跡('カケルの女遊び') || 足跡('絶望するミドリ')"]
[eval exp="種がある = 1" cond="findSeed('カケルの女遊び') >= 0"]
[nowait]
[ミドリなにしてる]
[種分岐 ア=カケルの女遊び イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*カケルの女遊び2"][endif]
*本文
[モノローグ終了]
※シナリオ：カケルの女遊び[next]
[種入手 名前=絶望するミドリ 詳細=ミドリはカケルのことでショックを受けたようだ]
[足跡 名前=絶望するミドリ]
[return]
*カケルの女遊び2

*カケルとマリの密会
[足跡デバッグ 名前=カケルとマリの密会]
[jump target="*カケルとマリの密会2" cond="!足跡('カケルとマリの密会') || 足跡('絶望するミドリ')"]
[eval exp="種がある = 1" cond="findSeed('カケルとマリの密会') >= 0"]
[nowait]
[ミドリなにしてる]
[種分岐 ア=カケルとマリの密会 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ]
	[jump target="*カケルとマリの密会2"]
[endif]
*本文
[モノローグ終了]
※シナリオ：カケルとマリの密会[next]
[種入手 名前=絶望するミドリ 詳細=ミドリはカケルのことでショックを受けたようだ]
[足跡 名前=絶望するミドリ]
[return]
*カケルとマリの密会2

これ以上会話はないみたい。
[if exp="種がある || f.ミドリ参加 || f.ミドリ招集 || f.ミドリ不参加"]
	[next]
[else]
	[eval exp="var 呼ぶ = '放課後の文化祭準備に呼ぶ (' + 招集消費 + ')'"]
	[二択 ア=&呼ぶ イ=呼ばない]
	[jump target="*強制招集" cond=ア]
[endif]
[cm]
[jump target="*雑談"]

; ここから強制イベント

*カケルとミドリの破局
[場面転換]
[if exp=f.昼休み]
	[背景 画像=教室]
	[BGM 曲=05日常.ogg 音量=50 ループ]
[else]
	[背景 画像=教室夕方]
	[BGM 曲=夕暮れ.ogg 音量=50 ループ]
[endif]
[枠]
[モノローグ]
そういえば、美園さんは今日も休みだったっけ……[next]
[モノローグ終了]
[return]

*強制招集
[モノローグ終了]
[自分]
美園さん、お願いがあるんだけど……[n]
放課後の文化祭準備をちょっと手伝って欲しいんだ！[next]
[人物 画像=ミドリ発言 名前=美園ミドリ]
どうしよう……カレン怒ってないかな……[next]
[モノローグ]
俺は粘り強く交渉した。[next]
[モノローグ終了]
[体力 変化=&招集消費]
[if exp="人員計算() > 7"]
	[人物 画像=ミドリそれは 名前=美園ミドリ]
	う〜ん……ごめんなさい。[n]
	手伝ってくれるひと、いるんだよね？[next]
	[自分]
	あ、うん。そっか……[next]
	[return]
[endif]
[eval exp="f.ミドリ招集 = 1"]
[人物 画像=ミドリ苦笑 名前=美園ミドリ]
だったら、少しだけお手伝いしても、いいのかな……[next]
[自分]
よかった。ありがとう美園さん！[next]
[人物消去]
[メッセージ]
次の放課後準備に、美園ミドリが手伝いに来てくれることになった。[next]
[return]
