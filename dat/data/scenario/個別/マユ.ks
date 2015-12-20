[macro name=マユなにしてる]
[nowait]
[if exp=f.昼休み]
	桜さんが人体デッサンを描いている。
[else]
	桜さんがアニメっぽい絵を描いている。
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
[表情 画像=マユ]
[モノローグ]

;種があると、強制招集が使えません。
[eval exp="var 種がある = 0;"]

*種開始

*マユの趣味
[足跡デバッグ 名前=マユの趣味]
[jump target="*マユの趣味2" cond="!足跡('マユの趣味')"]
[jump target="*マユの趣味2" cond="足跡('マユの趣味はコスプレ？')"]
[eval exp="種がある = 1" cond="findSeed('マユの趣味') >= 0"]
[nowait]
[マユなにしてる]
[種分岐 ア=マユの趣味 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*マユの趣味2"][endif]
*本文
桜さんは机から何かの冊子を取り出して[n]
自分の机で熱心に読み始めた。[next]
[モノローグ終了]
[自分]
あれ、桜さん。[next]
[人物 画像=マユ笑顔 名前=桜マユ]
あ、[姓]くんだ。[next]
[自分]
何読んでるの？[next]
[人物 画像=マユ 名前=桜マユ]
これだよ〜[next]
[モノローグ]
桜さんは笑顔で手元にあるものを[n]
俺の方に掲げてきた。[next]
[モノローグ終了]
[自分]
えっと、ファッション雑誌？[next]
[人物 画像=マユ笑顔 名前=桜マユ]
色々と勉強しようと思って〜[next]
[表情 画像=マユ]
[自分]
勉強？[n]
ああ、桜さん、[n]
ファッションとか興味あるんだってね。[next]

そういう方面に就職とか考えてるの？[next]
[人物 画像=マユむう 名前=桜マユ]
違うよー！[n]
コスプレのためだよ。[next]
[表情 画像=マユ]
[自分]
……え！？[n]
こ、コスプレ！？[next]
[人物 画像=マユ笑顔 名前=桜マユ]
ほら、このお洋服とか、すっごく可愛くない？[next]
[表情 画像=マユ]
なんか、[n]
『魔法少女くーも☆ＤＯＮ！』[n]
の衣装みたいだよね！[next]
[自分]
くーも……何！？[next]
[人物 画像=マユ 名前=桜マユ]
あー、そうだっ！[n]
[姓]くん、これあげるね☆[next]
[表情 画像=マユ笑顔]
ボクのブロマイドだよっ！[next]

文化祭のコスプレ大会では、[n]
『メイド in チャイナ服・桜マユ』に清き一票[n]
よろしくおねがいしま〜す！[next]
[表情 画像=マユ]
[自分]
あ、はぁ……どうも……。[next]
[人物 画像=マユえっ 名前=桜マユ]
あ、ボクもう行かなきゃ！[next]
[表情 画像=マユ笑顔]
じゃあね〜[姓]くん。[next]
[自分]
じゃ、じゃあね〜……。[next]
[人物消去]
[モノローグ]
呆気にとられている俺を尻目に、[n]
桜さんはさっさと教室を出て行ってしまった。[next]
[モノローグ終了]
[自分]
（……なんだろう、宇宙人みたいな子だなぁ……。[n]
　ここまでマイペースだとは思わなかった……）[next]
（それに、どうしようか……このコスプレ写真）[next]
[種入手 名前=マユの趣味はコスプレ？ 詳細=魔法少女コスプレのブロマイドをもらったんだけど……]
[足跡 名前=マユの趣味はコスプレ？]
[モノローグ]
衣装……！[n]
そういえば喫茶のコスチュームも考えないと。[next]

本多さんはメニューで手一杯だろうし、[n]
恋ヶ窪さんあたりに相談してみるか。[next]
[return]
*マユの趣味2

*マユへのお願い
[足跡デバッグ 名前=マユへのお願い]
[jump target="*マユへのお願い2" cond="!足跡('マユへのお願い')"]
[jump target="*マユへのお願い2" cond="足跡('マユ参加')"]
[eval exp="種がある = 1" cond="findSeed('マユへのお願い') >= 0"]
[nowait]
[マユなにしてる]
[種分岐 ア=マユへのお願い イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*マユへのお願い2"][endif]
[モノローグ終了]
*本文
[自分]
桜さん。[next]

[人物 画像=マユ 名前=桜マユ]
ん〜？[n]
どうしたの[姓]くん？[next]

[自分]
あのさ、[n]
突然で悪いんだけど。[next]

クラス企画、[n]
参加してくれないかな…？[next]

[人物 画像=マユはわわ 名前=桜マユ]
えぇ〜、クラス企画ぅ？[next]

[自分]
実はうちの本格喫茶、[n]
まだ店員の衣装が決まらなくてさ。[next]

桜さん、コスプレやってるって[n]
この間言ってたから――[next]

[人物 画像=マユ 名前=桜マユ]
あ、そうそう！[next]

先週の放送で[n]
新しいキャラが出たんだけど、[n]
その子の服がすっごく可愛くてね！[next]
[人物 画像=マユ笑顔 名前=桜マユ]
コスプレ大会の衣装を変えちゃおうかなって[n]
迷ってるんだ〜。[next]

[自分]
へえ、そうなんだ。[n]
もちろん、衣装は自作なんだよね？[next]

[人物 画像=マユ笑顔 名前=桜マユ]
うん、そうだよ〜。[next]
[表情 画像=マユ]
[自分]
だよね！ だからさ、服のデザインとか製作とか[n]
詳しそうだなって思って。[next]

それだけできる人って、うちのクラスには桜さんしかいないから、[n]
力を貸してほしいんだけど……。[next]

[人物 画像=マユ笑顔 名前=桜マユ]
あはは、ボクのこと頼ってくれるんだー。[next]
[表情 画像=マユいじける]
でもボクのコスチューム、[n]
本格喫茶には合わないから[n]
みんなにダメって言われそう。[next]

恋ヶ窪さんとか[n]
これじゃないって言いそうだし……。[next]

[自分]
恋ヶ窪さん、[n]
桜さんの衣装可愛いって言ってたよ！[next]

[人物 画像=マユえっ 名前=桜マユ]
……ほえ？[next]

[自分]
こんなに可愛い物を作れるんだし、[n]
ぜひ協力してほしいって。[next]

だから、[n]
桜さんが来てくれたら、きっと喜ぶよ！[next]

[人物 画像=マユはわわ 名前=桜マユ]
……え、えぇ〜。[n]
そんなのありえないよぉ。[next]
[表情 画像=マユむう]
[姓]くん、[n]
いくら人を増やしたいからって[n]
嘘はだめだよ？[next]

[枠消去]
[表情左 画像=カレンねえ]
[人物消去]
[表情右 画像=マユ]
[枠]
[人物左 画像=カレンねえ 名前=恋ヶ窪カレン]
本当よ。[next]

[人物右 画像=マユえっ 名前=桜マユ]
へっ？[next]

[自分]
恋ヶ窪さん！？[n]
いつの間に来てたの？[next]

[人物左 画像=カレンしゃべる 名前=恋ヶ窪カレン]
ごめんなさいね、[n]
盗み聞きするつもりはなかったんだけど。[next]

教科書を取りに来たら[n]
あなたたちの声が聞こえてきたから。[next]

[間][間]
[表情左 画像=カレン発言]
……桜さん、あのね。[next]

[人物右 画像=マユはわわ 名前=桜マユ]
ふ、ふぁいっ！？[next]

[人物左 画像=カレンにこ 名前=恋ヶ窪カレン]
[姓]くんの話は本当。[n]
あなたの写真、見せてもらったの。[next]
……すごく素敵だったわ。[next]

[人物右 画像=マユえっ 名前=桜マユ]
え、えっと、あの。[next]

[人物左 画像=カレンしゃべる 名前=恋ヶ窪カレン]
私にはできないことだし、[n]
あなたのセンス、すごく好きだなって、[n]
その時、素直にそう思ったの。[next]

だから、ぜひあなたにも協力してほしい。[next]
[表情左 画像=カレン]
[人物右 画像=マユえっ 名前=桜マユ]
…………。[next]

[人物左 画像=カレンややおこ 名前=恋ヶ窪カレン]
こ、こういうの、[n]
柄じゃないのは自分でも分かってるのよ？[next]
[表情左 画像=カレンうーん]
でも、私だって[n]
可愛い物は大好きなんだから！[next]
[表情左 画像=カレンねえ]
だから……、[n]
衣装作りつつ[n]
色々教えてもらえたらなぁ……って。[BGM停止 時間=2000][next]
[表情左 画像=カレン真顔]
[自分]
恋ヶ窪さん……。[next]

[人物右 画像=マユ 名前=桜マユ]
……分かった。[n]
ボク、やってみる。[いい話だなあ][next]

[人物左 画像=カレンびっくり 名前=恋ヶ窪カレン]
本当！？[next]

[人物右 画像=マユ 名前=桜マユ]
うん。[next]

ボク、みんなと一緒に何かやっても、[n]
なんかうまくいかないから、[n]
いなくていいかなって思ってたけど。[next]
[表情右 画像=マユむう]
でも、だからって、[n]
逃げてばかりも良くないかもって。[next]
[表情左 画像=カレンにこ]

[自分]
桜さん……。[next]

[人物右 画像=マユ笑顔 名前=桜マユ]
ズミねえも、[n]
楽しいと思えることをやれって言ってたしね。[next]

今まではキャラのコスプレばっかりだったけど、[n]
ちょっと違う服にも挑戦してみたくなったんだー。[next]

だから、[n]
ボクでよければやってみるよ！[next]
[表情右 画像=マユ]
[自分]
桜さん……ありがとう！[next]

[参加 名前=マユ]
[実績解除 名前=実績５：マユが参加]
[モノローグ終了]

[人物左 画像=カレンしゃべる 名前=恋ヶ窪カレン]
ありがとう……、[n]
断られたらどうしようかと思ったわ。[next]

[人物右 画像=マユ笑顔 名前=桜マユ]
えへへ、ボクも[n]
可愛いって言ってもらって嬉しかったよ。[next]

[足跡デバッグ 名前=イズミの不満]
[jump target="*本文2" cond="足跡('イズミの不満')"]
まあ、せっかくなら人生、楽しいことやらなきゃね〜。[next]
[表情右 画像=マユ]
ね、ズミねえ？[next]
[表情左 画像=カレンねえ]
[自分]
え！？[next]
[人物左消去]

[人物右 画像=マユ笑顔 名前=桜マユ]
そこにいるんでしょ、[n]
知ってるよ〜？[next]
[表情右 画像=マユ]
[人物左 画像=イズミ仕方ない 名前=本多イズミ]
……バレてたか。[n]
ホント、ヘンなところ鋭いよね、[n]
まゆゆは。[next]

[人物右 画像=マユ笑顔 名前=桜マユ]
えっへ〜ん。[next]

[人物右 画像=カレンねえ 名前=恋ヶ窪カレン]
……今の話、聞いてたの？[next]

[人物左 画像=イズミはあ 名前=本多イズミ]
ごめん、[n]
まゆゆが嫌なこと言われないか[n]
ちょっと心配だったから。[next]
[表情左 画像=イズミやったぜ]
でもさ……、[n]
ちょっと見直した。[next]

[人物右 画像=カレン発言 名前=恋ヶ窪カレン]
え？[next]
[表情右 画像=カレン真顔]
[人物左 画像=イズミふふふ 名前=本多イズミ]
アンタ、ただいい子ぶって[n]
みんなで協力〜とか[n]
喚いてるだけかと思ってたけど。[next]
[表情左 画像=イズミしゃべる]
ちゃんと、相手のことを見た上で[n]
その人の力が必要だから協力してほしいって言えるんだな、って。[next]
[表情左 画像=イズミ]

[人物右 画像=カレンかああ 名前=恋ヶ窪カレン]
あ、ありがとう……。[next]
[表情右 画像=カレンにこ]
あなたも、態度からは想像つかないけど[n]
意外と優しいところはあるのね。[next]

[人物左 画像=イズミ不快 名前=本多イズミ]
はぁ？[n]
「態度からは想像つかないけど」は[n]
余計だしー。[next]
[表情左 画像=イズミ説明]
ウチは[n]
常に人のことを思いやる優しい女子でしょーが。[next]
[表情左 画像=イズミやれやれ]
いっつも思うんだけど、[n]
アンタ、そういう余計なひと言多すぎんじゃない？[next]
[表情左 画像=イズミむすっ]

[人物右 画像=カレンややおこ 名前=恋ヶ窪カレン]
なっ、何よ！[n]
せっかく褒めてあげたのに[n]
そんな言い方ないでしょ！[next]

あなたこそ、その物言いをどうにかしたら！？[n]
周りから誤解受けやすいわよ！[next]

[表情左遠い 画像=イズミおい][表情右遠い 画像=カレンややおこ]
[人物 画像=マユ笑顔 名前=桜マユ]
あははっ、[n]
ズミねえと恋ヶ窪さん、[n]
気が合うんだねぇー。[next]

[人物右遠い 画像=カレンおこ 名前=恋ヶ窪カレン]
そんなわけ[next]
[人物左遠い 画像=イズミおこ 名前=本多イズミ]
ないでしょ！！[next]

[自分]
あ、あはは……。[n]
まあまあ……。[next]

（でも、二人とも結構、気が合うと思うよ……）[next]

[足跡 名前=マユ参加]
[return]
*本文2
[表情右 画像=マユ]
というか、ボク気づいたんだけど、[n]
恋ヶ窪さんって、笑顔が素敵だね。[next]

[人物左 画像=カレンびっくり 名前=恋ヶ窪カレン]
えっ？[next]

[表情右 画像=マユ笑顔]
みんなの前でも[n]
もっと笑ってみたらいいのに……。[next]

[人物左 画像=カレン残念 名前=恋ヶ窪カレン]
でも……。[next]

[人物右 画像=マユ 名前=桜マユ]
ほーらー！[n]
また口角下がってるよー？[next]
[表情右 画像=マユ笑顔]
はい、じゃあ練習！[n]
笑って笑ってー、にっこりー☆[next]

[人物左 画像=カレン哀愁 名前=恋ヶ窪カレン]
え、えっと……あはは……？[next]

[人物右 画像=マユむう 名前=桜マユ]
んー、なんかちょっと違う……。[n]
どうしたら笑ってくれるのー？[next]
[表情右 画像=マユ]
あ、ボクと仲良くなってくれたら、[n]
笑ってくれる？[next]

[人物左 画像=カレンびっくり 名前=恋ヶ窪カレン]
えぇ！？[next]

[自分]
なんでそうなるの！？[next]

[人物左 画像=カレンうーん 名前=恋ヶ窪カレン]
ええっと……よく分からないけど[n]
努力する、わ……？[next]

[人物右 画像=マユ 名前=桜マユ]
わーい！[n]
じゃあ今日からお友達になろう！[next]
[表情右 画像=マユ笑顔]
よろしくね、レンレン！[next]

[人物左 画像=カレンかああ 名前=恋ヶ窪カレン]
れ、レンレン！？[next]

[人物右 画像=マユ 名前=桜マユ]
うん、カレンだから、レンレン！[next]
[表情右 画像=マユ笑顔]
はい、お友達になった記念として[n]
ボクと握手！[next]

[人物左 画像=カレン哀愁 名前=恋ヶ窪カレン]
よ……よろしく……。[next]

[モノローグ]
なんか、恋ヶ窪さんが振り回されてるけど……。[next]

でも、二人とも何となく楽しそうだからいいか。[next]
[モノローグ終了]

[枠消去]
[足跡 名前=マユ参加]
[eval exp="f.マユ参加 = 1"]
[return]
*マユへのお願い2

*雑談
[マユなにしてる]
[三択 ア=雑談する イ=何か他の話題は……]
[if exp=イ]
	[jump target="*雑談2"]
[endif]
[人物 名前=桜マユ 画像=マユ]
とりとめのない会話が入ります。[next]
[人物消去]
[枠消去]
[return]
*雑談2

[nowait]これ以上会話はないみたい。[endnowait]
[if exp="種がある || f.マユ参加 || f.マユ招集"]
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
桜さん、お願いがあるんだけど……[n]
放課後の文化祭準備をちょっと手伝って欲しいんだ！[next]
[人物 画像=マユはわわ 名前=桜マユ]
えええ……[next]
[モノローグ]
俺は粘り強く交渉した。[next]
[モノローグ終了]
[体力 変化=&招集消費]
[if exp="人員計算() > 7"]
	[人物 画像=マユにこ 名前=桜マユ]
	……やっぱり今回はダメ〜[n]
	手伝ってくれるひと、いるんだよね？[next]
	[自分]
	あ、うん。そっか……[next]
	[return]
[endif]
[eval exp="f.マユ招集 = 1"]
[人物 画像=マユ 名前=桜マユ]
しょうがないなあ……ちょっとだけだからね。[next]
[自分]
よかった。ありがとう桜さん！[next]
[人物消去]
[メッセージ]
次の放課後準備に、桜マユが手伝いに来てくれることになった。[next]
[return]

[return]
