[jump target="*22レクチャー" cond="f.日==22 && f.放課後"]
[jump target="*カレンデート１" cond="f.カレンデート == 1 && f.曜日 == '週末'"]
[jump target="*カレンデート２" cond="f.カレンデート == 2 && f.曜日 == '週末'"]

[足跡デバッグ 名前=カレンと放課後に会った]
[if exp="足跡('カレンと放課後に会った')"][足跡デバッグ 名前=また図書室で][endif]

[iscript]
var カレン図書室 = 0;// カレンと図書室で出会うフラグです。
//                      種[また図書室で][成績優秀！]を持っているまたは、
//                      カレンに放課後に会っていない場合は強制的に発動します。
//                      このファイル内で有効です。
if(!足跡('カレンと放課後に会った') || 足跡('また図書室で') || findSeed('成績優秀！')>=0) {
	if(f.放課後 && findSeed('イズミは頑固')==-1) {
		カレン図書室 = 1;
	}
}
[endscript]

[macro name=カレンなにしてる]
[nowait]
[if exp=f.昼休み]
	恋ヶ窪さんはノートを見直しているみたいだ。
[elsif exp=カレン図書室]
	恋ヶ窪さんは静かに何かを書いている。
[else]
	恋ヶ窪さんは文化祭の書類を作っているようだ。
[endif]
[endnowait]
[endmacro]

[場面転換]
[if exp=f.昼休み]
	[背景 画像=教室]
	[BGM 曲=05日常.ogg 音量=50 ループ]
[elsif exp=カレン図書室]
	[足跡 名前=カレンと放課後に会った]
	[背景 画像=図書室]
	[BGM 曲=夕暮れ.ogg 音量=50 ループ]
[else]
	[背景 画像=教室夕方]
	[BGM 曲=夕暮れ.ogg 音量=50 ループ]
[endif]
[枠]
[表情 画像=カレン真顔]
[モノローグ]

;種があると、強制招集が使えません。
[eval exp="var 種がある = 0;"]

;強制イベント
[jump target="*初回放課後" cond="カレン図書室 && !足跡('また図書室で')"]
[足跡デバッグ 名前=カレン１回目のデート終了]
[jump target="*カレン１回目のデート終了" cond="足跡('カレン１回目のデート終了') && !足跡('楽しく参加するには')"]
[足跡デバッグ 名前=カレンけんか]
[jump target="*カレンけんか" cond="足跡('カレンけんか')"]

*雑談
[カレンなにしてる]
[三択 ア=雑談する イ=何か他の話題は……]
[if exp=イ]
	[jump target="*雑談2"]
[endif]
[人物 名前=恋ヶ窪カレン 画像=カレン]
とりとめのない会話が入ります。[next]
[人物消去]
[枠消去]
[return]
*雑談2

