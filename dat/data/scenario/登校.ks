[場面転換]
[背景 画像=通学路]
[BGM 曲= 05日常.ogg ループ= 1 音量= 50]

[if exp="testplay"][eval exp="f.生命=40,f.体力=20"][endif]

[jump target="*23" cond="f.日==23"]
[jump target="*22" cond="f.日==22"]

[jump target="*プラナリアは１本だけ" cond="f.イズミ栄養ドリンク == 1"]
[jump target="*プラナリアは１本だけ" cond="f.ミドリ栄養ドリンク == 1"]
[jump target="*プラナリアは１本だけ" cond="f.マリ栄養ドリンク == 1"]
[jump target="*プラナリアは１本だけ" cond="f.マリ恋愛栄養ドリンク == 1"]
[jump target="*プラナリアは１本だけ" cond="f.カレン恋愛栄養ドリンク == 1"]
[jump target="*プラナリアは１本だけx"]
*プラナリアは１本だけ
[call target="*プラナリア"]
*プラナリアは１本だけx

[足跡デバッグ 名前=カケルは気づいた]
[jump target="*カケルは気づいた" cond="足跡('カケルは気づいた') && !足跡('カケルミドリ参加')"]
[足跡デバッグ 名前=部長の仕事]
[jump target="*部長の仕事" cond="足跡('部長の仕事') && !足跡('マリ参加')"]
[足跡デバッグ 名前=マリの告白]
[jump target="*マリの告白" cond="足跡('マリの告白') && !足跡('マリカケル参加')"]

*おはようランダム
[iscript]
if(f.おはようランダム === void) f.おはようランダム = intrandom(0, 8);
f.おはようランダム = (f.おはようランダム + intrandom(1, 3)) % 9;
var rnd = f.おはようランダム;
[endscript]
[枠]
[if exp="rnd==0"]
	[人物 画像=イズミしゃべる 名前=本多イズミ]
	よっ！ [姓]。[next][自分]おはよう。[next]
[elsif exp="rnd==1"]
	[人物 画像=カケルえっ 名前=梶野カケル]
	よう、[姓]。[next][自分]おはよう。[next]
[elsif exp="rnd==2"]
	[人物 画像=カズキしゃべる 名前=国分寺カズキ]
	[名]！ 一緒に行くぞ。[next][自分]おう。[next]
