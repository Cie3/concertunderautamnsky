[macro name=ヨシオなにしてる]
[nowait]
[if exp=f.昼休み]小平が将棋の本を読んでいる。[else]小平が囲碁の本を読んでいる。[endif]
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
[表情 画像=ヨシオ]
[モノローグ]

;種があると、強制招集が使えません。
[eval exp="var 種がある = 0;"]

*種開始

*人が集まらない休日準備
[足跡デバッグ 名前=人が集まらない休日準備]
[jump target="*人が集まらない休日準備2" cond="!足跡('人が集まらない休日準備') || 足跡('イズミは頑固')"]
[eval exp="種がある = 1" cond="findSeed('人が集まらない休日準備') >= 0"]
[ヨシオなにしてる]
[種分岐 ア=人が集まらない休日準備 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*人が集まらない休日準備2"][endif]
*本文
あの後、３人でできることから手を付けたが[n]
メニューなど、具体的な内容は決まることなく[n]
解散となってしまった。[next]

「やる気がない人間は来なくていい」と[n]
言い始めたのは本多さんだ。[next]

本多さんを説得すれば、[n]
他の人たちも来たりしないかな……[next]

とりあえず小平に話を聞いてみよう。[n]
本多さんと仲がいいみたいだし、何か分かるかもしれない。[next]
[モノローグ終了]

[人物 名前=小平ヨシオ 画像=ヨシオ自信]
おや？　[姓]じゃないか。[next]
[表情 画像=ヨシオきりっ]

[自分]
ああ。小平、ちょうど良かった。[next]

本多さんについて、[n]
ちょっと聞きたいことがあるんだ。[next]

[人物 名前=小平ヨシオ 画像=ヨシオ]
本多のこと？ [n]
……ああ、この前は大変だったからな。[next]

[自分]
あはは……そうだな。[n]
休日準備はありがとう。[next]

で、本多さんのことなんだけど、[n]
どうしたら文化祭に参加してもらえるかな？[next]

[表情 画像=ヨシオふむ]
最初に出て行ったあの子を[n]
呼び戻すことができれば、[n]
きっとみんなも来ると思うんだよ。[next]

[人物 名前=小平ヨシオ 画像=ヨシオ]
ふむ……そうだな。[n]
いい案だとは思うが、なかなか骨が折れるぞ？[next]

[表情 画像=ヨシオ説明]
本多はあの通り頑固で気分屋だ。[n]
気に入らないことがあると[n]
すぐに反抗してくる。[next]
[表情 画像=ヨシオ]

[自分]
そうなんだ……[next]

[モノローグ]
それはこの前の事件を見て何となく分かった。[next]
[モノローグ終了]

[人物 名前=小平ヨシオ 画像=ヨシオ自信]
ただまあ、時間をおけば[n]
自分を省みることができる奴でもある。[next]

ひょっとしたら、あのことも反省して[n]
考え直すかもしれないだろう。[next]

何があいつの琴線に触れるかは[n]
この僕も未だに分かっていないが、[n]
本音で話した方が割と上手くいく気がするぞ。[next]

[表情 画像=ヨシオどや]
言いたいことをはっきり言わない奴は大嫌いだと、[n]
過去に言っていたからな。[next]
[表情 画像=ヨシオきりっ]

[自分]
そっか……[n]
分かったよ、ありがとう小平。[next]

[自分]
（本当に本人の気分次第か……。[n]
　こりゃ気長にやっていくしかないな）[next]
[人物消去]

[モノローグ]
とにかく、ヒントはもらったし、[n]
本多さんを説得しに行こう。[next]
[モノローグ終了]
[種入手 名前= イズミは頑固 詳細=本音で話した方が割と上手くいく、と小平が言っていた]
[足跡 名前=イズミは頑固]

[枠消去]
[return]
*人が集まらない休日準備2

*カケルは友達がいない
[足跡デバッグ 名前=カケルは友達がいない]
[jump target="*カケルは友達がいない2" cond="!足跡('カケルは友達がいない') || 足跡('カケルの友達')"]
[eval exp="種がある = 1" cond="findSeed('カケルは友達がいない') >= 0"]
[ヨシオなにしてる]
[種分岐 ア=カケルは友達がいない イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*カケルは友達がいない2"][endif]
*本文
梶野が女子にモテることを[n]
小平なら、からかったり妬んだりしないだろう。[next]

梶野の件を相談するにはもしかしたら適任かも……[next]
[モノローグ終了]

[自分]
あのさ、梶野のことで相談があるんだけど……[next]

[人物 画像= ヨシオ  名前= 小平ヨシオ]
梶野のこと？[n]
どうしたんだ、突然……[next]

[人物 画像= ヨシオどや  名前= 小平ヨシオ]
いや、この僕にかかればどんな悩みも解決できる。[n]
さあ、話してくれたまえ。[next]

[自分]
あ、うん、実は……[next]

[モノローグ]
俺はこの前見た内容を小平に話した。[next]

梶野が男子たちから妬まれていること、[n]
そのために友達がいないこと……[next]
[モノローグ終了]

[人物 画像= ヨシオ  名前= 小平ヨシオ]
ふうむ……なるほど。[n]
男の嫉妬とは見苦しいな。[next]

[自分]
俺も嫉妬する気持ちがよくわからないんだよ。[n]
確かに、凄いとは思うけど。[next]

[人物 画像= ヨシオ  名前= 小平ヨシオ]
みんな、梶野のことを妬んでいるから友達になろうとしない。[next]

[自分]
うん。[next]

[人物 画像= ヨシオふむ  名前= 小平ヨシオ]
そして、僕達は梶野を妬んでいない。[next]

[自分]
そうだな。[next]

[人物 画像= ヨシオ  名前= 小平ヨシオ]
……それなら、何故僕達は梶野の友達ではないのだ？[next]

[自分]
う、うん？[next]

[人物 画像= ヨシオ自信  名前= 小平ヨシオ]
よし、解決方法がわかったぞ。[n]
[姓]、君と僕で梶野の友達になればいい。[next]

[自分]
ああ、わかった……[n]
って、え！？[next]

[人物 画像= ヨシオきりっ  名前= 小平ヨシオ]
そうと決まれば善は急げだ。[n]
梶野のところに行くぞ。[next]
[人物消去]

[自分]
おい、ちょっと待て、小平……！！[next]
[枠消去]

[間][間][間][間][間][間][間]

[枠]
[表情左 画像= カケル]
[人物右 画像= ヨシオ自信  名前= 小平ヨシオ]
梶野、[姓]から話は聞いた。[next]
[表情右 画像= ヨシオきりっ]

[人物左 画像= カケルしゃべる  名前= 梶野カケル]
なんだよ、いきなり。[next]
[表情左 画像= カケル]

[人物右 画像= ヨシオ自信  名前= 小平ヨシオ]
僕と[姓]が君の友達になってやろう！[next]
[表情右 画像= ヨシオきりっ]

[人物左 画像= カケルはあ  名前= 梶野カケル]
……[姓]、何を話したんだ。[next]

[自分]
いや……俺は、その……[next]

(小平に相談したのは間違いだったか……)[next]

[人物左 画像= カケルしゃべる  名前= 梶野カケル]
だいたい、今日からオレ達は友達だ、って小学生じゃあるまいし。[n]
納得できるわけないだろ。[next]
[表情左 画像= カケル]

[人物右 画像= ヨシオ説明  名前= 小平ヨシオ]
ふむ、それもそうだな。[next]
[表情右 画像= ヨシオふむ]

[自分]
な、何か友達らしいことをしてみるとか、どうかな。[n]
一緒に何かする、とか……[next]

[人物右 画像= ヨシオ  名前= 小平ヨシオ]
一緒に……[l][n]
[表情右 画像= ヨシオ自信]
よし、それなら勉強会などどうだろう。[n]
いかにも学生らしいじゃないか！[next]
[表情右 画像= ヨシオきりっ]

[人物左 画像= カケルしゃべる  名前= 梶野カケル]
勉強会、っていつの時代の人間だよ。[l][n]
[表情左 画像= カケルめそらし]
なあ、[姓]、オレ、もう行っていいか？[next]

[自分]
頼む！ 今日だけでも付き合ってくれないか？[next]

[人物左 画像= カケル  名前= 梶野カケル]
…………[next]

[表情左 画像=カケルしゃべる]
だったらまあ、別にいいけどさ。[next]

;;;;ここでカケル了承のセリフが必要だと思う。
;;;;でないと、ヨシオがあまりにも相手を無視した自分勝手な奴に見えてしまう。

[人物右 画像= ヨシオ自信  名前= 小平ヨシオ]
何をのんびりしている？[n]
早くノートと教科書を用意したらどうだ。[next]

[場面転換]
[BGM停止]
[間][間][間][間]

[場面転換]
[if exp=f.昼休み]
	[背景 画像=教室]
[else]
	[背景 画像=教室夕方]
[endif]

[枠]
;★できればBGMに時計の音が欲しいところ

[人物 画像= ヨシオ  名前= 小平ヨシオ]
;;;;★鉛筆を走らせる音
…………[next]
[人物消去]

[人物 画像= カケルめそらし  名前= 梶野カケル]
[SE 音=紙をめくる.ogg 音量=50]
…………[next]

[モノローグ]
梶野はぼんやりと教科書をめくっているし、[n]
小平は問題集を解きはじめてしまった。[next]

会話が無さすぎる……[n]
なんとかしないと……[next]
[モノローグ終了]

[自分]
あ、あのさ、前回の数学のノート、[n]
取り損ねたんだけど、見せてくれないか？[next]

[人物 画像= カケルしゃべる  名前= 梶野カケル]
……ほら。[next]
[人物 画像= カケル  名前= 梶野カケル]

[自分]
ありがとう！[n]
えーっと……[next]

;;;;;参考画像があると素敵�@

[モノローグ]
[SE 音=紙をめくる.ogg 音量=50]
パラパラとノートをめくる。[n]
そこには小さくて丸い文字が並んでいた。[next]
[モノローグ終了]

[BGM 曲=文化祭準備02.ogg 音量=50]
;穏やか系のBGMが欲しくて勝手に使いましたごめんなさい
[自分]
へえ、こんな字を書くんだな。[n]
女子っぽい、というか、可愛いというか……[n]
結構意外かも。[next]

[人物 画像= カケルしゃべる  名前= 梶野カケル]
姉が二人いるから、その影響かもな。[next]
[人物 画像= カケル  名前= 梶野カケル]

[自分]
へえ、お姉さんがいるのか。[n]
それは知らなかったよ。[next]

そういえばここの部分書いてないけど……[next]

[人物 画像= カケルしゃべる  名前= 梶野カケル]
ああ、オレもそこは寝てたような気がする。[next]
[人物 画像= カケル  名前= 梶野カケル]

[自分]
なあ、小平、お前のノート、見せてくれないか？[next]

[人物消去]
[間]

[人物 画像= ヨシオ自信  名前= 小平ヨシオ]
それぐらい雑作もない。[next]

[モノローグ]
小平が自信満々にノートを見せてくる。[n]
しかし……[next]
[モノローグ終了]

[人物消去]
[BGM停止]

[表情 画像= カケルえっ]
[自分]
こ、これは……[next]

[BGM 曲=やらかした.ogg 音量=40]
[人物 画像= カケルしゃべる  名前= 梶野カケル]
読めねえよ。[next]
[人物消去]

[人物 画像= ヨシオ困惑  名前= 小平ヨシオ]
む、そんなはず……！！[next]
;;;;★もっと大げさな表情があるといいな。（ない物ねだり）

;;;;参考画像があると素敵�A
[人物消去]
[枠消去]
[背景 画像=ノート]
[枠]

[メッセージ]
達筆すぎるというか、もはや崩し字に近く[n]
何が書いてあるのかさっぱりだ。[next]

前から読みにくい字を書くのは知っていたけど[n]
今日はいつにも増して酷い気がする……[next]

[背景教室]

[自分]
じゃあ、ここ、なんて書いてあるんだ？[next]

[人物 画像= ヨシオどや  名前= 小平ヨシオ]
「次の方程式を微分するとき……」[next]

[自分]
いや、絶対読めないって！[next]

[人物 画像= ヨシオ困惑  名前= 小平ヨシオ]
どう見てもここに方程式と書いてあるではないか！[next]

[自分]
俺の知ってる『方』の漢字はこんな汚くないぞ。[next]

[人物 画像= ヨシオ  名前= 小平ヨシオ]
限られた時間内でより多くの情報を記録するための[n]
合理的な形状だと言って欲しいものだが。[next]

[自分] 
略しすぎて、これじゃ暗号か古文書だろ。[next]

;※スチルの出し方がうまくいかなかったので、ここから盛大に改変してます、すみません
[BGM停止]
[人物 画像= ヨシオ困惑  名前= 梶野カケル]
……ぷ、くく……[next]

[自分]
！？[next]

[枠消去]
[人物消去]

[背景 画像= カレン立候補]

[BGM 曲=いい話だなあ.ogg 音量=70]
[間][間][間]
[枠]
[人物 画像= なし  名前= 梶野カケル]
あはははっ。[n]
お前ら変なやつだな……[next]

[自分]
（あの梶野が、笑ってる……）[next]

[人物 画像= なし  名前= 梶野カケル]
くだらねー、はははっ。[next]

[人物 画像= なし  名前= 小平ヨシオ]
…………[next]

……やっと笑ったな。[n]
これで僕と君はもう友達だろう？[next]
;;;;主人公蚊帳の外？

[間][間][間][間]

[場面転換]
[背景教室]

[枠]

[表情右 画像= ヨシオ優しい]
[人物左 画像= カケルにこ  名前= 梶野カケル]
仕方ないな。[n]
お前、友達少なそうだし。[next]
;;;;主人公蚊帳の外？

[自分]
梶野に言われたくないだろ……[next]

[人物右 画像= ヨシオどや  名前= 小平ヨシオ]
そういう[姓]も休み時間はすぐに他の教室に[n]
行ってしまうだろう？[next]
;;;;「そう”言”う」

[自分]
お、俺は他のクラスには友達いるからな……！！[next]

;;;;最後に、カケルの「俺たち、思ったより似てるかもな」的な締めの一言が欲しいです。

[人物消去]

[モノローグ]
そのあと俺たちはあまり勉強はせず、くだらない話をして過ごした。[n]
友達ってこういうものだよな……[next]

梶野も意外と自分のことを話してくれた。[n]
梶野が「寂しい人」だと心配している美園さんに[n]
このことを教えてみようか。[next]
[モノローグ終了]

[種入手 名前=カケルの友達 詳細=カケルにも友達ができた]
[足跡 名前=カケルの友達]
[return]
*カケルは友達がいない2

*イズミの特技
[足跡デバッグ 名前=イズミの特技]
[jump target="*イズミの特技2" cond="!足跡('イズミの特技') || 足跡('イズミ参加')"]
[eval exp="種がある = 1" cond="findSeed('イズミの特技') >= 0"]
[ヨシオなにしてる]
[種分岐 ア=イズミの特技 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*イズミの特技2"][endif]
*本文
[表情 画像=ヨシオふむ]
俺は教室で、小平と一緒に[n]
喫茶店のメニューを考えることにした。[next]

しかしなかなかいい案は出ず、[n]
次第に議論から雑談へと変わっていた。[next]
[モノローグ終了]

[自分]
小平、本多さんのお菓子って食べたことあるか？[next]

[人物 名前=小平ヨシオ 画像=ヨシオどや]
本多の？ ああ、あるぞ。[next]

桜さんにあげるものを[n]
作りすぎたとか何とかで[n]
何故か桜さんより先にもらってるな。[next]
[表情 画像=ヨシオきりっ]

[自分]
……小平[n]
それ毒見要員になってるよ、お前。[next]

[人物 名前=小平ヨシオ 画像=ヨシオ説明]
まあそうかもしれないな。[next]
[表情 画像=ヨシオ自信]
まあとにかく、[n]
あいつの作る菓子はどれも美味いぞ。[next]
[表情 画像=ヨシオふっ]
既存のレシピ通りに作るのでは満足できないらしく、[n]
オリジナルのレシピまで考案する熱の入れようでな。[next]
[表情 画像=ヨシオどや]
しかしどれも失敗したことがないんだ。[n]
あれはかなりの腕前だと思うぞ。[next]
[表情 画像=ヨシオ]

[自分]
オリジナルで？ [n]
そんなことまでできるんだ。[next]

[人物 名前=小平ヨシオ 画像=ヨシオ]
ああ。[n]
むしろ既存の物を再現するより[n]
そっちの方が好きだと言っていた。[next]
[表情 画像=ヨシオふむ]
正直な話、参加してくれるなら[n]
メニュー決めは本多に頼みたかったんだ。[next]
[表情 画像=ヨシオ説明]
こういうものに縁のない我々より[n]
よっぽど良いアイデアを出してくれそうなんだがな。[next]
[表情 画像=ヨシオふむ]
[モノローグ]
小平は溜息をつきながら、[n]
手元のメモ紙を見つめた。[next]
[モノローグ終了]

[自分]
……なら頼んでみるか。[next]

[人物 名前=小平ヨシオ 画像=ヨシオ困惑]
え？[next]

[自分]
本多さんに頼めばいいんだよ。[next]

目玉になるメニューを[n]
本多さんに考案してもらえないか、お願いしよう！[next]

俺たちも助かるし、それなら、本多さんだって[n]
きっと楽しいと思ってくれるはずだ！[next]

[場面転換]
[if exp=f.昼休み]
	[背景 画像=廊下]
[else]
	[背景 画像=廊下夕方]
[endif]
[枠]
[モノローグ]
俺は本多さんを探すために教室を飛び出した。[next]

すると、目線の先に、[n]
廊下を歩く本多さんの背中が見えた。[next]
[モノローグ終了]

[自分]
本多さん！[next]

[人物 名前=本多イズミ 画像=イズミへえ]
どうしたんだよ[姓]、[n]
そんなに慌てて。[next]
[表情 画像=イズミふーん]

[自分]
本多さん、ちょうどよかった。[n]
言いたいことがあるんだ。[next]

文化祭に参加しないか？[n]
俺たちと一緒に喫茶店を成功させてほしいんだ！[next]

[人物 名前=本多イズミ 画像=イズミやれやれ]
はぁ！？ [n]
いきなり何！？[next]
[表情 画像=イズミめそらし]

[自分]
文化祭のメニュー、[n]
全然いいものが思いつかなくて。[next]
[表情 画像=イズミふーん]
本多さん、お菓子作るの好きなんだろ？ [n]
でも今一緒にやってるメンバーの中には[n]
そういうの詳しい人間がいないんだ。[next]

だから、本多さんが適任だと思うんだ。[n]
出来る限りのことはするから、[n]
協力してほしい。[next]

[人物 名前=本多イズミ 画像=イズミはあ]
あのさ、前にも言ったけど[n]
そういうのウザいって──[next]
[表情 画像=イズミうーん]

[自分]
協力を強制することを[n]
本多さんが嫌いなのは知ってる。[next]

でも、楽しいことは[n]
嫌いじゃないんだろ？[next]

だから誘ってみたんだ。[n]
俺の勝手だから無理強いはしない。[next]

[BGM停止 時間=2000]ただ、これは本多さん、[n]
きっと喜ぶって思ったから……。[next]

[人物 名前=本多イズミ 画像=イズミめそらし]
…………[next]

[自分]
本多さん──[next]

[人物 名前=本多イズミ 画像=イズミ仕方ない]
……分かったよ。[next]

[自分]
……え？[next]

[人物 名前=本多イズミ 画像=イズミやったぜ]
協力してやるよ、[いい話だなあ]文化祭。[next]
[表情 画像=イズミふふふ]
合法的に学校で趣味の時間をもらえるなんて、[n]
こんなチャンス滅多にないだろ？[next]
[表情 画像=イズミやったぜ]
みんなが驚くくらい[n]
とびっきり美味しいの作ってやるから。[next]
[表情 画像=イズミ]

[自分]
本多さん……！[next]

[人物 名前=本多イズミ 画像=イズミにっ]
それに、アンタみたいな奴とだったら[n]
楽しくやれそうだしね。[next]

[モノローグ]
そう言うと、本多さんはニッと笑ってみせた。[next]
[モノローグ終了]

[自分]
ありがとう、本多さん！[next]

[人物 名前=本多イズミ 画像=イズミふふふ]
分かったから、[n]
今度から大声で呼びながら追っかけてくるのやめてよね。[next]
[表情 画像=イズミ仕方ない]
呼ばれてるこっちとしては[n]
めっちゃ恥ずかしいんだからさ。[next]
[表情 画像=イズミ]

[自分]
あはは、ごめんごめん。[n]
じゃあこれからよろしく！[next]

[参加 名前=イズミ]
[実績解除 名前=実績１：イズミが参加]
[足跡 名前=イズミ参加]
[枠消去]
[人物消去]
[return]
*イズミの特技2

*イズミの不満
[足跡デバッグ 名前=イズミの不満]
[jump target="*イズミの不満2" cond="!足跡('イズミの不満') || 足跡('イズミとマユ')"]
[eval exp="種がある = 1" cond="findSeed('イズミの不満') >= 0"]
[ヨシオなにしてる]
[種分岐 ア=イズミの不満 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*イズミの不満2"][endif]
*本文
本多さんと恋ヶ窪さんの仲が悪くなってしまった……[n]
小平は相談に乗ってくれるだろうか。[next]
[モノローグ終了]
[自分]
小平……[n]
本多さんって正面から話さないと、本当にダメなんだね。[next]

[人物 画像=ヨシオ説明 名前=小平ヨシオ]
まあ、そうだな。[n]
この前も言っただろう。本音で話した方がいいと。[next]

[自分]
それで……[next]

[モノローグ]
俺は小平に話した。[n]
恋ヶ窪さんの気持ちを本多さんに話したこと、[n]
本多さんが、陰口は嫌いだ、と怒ってしまったこと……[next]
[モノローグ終了]

[人物 画像=ヨシオ困惑 名前=小平ヨシオ]
なんと……[next]

まず恋ヶ窪さんは、陰で卑怯な陰口を叩くような人ではない。[n]
この前の休日準備では、二人とも正面切って[n]
議論していたではないか……[next]
[表情 画像=ヨシオ説明]
本多が、一体何に腹を立てているのか、[n]
少々分かりかねるところがある……が[next]
[表情 画像=ヨシオふむ]
正しく伝わらなかったとすれば、それは正した方がいい。[n]
僕の方からも話をしてみることにしよう。[next]

[自分]
[if exp="f.イズミ不参加"]
ありがとう。[n]
（もう、手遅れなんだけどな……）[next]
[else]
ありがとう。[next]
[endif]

そういえば、本多さんと仲がいい人って誰なの？[next]

[人物 画像=ヨシオ説明 名前=小平ヨシオ]
そうだなぁ……。[n]
僕や桜さんとはよく一緒にいるが、[n]
他の人と関わっているところはあまり見ないな。[next]
[表情 画像=ヨシオ]
[自分]
へえ、意外だなー。[n]
テンション高いしノリいい方だから、[n]
色んな人とよく遊んでるのかと思ってた。[next]
[人物 画像=ヨシオ自信 名前=小平ヨシオ]
本人いわく、[n]
変わってる人間と一緒にいた方が[n]
退屈しなくていいんだそうだ。[next]
[表情 画像=ヨシオどや]
桜さんとは、休日一緒に出かけるほどの仲らしいからな。[next]
[表情 画像=ヨシオきりっ]
[自分]
へえ、そんなに仲良いの？[n]
桜さんと本多さんなんて、全然タイプ違うけど……。[n]
趣味が合うのかなぁ……？[next]
[人物 画像=ヨシオ説明 名前=小平ヨシオ]
さあ、二人で何をしているのかは、僕も知らないがね。[next]
[表情 画像=ヨシオ自信]
そんなに気になるなら、今度[n]
本多本人に聞いてみたらどうだい？[next]
[表情 画像=ヨシオきりっ]
[自分]
うん、そうしてみるよ。[next]
[種入手 名前=イズミとマユ 詳細=イズミとマユはとても仲がいいらしい]
[足跡 名前=イズミとマユ]
[return]
*イズミの不満2

*イズミの交友関係
; このイベントは、イズミが参加するか、イズミが不満を溜めるかで発生します。
[足跡デバッグ 名前=イズミの交友関係]
[足跡デバッグ 名前=イズミ参加]
[jump target="*イズミの交友関係2" cond="!足跡('イズミ参加') || 足跡('イズミとマユ')"]
[eval exp="種がある = 1" cond="findSeed('イズミの交友関係') >= 0"]
[ヨシオなにしてる]
[種分岐 ア=イズミの交友関係 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*イズミの交友関係2"][endif]
*本文
[モノローグ終了]
[自分]
そういえば、[n]
本多さんって普段クラスの人と遊んだりしてるの？[next]

俺、あまりクラスにいないから[n]
そこんとこよく分からないんだけど……。[next]

[人物 画像=ヨシオ説明 名前=小平ヨシオ]
そうだなぁ……。[n]
僕や桜さんとはよく一緒にいるが、[n]
他の人と関わっているところはあまり見ないな。[next]
[表情 画像=ヨシオ]
[自分]
へえ、意外だなー。[n]
テンション高いしノリいい方だから、[n]
色んな人とよく遊んでるのかと思ってた。[next]
[人物 画像=ヨシオ自信 名前=小平ヨシオ]
本人いわく、[n]
変わってる人間と一緒にいた方が[n]
退屈しなくていいんだそうだ。[next]
[表情 画像=ヨシオどや]
桜さんとは、休日一緒に出かけるほどの仲らしいからな。[next]
[表情 画像=ヨシオきりっ]
[自分]
へえ、そんなに仲良いの？[n]
桜さんと本多さんなんて、全然タイプ違うけど……。[n]
趣味が合うのかなぁ……？[next]
[人物 画像=ヨシオ説明 名前=小平ヨシオ]
さあ、二人で何をしているのかは、僕も知らないがね。[next]
[表情 画像=ヨシオ自信]
そんなに気になるなら、今度[n]
本多本人に聞いてみたらどうだい？[next]
[表情 画像=ヨシオきりっ]
[自分]
うん、そうしてみるよ。[next]
[種入手 名前=イズミとマユ 詳細=イズミとマユはとても仲がいいらしい]
[足跡 名前=イズミとマユ]
[return]
*イズミの交友関係2

*雑談
[ヨシオなにしてる]
[三択 ア=雑談する イ=何か他の話題は……]
[if exp=イ]
	[jump target="*雑談2"]
[endif]
[人物 名前=小平ヨシオ 画像=ヨシオ]
[if exp="f.放課後"]
[自分]
小平ってさ、[n]
休みの日は何してんの？[next]

なんか勉強してるイメージしかないんだけど。[next]

[人物 画像=ヨシオ 名前=小平ヨシオ]
……？[n]
当然だろう？[next]

毎日課題や予習復習があるのだから、[n]
勉強以外の何をすると言うんだ？[next]

[自分]
え……、いや、お前、[n]
息抜きとかしないの？[next]

勉強で頭使ってばっかりって、さすがに疲れない？[next]

[人物 画像=ヨシオ 名前=小平ヨシオ]
ああなんだ、そういうことか。[next]

もちろん、息抜きはしているぞ。[n]
僕だってロボットではないからな。[next]

[自分]
……それ聞いて安心したわ。[next]

[人物 画像=ヨシオ 名前=小平ヨシオ]
まあ、勉強以外だったら[n]
もっぱら詰め将棋や囲碁に勤しんでいる。[next]

[自分]
って結局頭使うのかよ！[n]
全然息抜きになってなくないか！？[next]

[人物 画像=ヨシオ 名前=小平ヨシオ]
遊びだからそんなに疲れないぞ？[next]

そういう[姓]は何をしているんだ？[next]

[自分]
え？　俺？[n]
俺は……だいたいネトゲかな。[next]

[人物 画像=ヨシオ 名前=小平ヨシオ]
……疲れないのか？[next]

[自分]
小平には言われたくない。[next]

[人物 画像=ヨシオ 名前=小平ヨシオ]
……そうか。[next]

[自分]
……今度、一緒に遊んでみるか？[next]

[人物 画像=ヨシオ 名前=小平ヨシオ]
いいのか？[next]

[自分]
うん。その代わり将棋教えてくれよ。[next]

[人物 画像=ヨシオ 名前=小平ヨシオ]
ああ。ぜひ対局しよう。[next]

では、僕はこれで。[next]
[else]


[endif]
[人物消去]
[枠消去]
[return]
*雑談2

[nowait]これ以上会話はないみたい。[endnowait]
[if exp="種がある"]
	[next]
[else]
	[eval exp="var 呼ぶ = '放課後の準備に呼んでもらう (' + 招集消費 + ')'"]
	[二択 ア=&呼ぶ イ=呼ばない]
	[jump target="*強制招集" cond=ア]
[endif]
[cm]
[jump target="*種開始"]

*強制招集
[モノローグ終了]
[自分]
小平、お願いがあるんだけど……[n]
放課後の文化祭準備にもっと人を呼んでみてくれないかな？[next]
[人物 画像=ヨシオ困惑 名前=小平ヨシオ]
うぬっ……そういうのはもっと適役がいるのではないか。[next]
[表情 画像=ヨシオ説明]
いないのなら、まあ仕方ないが……[next]
[モノローグ]
俺たちは粘り強く交渉した。[next]
[モノローグ終了]
[体力 変化=&招集消費]
[if exp="人員計算() > 7"]
	[人物 画像=ヨシオふむ 名前=小平ヨシオ]
	……想定内とはいえ、誰もいない、か。[n]
	しかし十分な人員は揃っているわけだから、問題ないだろう。[next]
	[自分]
	まあ、そうだな……[next]
	[return]
[endif]
[eval exp="f.モブ男招集 = 1"]
[人物 画像=ヨシオ自信 名前=小平ヨシオ]
聞け[姓]、朗報だ！[n]
放課後の人員に男子１人を追加できそうだぞ。[next]
[表情 画像=ヨシオきりっ]
[自分]
やった！ 助かるよ小平！[next]
[人物消去]
[メッセージ]
次の放課後準備に、クラスの男子が手伝いに来てくれることになった。[next]
[return]
