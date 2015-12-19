
[jump target="*初回準備" cond="f.日==21"]

[場面転換]
[eval exp="var 今日の進捗 = 0"]
[BGM 曲=文化祭準備01.ogg 音量=50 ループ]
[背景 画像=空き教室]
[枠]
[人物 画像=カレン発言 名前=恋ヶ窪カレン]
文化祭の準備を始めましょうか。[next]
[eval exp="今日の進捗 += 進捗参加 + f.カレン加速"]

[人物 画像=ヨシオ 名前=小平ヨシオ]
工程表を確認すると……[n]
準備の進捗は [emb exp="f.進捗"]％ ってところだろうか。[next]
[eval exp="今日の進捗 += 進捗参加 + f.ヨシオ加速"]

[if exp="f.マリ参加"]
	[人物 画像=マリあはは 名前=貫井マリ]
	宣伝班のシフトは、とりあえず組んでから修正……っと。[n]
	あとは、隣のクラスと協力して、お客さんの流れはバッチリ！[next]
	[eval exp="今日の進捗 += 進捗参加 + f.マリ加速"]
[endif]

[if exp="f.カケル参加"]
	[人物 画像=カケルにこ 名前=梶野カケル]
	まあ、文化祭当日にクレームとかは来ないとは思うけど[n]
	ちゃんと準備してるに越したことはないよな。[next]
	[eval exp="今日の進捗 += 進捗参加 + f.カケル加速"]
[endif]

[if exp="f.イズミ参加"]
	[人物 画像=イズミしゃべる 名前=本多イズミ]
	調理の手間のことを考えると、品目はもう少し絞った方が[n]
	お客さんも満足するんじゃないのかな？[next]
	[eval exp="今日の進捗 += 進捗参加 + f.イズミ加速"]
[endif]

[if exp="f.マユ参加"]
	[人物 画像=マユ 名前=桜マユ]
	ふりふりの女の子用エプロンだけじゃくて[n]
	ロマンあふれるソムリエ風なのもあるんだよ☆[next]
	[eval exp="今日の進捗 += 進捗参加 + f.マユ加速"]
[endif]

[if exp="f.ミドリ参加"]
	[人物 画像=ミドリ断言 名前=美園ミドリ]
	本格喫茶なんだから、テーブルには花瓶も欲しいし、[n]
	壁には白いカーテンがあればいいけど、どこまでできるかな。[next]
	[eval exp="今日の進捗 += 進捗参加 + f.ミドリ加速"]
[endif]

[人物消去]

[メッセージ]
俺はどれくらい頑張ろうか……
[if exp="f.生命 + f.体力 > 80"]
	[四択 ア="&'全力投球だ ('+準備２+')'" イ="&'適度にやる ('+準備１+')'" ウ="&'見てるだけ ('+準備０+')'" エ="&'最後の追込み ('+準備３+')'"]
[else]
	[四択 ア="&'全力投球だ ('+準備２+')'" イ="&'適度にやる ('+準備１+')'" ウ="&'見てるだけ ('+準備０+')'"]
[endif]
[枠消去]
[if exp=ア]
	[体力 変化=&準備２]
	[eval exp="今日の進捗 += 進捗２ + f.主人公加速"]
[elsif exp=イ]
	[体力 変化=&準備１]
	[eval exp="今日の進捗 += 進捗１ + f.主人公加速"]
[elsif exp=ウ]
	[体力 変化=&準備０]
	[eval exp="今日の進捗 += 進捗０"]
[elsif exp=エ]
	[体力 変化=&準備３]
	[eval exp="今日の進捗 += 進捗３ + f.主人公加速"]
[endif]

[背景 画像=空き教室夕方]

*進捗表示

