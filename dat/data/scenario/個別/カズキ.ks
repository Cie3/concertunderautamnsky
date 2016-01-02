[jump target= "*23" cond="f.日==23 && f.放課後"]
[jump target="*1" cond="f.日 == 1 && f.放課後"]
[macro name=カズキなにしてる]
[nowait]
[if exp=f.昼休み]
	カズキが弁当を食っている。
[else]
	カズキが廊下で待っている。
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
[表情 画像=カズキ]
[モノローグ]

;種があると、強制招集が使えません。
[eval exp="var 種がある = 0;"]

*種開始

*マリは責任感が強い
[足跡デバッグ 名前=マリは責任感が強い]
[jump target="*マリは責任感が強い2" cond="!足跡('マリは責任感が強い') || 足跡('マリは部活で悩んでる？')"]
[eval exp="種がある = 1" cond="findSeed('マリは責任感が強い') >= 0"]
[カズキなにしてる]
[種分岐 ア=マリは責任感が強い イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*マリは責任感が強い2"][endif]

そういえばカズキは男子テニス部のキャプテンだ。[n]
女子テニス部の貫井さんのことを何か知っているかもしれない。[next]
[モノローグ終了]

[自分]
なあ、貫井さんってかなり責任感が強いんだな。[n]
部長になったんだから誰よりもテニスが上手くないと[n]
いけないんだって言っていたよ。[next]

[人物  画像=  カズキうーん  名前=  国分寺カズキ]
え、ああ、貫井か……うーん。[next]

[自分]
何かあるのか？[next]

[人物  画像=  カズキ残念  名前=  国分寺カズキ]
実はここだけの話、あんまり貫井って評判良くねぇんだよなぁー……[next]

[自分]
え！？  あんなに頑張ってるみたいなのに！？[next]

[人物  画像=  カズキへえ  名前=  国分寺カズキ]
男子と女子って別々に練習しているから[n]
俺も詳しくないんだけどさ。[next]

女子テニス部の一年生から話を聞くと[n]
「なんで貫井先輩が部長なんだろう？」って言うんだよ。[next]

真面目でテニスも上手いのに、なんでそう思われてるのか[n]
俺もよくわからねぇけど[next]

とりあえず「頼りない部長」って声はよく聞くな。[next]
[表情 画像=カズキ]
[自分]
そ、そうなのか……[n]
クラスだと運動できる元気な女子ってイメージあるから意外だったな。[next]

[人物  画像=  カズキしゃべる  名前=  国分寺カズキ]
そんなに気になるなら[n]
本人に部活関係で悩みとかないか聞いてみたらいいんじゃねえの？[next]
[表情 画像=カズキ]
[自分]
ああ、少し考えてみるよ、ありがとな。[next]

[人物  画像=  カズキしゃべる  名前=  国分寺カズキ]
[if exp=f.昼休み]おう！ じゃあオレ、行くな！[next]
[else]さ、下駄箱行くぞ。[next]
[endif]
[人物消去]

[種入手 名前=マリは部活で悩んでる？ 詳細=マリはテニス部の中で評判が良くないとカズキが言っていた]
[足跡 名前=マリは部活で悩んでる？]
[モノローグ]
カズキが言った通り、[n]
貫井さん本人に少し話を聞いてみてもいいかもしれないな。[next]
[モノローグ終了]

[return]
*マリは責任感が強い2

*マリのうまくいかない毎日
[足跡デバッグ 名前=マリのうまくいかない毎日]
[jump target="*マリのうまくいかない毎日2" cond="!足跡('マリのうまくいかない毎日') || 足跡('前原先生はテニス部顧問')"]
[eval exp="種がある = 1" cond="findSeed('マリのうまくいかない毎日') >= 0"]
[カズキなにしてる]
[種分岐 ア=マリのうまくいかない毎日 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*マリのうまくいかない毎日2"][endif]
*本文
[モノローグ終了]
[自分]
この前、貫井さんと話をしたんだ。[next]

[人物 画像= カズキしゃべる  名前= 国分寺カズキ]
へえ、どうだったんだ？[next]
[表情 画像=カズキ]

[自分]
それが……[next]

[モノローグ]
俺は、貫井さんが悩んでいることをカズキに話した。[next]

中学時代、副部長だったけれどうまくいかなかったこと、[n]
今度こそと思って高校では部長になったけどやっぱりダメなこと。[next]

だから練習に打ち込んでいるということ……[next]

[モノローグ終了]

[人物 画像= カズキへえ  名前= 国分寺カズキ]
……そっか、そんなことを悩んでたんだな。[next]
[表情 画像=カズキ]

[自分]
俺、貫井さんに何も言ってあげられなかったんだ。[n]
どうしたら貫井さんの力になれるんだろう……[next]

[人物 画像= カズキうーん  名前= 国分寺カズキ]
うーん……[next]

[表情 画像=カズキしゃべる]
そうだ、前原先生に聞けば？[next]
[表情 画像=カズキ]

[自分]
えっ、なんで前原先生！？[n]
確かにうちのクラスの担任だけど……[next]

[人物 画像= カズキ  名前= 国分寺カズキ]
前原先生ってさ、テニス部の顧問もしてるんだよ。[n]
貫井と話してるのもよく見かけるし。[next]

[自分]
そういえばそうだった！[n]
……でも、俺がいきなり貫井さんのことを聞いたら[n]
変な風に思われないか？[next]

[人物 画像= カズキ  名前= 国分寺カズキ]
文化祭を成功させたいか、みんなに作業に来てほしいんだろ？[n]
その相談も兼ねて聞いてみればいいんじゃないか。[next]

[モノローグ]
そうだ、俺は文化祭のクラス実行委員になったんだ。[n]
みんなで協力して文化祭を成功させたい。[n]
貫井さんにも来てほしいんだ。[next]
[モノローグ終了]
[表情 画像=カズキ]

[自分]
うん、そうするよ。[n]
ありがとな、カズキ。[next]

[人物 画像= カズキにこ  名前= 国分寺カズキ]
ああ、頑張れよ！[next]

[人物消去]

[種入手    名前=前原先生はテニス部顧問    詳細=  貫井さんのことで相談できるかもしれない]
[足跡 名前=前原先生はテニス部顧問]

[モノローグ]

さっそく前原先生に貫井さんのことを聞いてみよう。[n]
文化祭成功のヒントももらえるかもしれない。[next]

[モノローグ終了]
[return]
*マリのうまくいかない毎日2

*マリの恋心
[足跡デバッグ 名前=マリの恋心]
[jump target="*マリの恋心2" cond="!足跡('マリの恋心') || 足跡('マリけんか')"]
[eval exp="種がある = 1" cond="findSeed('マリの恋心') >= 0"]
[カズキなにしてる]
[種分岐 ア=マリの恋心 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*マリの恋心2"][endif]
*本文
貫井さんは梶野が好きだけど、その気持ちを伝えられない……[next]

部活も恋愛もうまくいっていないけど、[n]
カズキなら、何か知っていることがあるかもしれない。[next]
[モノローグ終了]

[自分]
なあ、カズキ。[n]
恋愛の相談なんだけど……[next]

[人物 画像=カズキへえ 名前=国分寺カズキ]
…………。[next]

[表情 画像=カズキにこ]
ふ〜ん。[next]

[自分]
いや、俺じゃないよ。[next]

[人物 画像=カズキ残念 名前=国分寺カズキ]
なんだよ。[next]
[表情 画像=カズキしゃべる]
で、誰なの？ オレの知ってる人？[next]

[自分]
……ここじゃなんだし、場所を変えよう。[next]

[場面転換]
[if exp="f.昼休み"][背景 画像=階段昼]
[else][背景 画像=階段夕方]
[endif]
[表情 画像=カズキ]
[枠]
[自分]
まあ、貫井さんの恋愛についてなんだけど……[n]
あの子が、なんだか悩んでるみたいなんだよね。[next]

[人物 画像=カズキへえ 名前=国分寺カズキ]
へえ……。貫井がねえ。[n]
どんな風に？[next]

[自分]
同じクラスに梶野ってやつがいてさ……[next]

[人物 画像=カズキうーん 名前=国分寺カズキ]
ああ、あいつか……[next]
[表情 画像=カズキへえ]
[人物左遠い 画像=マリよし 名前=貫井マリ]
[BGM停止]
…………。[next]
[表情左遠い 画像=マリうーん]
…………。[next]
[人物左消去]

[モノローグ]
まずいことになった。[next]
[モノローグ終了]

[自分]
俺……行ってくる！[next]

[人物 画像=カズキうーん 名前=国分寺カズキ]
ああ。[next]

[場面転換]
[if exp="f.昼休み"][背景 画像=廊下]
[else][背景 画像=廊下夕方]
[endif]
[BGM 曲=piano2-悲しい.ogg 音量=50 ループ=0]
[枠]
[表情 画像=マリうーん]
[自分]
……ごめん。[next]
[人物 画像=マリはあ 名前=貫井マリ]
あたしがバカだったよ。[n]
[姓]って、そういうヤツだったんだね……[next]

[自分]
こ、これは……[n]
貫井さんのために、何かできないかと思って……[next]

[if exp="足跡('カケルとミドリの破局')"]
	ほら、梶野っていま誰とも付き合ってないし。[next]
[endif]

[人物 画像=マリ悲しい 名前=貫井マリ]
…………。[next]

[表情 画像=マリ必死]
何もできないよ！[n]
[姓]には何もできない……！[next]

あたし、明日からクラスの人にどんな顔すればいいの？[n]
梶野にも……美園さんにも……[next]
[表情 画像=マリもう知らない]
もう、今までみたいにはできないよ……[next]
[人物消去]

[モノローグ]
そう言うと、貫井さんは足早に立ち去ってしまった。[next]

もう、貫井さんは、口をきいてくれないのかな……。[next]
[モノローグ終了]

[不参加 名前=マリ]
[実績解除 名前=実績１３：守秘義務違反]
[足跡 名前=マリけんか]
[eval exp="f.マリけんか = 1"]
[eval exp="f.マリ栄養ドリンク = 1"]
[return]
*マリの恋心2

*動物園に行こう
[足跡デバッグ 名前=動物園に行こう]
[jump target="*動物園に行こう2" cond="!足跡('動物園に行こう') || 足跡('自分の方こそ……')"]
[eval exp="種がある = 1" cond="findSeed('動物園に行こう') >= 0"]
[カズキなにしてる]
[種分岐 ア=動物園に行こう イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*動物園に行こう2"][endif]
*本文
;----------↓ここから↓----------シナリオ未完
※シナリオ：動物園に行こう（カレン恋愛７）[n]
【しえ企画 割り当て】浅葱[next]
;----------↑ここまで↑----------
[足跡 名前=自分の方こそ……]
[種入手 名前=自分の方こそ…… 詳細=気づかうだけじゃなくて自分の方こそ楽しまなきゃね、とカズキは言った 期限=1]
[return]
*動物園に行こう2

*雑談
[eval exp="var 他の話題 = 種がある ? '何か他の話題は……' : ''"]
[カズキなにしてる]
[if exp="種がある"]
	[eval exp="var 強制招集 = ''"]
[else]
	[eval exp="var 強制招集 = '放課後の文化祭準備に呼ぶ（0)'"]
[endif]
[三択 ア=雑談する イ=&強制招集 ウ=&他の話題]
[if exp="イ"]
	[jump target="*強制招集"]
[elsif exp="ウ"]
	[jump target="*雑談2"]
[endif]
[人物 名前=国分寺カズキ 画像=カズキ]
とりとめのない会話が入ります。[next]
[人物消去]
[枠消去]
[return]
*雑談2

[jump target="*種開始"]

*23
[場面転換]
[背景 画像= 通学路夕方]
[枠]
[人物 画像= カズキにこ  名前= 国分寺カズキ]
おーい、[名]ー！ [カラス]帰るぞ！[next]
[表情 画像=カズキ]

[モノローグ]
こいつは国分寺カズキ、[n]
中学時代からの友達で一年生の時は同じクラスだった。[n]
今は違うクラスだけど俺の一番の友達だ。[next]
[モノローグ終了]

[人物 画像= カズキにこ  名前= 国分寺カズキ]
帰ったらあとでネトゲしようぜ？[n]
俺、お前がいないと今月のクエスト全然ダメなんだよ〜[next]
[表情 画像= カズキうーん]

[自分]
お前、パーティー構成も考えずに前衛に出るからだろ？[next]

[モノローグ]
毎晩、俺とネトゲをしているが[n]
実は男子テニス部のキャプテンだったりする。[n]
人は見かけによらないとは、よく言ったものだ。[next]
[モノローグ終了]

[人物 画像= カズキしゃべる  名前= 国分寺カズキ]
そう言えば、明日のホームルームって[n]
全クラス文化祭の委員とクラス出し物決めだったよな？

[種分岐 ア= カレンが立候補 イ= 「そうだな」]
[表情 画像=カズキ]
[if exp= ア]
	[自分]
	こっちのクラスは、立候補しそうな人がいたよ。[n]
	学級委員の子なんだけどさ……[next]
	[人物 画像= カズキしゃべる  名前= 国分寺カズキ]
	へえ、[名]は何かやったりしないの？[n]
	サッカーやめてから暇そうにしてんなーって思って。[next]
	[表情 画像=カズキ]
	[自分]
	そうだな……[n]
	先生にも勧められたし、ちょっと悩んでる。[next]
	[人物 画像= カズキへえ  名前= 国分寺カズキ]
	ほー、先生に…… [間]そんなこともあるのか。[next]
	
	[表情 画像=カズキ残念]
	オレ、これから部活の強化月間でさ[n]
	帰ったらたぶん、疲れてすぐに寝るだろうし、[n]
	オンラインにはあんまり顔出せねーかもって感じなんだよ。[next]
	[人物 画像=カズキにこ 名前=国分寺カズキ]
	突撃バカのオレでも、いなきゃいないで寂しいだろ？[next]
	[自分]
	……はいはい。[next]
	[人物 画像= カズキしゃべる  名前= 国分寺カズキ]
	どうせ暇なんだったら、やってみてもいいんじゃねーの？[n]
	やって後悔するよりナントカ……ってやつ。[next]
	[表情 画像=カズキ]
	[自分]
	「やらずに後悔するより、やって後悔したほうがいい」だろ。[n]
	まあ、明日まで考えてみるか。[next]

	そういえば、そっちのクラスの出し物とか、何か考えてたりする？[next]
[else]
	[自分]
	そうだな。[間]そっちのクラスはどんな感じ？[next]
[endif]

[人物 画像=カズキにこ 名前=国分寺カズキ]
オレ、全然考えてなかったぜ！[n]
何になるんだろうなぁ。[next]
[人物消去]
[枠消去]
[SE停止]
[足跡 名前=カズキと話す]

[return]

*1
[場面転換]
[背景 画像= 通学路夕方]
[枠]
[人物 画像= カズキにこ  名前= 国分寺カズキ]
おーい、[名]ー！ [カラス]そっちの調子はどうよ？[next]
[表情 画像=カズキ]
[自分]
けっこう頑張って準備したつもりだけど、どうなんだろう。[next]
なんだか、もう明日が文化祭本番だなんて[n]
実感がわかないんだよなあ。[next]
[人物 画像=カズキへえ 名前=国分寺カズキ]
もう二学期が始まって２ヵ月か……[n]
信じられねーよ。[next]
[表情 画像=カズキしゃべる]
文化祭やら強化練習やらで、もう本当にあっという間だな。[next]
[表情 画像=カズキにこ]
このまま高校生活が終わっちまう勢いだぜ！[next]
[表情 画像=カズキ]
[自分]
ははは……それは困るな。[next]
カズキのクラスは、たしか筋肉アトラクションだったよな。[next]
[人物 画像=カズキしゃべる 名前=国分寺カズキ]
ああ、かなり本格的肉体派アスレチックになってて、[n]
クラスの奴らも大盛り上がりだぞ？[next]
[表情 画像=カズキにこ]
今年の大賞は１組がいただきかもな！[next]
[表情 画像=カズキ]
[自分]
カズキも受付とか部活とかの合間に、喫茶店に遊びに来たら？[n]
ドリンクもあるし、いい感じに休めると思うんだ。[next]
俺はたぶん、厨房かウェイターの足りない方に入ってるから[n]
カズキの相手できるかわかんないけど。[next]
[表情 画像=カズキしゃべる]
へえ、[名]、大活躍じゃん。[n]
じゃあ２組にお邪魔しようかな！[next]
[表情 画像=カズキにこ]
[自分]
おう。じゃあ、また明日！[next]
[return]

*強制招集
[モノローグ終了]
[自分]
カズキ、お願いがあるんだけど……[n]
放課後の文化祭準備をちょっと手伝って欲しいんだ！[next]
[人物 画像=カズキ残念 名前=国分寺カズキ]
何言ってんだよ……[next]
[表情 画像=カズキへえ]
オレにそんな時間あったら、自分とこのクラス手伝えって[n]
言われるに決まってんだろ。[next]
[自分]
そりゃそうだ……[next]
[人物 画像=カズキにこ 名前=国分寺カズキ]
そんなわけで文化祭当日は、２年１組の[n]
筋肉アトラクション『ＹＯ☆ＳＡ☆ＫＵ』[n]
よろしくなっ！[next]
[自分]
（まあ、カズキは無理だよなあ……）[next]
[return]
