[eval exp="人員計算()"]
[jump target="*放課後レッスン" cond="f.放課後レッスン"]

[場面転換]
[eval exp="var 今日の進捗 = 0"]
[BGM 曲=文化祭準備01.ogg 音量=50 ループ]
[背景 画像=教室放課後]
[枠]
[人物 画像=カレン発言 名前=恋ヶ窪カレン]
文化祭の準備を始めましょうか。[next]
[eval exp="今日の進捗 += 進捗参加"]

[人物 画像=ヨシオ 名前=小平ヨシオ]
工程表を確認すると……[n]
準備の進捗は [emb exp="f.進捗"]％ ってところだろうか。[next]
[eval exp="今日の進捗 += 進捗参加"]

[if exp="f.モブ男招集"]
	[人物 画像=男子生徒ア 名前=男子生徒]
	あ、[姓]。[n]
	僕はこの書類を先生のところに持っていけばいいんだよね。[next]
[endif]

[if exp="f.マリ参加"]
	[人物 画像=マリあはは 名前=貫井マリ]
	お客を集めるには、でっかい看板と目立つビラでしょ！[n]
	あとは、運動部の競技の終わった後がチャンス、っと。[next]
	[eval exp="今日の進捗 += 進捗参加"]
[elsif exp="f.マリ招集"]
	[人物 画像=マリえっ 名前=貫井マリ]
	手伝うことあるかな……？[n]
	ちょっと職員室行ってきたいんだけど。[next]
	[eval exp="今日の進捗 += 進捗招集"]
[endif]

[if exp="f.カケル参加"]
	[人物 画像=カケルにこ 名前=梶野カケル]
	この接客マニュアル、まだ改善できそうだな。[next]
	[eval exp="今日の進捗 += 進捗参加"]
[elsif exp="f.カケル招集"]
	[人物 画像=カケルめそらし 名前=梶野カケル]
	こんなテキトーなテーブル配置で大丈夫か……？[n]
	まあ、いいか。[next]
	[eval exp="今日の進捗 += 進捗招集"]
[endif]

[if exp="f.イズミ参加"]
	[人物 画像=イズミへえ 名前=本多イズミ]
	うーん、ちょっと調理の手順に凝りすぎたかな……[n]
	あとは、材料の調達場所かな。[next]
	[eval exp="今日の進捗 += 進捗参加"]
[elsif exp="f.イズミ招集"]
	[人物 画像=イズミはあ 名前=本多イズミ]
	ここのレシピ、加熱時間が少な過ぎるんじゃないの？[n]
	ちゃんと確認してんの？[next]
	[eval exp="今日の進捗 += 進捗招集"]
[endif]

[if exp="f.マユ参加"]
	[人物 画像=マユ 名前=桜マユ]
	このエプロンのアクセントは捨てがたいけど[n]
	やりすぎるとコスプレって言われちゃうのですよ。[next]
	[eval exp="今日の進捗 += 進捗参加"]
[elsif exp="f.マユ招集"]
	[人物 画像=マユはわわ 名前=桜マユ]
	えっと、えっと？[n]
	ヨッシー、何すればいいの〜？[next]
	[eval exp="今日の進捗 += 進捗招集"]
[endif]


[if exp="f.モブ女招集"]
	[人物 画像=女子生徒ア 名前=女子生徒]
	恋ヶ窪さん。机を並べてみるというのは、[n]
	こんな感じでいいんですか？[next]
[endif]

[if exp="f.ミドリ参加"]
	[人物 画像=ミドリ笑顔 名前=美園ミドリ]
	ここのテーブルにね、かわいいバラ柄のクロスが似合うと思うの。[n]
	ねえ、カケルくん。[next]
	[eval exp="今日の進捗 += 進捗参加"]
[elsif exp="f.ミドリ招集"]
	[人物 画像=ミドリはあ 名前=桜マユ]
	はあ……[next]
	メニューと内装って言われても……[next]
	[eval exp="今日の進捗 += 進捗招集"]
[endif]

[人物消去]

[メッセージ]
俺はどれくらい頑張ろうか……
[四択 ア="&'全力投球だ('+準備２+')'" イ="&'適度にやる('+準備１+')'" ウ="&'見てるだけ('+準備０+')'"]
[枠消去]
[if exp=ア]
	[体力 変化=&準備２]
	[eval exp="今日の進捗 += 進捗２"]
[elsif exp=イ]
	[体力 変化=&準備１]
	[eval exp="今日の進捗 += 進捗１"]
[elsif exp=ウ]
	[体力 変化=&準備０]
	[eval exp="今日の進捗 += 進捗０"]
[endif]

[jump storage="scenario/個別/マリ.ks" cond="足跡('マリ参加') && !足跡('文化祭の買い出し終了')"]

[背景 画像=教室夕方]

*進捗表示

[cancelskip]
[枠][メッセージ]
[nowait]
参加者：自分   カレン  ヨシオ
[ch text="  イズミ" cond="f.イズミ参加 + f.イズミ招集"]
[ch text="   マユ " cond="f.マユ参加 + f.マユ招集"]
[ch text="  カケル" cond="f.カケル参加 + f.カケル招集"]
[ch text="  ミドリ" cond="f.ミドリ参加 + f.ミドリ招集"]
[ch text="   マリ " cond="f.マリ参加 + f.マリ招集"]
[ch text="  生徒男" cond="f.モブ男招集"]
[ch text="  生徒女" cond="f.モブ女招集"][r]
貢献度：[ch text="&進捗２+'％  '" cond="ア"][ch text="&進捗１+'％  '" cond="イ"][ch text="&進捗０+'％  '" cond="ウ"]
＋  [emb exp=進捗参加]％ ＋  [emb exp=進捗参加]％
 