[cancelskip]
[枠][メッセージ]
[nowait]
参加者：自分   カレン  ヨシオ
[ch text="  イズミ" cond="f.イズミ参加"]
[ch text="   マユ " cond="f.マユ参加"]
[ch text="  カケル" cond="f.カケル参加"]
[ch text="  ミドリ" cond="f.ミドリ参加"]
[ch text="   マリ " cond="f.マリ参加"][r]
貢献度：[style autoreturn=false]
[font color=&色：強化 cond=f.主人公加速]
[ch text="&進捗２ + f.主人公加速 +'％ '" cond="ア"]
[ch text="&進捗１ + f.主人公加速 +'％ '" cond="イ"]
[ch text="&進捗０ +'％ '" cond="ウ"]
[ch text="&進捗３ + f.主人公加速 +'％ '" cond="エ"]
[font color=&色：文字]
＋  
[font color=&色：強化 cond=f.カレン加速]
[emb exp="進捗参加 + f.カレン加速"]％ 
[font color=&色：文字]
＋  
[font color=&色：強化 cond=f.ヨシオ加速]
[emb exp="進捗参加 + f.ヨシオ加速"]％ 
[font color=&色：文字]

[if exp="f.イズミ参加"]
	＋  [font color=&色：強化 cond=f.イズミ加速][emb exp="進捗参加 + f.イズミ加速"]％ [font color=&色：文字]
[endif]

[if exp="f.マユ参加"]
	＋  [font color=&色：強化 cond=f.マユ加速][emb exp="進捗参加 + f.マユ加速"]％ [font color=&色：文字]
[endif]

[if exp="f.カケル参加"]
	＋  [font color=&色：強化 cond=f.カケル加速][emb exp="進捗参加 + f.カケル加速"]％ [font color=&色：文字]
[endif]

[if exp="f.ミドリ参加"]
	＋  [font color=&色：強化 cond=f.ミドリ加速][emb exp="進捗参加 + f.ミドリ加速"]％  [font color=&色：文字]
[endif]

[if exp="f.マリ参加"]
	＋  [font color=&色：強化 cond=f.マリ加速][emb exp="進捗参加 + f.マリ加速"]％ [font color=&色：文字]
[endif]

[style autoreturn=true][r]
進捗  ：[emb exp="f.進捗"]％  →  [font color=&色：強化][emb exp="f.進捗 + 今日の進捗"]％[resetfont][next]
[endnowait]
[モノローグ終了]
[eval exp="f.進捗+=今日の進捗"]
[自分]
休日なのにわざわざ集まってくれてありがとう。[n]
じゃあ、今日はこれで解散。[next]

[枠消去]
[eval exp="f.休日準備 = 0"]
[return]


*初回準備
[場面転換]
[BGM 曲= 05日常.ogg ループ= 1 音量= 50]
[背景 画像= 教室]
[枠]
[モノローグ]
休日。今日は最初の作業日だ。[next]

この前のクラスの反応はいまいちだったけど、[n]
さすがに初日はみんな来るだろうな……。[next]
[モノローグ終了]

[自分]
おはよう！[間][間]……って、あれ？[next]

[BGM停止 時間=2000]

[モノローグ]
ドアを開けてみると、集まっていたのは[n]
恋ヶ窪さんと美園さん、本多さん、小平、梶野の５人だけだった。[next]

[モノローグ終了]
[自分]
え？ どういうことだよ？[n]
他のみんなは？[next]

[人物 画像= イズミやれやれ  名前= 本多イズミ]
まゆゆはコスプレ大会の準備、[n]
貫井さんは部活が忙しいんだってさ。[next]

他は知らない、サボりなんじゃなぁい？[n]
ふあぁ〜、ねっむ〜……。[next]

[人物 画像= ヨシオ困惑  名前= 小平ヨシオ]
予定の調整はつかないのか、一応聞いてはみたのだが、[n]
来られないの一点張りで……[next]

[自分]
（嘘だろ……まさかここまでやる気がないとは）[next]

[人物消去]

[人物 画像= カレンうーん  名前= 恋ヶ窪カレン]
……いくらなんでも出席率が悪すぎるわ。[next]

[表情 画像=カレン残念]
確かに急な招集だったけど……、[n]
ここまでやる気がないのはさすがにいただけないわよ。[next]
[人物消去]
[表情左 画像=カレン心配]

[人物右 画像= イズミへえ  名前= 本多イズミ]
えー、いいんじゃない？ 別に。[next]

こういうのって、[n]
やる気ない人に無理やりやらせても[n]
意味ないと思うんだよね。[next]
[表情左 画像=カレン真顔]