[elsif exp="rnd==3"]
	[if exp="f.カレンけんか"]
		[人物 画像=カレン真顔 名前=恋ヶ窪カレン]
		おはよう。[next][自分]……おはよう。[next]
	[else]
		[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
		おはよう、[if exp="f.カレン攻略"][名][else][姓][endif]くん。[next][自分]あ、おはよう。[next]
	[endif]
[elsif exp="rnd==4"]
	[人物 画像=マユ 名前=桜マユ]
	わー、[姓]くんだー！[next][自分]あ、おはよう。[next]
[elsif exp="rnd==5"]
	[if exp="f.マリけんか"]
		[人物 画像=マリ決意 名前=貫井マリ]
		…………[next][自分]…………[next]
	[else]
		[人物 画像=マリ 名前=貫井マリ]
		[姓]！ おはよー！[next][自分]おはよう。[next]
	[endif]
[elsif exp="rnd==6"]
	[if exp="f.ミドリ不参加"]
		[人物 画像=ミドリ病み 名前=美園ミドリ]
		…………[next][人物消去][自分]ん？[next]
		[モノローグ]なんだ……気のせいか。[next][モノローグ終了]
	[else]
		[人物 画像=ミドリしゃべる 名前=美園ミドリ]
		[姓]くん、おはよう。[next][自分]おはよう。[next]
	[endif]
[elsif exp="rnd==7"]
	[人物 画像=ヨシオきりっ 名前=小平ヨシオ]
	おっ、[姓]ではないか、おはよう。[next][自分]おはよう。[next]
[elsif exp="rnd==8"]
	[人物 画像=前原先生しゃべる 名前=前原先生]
	おはよう、[姓]。調子はどうかな。[next]
	[表情 画像=前原先生]
	[自分]まあ、良さそうです。[next]
	[人物 画像=前原先生しゃべる 名前=前原先生]
	そうか、今日も一日元気に頑張れよ。[next]
[endif]
[人物消去]
[return cond="!testplay"]

*23
[枠]
久しぶりの授業日だ。[n]
夏休みにたいして動かなかったせいか、力が有り余っている感じがする。[next]

[人物 画像=カレン 名前=クラスメイト]
おはよう、[姓]くん。[next]

[自分]
あ、おはよう……[next]

[モノローグ]
あいさつはするけど、それ以上の関わりはあまりない。[n]
クラスメイトとは、大体そんな感じだ。[next]
[モノローグ終了]
[return cond="!testplay"]

[人物消去]

*22
[枠]
[人物 画像=カズキしゃべる 名前=国分寺カズキ]
よう！ [名]！[n]
昨日の全米オープン見た？ やべえぞあれ！[next]

[自分]
ああ、今朝ニュースでやってたな。[n]
カズキは見てたのか。いつやってたんだ？[next]

[人物 画像=カズキ残念 名前=国分寺カズキ]
いや……それが、オレも寝落ちしてて見れなかったんだよ。[next]
[表情 画像=カズキうーん]
くそっ！ 惜しいところ見逃したぜ……[next]
[return cond="!testplay"]
[人物消去]

*部長の仕事
[枠]
[人物 画像=マリ 名前=貫井マリ]
[姓]、この前はありがとう。[next]
[表情 画像=マリうん]
[自分]
いや、俺、結局何もしてなかったよ？[next]
[BGM停止 時間=2000]
[人物 画像= マリ哀愁の笑み  名前= 貫井マリ]
ううん、私、やっぱり頑張り方が間違ってた。[next]
[表情 画像=マリ真面目]
あの後、前原先生とか[n]
部活の同級生とも話したんだけど。[next]
[表情 画像=マリあちゃー]
みんな[いい話だなあ]が求めていたのは[n]
誰よりも練習してテニスが上手くなることじゃなくて[n]
みんなの代表として色んなことを決めることだったんだ。[next]
[表情 画像=マリうん]
[自分]
悩み事、解決したみたいだね、良かった。[next]

[人物 画像= マリあはは  名前= 貫井マリ]
それでね、あたし、今度から[n]
休日の文化祭準備も出ようと思うんだ。[next]
[表情 画像=マリうん]
[自分]
えっ、練習が忙しいからって言ってたのに[n]
大丈夫なの？[next]
[人物 画像= マリ  名前= 貫井マリ]
前原先生から、部活のことしか考えてないと[n]
逆に視野が狭まるって言われたんだ。[next]

それにここまで相談乗ってもらったんだから[n]
何かお返ししないといけないと思って。[next]
[表情 画像=マリあはは]
今度はあたしが[姓]の力になるよ！[next]

[自分]
ありがとう……！！[next]

[モノローグ]
貫井マリが文化祭準備に参加するようになった！[next]
[モノローグ終了]
[実績解除 名前=実績２：マリが参加]
[足跡 名前=マリ参加]
[eval exp="f.マリ参加 = 1"]
[BGM 曲= 05日常.ogg ループ= 1 音量= 50]
[return cond="!testplay"]
[人物消去]

*カケルは気づいた
[枠]
[表情右 画像= ミドリ]
[人物左 画像= カケルしゃべる  名前= 梶野カケル]
この前はありがとな、小金井。[next]
[表情左 画像= カケル]

[人物右 画像= ミドリ苦笑  名前= 美園ミドリ]
私達、色々と話してみたの。[n]
今までの二人の行動とか見直してみて……[next]
[表情右 画像= ミドリ]

[人物左 画像= カケルななんだよ  名前= 梶野カケル]
オレが気付かない間に[n]
ミドリに迷惑かけてたってことがわかったよ。[next]
[表情左 画像= カケルめそらし]

[人物右 画像= ミドリ笑顔  名前= 美園ミドリ]
そ、そんなことないよっ！[next]

[自分]
あはは……[next]
[BGM停止]
(なんだか見せつけられてるみたいだ……)[next]
[人物右 画像= ミドリしゃべる  名前= 美園ミドリ]
[表情左 画像= カケル]
それでね、[いい話だなあ]私達、文化祭の休日準備にも[n]
参加することにしたから。[next]
[表情右 画像= ミドリ]

[自分]
本当に！？[next]

[人物右 画像= ミドリ苦笑  名前= 美園ミドリ]
喫茶店やりたいって言ったのは私だし……[next]
[表情右 画像= ミドリ]

[人物左 画像= カケルにこ  名前= 梶野カケル]
小金井への礼もあるしな。[next]

[自分]
ありがとう、これからよろしく頼むよ！[next]

[メッセージ]
カケルとミドリが文化祭準備に参加するようになった！[next]
[足跡 名前=カケルミドリ参加]
[eval exp="f.カケル参加 = f.ミドリ参加 = 1"]
[eval exp="f.カケル加速++, f.ミドリ加速++"]
[実績解除 名前=実績３：カケルが参加]
[実績解除 名前=実績４：ミドリが参加]
[BGM 曲= 05日常.ogg ループ= 1 音量= 50]
[return]

*マリの告白
[表情 画像=マリ]
[枠]
[足跡 名前=マリカケル参加]
マリとカケルが文化祭準備に参加するようになった！[next]
[eval exp="f.マリ参加 = f.カケル参加 = 1"]
[eval exp="f.カケル加速++, f.マリ加速++"]
[実績解除 名前=実績２：マリが参加]
[実績解除 名前=実績３：カケルが参加]
[実績解除 名前=実績１５：キューピッド]
[人物消去]
[return cond="!testplay"]

*プラナリア
[eval exp="棒()"]
[BGM 曲= やらかした.ogg ループ= 1 音量= 40]
[枠]
[人物 画像= カズキしゃべる 名前= 国分寺カズキ]
おーい、[名]！[next]
[自分]
ああ、カズキか……[next]
[人物 画像= カズキへえ  名前= 国分寺カズキ]
どうしたんだよおい！ ひでえ顔色だぞ？[next]
[自分]
実は……[next]
[モノローグ]
[if exp="f.イズミ栄養ドリンク"]
	俺は、恋ヶ窪カレンと本多イズミが修復不可能になった事件を[n]
	カズキに話した。[next]
	[eval exp="f.イズミ栄養ドリンク = 0"]
	[モノローグ終了]
	[人物 画像= カズキ残念  名前=国分寺カズキ ]
	なるほど、それでクラスメイトにもう準備に来ないって[n]
	言われちゃったんだな……[next]
	[表情 画像=カズキ]
	[自分]
	うん……[n]
	俺、クラス実行委員なのにダメだよなあ……[next]
	
	[人物 画像= カズキしゃべる  名前=国分寺カズキ ]
	でもクラス実行委員だからこそ、[n]
	元気がなくちゃダメなんじゃねーの。[next]
[elsif exp="f.ミドリ栄養ドリンク"]
	俺は、美園ミドリが絶望的な失恋をしてしまった事件を[n]
	カズキに話した。[next]
	[eval exp="f.ミドリ栄養ドリンク = 0"]
	[モノローグ終了]
	[人物 画像= カズキ残念  名前=国分寺カズキ ]
	なるほど、それでクラスメイトにもう準備に来ないって[n]
	言われちゃったんだな……[next]
	[表情 画像=カズキ]
	[自分]
	いや、来ないって言われてはいないけど[n]
	もう来ないだろうなって感じはする……[next]
	
	俺、クラス実行委員なのにダメだよなあ……[next]
	
	[人物 画像= カズキしゃべる  名前=国分寺カズキ ]
	でもクラス実行委員だからこそ、[n]
	元気がなくちゃダメなんじゃねーの。[next]
[elsif exp="f.マリ栄養ドリンク"]
	俺は、貫井マリを傷つけてしまったことをカズキに話した。[next]
	[eval exp="f.マリ栄養ドリンク = 0"]
	[モノローグ終了]
	[人物 画像= カズキしゃべる 名前=国分寺カズキ]
	ハッキリ言うぞ。[n]
	お前が悪い。[next]
	[自分]
	うん……[next]
	[人物 画像= カズキにこ 名前=国分寺カズキ]
	まあ、オレは誰にも言わねーから気にすんなよ。[next]
	[自分]
	俺、クラス実行委員なのにダメだよなあ……[next]
	
	[人物 画像= カズキしゃべる  名前=国分寺カズキ ]
	でもクラス実行委員だからこそ、[n]
	元気がなくちゃダメなんじゃねーの。[next]
[elsif exp="f.マリ恋愛栄養ドリンク"]
	俺は、貫井マリとけんか別れしてしまった事件を[n]
	カズキに話した。[next]
	[eval exp="f.マリ恋愛栄養ドリンク = 0"]
	[モノローグ終了]
	[人物 画像= カズキ残念  名前=国分寺カズキ ]
	なるほど、それで話ができないくらいこじれちゃったのな。[n]
	本当にご愁傷さまだぜ……[next]
	[if exp="f.カレンけんか"]
		なんか、前もこんなことあったよな……[n]
		まあ、いっか。[next]
	[endif]
	[表情 画像=カズキうーん]
	[自分]
	あああ、もうダメだ。[next]
	[人物 画像= カズキへえ  名前=国分寺カズキ]
	おいおい[名]、お前はダメなんかじゃねーよ。[n]
	
	貫井と仲のいいヤツとかから、あいつのこと[n]
	ちゃんと知る機会がなかったんだろ？[next]
	
	それに、クラス実行委員だからこそ、[n]
	元気がなくちゃダメなんじゃねーの。[next]
[elsif exp="f.カレン恋愛栄養ドリンク"]
	俺は、恋ヶ窪カレンを動物園に置き去りにした事件を[n]
	カズキに話した。[next]
	[eval exp="f.カレン恋愛栄養ドリンク = 0"]
	[モノローグ終了]
	[人物 画像= カズキ残念  名前=国分寺カズキ ]
	なるほど、それで話ができないくらいこじれちゃったのな。[n]
	本当にご愁傷さまだぜ……[next]
	[if exp="f.マリけんか"]
		なんか、前もこんなことあったよな……[n]
		まあ、いっか。[next]
	[endif]
	[表情 画像=カズキうーん]
	[自分]
	あああ、もうダメだ。[next]
	[人物 画像= カズキへえ  名前=国分寺カズキ]
	おいおい[名]、お前はダメなんかじゃねーよ。[n]
	
	取り乱した女の扱いに慣れてなかっただけだろ？[n]
	デート行く前にオレに相談してくれればよかったのに……[next]
	
	それに、クラス実行委員だからこそ、[n]
	元気がなくちゃダメなんじゃねーの。[next]
[endif]

*そうなんだけど
[自分]
そうなんだけど……[next]

[人物 画像= カズキにこ  名前=国分寺カズキ ]
そんなお前にはこれ、やるよ！[next]

[自分]
プラナリアドリンク……！[next]

[人物 画像= カズキ  名前=国分寺カズキ ]
「どんなに傷ついても驚きの再生力」[n]
って書いてあるだろ。[next]
[表情 画像=カズキにこ]
ほら、飲めよ、元気出るぜ？[next]

[自分]
うん、ありがとう……！！[next]
[BGM停止]

[モノローグ]
ゴクッ！ゴクッ！[next]
[SE 音=しみわたる 音量=80]
緑色に妖しく輝く液体が、俺の体に染みわたる……！！[next]
[モノローグ終了]
[枠消去]
[SE 音=キラキラリ 音量=80][プラナリア回復]
[枠]
[メッセージ]
生命力が全回復した！[cancelskip][next]
[BGM 曲= 05日常.ogg ループ= 1 音量= 50]
[人物消去]
[枠消去]
[return]