[ch text="&'＋  '+進捗参加+'％ '" cond="f.イズミ参加"][ch text="&'＋  '+進捗招集+'％ '" cond="f.イズミ招集"]
[ch text="&'＋  '+進捗参加+'％ '" cond="f.マユ参加"][ch text="&'＋  '+進捗招集+'％ '" cond="f.マユ招集"]
[ch text="&'＋  '+進捗参加+'％ '" cond="f.カケル参加"][ch text="&'＋  '+進捗招集+'％ '" cond="f.カケル招集"]
[ch text="&'＋  '+進捗参加+'％ '" cond="f.ミドリ参加"][ch text="&'＋  '+進捗招集+'％ '" cond="f.ミドリ招集"]
[ch text="&'＋  '+進捗参加+'％ '" cond="f.マリ参加"][ch text="&'＋  '+進捗招集+'％ '" cond="f.マリ招集"]
[ch text="&'＋  '+進捗招集+'％ '" cond="f.モブ男招集"]
[ch text="&'＋  '+進捗招集+'％ '" cond="f.モブ女招集"]
[r]
進捗  ：[emb exp="f.進捗"]％  →  [emb exp="f.進捗 + 今日の進捗"]％[next]
[endnowait]
[モノローグ終了]
[eval exp="f.進捗+=今日の進捗"]
[自分]
結構進んだね。みんなありがとう。[next]
[枠消去]
[iscript]
f.イズミ招集 = f.マユ招集 = f.カケル招集 = f.ミドリ招集 = f.マリ招集 = f.モブ男招集 = f.モブ女招集 = 0;
[endscript]

[return]


*放課後レッスン
[場面転換]
[背景 画像=教室狂気]
[BGM 曲=狂気の教室.ogg 音量=50]
[枠]
[eval exp="f.放課後レッスン = 0"]

[人物 画像=女性教員 名前= 英語のシエ=サン]
これから放課後特別レッスンを始める。[next]

試験に合格できなかった劣等生の諸君、[n]
己の不勉強を恥じて、心を入れ替えなさい。[next]

補習の効果が見られるまで容赦はしない。[n]
できるようになるまで帰れないと覚悟しておくことだ。[next]

教科書と辞書を使って穴埋め形式の問題を解く。[n]
できた者から、口頭試問を行う。[next]

はじめ！[next]
[枠消去]
[体力 変化=&補習消費]
[学力 変化=&"補習後の成績 - f.試験の点数"]

[BGM停止 時間=2000]
[背景 画像=教室夕方]
[人物消去]

[枠]
[メッセージ]
こうして、俺の[カラス]放課後は潰れてしまった。[n]
次はきちんと勉強しよう……[next]

[実績解除 名前=実績６：放課後レッスン]

それよりも、文化祭の準備に向かわないと！！[next]

[場面転換]
[背景 画像=教室夕方]
[BGM 曲=文化祭準備01.ogg 音量=50 ループ]

[枠]
[自分]
ごめん！！[n]
補習が終わったらこんな時間になっちゃって……[next]

[人物 名前=恋ヶ窪カレン 画像=カレンむっ]
…………[next]

[人物 名前=小平ヨシオ 画像=ヨシオ困惑]
やれやれ、シエ先生の放課後特別レッスンというのは[n]
都市伝説ではなかったのだな……[next]

[人物 名前=恋ヶ窪カレン 画像=カレンうーん]
……まあ、いる人だけでなんとか進めておいたわ。[next]

[人物消去]
[eval exp="var 今日の進捗 = 4"]
[if exp="f.マリ参加"][eval exp="今日の進捗 += 進捗参加"]
[elsif exp="f.マリ招集"][eval exp="今日の進捗 += 進捗招集"]
[endif]
[if exp="f.カケル参加"][eval exp="今日の進捗 += 進捗参加"]
[elsif exp="f.カケル招集"][eval exp="今日の進捗 += 進捗招集"]
[endif]
[if exp="f.イズミ参加"][eval exp="今日の進捗 += 進捗参加"]
[elsif exp="f.イズミ招集"][eval exp="今日の進捗 += 進捗招集"]
[endif]
[if exp="f.マユ参加"][eval exp="今日の進捗 += 進捗参加"]
[elsif exp="f.マユ招集"][eval exp="今日の進捗 += 進捗招集"]
[endif]
[if exp="f.ミドリ参加"][eval exp="今日の進捗 += 進捗参加"]
[elsif exp="f.ミドリ招集"][eval exp="今日の進捗 += 進捗招集"]
[endif]
[if exp="f.モブ男招集"][eval exp="今日の進捗 += 進捗招集"][endif]
[if exp="f.モブ女招集"][eval exp="今日の進捗 += 進捗招集"][endif]

[eval exp="ア=0,イ=0,ウ=1"]
;選択肢ウを選んだのを再現する
[jump target="*進捗表示"]