来たくないなら無理して来る必要ないって。[n]
それがお互いのためにもいいでしょ。[next]
[表情右 画像=イズミふーん]

[人物左 画像= カレンややおこ  名前= 恋ヶ窪カレン]
クラス単位での出し物なのよ！？[n]
クラス全員でやらなければそれこそ意味がないの！[next]
[表情左 画像=カレンむっ]

[人物右 画像= イズミおい  名前= 本多イズミ]
いや、そこにこだわって[n]
間に合わなかったら本末転倒だよ。[next]

[表情右 画像=イズミ説明]
なに？[間][間] だったら[n]
うちは準備できてませーんって当日に大恥かくつもり？[n]
なら止めないけどさ。[next]
[表情右 画像=イズミむすっ]

[BGM 曲=喧嘩.ogg 音量=70]
[人物左 画像= カレンおこ  名前= 恋ヶ窪カレン]
そんなつもりはないわ。[n]
間に合わせるわよ、もちろん。[n]
でも、そのためにはクラスみんなの協力が欠かせないの！[next]

だからみんなに来てほしいのに！[next]
[表情左 画像=カレンむっ]

[人物右 画像= イズミやれやれ  名前= 本多イズミ]
でもさ、[n]
モチベーション低い人間に来られても[n]
そっちの方が迷惑だよ。[next]

[表情右 画像=イズミおい]
効率を考えるなら[n]
団結とか悠長なこと言ってられないんじゃないの？[next]

[表情右 画像=イズミ不快]
これだからいい子ちゃんはめんどくさいんだよ……。[next]
[表情左 画像=カレンおこ]

[モノローグ]
恋ヶ窪さんと本多さんの言い合いは[n]
どんどんヒートアップしていく。[next]

これが女の戦いってやつか……。[n]
実際に見ると迫力がある。[next]

……って、そんなこと考えてる場合じゃない！[next]

[表情右 画像=イズミおこ]

そうこうしているうちにも[n]
二人は爆発寸前のところまで来ている。[next]

いい加減止めなければいけないと俺は焦り始めた。[next]
[モノローグ終了]

[人物消去]

[間][間]

[表情左遠い 画像=カレンむっ]
[表情右遠い 画像=イズミおこ]

[人物 画像= ヨシオ自信  名前= 小平ヨシオ]
まあまあ二人とも、それくらいにするんだ。[next]

[人物左遠い 画像= カレンねえ  名前= 恋ヶ窪カレン]
小平君？[next]

[人物右遠い 画像= イズミ不快  名前= 本多イズミ]
何だよヨッシー、なんか文句あんの？[next]

[BGM中断 時間=2000]
[モノローグ]
ナイスだ小平！ この状況をどうにかしてくれ！[next]
[モノローグ終了]

[表情右遠い 画像=イズミふーん]

[人物 画像= ヨシオ  名前= 小平ヨシオ]
まあ確かに[n]
恋ヶ窪さんも熱くなり過ぎた部分があるがね。[next]
[表情左遠い 画像=カレン真顔]

[表情 画像=ヨシオ自信]
しかし、冷静に考えて[n]
確かにマンパワーがある方が準備が捗るだろう。[next]

私情を優先するあまり作業をないがしろにするのは、[n]
さすがにどうかと僕も思う訳だよ。[next]

クラス全体の協力は必要なんだ。[n]
個人の気持ちの話は置いておいて、[n]
本多も人集めに協力すべきではないのかね？[next]

[表情 画像=ヨシオどや]
それに、団結することを通してクラスの絆も[n]
より深まるに違いないっ！[next]

[モノローグ]
…[間]…[間] ま[間] ず[間] い[next]

この状況で[n]
そんな上から目線な物言いをするのは[n]
火に油を注いでいるようなものじゃないか……[next]
[モノローグ終了]

[表情 画像=ヨシオ]

[間][間]

[BGM再開 音量=70]
[人物右遠い 画像= イズミ不快  名前= 本多イズミ]
……何？[n]
ヨッシー、そいつの肩持つ気？[next]

[表情 画像=ヨシオ困惑]
……マジがっかりしたわ。[next]

