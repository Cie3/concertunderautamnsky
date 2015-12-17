[足跡デバッグ 名前=マリ参加]
[jump target="*文化祭の買い出し" cond="足跡('マリ参加') && !足跡('文化祭の買い出し終了')"]
[足跡デバッグ 名前=文化祭の買い出し終了]
[jump target="*カズキと一緒に出かけよう" cond="足跡('文化祭の買い出し終了') && !足跡('マリが付き合ったらしたいこと')"]
[jump target="*マリデート１" cond="f.マリデート == 1 && f.曜日 == '週末'"]
[jump target="*マリデート２" cond="f.マリデート == 2 && f.曜日 == '週末'"]


[macro name=マリなにしてる]
[nowait]
[if exp=f.昼休み]
	貫井さんが職員室から出てきた。
[else]
	貫井さんが書類とにらめっこしている。
[endif][endnowait]
[endmacro]

[場面転換]
[if exp=f.昼休み]
	[背景 画像=廊下]
	[BGM 曲=05日常.ogg 音量=50 ループ]
	[表情 画像=マリうーん]
[else]
	[背景 画像=教室夕方]
	[BGM 曲=夕暮れ.ogg 音量=50 ループ]
	[表情 画像=マリうん]
[endif]
[枠]

;種があると、強制招集が使えません。
[eval exp="var 種がある = 0;"]

[足跡デバッグ 名前=マリけんか]
[jump target=*マリけんか cond="足跡('マリけんか')"]

[モノローグ]

*雑談
[マリなにしてる]
[三択 ア=雑談する イ=何か他の話題は……]
[if exp=イ]
	[jump target="*雑談2"]
[endif]
[人物 名前=貫井マリ 画像=マリ]
とりとめのない会話が入ります。[next]
[人物消去]
[枠消去]
[return]
*雑談2

