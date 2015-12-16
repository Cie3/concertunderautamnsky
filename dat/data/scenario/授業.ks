;[BGM停止]
[場面転換]
[背景 画像=教室]
[SE 音=チャイム2R.ogg buf=2 音量=40]

[枠]
[メッセージ]

[if exp=f.学力<40]
	ああ、授業か……[n]
	かなり置いていかれているから、[n]
	そろそろ本気を出さないと……[next]
[elsif exp=f.学力<60]
	さて、授業か。[n]
	きちんとノートを取った方がいいかな。[next]
[elsif exp=f.学力<80]
	授業時間だ。[n]
	まあ、いつも通り受けるか。[next]
[else]
	授業の時間だな。[n]
	内容は大体わかってるし、[n]
	今日くらい聞き流してもいいか。[next]
[endif]
[iscript]
var n = f.日;
[endscript]
[if exp= "n==23 || n==11"]
	[人物 画像=前原先生しゃべる 名前=古典の前原]
	鈴虫の 声の限りを 尽くしても 長き夜明かず ふる涙かな[n]
	この和歌でなぜ「ふる」が仮名で書いてあるかというと[n]
	鈴を振るの「ふる」と涙が雨のように「降る」のを掛けた……
[elsif exp= "n==22 || n==10"]
	[人物 画像=男性教員 名前=数学の松岸]
	４次関数ｆ(x)の最小値を求めるには、このグラフの傾きが[n]
	真横になる所を探せばいいから、まずは公式に従って微分する。[n]
	微分すると３次関数が出てくるから、この解を掃き出し法で……
[elsif exp= "n==20 || n==8"]
	[人物 画像=女性教員 名前=英語のシエ=サン]
	The life cycles of insects vary but most hatch from eggs.[n]
	難しいデスカ？ 文章を読むとき、動詞がどれなのか[n]
	考エールのが大切デスネ。コノ場合 vary と hatch, つまり……
[elsif exp= "n==19 || n==7"]
	[人物 画像=男性教員 名前=数学の高谷]
	この問題だと、まずＡからＢへのベクトルが未知数でしょ。[n]
	よくわかんない数でてきたらまず変数で表すこと、これ鉄則な。[n]
	んで、変数が３つ出てきたら３式立てて連立、はいわかんない人ー
[elsif exp= "n==17 || n==5"]
	[人物 画像=男性教員 名前=現代文の豊田]
	ここで李徴の言ってる尊大な羞恥心ってのはですね、[n]
	詩を書く才能がないかも、とか自分では思ってるのにですね、[n]
	自分は凄いんですよーって強がって人を避けてる事なんですね……
[elsif exp= "n==16 || n==4"]
	[人物 画像=女性教員 名前=世界史の奥沢]
	国際連盟って、自分の民族のことは自分で決めるってことを[n]
	認めてたはずなんだけど、それはヨーロッパだけの話で[n]
	アジアは自立できない国とみなして植民地にしてたのね……
[elsif exp= "n==14 || n==2"]
	[人物 画像=男性教員 名前=倫理の秋山]
	えー、ソクラテスは、いろんな偉い人と話をしていくうちに[n]
	大事なことに気が付きました。それは何かというと、彼らは[n]
	自分が話していることについてよく知らずに話しているのです……
[else]
	[人物 画像=男性教員 名前=生物の岡本]
	自然の世界では同種の仲間でも、生存競争で弱いものは強いものに[n]
	住んでいる場所を追い出されることもある。そんなこと言ったら[n]
	人間社会だってモテる奴は俺たちの居場所を奪ってチクショー！
[endif]

[eval exp="var ア授業２ = '真面目にノートをとる (' + 授業２消費 + ')'"]
[eval exp="var イ授業１ = '適当に話を聞き流す (' + 授業１消費 + ')'"]
[eval exp="var ウ授業０ = '睡眠学習を試みる (+' + 授業０消費 + ')'"]
[三択 ア=&ア授業２ イ=&イ授業１ ウ=&ウ授業０]

[人物消去]
[メッセージ]

[if exp=ア]
	[体力 変化= &授業２消費]
	[学力 変化= &授業２上昇]
[elsif exp=イ]
	[体力 変化= &授業１消費]
	[学力 変化= &"(int)(f.学力 * 授業１上昇割合)"]
[elsif exp=ウ]
	[背景 画像= 黒]
	[体力 変化= &授業０消費]
	[学力 変化=&授業０上昇]
	[枠消去]
[endif]


[SE 音="チャイムR.ogg" buf=2 音量=40]

[if exp=ア]
	ノートも綺麗にまとめたし、自分にしてはよく頑張った。[next]
[elsif exp=イ]
	最後の方は時計ばかり気にしてたな……[next]
[else]
	[間][間][間][間]
	[背景 画像= 教室]
	[枠]
	ふぁあ……[n]
	あれ、授業は終わってた。[next]
[endif]