[人物左消去]
[表情右遠い 画像=イズミ説明]
[人物 画像=ヨシオ困惑 名前=小平ヨシオ]
えっ？ あ、いや、[n]
別にそういうつもりではなくてだな……。[next]

[人物右遠い 画像= イズミおい  名前= 本多イズミ]
そういえばアンタ、[n]
恋ヶ窪さんのこと尊敬してるとか言ってたもんね。[next]

[表情右遠い 画像=イズミ不快]
いいよ、ヨッシーの好きにしなよ。[n]
その代わり、こっちも好きなようにさせてもらうから。[next]

ぶっちゃけうちも文化祭とかかったるいしさ？[n]
正直来たくなかったんだけど、[n]
ヨッシーの顔を立てるためにしょうがなく来てやったんだよね。[next]

[表情右遠い 画像=イズミやれやれ]
でもマジ無理、[n]
このメンツと仲良くやれる気が全っ然しないわ。[next]
まゆゆも来る気ないみたいだし、[n]
意味ないからうち抜けさせてもらうわ。[next]

[表情右遠い 画像=イズミ仕方ない]
あとはどうぞご自由に。[n]
団結だとか絆だとか言って思う存分セイシュンしてなよ。[next]
[人物右消去]
[表情 画像=ヨシオ困惑]

[BGM停止 時間=4000]

[モノローグ]
そう言い捨てると、[n]
本多さんはスタスタと教室を出て行ってしまった。[next]
[モノローグ終了]

[人物消去]

[自分]
ちょっと待ってよ！ 本多さん！？[next]
[人物左消去]

[人物 画像= カレンおこ  名前= 恋ヶ窪カレン]
本当にいい加減な人なのね！ 呆れたわ！[next]

[人物 画像= カケルえっ  名前= 梶野カケル]
あのさ、お取込み中悪いんだけど、ちょっといいかな？[next]
[表情 画像=カケル]

[自分]
ん？ どうしたんだ梶野？[next]

[人物 画像=カケルえっ  名前= 梶野カケル]
今、やる気ないってことで本多が帰った訳じゃん？[next]

[表情 画像=カケルめそらし]
実を言うとオレも文化祭とか興味なくてさ。[n]
ミドリに付き合って来ただけなんだよね。[next]

[表情 画像=カケル]
でもやる気ない奴は来なくていいなら、[n]
オレも帰らせてもらうわ。[n]
休みの日は遊びたいし。[next]

[表情 画像=カケルえっ]
あ、平日くらいなら少しは協力するから。[n]
じゃあそういうことで。[next]
[人物消去]

[モノローグ]
梶野もさっさと[BGM 曲=piano2-悲しい.ogg 音量=50]教室を出て行ってしまった。[next]
[モノローグ終了]

[人物 画像= ミドリぎくっ  名前= 美園ミドリ]
えっ！？[n]
ちょ、ちょっと待ってよカケルくん！[next]
[人物消去]

[モノローグ]
美園さんまで慌てて後を追って去ってしまう。[next]
[モノローグ終了]

[人物 画像=カレン心配 名前=恋ヶ窪カレン]
ミドリ……[next]
[人物消去]

[モノローグ]
残ったのは、[n]
クラス委員の俺と恋ヶ窪さん、小平だけとなった。[next]
[モノローグ終了]

[人物 画像= ヨシオ困惑  名前= 小平ヨシオ]
……すまない。[n]
少し言い方が悪かったようだ。[next]
[人物消去]
[表情左 画像=ヨシオ]

[人物右 画像= カレン残念  名前= 恋ヶ窪カレン]
本当にどうなってるのこのクラス……。[n]
まともな人がほとんどいないじゃない！[next]

[自分]
（全くだよ……）[next]

[モノローグ]
呆れる気すら失った俺は、[n]
憤慨する恋ヶ窪さんの声をぼーっと聞いていた。[next]

本当にこんな調子で[n]
文化祭を成功させることができるのか……？[next]

[モノローグ終了]
[無限種入手  名前=人が集まらない休日準備 詳細= 文化祭なのにクラスがまとまらない……]
[足跡 名前=人が集まらない休日準備]
[人物全消去]
[枠消去]
[eval exp="f.休日準備 = 0"]
[return]