*人が集まらない休日準備
[足跡デバッグ 名前=人が集まらない休日準備]
[jump target=*人が集まらない休日準備2 cond="!足跡('人が集まらない休日準備')"]
[jump target=*人が集まらない休日準備2 cond="足跡('マリは責任感が強い')"]
[eval exp="種がある = 1" cond="findSeed('人が集まらない休日準備') >= 0"]
[マリなにしてる]
[種分岐 ア=人が集まらない休日準備 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*人が集まらない休日準備2"][endif]
*人が集まらない休日準備-シナリオ
[モノローグ終了]
[自分]
貫井さん、文化祭の準備に来るのは[n]
やっぱり難しいのかな？[next]

俺は実行委員だから[n]
なんとかして文化祭を成功させたいんだけど……[next]

[人物 画像=マリ真面目 名前=貫井マリ]
あたしも休日の準備に行きたい気持ちはあるんだけどね……[n]
部活をどうしても休みたくないんだ。[n]
部長が練習来ないのっておかしいじゃん？[next]

[自分]
部長……そうだ、女子テニス部で部長をしているんだっけ。[next]

[人物 画像=マリうん 名前=貫井マリ]
うん、部長になったんだから誰よりも練習に行って[n]
誰よりもテニスが上手くなくちゃいけないと思うんだ。[next]

[自分]
責任感が強いんだね、凄いなぁ……[next]

[人物 画像=マリあちゃー 名前=貫井マリ]
いやいや、そんなことないよ……[next]
[表情 画像=マリ]
休日の作業については……ごめん。[n]
でも平日頑張るから！[next]
[表情 画像=マリあはは]
じゃあ、部活のミーティングがあるから、またね！[next]

[自分]
うん、ありがとう、またね。[next]

[人物消去]
[種入手 名前=マリは責任感が強い 詳細=マリは部長としての責任感が強いようだ 期限=10]
[足跡 名前=マリは責任感が強い]
[モノローグ]
そういえばカズキもテニス部だったな。[n]
何か話が聞けるかもしれない。[next]
[モノローグ終了]
[return]
*人が集まらない休日準備2

*マリは実は頼りない？
[足跡デバッグ 名前=マリは実は頼りない？]
[jump target=*マリは実は頼りない？2 cond="!足跡('マリは実は頼りない？')"]
[jump target=*マリは実は頼りない？2 cond="足跡('マリの秘密')"]
[eval exp="種がある = 1" cond="findSeed('マリは実は頼りない？') >= 0"]
[マリなにしてる]
[種分岐 ア=マリは実は頼りない？ イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*マリは実は頼りない？2"][endif]
*マリは実は頼りない？-シナリオ
[モノローグ終了]
[自分]
あの、貫井さん、部活関係で悩んでることってない？[next]

[人物  画像=  マリえっ  名前=  貫井マリ]
いきなりどうしたの、[姓]？[n]
あたしなら全然大丈夫だよ？[next]
[表情 画像=マリうーん]

[自分]
俺、カズキと中学からの友達なんだ。[n]
それで少し話を聞いたんだけど……[next]

[人物  画像=  マリえっ  名前=  貫井マリ]
…………[next]
[表情 画像=マリうーん]
[自分]
ご、ごめん、話したくなかったらいいんだけど……[next]

[人物  画像=  マリ真面目  名前=  貫井マリ]
……ううん、国分寺がどこまで話したか知らないけど[n]
この際だから、あたしの話を聞いてもらおうかな。[n]
少し長くなるけど。[next]

[自分]
もちろん、大丈夫だよ。[next]

[人物  画像=  マリ真面目  名前=  貫井マリ]
あたし、小学生の時からテニス習ってたんだ。[n]
中学のテニス部では、ずっとレギュラーだったの。[next]

だから、一年生のころからキャプテンとか部長とか期待されて[n]
結局、副部長になったんだ。[next]
[表情 画像=マリ悲しい]
でも部長が休みの日に、あたしが部活を仕切ると[n]
なんだかうまくいかなくてね。[next]
[表情 画像=マリ真面目]
だから高校でも部長になって欲しいって言われた時は[n]
断ろうと思ってて、でも、そんな時に……[next]
[人物消去]
[場面転換]
[ま][ま][ま]

[背景 画像= 屋上]
[枠]

[人物左  画像=  マリはあ  名前=  貫井マリ]
『私には部長なんて無理だよ……』[next]
[表情左 画像=マリ悲しい]

[人物右  画像=  カケルえっ  名前=  梶野カケル]
『どうしたんだよ、暗い顔して』[next]

[人物左  画像=  マリえっ  名前=  貫井マリ]
『梶野！どうしてここに！？』[next]
[表情左 画像=マリ真面目]
[人物右  画像=  カケルしゃべる  名前=  梶野カケル]
『俺がどこにいたっていいだろ？[n]
それより、話なら聞くよ。[n]
せっかく中学も高校も一緒って仲なんだし』[next]

[人物左  画像=  マリはあ  名前=  貫井マリ]
『うーん……
テニス部の部長にならないか、って話が出てるんだ。[n]
でもあたし、また中学の頃みたいになったら嫌だなぁって……[n]

あたし、ほら、そういうのダメなんだよねー』[next]
[表情左 画像=マリうーん]
[人物右  画像=  カケル安らか  名前=  梶野カケル]
『別に貫井はダメじゃないよ、テニス上手いじゃん』[next]
[表情右 画像=カケルふっ]
『それに中学の時に失敗した経験を生かしてさ、[n]
今度こそ部長やってみればいいんじゃないのか』[next]

[人物左  画像=  マリ哀愁の笑み  名前=  貫井マリ]
『あたし、部長になってもいいのかな……？』[next]
　
[人物右  画像=  カケルにい  名前=  梶野カケル]
『そうだな、挑戦するのは誰だって自由だろ？』[next]

[場面転換]
[ま][ま][ま]
[if exp=f.昼休み][背景 画像=教室][else][背景 画像=教室夕方][endif]
[表情 画像=マリうーん]
[枠]
[自分]
そんなことが……[next]

[人物  画像=  マリ真面目  名前=  貫井マリ]
今度こそ頑張ろうって思ってるんだけど[n]
やっぱりなんか上手くいかないことも多くってね。[next]

だから、せめて誰よりも練習して[n]
誰よりもテニスが上手ければ少しは頼りがいもあるかなって。[next]
[表情 画像=マリはあ]
そうじゃないと応援してくれた梶野にも悪いし……[next]
[表情 画像=マリうーん]
[自分]
…………[next]

[モノローグ]
貫井さんの話を聞いて、俺も力になりたいと思った。[n]
でも良い言葉が見つからない。[next]
[モノローグ終了]

[人物 画像= マリあちゃー  名前= 貫井マリ]
そんな顔しないで！[n]
話を聞いてくれただけで十分だよ。[n]
あたしは大丈夫だから！[next]

[自分]
そう……だったらいいんだけど。[next]

[人物 画像= マリ  名前= 貫井マリ]
じゃあ、そろそろ練習に行くね。[next]
[表情 画像= マリうん]
[自分]
うん、またね。[next]

[人物消去]
[種入手 名前=マリの秘密 詳細=マリはカケルの勧めで部長になったけど、うまくいかない毎日みたいだ]
[足跡 名前=マリの秘密]
[return]
*マリは実は頼りない？2

*女子テニス部員の不満
[足跡デバッグ 名前=女子テニス部員の不満]
[jump target=*女子テニス部員の不満2 cond="!足跡('女子テニス部員の不満')"]
[jump target=*女子テニス部員の不満2 cond="足跡('部長の仕事')"]
[eval exp="種がある = 1" cond="findSeed('女子テニス部員の不満') >= 0"]
[マリなにしてる]
[種分岐 ア=女子テニス部員の不満 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*女子テニス部員の不満2"][endif]
*本文
貫井さんは何かの紙を持っている。[n]
そして少し悩んでいるようだ。[next]
[モノローグ終了]

[自分]
もしかして、それ、グラウンド利用願い？[next]

[人物 画像= マリえっ  名前= 貫井マリ]
えっ、なんで知ってるの？[next]

[自分]
前原先生とテニス部の人が話しているところを見ちゃって……[next]

[人物 画像= マリはあ  名前= 貫井マリ]
やっぱり怒ってた……？[n]
急がないといけないのはわかってるんだけど[n]
なかなか完成しなくて……[next]

[モノローグ]
貫井さんは困り顔でそう言った。[next]
[モノローグ終了]

[自分]
俺も書類作るの手伝うよ。[next]

[人物 画像= マリあちゃー  名前= 貫井マリ]
そんなの悪いよ、あたしの仕事だし。[next]

[自分]
困っている貫井さんを放っておけないよ。[n]
それに二人でやった方が早く終わると思うんだ。[next]

[人物 画像= マリ哀愁の笑み  名前= 貫井マリ]
それもそうだね。[n]
ありがとう。[next]
[表情 画像=マリ悲しい]
[モノローグ]
貫井さんは書類に向かった。[n]
でもあまりペンが進まない。[next]
[モノローグ終了]

[人物 画像= マリ真面目  名前= 貫井マリ]
ええと……この日って人集まるのかな……[n]
確かキャプテンが来られないって言ってた気がする。[next]

その次の日は試合の前日だから休みにした方がいいのかな。[n]
でも前日だからこそ練習するべき……？[next]
[表情 画像=マリうーん]
[間][間][間][間]

[自分]
あのさ、いつも書類作る時って[n]
こんな感じで悩んでるの？[next]

[人物 画像= マリ真面目  名前= 貫井マリ]
うーん……割とそうかもしれない。[n]
あたしが勝手に決めたらダメかな、って思って。[n]
そしたらいつも時間が過ぎちゃうんだよね。[next]

みんなにちょっとずつ予定を聞いたりするんだけど[n]
全員の予定が反映できるわけじゃないし。[n]
そうやって考えてるとなかなか決められないんだ。[next]
[表情 画像=マリうーん]
[自分]
貫井さんが部長なんだから、貫井さんの意志で決めちゃっても[n]
いいんじゃないかな。[next]

[人物 画像= マリえっ  名前= 貫井マリ]
えっ……でも……[next]

[自分]
俺が部員だったら先に[n]
「この日に練習するので来てください」[n]
って言ってもらった方が楽かも。[next]

[人物 画像= マリ真面目  名前= 貫井マリ]
……それで部員のみんなは怒ったりしない？[next]
[表情 画像=マリうーん]
[自分]
もちろん部員の意見を全く聞かない部長は困るけど。[n]
正直、練習日は早めに決めてくれれば[n]
あとから部員の方が予定を合わせるんじゃないかな。[next]

部長の仕事って部員の代表として決断することだと[n]
俺は思うよ。[next]

[人物 画像= マリ真面目  名前= 貫井マリ]
部員の代表として決断するのが仕事……[next]

[表情 画像=マリ決意]
[モノローグ]
貫井さんはそう呟くと[n]
再び書類を書き始めた。[next]

[モノローグ終了]

[人物 画像= マリよし  名前= 貫井マリ]
試合前日は午前中だけにして午後は休みにする。[n]
代わりにこっちの日は一日練習にして……[next]

こ、これで大丈夫かな……？[next]
[表情 画像=マリ真面目]
[自分]
ちゃんと理由があって決めたなら大丈夫だよ。[n]
何か部員から言われても説明すればいいんだから。[next]

[人物 画像= マリあはは  名前= 貫井マリ]
そっか、そうだよね。[next]
[表情 画像=マリ決意]
[モノローグ]
そのあとは俺に時々相談しつつ[n]
貫井さんは練習日を決めていった。[next]
[モノローグ終了]

[人物 画像= マリ  名前= 貫井マリ]
できたよ、[姓]……！[n]
前原先生のところに行ってくるね。[next]
[表情 画像=マリうん]
[自分]
間に合いそうで良かったよ。[next]

[人物 画像= マリ哀愁の笑み  名前= 貫井マリ]
その……色々とありがとう。[next]

あたし、自分でもちょっと考えてみようと思う。[n]
今までの部長としての振る舞いがどうだったか、とか。[next]
[表情 画像=マリ]
じゃあ、またね！[next]

[人物消去]

[モノローグ]
貫井さんは何かに気付いたみたいだった。[n]
これで貫井さんの悩みが解決されたならいいんだけど……[next]

また声をかけてみようかな。[next]

[モノローグ終了]
[足跡 名前=部長の仕事]
[return]
*女子テニス部員の不満2

*カケルの真意
[足跡デバッグ 名前=カケルの真意]
[jump target=*カケルの真意2 cond="!足跡('カケルの真意')"]
[jump target=*カケルの真意2 cond="足跡('マリの恋心')"]
[eval exp="種がある = 1" cond="findSeed('カケルの真意') >= 0"]
[マリなにしてる]
[種分岐 ア=カケルの真意 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="カケルの真意2"][endif]
;---------------------------------------------
[モノローグ終了]
[自分]
この前、梶野にも貫井さんの悩みを解決できそうなことを知ってるか[n]
聞いてみたんだけど……[next]

[人物 画像= マリえっ  名前= 貫井マリ]
か、梶野に！？[next]

[モノローグ]
貫井さんはとても慌てているように見える。[next]
[モノローグ終了]

[自分]
聞いたらいけなかったかな……？[next]

[人物 画像= マリ真面目  名前= 貫井マリ]
いや、あの、そんなことはないんだけど……[n]
それで、梶野はなんて……？[next]
[表情 画像=マリうーん]
[自分]
ただ悩んでるのがめずらしいって思ったくらいで[n]
そこまで強い気持ちはなかったから[n]
貫井さんに無理させてるなら悪いって……[next]

[人物 画像= マリ哀愁の笑み  名前= 貫井マリ]
そ、そうだよね……やっぱり……[n]
うん、わかってた……[next]

梶野って人に気を持たせるのがうまいっていうか。[n]
あんまり深いこと考えてないのに思わせぶりなこと言うから……[next]

まあ、それで期待しちゃうあたしがバカなんだけど。[n]
あはは……[next]

[モノローグ]
貫井さんは笑っているつもりのようだけど顔は悲しそうだ。[next]
[モノローグ終了]
[表情 画像=マリうーん]
[自分]
あの、もしかして貫井さんって梶野のこと……？[next]

[人物 画像= マリえっ  名前= 貫井マリ]
…………[next]

[間][間][間][間]
[表情 画像=マリ哀愁の笑み]
……うん。[n]
中学の時から気になってたんだ。[next]
[表情 画像=マリ悲しい]
でも梶野の周りには女子が沢山いるから[n]
自分がその子達を押しのけてまで好きだなんて言えなくて。[next]
[表情 画像=マリはあ]
高校に入ったら梶野は美園さんと付き合い始めたし。[n]
あたしの気持ちはもう伝えなくていいかなって。[next]
[表情 画像=マリ哀愁の笑み]
でも部長になるか悩んでる時に[n]
声をかけてくれたのはやっぱり嬉しくて……[n]
向こうにそんな気はない、ってわかってたんだけど。[next]
[表情 画像=マリ悲しい]
[自分]
そうなんだ……[next]

[人物 画像= マリ真面目  名前= 貫井マリ]
だから梶野がもし何か困ってるなら[n]
今度はあたしが力になりたいって思ってる。[next]

まあ、あの梶野が悩んだり困ったりすることなんて[n]
そんなに無いんだろうけどね。[next]
[表情 画像=マリうーん]
[自分]
自分の気持ちが届かなくても[n]
そんな風に考えられるなんて貫井さんってえらいね。[next]

[人物 画像= マリあちゃー  名前= 貫井マリ]
そ、そんなことないよ！[n]
小金井って、本当に人を褒めるのが上手いなあ……[next]
[表情 画像=マリ]
じゃあ、あたし、そろそろ行くよ。[n]
あと、今日話したことは誰にも秘密だからね……！！[next]
[表情 画像=マリうん]
[自分]
うん、またね。[next]

[人物消去]

[モノローグ]
貫井さんが梶野のことを好きだったなんて意外だったな。[next]

部活も恋愛もうまくいってないなんて[n]
なんだか大変そうだ……[next]
どちらかだけでも良い方向に行くといいんだけど……[next]

[種入手 名前=マリの恋心 詳細=まさか貫井さんが梶野のことを好きだったなんて……]
[足跡 名前=マリの恋心]

今のところ、何かできそうにもないけど[n]
とりあえず、梶野の様子を伺ってみるか……[next]
[モノローグ終了]
[return]
*カケルの真意2

*カケルは友達がいない
;放課後限定イベントです
[足跡デバッグ 名前=カケルは友達がいない]
[足跡デバッグ 名前=マリの恋心]
[jump target=*カケルは友達がいない2 cond="f.昼休み"]
[jump target=*カケルは友達がいない2 cond="!足跡('カケルは友達がいない')"]
[jump target=*カケルは友達がいない2 cond="!足跡('マリの恋心')"]
[jump target=*カケルは友達がいない2 cond="足跡('カケルとマリの密会')"]
[eval exp="種がある = 1" cond="findSeed('マリの恋心') >= 0"]
[マリなにしてる]
[種分岐 ア=カケルは友達がいない イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*カケルは友達がいない2"][endif]
*本文
梶野は男友達がいないのは昔からだって言ってたな。[next]

中学からの仲の貫井さんなら何か知ってるかもしれない……[next]
[モノローグ終了]

[自分]
貫井さん、実は梶野のことなんだけど……[next]

[人物 画像= マリ  名前= 貫井マリ]
梶野がどうかしたの？[next]

[モノローグ]
俺はこの前見た内容を貫井さんに話した。[next]
[表情 画像=マリうーん]
梶野が男子たちから妬まれていること、[n]
そのために友達がいないこと……[next]
[モノローグ終了]

[人物 画像= マリえっ  名前= 貫井マリ]
梶野に友達がいないだなんて……[n]
あたし、何で気が付かなかったんだろう……[next]

[自分]
そ、そっか、貫井さんでも知らなかったのか……[next]
[人物 画像= マリ真面目  名前= 貫井マリ]
……確かにあたしと梶野は中学の時から話す機会も多かった。[next]

でも、梶野の見た目のかっこよさ目当てで集まってくる[n]
女子たちと同じだと思われたくなくて[n]
だんだん話しかけにいくことがなくなっていったんだよね。[next]
[表情 画像=マリはあ]
だけど、梶野の寂しさに気が付けなかったんだから[n]
取り巻きの女子達とあたしも何にも変わらないよ……[next]
[表情 画像=マリ悲しい]
[モノローグ]
貫井さんはとても落ち込んでいるようだ。[n]
どうにかして励まさないと……[next]
[モノローグ終了]
[表情 画像=マリうーん]
[自分]
そんなことないよ……！！[n]
だって、貫井さんは他の女子達が[n]
梶野の見た目だけが目当てだって気が付いてたんだよね？[next]

[人物 画像= マリえっ  名前= 貫井マリ]
そ、そうだけど……[next]
[表情 画像=マリ真面目]
[自分]
だったら貫井さんはちゃんと[n]
梶野のことを見てたってことなんじゃないかな。[n]
そのことを梶野に伝えればいいと俺は思うよ。[next]

[人物 画像= マリ哀愁の笑み  名前= 貫井マリ]
あたし……梶野の力になれるかな……[next]
[表情 画像=マリ決意]
…[間]…[間]…[間]…[間][next]
[表情 画像=マリよし]
……うん、あたし、梶野のところに行ってくるね。[next]

[人物消去]

[モノローグ]
貫井さんはどこかへ行ってしまった。[n]
俺も後を追いかける。[next]
[モノローグ終了]

[場面転換]
[背景屋上]
[枠]

[人物左 画像= マリ  名前= 貫井マリ]
[人物右 画像= カケル  名前= 梶野カケル]

[モノローグ]
やっと二人を見つけた。[n]
俺はこっそり様子を伺う。[next]
[モノローグ終了]

[人物左 画像= マリ真面目  名前= 貫井マリ]
小金井から……聞いたよ？[next]

[人物右 画像= カケルしゃべる  名前= 梶野カケル]
何を聞いたか知らないけど、オレは別に……[next]

[人物左 画像= マリはあ  名前= 貫井マリ]
梶野はあたしが悩んでることに気が付いてくれた。[n]
なのに、あたしは……[next]

[人物右 画像= カケルななんだよ  名前= 梶野カケル]
貫井が気にすることじゃないだろ。[n]
オレはお前が思っているような人間じゃない。[next]

[人物左 画像= マリえっ  名前= 貫井マリ]
梶野は……それでいいの？[next]

[人物右 画像= カケル  名前= 梶野カケル]
男子から嫌われることにも、もう慣れた。[n]
だから……[next]

[人物左 画像= マリ必死  名前= 貫井マリ]
そんな寂しそうな顔して言わないで！[next]

[人物右 画像= カケルえっ  名前= 梶野カケル]
…………！！[next]

[人物左 画像= マリ哀愁の笑み  名前= 貫井マリ]
梶野にそんな気はなかったかもしれないけど[n]
「部長になってもいいんじゃないか」って背中を押してもらって[n]
あたしはとても嬉しかった。[next]
[表情左 画像=マリ真面目]
今度はあたしが梶野の力になりたい。[n]
あたしじゃダメかな……？[next]

[人物右 画像= カケルふっ  名前= 梶野カケル]
貫井……ありがとう。[next]

[人物全消去]

[種入手 名前=カケルとマリの密会 詳細=マリはカケルの力になると誓った]
[足跡 名前=カケルとマリの密会][return]
[自分]
[モノローグ]
貫井さんは梶野の相談に乗るつもりのようだ。[n]
そして梶野も満更でもなさそう。[next]

だけど、梶野を「寂しい人」だって言ってた美園さんは[n]
どう思うんだろう……[next]

[モノローグ終了]
[return]
*カケルは友達がいない2

*カケルとミドリの破局
[足跡デバッグ 名前=カケルとミドリの破局]
[jump target=*カケルとミドリの破局2 cond="!足跡('カケルとミドリの破局')"]
[jump target=*カケルとミドリの破局2 cond="足跡('マリの告白')"]
[eval exp="種がある = 1" cond="findSeed('カケルとミドリの破局') >= 0"]
[マリなにしてる]
[種分岐 ア=カケルとミドリの破局 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*カケルとミドリの破局2"][endif]
*本文
[モノローグ終了]
※シナリオ：カケルとミドリの破局[n]
マリが告白するイベント[next]
[足跡 名前=マリの告白]
[return]
*カケルとミドリの破局2

*マリが付き合ったらしたいこと
[足跡デバッグ 名前=マリが付き合ったらしたいこと]
[jump target=*マリが付き合ったらしたいこと2 cond="!足跡('マリが付き合ったらしたいこと')"]
[jump target=*マリが付き合ったらしたいこと2 cond="足跡('遊園地に行こう')"]
[eval exp="種がある = 1" cond="findSeed('マリが付き合ったらしたいこと') >= 0"]
[マリなにしてる]
[種分岐 ア=マリが付き合ったらしたいこと イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*マリが付き合ったらしたいこと2"][endif]
*本文
;----------↓ここから↓----------
※シナリオ：マリが付き合ったらしたいこと[n]
デートの予定が入る[next]
;----------↑ここまで↑----------
[eval exp="f.マリデート = 2"]
[種入手 名前=遊園地に行こう 詳細=マリと遊園地でデートすることになった 期限=1]
[足跡 名前=遊園地に行こう]
[return]
*マリが付き合ったらしたいこと2

これ以上会話はないみたい。
[if exp="種がある || f.マリ参加 || f.マリ招集 || f.マリ不参加"]
	[next]
[else]
	[eval exp="var 呼ぶ = '放課後の文化祭準備に呼ぶ (' + 招集消費 + ')'"]
	[二択 ア=&呼ぶ イ=呼ばない]
	[jump target="*強制招集" cond=ア]
[endif]
[cm]
[jump target="*雑談"]

*文化祭の買い出し
[枠]
;----------↓ここから↓----------
※シナリオ：文化祭の買い出し行く前[next]
;----------↑ここまで↑----------
[場面転換]
[背景 画像=文具店]
[枠]
;----------↓ここから↓----------
※シナリオ：文化祭の買い出しに行く[next]
;----------↑ここまで↑----------
[足跡 名前=文化祭の買い出し終了]
[場面転換]
[return]

*カズキと一緒に出かけよう
[場面転換]
[if exp=f.昼休み]
	[背景 画像=図書室昼]
	[BGM 曲=05日常.ogg 音量=50 ループ]
	[表情 画像=マリえっ]
[else]
	[背景 画像=図書室]
	[BGM 曲=夕暮れ.ogg 音量=50 ループ]
	[表情 画像=マリえっ]
[endif]
[枠]
;----------↓ここから↓----------
※シナリオ：カズキと一緒に出掛けよう[next]
;----------↑ここまで↑----------
[種入手 名前=マリが付き合ったらしたいこと 詳細=それって恋人とじゃなくてもできるのでは？]
[足跡 名前=マリが付き合ったらしたいこと]
[eval exp="f.マリデート = 1"]
[return]

*マリデート１
[場面転換]
[背景 画像=ショッピングモール]
[枠]
;----------↓ここから↓----------
※シナリオ：マリデート１[next]
;----------↑ここまで↑----------
[足跡 名前=マリデート１終了]
[eval exp="f.マリデート = 0"]
[return]

*マリデート２
[場面転換]
[背景 画像=遊園地3]
[枠]
;----------↓ここから↓----------
※シナリオ：マリデート２[next]
;----------↑ここまで↑----------
[eval exp="f.マリデート = 0"]
[足跡デバッグ 名前=また新しく作っていけばいい]
[種分岐 ア=また新しく作っていけばいい イ=そんなこと言われても困る 体力=&告白消費]
[if exp=ア]
	;----------↓ここから↓----------
	※マリを攻略[next]
	;----------↑ここまで↑----------
	[eval exp="f.マリ攻略 = 1"]
	[足跡 名前=マリ攻略]
[else]
	;----------↓ここから↓----------
	※マリとケンカ別れ[next]
	;----------↑ここまで↑----------
	[eval exp="f.マリけんか = 1"]
	[足跡 名前=マリけんか]
	[実績解除 名前=実績１７：仲たがい]
[endif]
[return]




*強制招集
[モノローグ終了]
[表情 画像=マリえっ]
[自分]
貫井さん、お願いがあるんだけど……[n]
放課後の文化祭準備をちょっと手伝って欲しいんだ！[next]
[人物 画像=マリはあ 名前=貫井マリ]
え？ どうしよう、この仕事明日までに間に合うかなあ……[next]
[モノローグ]
俺は粘り強く交渉した。[next]
[モノローグ終了]
[体力 変化=&招集消費]
[if exp="人員計算() > 7"]
	[人物 画像=マリ悲しい 名前=貫井マリ]
	……ごめん。ちょっと無理そう。[n]
	手伝ってくれるひと、いるんだよね？[next]
	[自分]
	あ、うん。そっか……[next]
	[return]
[endif]
[eval exp="f.マリ招集 = 1"]
[人物 画像=マリあちゃー 名前=貫井マリ]
まあ、少しくらいなら手伝っても大丈夫だと思う！[next]
[自分]
よかった。ありがとう貫井さん！[next]
[人物消去]
[メッセージ]
次の放課後準備に、貫井マリが手伝いに来てくれることになった。[next]
[return]

*マリけんか
[マリなにしてる]
[人物 画像=マリえっ 名前=貫井マリ]
！！[next]
[人物 画像=マリ悲しい 名前=貫井マリ]
…………。[next]
[人物消去]
[自分]
ああ……。[next]
[モノローグ]
仕方ないよな……。[next]
[モノローグ終了]
[return]