[if exp= "f.日 == 17 || f.日 == 11 || f.日 == 5 || f.日 == 2"]
	[場面転換]
	[背景 画像= 教室]
	[枠]
	次は小テストか…… 今日はハードだなあ。[next]
	気合を入れていかないと。[next]
	[人物 画像= 前原先生 名前= 前原先生]
	50点いかないと、補習になるので気をつけるように。[n]
	じゃあ、時計の針がゼロになったら始めるからね[間]・[間]・[間]・[next]
	[表情 画像=前原先生しゃべる]
	ハイ、はじめ。
	[二択 ア= いつも通りやる(-5) イ= 己の限界に挑む(-12)]
	[人物消去]
	[メッセージ]
	[if exp= ア]
		・・・・・・カリカリカリカリ。[n]
		[if exp= "f.学力 > 75"]ん？ そんなに難しくない……[next]
		[else]ん？ う〜ん。[next]
		[endif]
		[体力 変化= -5]
		[eval exp= "f.試験の点数=f.学力"]
	[elsif exp= イ]
		・・・・・・カリカリカリカリ。[n]
		お！ ひらめいた。[next]
		[体力 変化= -12]
		[eval exp= "f.試験の点数 = Math.min(f.学力+10, 100)"]
	[endif]
	[人物 画像= 前原先生 名前= 前原先生]
	もう時間だな。はい、そこまで。[next]
	[人物消去]
	[メッセージ]
	やっとおわった。[n]
	[if exp= "f.学力 < 40"]できない試験ほど憂鬱なものは無い……[next]
	[else]結果は……まあ、明日には分かるだろう。[next]
	[endif]
	[SE 音="チャイムR.ogg" buf=2 音量=40]
[endif]

もう昼休みか。[next]

[if exp= "f.日 == 16 || f.日 == 10 || f.日 == 4 || f.日 == 1"]
	[背景 画像=廊下]
	[枠]
	[モノローグ]
	あ、昨日のテストの結果が張り出してある。[next]
	[モノローグ終了]
	[if exp="f.日==16"]
		[人物 画像=ミドリ病み 名前=美園ミドリ]
		…………。[next]
		[人物消去]
	[elsif exp="f.日==10"]
		[人物 画像=イズミやれやれ 名前=本多イズミ]
		あっぶねー…… 絶対赤点だと思った。[next]
		[人物消去]
	[elsif exp="f.日==4"]
		[人物 画像=ヨシオどや 名前=小平ヨシオ]
		ふっ……。[next]
		[人物消去]
	[elsif exp="f.日=1"]
		[人物 画像=カズキ残念 名前=国分寺カズキ]
		……やっちまった。[next]
		[人物消去]
	[endif]
	[モノローグ]
	[if exp="f.試験の点数 < 50"][BGM 音量=50 曲=やらかした.ogg][endif]
	俺の点数は 「[emb exp="f.試験の点数"]点」[n]
	[cancelskip]
	[if exp="f.試験の点数 > 85"]
		自分でもびっくりだ。[next]
		[種入手 名前=成績優秀！ 詳細="&'テストで' + f.試験の点数 + '点を取ったぞ'" 期限=3]
		[if exp="f.試験の点数 == 100"][実績解除 名前=実績７：学年主席][endif]
		[モノローグ終了]
	[elsif exp="f.試験の点数 > 60"]
		まあ、順当にこんなところか。[next]
	[elsif exp="f.試験の点数 >= 55"]
		結構あぶなかったなあ。[next]
	[elsif exp="f.試験の点数 >= 50"]
		天は俺に味方したのだ！[next]
		[実績解除 名前=実績８：赤点水平飛行]
	[elsif exp="f.試験の点数 < 50"]
		試験に完全敗北した……[n]
		今日の放課後は居残りだ。[next]
		[eval exp="f.放課後レッスン = 1"]
	[endif]
	[モノローグ終了]
[endif]

[if exp= "f.今日=='９月 第１週 平日１'"]
	[人物 画像=前原先生 名前=古典の前原]
	ああ、そうそう。[n]
	今日はね、みんな、面談があるから。[n]
	時間はここに書いてあるから見ておいてね。[next]
	
	[モノローグ]
	この人が担任の[ルビ 読み= まえ]前[ルビ 読み= はら]原先生、古典が専門のベテランの先生だ。[n]
	授業はわかりやすいし、ガミガミ怒ったりもしない。[n]
	優しいし、困ったときは相談にものってくれる理想の担任だ。[next]
	[モノローグ終了]
	[人物消去]
[endif]

[if exp= "f.今日=='９月 第２週 平日１'"]
	[人物 画像=女性教員 名前= 英語のシエ=サン]
	来週テスト。[間]忘れずに頑張ってクダサーイ。[n]
	５０点で放課後レッスン！ Good luck！[next]
	[人物消去]
	
	[モノローグ]
	まずいな、テストで赤点を取ると[n]
	放課後の文化祭準備が補習になってしまう……[next]
	
	なんとしても５０点は死守するんだ。[next]
	[モノローグ終了]
[endif]

[枠消去]

[SE停止]

[return]