*イズミは頑固
[足跡デバッグ 名前=イズミは頑固]
[jump target="*イズミは頑固2" cond="!足跡('イズミは頑固') || 足跡('イズミへの不満')"]
[eval exp="種がある = 1" cond="findSeed('イズミは頑固') >= 0"]
[カレンなにしてる]
[種分岐 ア=イズミは頑固 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*イズミは頑固2"][endif]
*本文
[モノローグ終了]
※シナリオ：イズミは頑固[next]
[種入手 名前=イズミへの不満 詳細=イズミは文句を言い過ぎだ、とカレンは言った]
[足跡 名前=イズミへの不満]
[return]
*イズミは頑固2

*イズミの不満
[足跡デバッグ 名前=イズミの不満]
[jump target="*イズミの不満2" cond="!足跡('イズミの不満') || 足跡('イズミ不参加')"]
[eval exp="種がある = 1" cond="findSeed('イズミの不満') >= 0"]
[カレンなにしてる]
[種分岐 ア=イズミの不満 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*イズミの不満2"][endif]
*本文
[モノローグ終了]
※シナリオ：イズミの不満[next]
[足跡 名前=イズミ不参加]
[不参加 名前=イズミ]
[eval exp="f.イズミ栄養ドリンク = 1"]
[実績解除 名前="実績１２：イズミの不信"]
[return]
*イズミの不満2

*人が集まらない休日準備
[足跡デバッグ 名前=人が集まらない休日準備]
[jump target="*人が集まらない休日準備2" cond="!足跡('人が集まらない休日準備') || 足跡('ちょっと思いつかないなあ') || f.日 < 15"]
[eval exp="種がある = 1" cond="findSeed('人が集まらない休日準備') >= 0"]
[カレンなにしてる]
[種分岐 ア=人が集まらない休日準備 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*人が集まらない休日準備2"][endif]
*本文
[モノローグ終了]
[自分]
この前の休日準備は、全然人が集まらなくてびっくりしたよ。[next]

[人物 画像=カレンうーん 名前=恋ヶ窪カレン]
そうね……[間] 私もクラスの人と話をしているのだけど[n]
部活が忙しいとかいろいろ理由があるみたいで……[next]

木曜日の放課後は文化祭準備のために時間が取られているし[n]
本当は、頑張れば時間を作れると思うのだけど。[next]

[表情 画像=カレン残念]
[姓]くん、何かいい考えはないかしら。[next]

[自分]
うーん……[n]
今は、ちょっと思いつかないなあ。ごめん。[next]

[人物 画像=カレン心配 名前=恋ヶ窪カレン]
そう……[n]
なにかあったら教えてね。[next]

[人物消去]

[モノローグ]
恋ヶ窪さんは、ふたたび書類作成を始めた。[next]
[モノローグ終了]
[足跡 名前=ちょっと思いつかないなあ]
[枠消去]
[return]
*人が集まらない休日準備2

*ミドリの戸惑い
[足跡デバッグ 名前=ミドリの戸惑い]
[jump target="*ミドリの戸惑い2" cond="!足跡('ミドリの戸惑い') || 足跡('ミドリの事情')"]
[eval exp="種がある = 1" cond="findSeed('ミドリの戸惑い') >= 0"]
[カレンなにしてる]
[種分岐 ア=ミドリの戸惑い イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*ミドリの戸惑い2"][endif]
*本文
[モノローグ終了]

[自分]
恋ヶ窪さん、美園さんが何か理由があって[n]
休日の作業に来られないみたいなんだけど[n]
何か知ってる？[next]

[人物 画像= カレン心配  名前= 恋ヶ窪カレン]
…………[next]

[自分]
恋ヶ窪さん？[next]

[人物 画像= カレン残念  名前= 恋ヶ窪カレン]
……ミドリは理由があるって言っていたの？[next]

[自分]
いや……[n]
でも何か言いたそうにしていたし、[n]
参加できるように頑張るって言ってたから……[next]

[人物 画像= カレンおこ  名前= 恋ヶ窪カレン]
わかってるわ。絶対に梶野くんのことに決まってる。[next]
[表情 画像=カレンむっ]

[自分]
か、梶野が、なんで……？[n]
確かに美園さんと付き合ってるって話は聞くけど。[next]

[人物 画像= カレンうーん  名前= 恋ヶ窪カレン]
私、一年生の時からミドリと同じクラスだったの。[n]
ミドリは入学当初から成績優秀で[n]
学年１位になることも多かった。[next]

[表情 画像=カレン残念]
でも、梶野くんと付き合ってから全部変わってしまったわ。[n]
学校の休み時間も休日もずっと梶野くんのことばかり。[n]
私と一緒に勉強することもなくなってしまって……[next]

[表情 画像=カレンおこ]
それなのに梶野くんは、ミドリが塾に行っている時間は[n]
他の女の子と遊びに行ってしまうのよ。[next]

[表情 画像=カレンうーん]
どうせ休日来られない理由も[n]
梶野くんと一緒にいないといけないって思ってるからに[n]
決まってるじゃない……[next]
[表情 画像=カレンむっ]

[モノローグ]
恋ヶ窪さんはとても腹立たしく思っているようだ。[next]

ちょっとこの問題は複雑そうだ……[n]
恋ヶ窪さんの思いはわかったけど[n]
美園さんが考えていることはわからないし。[next]

[BGM停止 時間=3000]

その時だ。[next]
[モノローグ終了]

[表情右遠い 画像= ミドリめそらし]

[モノローグ]
美園さんがちょうど側を通りかかった。[next]
[モノローグ終了]
[人物右消去]

[人物 画像= カレンねえ  名前= 恋ヶ窪カレン]
あ、ミドリ……！！[next]

[表情 画像= カレンむっ]
いい機会だわ、ミドリに話をしましょう！[next]

[自分]
え、本当に！？[n]
ちょっと、恋ヶ窪さん、待って！[next]

[人物消去]

[モノローグ]
恋ヶ窪さんは美園さんを追いかけていってしまった。[n]
俺も慌てて追いかける。[next]
[モノローグ終了]

[場面転換]
[if exp=f.昼休み]
	[背景 画像=廊下]
[else]
	[背景 画像=廊下夕方]
[endif]
[枠]

[表情右 画像= ミドリうーん  名前= 美園ミドリ]
[人物左 画像= カレンむっ  名前= 恋ヶ窪カレン]
ミドリ、ちょっといい？[next]

[人物右 画像= ミドリぎくっ  名前= 美園ミドリ]
どうしたの、カレン？[next]

[モノローグ]
俺が追い付いた時、恋ヶ窪さんと美園さんは向かい合っていた。[n]
恋ヶ窪さんの表情はかなり真剣で俺もドキリとする。[next]
[モノローグ終了]
[表情右 画像=ミドリうーん]

[人物左 画像= カレンねえ  名前= 恋ヶ窪カレン]
私、ミドリ[BGM 曲=piano2-悲しい.ogg 音量=50]が本格喫茶という案を出してくれて嬉しかったの。[n]
去年、ふたりで喫茶店やりたいって話をしていたから……[next]

[表情左 画像=カレン哀愁]
あのとき、一緒にカフェの名前も考えたよね？[next]

[表情左 画像=カレン心配]
……ミドリ、どうして休日の作業に来ないの？[next]

[人物右 画像= ミドリぎくっ  名前= 美園ミドリ]
そ、それは……[next]

[人物左 画像= カレン残念  名前= 恋ヶ窪カレン]
梶野くんが来ないから、でしょう？[next]

[人物右 画像= ミドリそれが  名前= 美園ミドリ]
…………[next]
[表情右 画像=ミドリめそらし]

[人物左 画像= カレンうーん  名前= 恋ヶ窪カレン]
梶野くんと付き合い出してから話すことは梶野くんのことばかり。[n]
休み時間も放課後も休日もずっと梶野くんと一緒にいて……[next]

一緒に文化祭で喫茶店やろうって約束したのに……[next]

[表情左 画像=カレンむっ]
[人物右 画像= ミドリ黙る  名前= 美園ミドリ]
カレン、ごめんなさい……[n]
でも、私……やっぱり……[next]

[人物左 画像= カレンおこ  名前= 恋ヶ窪カレン]
……もう、ミドリなんて知らない……！！[next]

[人物左消去]

[人物右 画像= ミドリじわぁ  名前= 美園ミドリ]
カレン……[next]

[モノローグ]
恋ヶ窪さんはそう言うと美園さんの前から去って行ってしまった。[next]
[人物右消去]

恋ヶ窪さんはああ言っていたけど[n]
美園さんはどう思っているんだろう。[next]

[種入手    名前= ミドリの事情   詳細= ミドリは梶野のことが理由で来られない……？ ]
[足跡 名前=ミドリの事情]
[モノローグ終了]

[枠消去]
[return]
*ミドリの戸惑い2

*マユの趣味はコスプレ？
[足跡デバッグ 名前=マユの趣味はコスプレ？]
[jump target="*マユの趣味はコスプレ？2" cond="!足跡('マユの趣味はコスプレ？') || 足跡('カレンの本音')"]
[eval exp="種がある = 1" cond="findSeed('マユの趣味はコスプレ') >= 0"]
[カレンなにしてる]
[種分岐 ア=マユの趣味はコスプレ？ イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*マユの趣味はコスプレ？2"][endif]
*本文
恋ヶ窪さんと、文化祭に必要な道具の洗い出しをすることになった。[next]

その時ふと、桜さんとの会話を思い出した。[next]
[モノローグ終了]

[自分]
そういえば、このまえ桜さんと話してさ。[next]
[人物 画像=カレンねえ 名前=恋ヶ窪カレン]
そうなの、珍しいわね。[next]
[表情 画像=カレン]
[自分]
それで気づいたんだけど、ウェイトレスの[n]
衣装をどうしようかな……って思って。[next]

ちょっと調べてみたんだけど、[n]
俺には決められそうにないから、相談したいんだ。[next]
[モノローグ]
書類を出そうとしたときに、[n]
何かペラリと一枚の写真が飛び出して、[n]
恋ヶ窪さんの[ぺらり]足元にすべりこんだ。[next]
[表情 画像=カレンねえ]
[BGM停止]ん？[ま] まさか……[n]
アレは、[ま]桜さんの……[next]
コスプレ[SE 音=ガーン.ogg 音量=50 buf=2]写真！[next]
[モノローグ終了]
[人物 画像=カレン発言 名前=恋ヶ窪カレン]
あら。何かしら。[next]
[BGM 曲=やらかした.ogg 音量=50]
[モノローグ]
こんな写真を持っていることが恋ヶ窪さんに知られたら[n]
たぶんまずい。いや、確実にまずい……[next]

いかがわしい写真というわけじゃないんだけど、[n]
所持しているだけでまずい代物だ。[next]

俺が慌てている間に、[n]
恋ヶ窪さんは写真をひろいあげてしまった……。[next]
[モノローグ終了]
[表情 画像=カレンびっくり]
[自分]
これは……えっと、なんというか。[next]
[人物 画像=カレンびっくり 名前=恋ヶ窪カレン]
[姓]くん？[next]
[自分]
はい。[next]
[人物 画像=カレンびっくり 名前=恋ヶ窪カレン]
この写真、桜さんの……[next]
[自分]
手作りの衣装らしいです。[next]
[モノローグ]
終わったな。[BGM停止][next]
[モノローグ終了]
[人物 画像=カレンびっくり 名前=恋ヶ窪カレン]
…[ま]…[ま]…[ま]…[ま]…[ま]…[next]
[表情 画像=カレンかああ]
……[BGM 曲=文化祭準備01.ogg 音量=50]か、可愛いいぃー！[next]
[自分]
！？[next]
[人物 画像=カレンにこ 名前=恋ヶ窪カレン]
すごくいいわね！ このお洋服！[next]

色合いが可愛らしいし、[n]
フリルも過剰になりすぎずうまく使われてる！[n]
ひょっとしてこれ全部、桜さんが自分で作ったの！？[next]

[自分]
え？ あ、た、確かそうだったと思うよ？[next]
[人物 画像=カレンびっくり 名前=恋ヶ窪カレン]
すごいわね……。[next]

こういう可愛いものを作れちゃう上に、着ても似合うなんて[n]
桜さん羨ましいわ……。[next]
[自分]
そ、そっか。[n]
俺はよく分かんないや……。[n]
（助かった……？）[next]

[人物 画像=カレン発言 名前=恋ヶ窪カレン]
こんなに素敵な才能を持っているんだったら[n]
参加してくれればいいのにね……。[next]

[自分]
文化祭に？[next]
[人物 画像=カレン心配 名前=恋ヶ窪カレン]
まあ、私が言っても来てくれるわけないけれど。[next]
[自分]
……言ってみたら？[next]
[人物 画像=カレンねえ 名前=恋ヶ窪カレン]
え？[next]
[表情 画像=カレン真顔]
[自分]
桜さんにそのこと伝えてみたら？[n]
きっと喜ぶと思うよ。[next]

それに、今の恋ヶ窪さん、すっごく楽しそうだった。[next]

こんなに楽しそうな人に頼まれるなら、桜さんだって[n]
来てみようかなって、思ってくれるんじゃないかな？[next]
[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
[姓]くん、ありがとう。[next]
[表情 画像=カレン哀愁]
でも、いいのよ。[next]

来てほしいのは山々だけど……[n]
私には、上手な言い方が分からない。[next]
[表情 画像=カレン残念]
来る気をなくされちゃったら、って思うと……ね。[next]

[自分]
…………。[next]

[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
それより、ウェイトレスの衣装の件よね！[n]
大丈夫、私が考えてくるわ！[n]
こういうのは好きだから。[next]
[表情 画像=カレン]
[自分]
う、うん。[n]
じゃあ、お願いするよ。[next]

[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
分かったわ。[n]
じゃあね、[姓]くん。[next]
[人物消去]
[モノローグ]
恋ヶ窪さんは、さっさと教室を出て行ってしまった。[n]
……その後ろ姿は、どことなく寂しそうに見えた。[next]
[モノローグ終了]

[種入手 名前=カレンの本音 詳細=カレンはマユに、本当は参加してほしいと思っている]
[足跡 名前=カレンの本音]
[自分]
（恋ヶ窪さんなりに、みんなのことを気にしていたんだ）[next]

（でも、せっかく誰かと仲良くなれそうなのに[n]
　諦めるのはもったいないな。[n]
　桜さんに伝えられたらいいのに……）[next]
　
（本多さんなら伝えてくれたりしないかな）[next]
[return]
*マユの趣味はコスプレ？2

*また図書室で
;このセクションでは、恋愛ルートの振り分けを行っています。
;恋愛ルートに突入していない場合は発生しません。
[足跡デバッグ 名前=また図書室で]
[jump target= "*また図書室で2" cond="!足跡('また図書室で')"]
;恋愛ルートは、放課後にしか発生しません。
[jump target= "*また図書室で2" cond="f.昼休み"]
;デートの予定が入ると、終わるまで、それ以上は進展しません。
[jump target="*また図書室で2" cond="f.カレンデート != 0"]
;ルートを完遂した場合は発生しません。
[jump target="*また図書室で2" cond="足跡('遊園地に行こう')"]
[eval exp="種がある = 1" cond="findSeed('また図書室で') >= 0"]
[カレンなにしてる]
[種分岐 ア=また図書室で イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*また図書室で2"][endif]
*本文
[足跡デバッグ 名前=カレンの恋愛観]
[jump target="*カレンの恋愛観" cond="!足跡('カレンの恋愛観')"]
[足跡デバッグ 名前=熱意のすれちがい]
[jump target="*熱意のすれちがい" cond="!足跡('熱意のすれちがい')"]
[jump target="*和菓子屋とペットのこと"]
*また図書室で2

これ以上会話はないみたい。
[if exp="種がある"]
	[next]
[else]
	[eval exp="var 呼ぶ = '放課後の準備に呼んでもらう (' + 招集消費 + ')'"]
	[二択 ア=&呼ぶ イ=呼ばない]
	[jump target="*強制招集" cond=ア]
[endif]
[cm]
[jump target="*雑談"]

*22レクチャー
[場面転換]
[背景 画像=教室夕方]
[枠]
[人物 画像= カレン発言  名前= 恋ヶ窪カレン]
みんな、帰ってしまったわね。[n]
私達も帰りましょうか。[next]

[表情 画像=カレン真顔]

[自分]
うん、恋ヶ窪さんはバス通学だっけ？[next]

[人物 画像= カレンしゃべる  名前= 恋ヶ窪カレン]
ええ、学校から一番近くのバス停から乗るの。[next]
[表情 画像=カレン]

[自分]
じゃあ、途中の交差点まで一緒だな。[n]
俺の家、そっちの方なんだ。[next]

[人物消去]
[枠消去]
[背景 画像=黒]

[背景 画像= 通学路夕方]

[枠]
[人物 画像= カレンにこ  名前= 恋ヶ窪カレン]
クラス出し物、揉めるかと思ったけど[n]
案外[カラス]あっさり決まって良かったわ。[next]
[表情 画像=カレン]

[自分]
でも、小平が[n]
「書道の展示が良い」とか「休憩室はどうか」とか[n]
言い出した時はどうしようかと思ったよ。[next]

[人物 画像= カレン発言  名前= 恋ヶ窪カレン]
ええ、あれはちょっと……ね。[next]

[表情 画像=カレンしゃべる]
そうだ、[姓]くんはクラス実行委員初めてよね？[next]
[表情 画像=カレン]

[自分]
え、そうだけど……[next]

[人物 画像= カレンしゃべる  名前= 恋ヶ窪カレン]
私、一年生の時も実行委員をやっていたの。[n]
それでアドバイスなんだけど、[n]
いくつか覚えておいてほしいことがあるわ。[next]

まず、毎週木曜日の放課後はどのクラスも[n]
文化祭準備をすることになってること。[next]

[表情 画像=カレンうーん]
でも平日だけじゃ作業はあまり進まないのよね……[next]
[表情 画像=カレン心配]

[自分]
確かにそうだよな……[n]
じゃあ、週末にも集まったらいいんじゃないかな。[next]

[人物 画像= カレンねえ  名前= 恋ヶ窪カレン]

私もそれがいいと思う。[n]
毎年、休日も集まっていたクラスの方が[n]
良いクラス出し物になってるもの。[next]

さっそく今週末から休日も作業した方がいいかしら？[next]
[表情 画像=カレン真顔]

[自分]
うん、帰ったらクラスのみんなに連絡しておくよ。[next]

[人物 画像= カレンしゃべる  名前= 恋ヶ窪カレン]
ありがとう、よろしくね。[next]

じゃあ、私こっちだから……[n]
また明日ね。[next]

[表情 画像=カレンにこ]
[自分]
うん、また明日！[next]
[人物消去]
[実績解除 名前=実績０：クラス委員の心得]
[枠消去]
[return]

*初回放課後
[背景 画像=図書室]
学校の図書室に行くと、恋ヶ窪さんが勉強をしていた。[next]
[モノローグ終了]

[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
あら、小金井くん。ここで会うなんて珍しいわね。[next]
[表情 画像=カレン]
[自分]
ああ、たしかに珍しいかも。[n]
恋ヶ窪さん、勉強してるの？[next]

[人物 画像=カレンふふふ 名前=恋ヶ窪カレン]
ええ。ここは人もあまりいないし、[n]
お気に入りの場所っていうのかしら。[next]
[表情 画像=カレン哀愁]
……２年生になってから、自分の成績が少し気になるの。[next]
[表情 画像=カレン心配]
[自分]
気になるだなんて、[n]
成績上位者で貼り出されているくらいできるのに？[next]

[人物 画像=カレンねえ 名前=恋ヶ窪カレン]
できるからって勉強しないのは慢心よ。[n]
それに、最近、授業が頭に入らないって事が多くて……。[n]
文化祭のことが気になるのもあるのかしら。

[種分岐 ア=成績優秀！ イ=「俺とは違うなあ……」 体力=&シナリオ消費]
[if exp=イ]
	[表情 画像=カレン真顔]
	[自分]
	そうなんだ……[n]
	赤点じゃなくて喜んでるような俺とは、やっぱり違うんだなあ。[next]
	[モノローグ]
	勉強ができたら、もっと恋ヶ窪さんと話が合うのかな……[next]
	[モノローグ終了]
	[return]
[endif]
[表情 画像=カレン]
[自分]
せっかくだし、俺もちょっと勉強していこうかな。[n]
最近はノートもきちんと取ってるし、頑張ってるんだ。[next]

数学はまだ今までサボってたツケがきついけど。[next]

[人物 画像=カレンふふふ 名前=恋ヶ窪カレン]
ここでだれかと一緒に勉強するのって久しぶり……[next]
[表情 画像=カレンしゃべる]
はい、小金井君。数学のノート。[next]
[表情 画像=カレン]
[自分]
え？ いいの？[next]

[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
数学はけっこう好きなの。[next]
[表情 画像=カレンねえ]
その代わりといってはなんだけど、[n]
小金井君、英語か世界史は得意だったりする？[next]
[表情 画像=カレン]
[自分]
得意かどうかは微妙だけど、世界史のノートは取ってるよ。[n]
困ったときは、お互い様だね。[next]

[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
ありがとう、綺麗な字なのね。[next]
[表情 画像=カレン]
[自分]
え……そうかな？ いやいや、そうでもないよ。[next]

[モノローグ]
俺はどんな顔をすればいいのか分からなくて、[n]
借りたノートを適当に[ぺらり]ペラペラとめくった。[next]
[人物消去]
[背景 画像=恋ヶ窪ノート]
[モノローグ終了]
[メッセージ]
恋ヶ窪さんの数学のノートを見てみると、[n]
解法のポイントや公式のところに、[n]
可愛いキャラクターが描いてあった。[next]

とても堅い印象の彼女なだけに、意外だ。[next]

[自分]
この犬か猫みたいなキャラって何？[next]
[背景 画像=図書室]
[人物 画像=カレンかああ 名前=恋ヶ窪カレン]
あ！ ちょっとそれ、気にしないで。[next]

[自分]
恋ヶ窪さんが描いたの？[next]

[人物 画像=カレンややおこ 名前=恋ヶ窪カレン]
ん……まあ、そうなんだけど。[n]
あと、それネコじゃなくてオコジョのエルミちゃんだから。[next]

[自分]
そうなんだ、ごめん。[n]
女子のノート借りるのって俺、実は初めてで、[n]
なんか新鮮というか……[next]

[人物 画像=カレン哀愁 名前=恋ヶ窪カレン]
そうね。私も男の子のノートを借りるのは初めてよ。[n]
男の子なのに案外読める文字でびっくりしたわ。[next]
[表情 画像=カレン]
[自分]
読める文字……？[next]

そりゃ読めるよ。いや、読めない奴もいるけど。[n]
その先入観は一体どこから……[n]
（綺麗な文字って、読める文字ってことか）[next]

[人物 画像=カレン発言 名前=恋ヶ窪カレン]
うちのお父さんは文字が汚くて読めないし、[n]
みんなそうだと思っていたけど、言われてみればそうね。[next]

確かに、小平くんは真面目だし、丁寧な字を書きそう……。[next]
[表情 画像=カレン]
[自分]
ハハ……そうかもね。[next]

[モノローグ]
小平には一度ノートを見せてもらったことがあるが、[n]
字の崩し方が芸術的すぎて、それこそ読めたものではない。[next]
[モノローグ終了]

[人物 画像=カレンねえ 名前=恋ヶ窪カレン]
ねえ、小金井くん。[n]
このノートの「国際連盟の発足」のところで[n]
聞きたいところがあるのだけど教えてくれる？[next]

[自分]
ああ、いいよ。どこらへん？[next]

[モノローグ]
こうして、俺たち二人は下校時間まで勉強した。[next]
[モノローグ終了]

[場面転換]
[背景 画像=図書室]
[枠]

[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
あら、もうこんな時間。途中まで一緒に帰りましょう？[next]

[自分]
そうだね、行こうか。[next]

[場面転換]
[背景 画像=通学路夕方]
[枠]
[表情 画像=カレン]
[自分]
恋ヶ窪さんはどこ[カラス]までバスに乗るの？[next]

[人物 画像=カレン発言 名前=恋ヶ窪カレン]
時ヶ坂駅前よ。学校から20分くらい。[next]
[表情 画像=カレン真顔]
[自分]
へえ……いいなあ。近くに遊ぶところがたくさんあって便利だし。[next]

[人物 画像=カレンねえ 名前=恋ヶ窪カレン]
便利？ そんなに駅前っていいものかしら。[n]
学校に歩いて行けるあなたのお家のほうが便利じゃない？[next]
[表情 画像=カレン]
[自分]
まあ、学校との行き帰りだったら良いんだけど、[n]
気軽にゲーセンとか寄っていくには遠すぎるんだよなあ。[next]

[人物 画像=カレンねえ 名前=恋ヶ窪カレン]
ふうん、私は帰りにどこかに寄ったりとかはしたことないなあ。[n]
その……ゲームセンターって面白いのかしら？[next]
[表情 画像=カレン真顔]
[自分]
人それぞれだとは思うけど、[n]
ぬいぐるみとかのクレーンゲームは[n]
女の子も楽しめるんじゃないかな。[next]

[人物 画像=カレンねえ 名前=恋ヶ窪カレン]
そう……お金ってかかるの？[next]
[表情 画像=カレン真顔]
[自分]
取れそうなやつを見つけたら1000円くらいは使うかな。[n]
運がいいときは300円で取れたりとか……興味ある？[next]

[人物 画像=カレン発言 名前=恋ヶ窪カレン]
ううん、別に聞いてみただけよ。[next]
[表情 画像=カレン真顔]
[自分]
恋ヶ窪さんって、[n]
暇なときにどこか遊びに行ったりしないの？[next]

[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
そうね……暇なときはピアノを弾いたり[n]
音楽を聞いてることが多いかしら。[next]
[表情 画像=カレン発言]
どこかに遊びに行くことは少ないわね。たまに映画館とか。[next]
[表情 画像=カレンしゃべる]
小金井くんは暇なときはどうしてるの？[next]
[表情 画像=カレン]
[自分]
えっと、別のクラスのやつらと一緒に遊んでる。[next]

[人物 画像=カレンねえ 名前=恋ヶ窪カレン]
え、遊びに行くの？ 何をして？[next]
[表情 画像=カレン真顔]
[自分]
……ゲーム、かな。別に遊びに行くわけじゃないんだ。[n]
（正直にネトゲとは言いづらいな）[next]

[人物 画像=カレン発言 名前=恋ヶ窪カレン]
ゲームかあ……[n]
私、小さい頃やってみたいと思ったことがあったけど、[n]
お父さんが厳しくて買ってもらえなくて。[next]

小学校の時にお友達のお家でやったっきりで。[next]
[表情 画像=カレン]
[自分]
へえ、そうなんだ。[n]
まあ、ゲームにハマると時間が一気に消えるし、[n]
お父さんの気持ちも分からなくもないというか……[next]

[人物 画像=カレン哀愁 名前=恋ヶ窪カレン]
そう……[n]
でもね私、ピアノとか勉強とかじゃなくて、[n]
自分で一生懸命になれることを見つけなきゃって思うの。[next]
[表情 画像=カレン残念]
まわりを見ていて、[n]
このまま大人になるのって、何か大事なものが欠けてるような気がして。[next]
[表情 画像=カレン心配]
[自分]
じゃあ、文化祭実行委員になったのも関係あるの？[next]

[人物 画像=カレン哀愁 名前=恋ヶ窪カレン]
うん、それもあると思う。[n]
一生懸命にはなってるけど、楽しいかというと[n]
……正直今はちょっと。[next]
[表情 画像=カレン]
[自分]
そっか、大変だよね……。[next]
[人物 画像=カレンにこ 名前=恋ヶ窪カレン]
小金井くん、今日は一緒に勉強してくれてありがとう。[n]
また図書室で、お話ししましょうね。[next]

[無限種入手 名前=また図書室で 詳細=カレンは放課後に人の少ない図書室にいるのが好きみたいだ 期限=18]
[足跡 名前=また図書室で]
[表情 画像=カレンしゃべる]
私はこっちだから。また明日ね。[next]

[自分]
こちらこそありがとう。また明日。[next]
[return]
*カレンの恋愛観
文化祭の申請書類を記入するということで、[n]
俺は恋ヶ窪さんに図書館に呼ばれたのだった。[next]

彼女は、カバンから書類の束を取り出した。[n]
まさかこれ全部を俺たちでやるというのか？[next]
[モノローグ終了]

[自分]
……これ、けっこうたくさんありそうだね。[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
そうよ。小金井くん、こういうの初めて？[next]

[自分]
正直よくわからないな……。[n]
この取扱い食品、および取扱い方法って、なんだろう。[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
そこには一応、料理のレシピを書くことになってるんだけど、[n]
レシピはここに用意してあるわ。[next]

[自分]
恋ヶ窪さんは、やっぱり一回[n]
委員をやっただけあって詳しいんだなあ。[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
去年は喫茶店じゃなかったから、私もこの作業は初めてよ。[next]

お互い手探りなんだから、私に頼りすぎちゃダメ。[next]

[自分]
まあ、そうだよな。[n]
えっと……さつまいもにラップをかけて[n]
５分間レンジで加熱する、あとそれから……[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
生ものとか食中毒になりそうな工程がないってことを[n]
ここで書いておく必要があるの。[next]

[モノローグ]
恋ヶ窪さんが俺の書いている用紙を覗き込むと、[n]
顔が近いし、なんだかいい匂いがするし……気が散ってしまう。[next]

いやいや、ちゃんと書類に集中しないと！[next]
[モノローグ終了]

[自分]
加熱しないとダメって書いてあるから、[n]
この最後の「生クリームとミントの葉を盛り付ける」ってのは[n]
入れない方がいいのかな。[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
うーん……書類ができたらみんなでレシピを[n]
確認した方がよさそうね。[next]

[モノローグ]
俺たちは、慣れないながらも書類を１つずつ片づけていった。[next]
[場面転換]
[モノローグ]
[背景 画像=図書室]
[表情 画像=カレン]
[枠]
……30分は経っただろうか。[next]
[モノローグ終了]

[自分]
あー、肩がこってきたな。ちょっと休もう。[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
そうね。ちょうど私、本を返そうと思っていたの。[n]
ちょっと席を外すわね。[next]
[人物消去]
[モノローグ]
恋ヶ窪さんが本を返しに行ったとき、[n]
俺はカバンからはみ出している一冊のマンガが気になった。[next]

男子生徒が女子に壁際で迫っている構図……[n]
もしかして、恋ヶ窪さんって案外そういうのが好きなのかな？[next]

ちょっと読んでみたい気もするけど、[n]
勝手にカバンに手を突っ込むのは良くない。[next]

うーん、でも……読みたい！[next]

そういえば、 恋ヶ窪さんはなかなか戻ってこないな。[n]
今がチャンス……[next]
[モノローグ終了]

[人物 画像=カレン 名前=恋ヶ窪カレン]
どうかしたの？ 小金井くん。[next]

[自分]
（真後ろにいた！）[next]

あ、あ、ゴメン。[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
何を謝っているの？[next]

[自分]
えっと……そのマンガが気になっちゃって。[n]
恋ヶ窪さん、そういうの読むんだなあって、あはは……[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
ああ、これね。丁度いいわ。[n]
ちょっと最後まで読んでみて。[next]

[自分]
いいの？[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
ええ、あなたの感想が聞いてみたいの。[next]

[自分]
感想って……どんな？[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
そうね、この主人公の女の子のこと、どう思うとか、[n]
このカレシのこと、どう思うとか。[next]

[モノローグ]
渡されたマンガを[ぺらり]読んでいく……[next]

俺の女になれ、と言われてしぶしぶ付き合った女の子が、[n]
マイペースな彼氏に振り回されながら、[n]
だんだん夢中になっていく様が描かれている。[next]

この男に女の影がちらついたりするごとに、[n]
主人公の女の子が苦悩しつつも、どんどん献身的になっていく。[n]
……そこで１巻は終わっている。[next]
[モノローグ終了]

[自分]
読み終わったよ。[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
どう？[next]

[自分]
この男が何を考えているのか、正直よく分からない。[n]
女の子って、こういうの好きなのかな。[n]
主人公の女の子も、なんだか優柔不断だし。[next]

……あ、ごめん。[n]
好きなマンガのこと悪く言うつもりは無いんだ。[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
そう……。わたしも同感ね。[next]

[自分]
え？[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
このマンガね、ミドリに貸してもらった本なの。[next]

私、マンガを読んだことがなかったんだけど、[n]
そしたらミドリが、涙なしには読めないオススメの本だって。[next]

私はぜんぜん泣ける本だとは思えなくて、[n]
むしろ登場人物に腹が立つというか。[next]

でも、普通の人はそうじゃないのかしら、って思ったの。[next]

[自分]
普通かどうかは知らないけど……[n]
俺は恋ヶ窪さんの考え方に近いかな。[next]

この本みたいな、相手のことを想って[n]
盲目になっちゃうような関係って、[n]
実際よくわからないんだけどね。[next]

[人物 画像=カレン 名前=恋ヶ窪カレン]
私ね、恋愛してるふたりって、お互いのことを[n]
好きだって確認し合って、お互い支え合って[n]
困難を乗り越えていく関係じゃなきゃいけないと思う。[next]

この本みたいに、相手の勝手に付き合って、[n]
ボロボロになりながら尽くすのって、[n]
何のために恋愛しているのかしら。[next]

それじゃ、一緒にいる意味がないでしょ？[next]

[自分]
俺はそこまで真面目に考えたことなかったなあ。[n]
実際に恋に落ちたら、どうなるかわからないし。[next]

[モノローグ]
恋ヶ窪さんは、恋愛に対して信念を持っているみたいだ。[n]
もしかしたら、美園さんを見ていて、[n]
何か思うところがあったからだろうか。[next]
[モノローグ終了]

[人物 画像=カレン 名前=恋ヶ窪カレン]
……ふう。長い休憩になってしまったわ。続きをしましょう。[next]

[モノローグ]
こうして、俺と恋ヶ窪さんは残りの書類を片づけていった。[next]

こういう風に夕方まで過ごすのって良いなあと、[n]
俺はぼんやりと思ってしまった。[next]
[足跡 名前=カレンの恋愛観]
[return]

*熱意のすれちがい
;----------↓ここから↓----------
※シナリオ：熱意のすれちがい[n]
デートの約束をした[next]
;----------↑ここまで↑----------
[足跡 名前=熱意のすれちがい]
[eval exp="f.カレンデート = 1"]
[return]

*カレンデート１
[枠]
;----------↓ここから↓----------
※シナリオ：カレンデート１[next]
;----------↑ここまで↑----------
[eval exp="f.カレンデート = 0"]
[足跡 名前=カレン１回目のデート終了]
[実績解除 名前=実績１１：デート！？]
[return]

*カレン１回目のデート終了
[枠]
;----------↓ここから↓----------
※シナリオ：楽しく参加するには[next]
;----------↑ここまで↑----------
[足跡 名前=楽しく参加するには]
[return]

*和菓子屋とペットのこと
;----------↓ここから↓----------
※シナリオ：和菓子屋とペットのこと[n]
デートの約束をした[next]
;----------↑ここまで↑----------
[足跡 名前=動物園に行こう]
[種入手 名前=動物園に行こう 詳細=カレンと動物園でデートすることになった 期限=1]
[eval exp="f.カレンデート = 2"]
[return]

*カレンデート２
[場面転換]
;----------↓ここから↓----------
[背景 画像=動物園2]
[枠]
※シナリオ：カレンデート２[next]
;----------↑ここまで↑----------
[eval exp="f.カレンデート = 0"]
[足跡デバッグ 名前=自分の方こそ……]
[種分岐 ア=自分の方こそ…… イ=何を言えばいいのか分からない 体力=&告白消費]
[if exp=ア]
	;----------↓ここから↓----------
	※カレンを攻略[next]
	;----------↑ここまで↑----------
	[eval exp="f.カレン攻略 = 1"]
	[eval exp="f.カレン加速++, f.主人公加速++"]
	[足跡 名前=カレン攻略]
[else]
	;----------↓ここから↓----------
	※カレンを放置して帰る[next]
	;----------↑ここまで↑----------
	[eval exp="f.カレンけんか = 1"]
	[足跡 名前=カレンけんか]
	[実績解除 名前=実績１６：放置]
	[eval exp="f.カレン恋愛栄養ドリンク = 1"]
[endif]
[return]

*強制招集
[モノローグ終了]
[自分]
恋ヶ窪さん、お願いがあるんだけど……[n]
放課後の文化祭準備にもっと人を呼んでみてくれないかな？[next]
[人物 画像=カレンうーん 名前=恋ヶ窪カレン]
うーん、私にできるのかしら……[next]
[モノローグ]
俺たちは粘り強く交渉した。[next]
[モノローグ終了]
[体力 変化=&招集消費]
[if exp="人員計算() > 7"]
	[人物 画像=カレン残念 名前=恋ヶ窪カレン]
	……手伝ってくれる人は、誰も見つからなかったわ。[n]
	いる人だけで頑張りましょ。[next]
	[自分]
	あ、うん。仕方ないね……[next]
	[return]
[endif]
[eval exp="f.モブ女招集 = 1"]
[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
クラスの女の子が１人、手伝ってくれるそうよ！[next]
[自分]
やったあ！ ありがとう恋ヶ窪さん！[next]
[人物消去]
[メッセージ]
次の放課後準備に、クラスの女子が手伝いに来てくれることになった。[next]
[return]

*カレンけんか
[カレンなにしてる][next]
[モノローグ終了]
[人物 画像=カレンびっくり 名前=恋ヶ窪カレン]
！！[next]
[人物 画像=カレンひっぐ 名前=恋ヶ窪カレン]
…………。[next]
[人物消去]
[自分]
ああ……。[next]
[モノローグ]
あの時どうすれば良かったんだろう。[next]
[モノローグ終了]
[return]
