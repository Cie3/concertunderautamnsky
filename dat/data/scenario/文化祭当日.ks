[eval exp="f.履歴許可 = true"]
[history output=true]
[eval exp="棒消去()"]
[ボタン表示]

[macro name=カレンより]
[if exp="f.カレン攻略"][名]
[else][姓]
[endif]
[endmacro]

[macro name=カレンへ]
[if exp="f.カレン攻略"]カレン
[else]恋ヶ窪さん
[endif]
[endmacro]

[macro name=スコア表示]
[nowait]進捗率：[font color=&色：強化 cond="highscore1"][emb exp="f.進捗"]％[resetfont]
　成績累計：[font color=&色：強化 cond="highscore2"][emb exp="f.試験の累計点数"][resetfont]点
　[font color=&色：強化][emb exp="'☆HIGHSCORE☆'" cond="highscore1 + highscore2"][resetfont][endnowait]
[endmacro]

[場面転換]
[BGM 曲=いよいよ文化祭.ogg 音量=60]

*エンド条件判定
[eval exp="var 最終人員 = 人員計算()"]
[eval exp="var ending = -1"]
[if exp="最終人員 == 8 && f.進捗 >= 100"][eval exp="ending = 6"]
[elsif exp="f.カレン攻略 && f.マリ攻略"][eval exp="ending = 9"]
[elsif exp="f.カレン攻略"][eval exp="ending = 7"]
[elsif exp="f.マリ攻略"][eval exp="ending = 8"]
[elsif exp="f.進捗 < 100"][eval exp="ending = 3"]
[elsif exp="最終人員 == 3"][eval exp="ending = 4"]
[else][eval exp="ending = 5"]
[endif]

[eval exp="var 仮リザルト = false"]
*仮リザルト
[if exp="仮リザルト"]
	[枠][メッセージ]
	文化祭準備の進捗率：[emb exp="f.進捗"]％[n]
	攻略したヒロイン：
	[if exp="f.マリ攻略 + f.カレン攻略 == 0"]なし[endif]
	[if exp="f.カレン攻略"]カレン[endif]
	[if exp="f.カレン攻略 && f.マリ攻略"]・[endif]
	[if exp="f.マリ攻略"]マリ[endif]
	[n]
	参加した人数（自分を含む）：[emb exp="最終人員"][next]
[endif]

*エンドフラグ・スコア処理
[eval exp="var highscore1 = 0"]
[eval exp="var highscore2 = 0"]
[if exp="ending == 3"]
	[eval exp="sf.エンド３：失敗カフェ = 1"]
	[eval exp="var highscore1 = 1" cond="f.進捗 > sf.ハイスコア進捗３"]
	[eval exp="var highscore2 = 1" cond="f.試験の累計点数 > sf.ハイスコア成績３"]
	[eval exp="sf.ハイスコア進捗３ = Math.max(f.進捗, sf.ハイスコア進捗３)"]
	[eval exp="sf.ハイスコア成績３ = Math.max(f.試験の累計点数, sf.ハイスコア成績３)"]
	[if exp="仮リザルト"]エンド３：失敗カフェ[n]文化祭準備が足りなかった。[next][endif]
[elsif exp="ending == 4"]
	[eval exp="sf.エンド４：三人の精鋭 = 1"]
	[eval exp="var highscore1 = 1" cond="f.進捗 > sf.ハイスコア進捗４"]
	[eval exp="var highscore2 = 1" cond="f.試験の累計点数 > sf.ハイスコア成績４"]
	[eval exp="sf.ハイスコア進捗４ = Math.max(f.進捗, sf.ハイスコア進捗４)"]
	[eval exp="sf.ハイスコア成績４ = Math.max(f.試験の累計点数, sf.ハイスコア成績４)"]
	[if exp="仮リザルト"]エンド４：三人の精鋭[n]カレン・ヨシオ・主人公だけで攻略した。[next][endif]
[elsif exp="ending == 5"]
	[eval exp="sf.エンド５：文化祭成功 = 1"]
	[eval exp="var highscore1 = 1" cond="f.進捗 > sf.ハイスコア進捗５"]
	[eval exp="var highscore2 = 1" cond="f.試験の累計点数 > sf.ハイスコア成績５"]
	[eval exp="sf.ハイスコア進捗５ = Math.max(f.進捗, sf.ハイスコア進捗５)"]
	[eval exp="sf.ハイスコア成績５ = Math.max(f.試験の累計点数, sf.ハイスコア成績５)"]
	[if exp="仮リザルト"]エンド５：文化祭成功[n]文化祭は成功したが、他のエンドの条件を満たさなかった。[next][endif]
[elsif exp="ending == 6"]
	[eval exp="sf.エンド６：秋空のコンチェルト = 1"]
	[eval exp="var highscore1 = 1" cond="f.進捗 > sf.ハイスコア進捗６"]
	[eval exp="var highscore2 = 1" cond="f.試験の累計点数 > sf.ハイスコア成績６"]
	[eval exp="sf.ハイスコア進捗６ = Math.max(f.進捗, sf.ハイスコア進捗６)"]
	[eval exp="sf.ハイスコア成績６ = Math.max(f.試験の累計点数, sf.ハイスコア成績６)"]
	[if exp="仮リザルト"]エンド６：秋空のコンチェルト[n]全員が準備に参加して、文化祭を成功させた。[next][endif]
[elsif exp="ending == 7"]
	[eval exp="sf.エンド７：高嶺のお嬢様 = 1"]
	[eval exp="var highscore1 = 1" cond="f.進捗 > sf.ハイスコア進捗７"]
	[eval exp="var highscore2 = 1" cond="f.試験の累計点数 > sf.ハイスコア成績７"]
	[eval exp="sf.ハイスコア進捗７ = Math.max(f.進捗, sf.ハイスコア進捗７)"]
	[eval exp="sf.ハイスコア成績７ = Math.max(f.試験の累計点数, sf.ハイスコア成績７)"]
	[if exp="仮リザルト"]エンド７：高嶺のお嬢様[n]カレンを攻略した。[next][endif]
[elsif exp="ending == 8"]
	[eval exp="sf.エンド８：迷える突撃娘 = 1"]
	[eval exp="var highscore1 = 1" cond="f.進捗 > sf.ハイスコア進捗８"]
	[eval exp="var highscore2 = 1" cond="f.試験の累計点数 > sf.ハイスコア成績８"]
	[eval exp="sf.ハイスコア進捗８ = Math.max(f.進捗, sf.ハイスコア進捗８)"]
	[eval exp="sf.ハイスコア成績８ = Math.max(f.試験の累計点数, sf.ハイスコア成績８)"]
	[if exp="仮リザルト"]エンド８：迷える突撃娘[n]マリを攻略した。[next][endif]
[elsif exp="ending == 9"]
	[eval exp="sf.エンド９：悔い改めよ = 1"]
	[eval exp="var highscore1 = 1" cond="f.進捗 > sf.ハイスコア進捗９"]
	[eval exp="var highscore2 = 1" cond="f.試験の累計点数 > sf.ハイスコア成績９"]
	[eval exp="sf.ハイスコア進捗９ = Math.max(f.進捗, sf.ハイスコア進捗９)"]
	[eval exp="sf.ハイスコア成績９ = Math.max(f.試験の累計点数, sf.ハイスコア成績９)"]
	[if exp="仮リザルト"]エンド９：悔い改めよ[n]２人のヒロインを要領よく攻略した。[next][endif]
[endif]

*開始
[背景 画像= 廊下]
[枠]

[モノローグ]
今日は文化祭当日だ。[n]
今まで大変なこと、つらいこともあったけど[n]
それも全部今日のためだと思えば頑張れたんだ。[next]

よし、クラスのみんなの様子を見に行こう。[next]

[モノローグ終了]

;-----------------------------ここからカフェ分岐
[jump target="*カフェ失敗" cond="f.進捗 < 100"]
[jump target="*カフェ成功" cond="f.進捗 >= 100"]

*カフェ失敗

[場面転換]
[背景 画像= 教室]
[枠]

[モノローグ]
なんだか教室の様子が騒がしいな……[next]
[モノローグ終了]


[表情左 画像= ヨシオ  名前= 小平ヨシオ]
[人物右 画像= カレンうーん  名前= 恋ヶ窪カレン]
もう、どうしてこんなことに……[next]

[表情右 画像= カレン心配  名前= 恋ヶ窪カレン]
[人物左 画像= ヨシオ自信  名前= 小平ヨシオ]
良かった、[姓]、来てくれたんだな。[next]

[自分]
いったいどうしたんだ……？[next]

[モノローグ]
もうすぐ開店の時間だというのに内装も間に合っていない。[n]
さらにクラスメイトの姿もほとんどいない……[next]
[モノローグ終了]

[表情左 画像= ヨシオ  名前= 小平ヨシオ]
[人物右 画像= カレン残念  名前= 恋ヶ窪カレン]
今朝になって今日の文化祭は休むと言い出した人が[n]
あまりにも多くて、何もかもが間に合っていないのよ。[next]

[表情右 画像= カレン心配  名前= 恋ヶ窪カレン]
[人物左 画像= ヨシオ  名前= 小平ヨシオ]
どうせこの喫茶店はうまくいかない、と[n]
みんな踏んだらしくてな。[next]

[自分]
……仕方がない、俺たちだけでもなんとかやってみよう。[n]
机と椅子、飲み物とお菓子、それと店員がいればなんとかなるはずだ。[next]

[人物右 画像= カレン残念  名前= 恋ヶ窪カレン]
そうね、今はやるしかないわ。[next]

[人物左消去]
[人物右消去]

[メッセージ]
なんとか開店時間には間に合わせたけど……[n]
とにかく店員が足りない……[next]

[表情右 遠い 画像= カレン  名前= 恋ヶ窪カレン]
[表情 画像= 女子生徒イ  名前= 女性客]
[人物左 遠い 画像= 女子生徒ア  名前= 女性客]
あのー、注文いいですか？[next]

[人物右 遠い 画像= カレンしゃべる  名前= 恋ヶ窪カレン]
は、はいっ！！[next]

[人物左 遠い 画像= 女子生徒ア  名前= 女性客]
オレンジジュースと、レモンティーと……[next]

[人物右 遠い 画像= カレン心配  名前= 恋ヶ窪カレン]
レモンティー……？ そんなものあったかしら……[next]

[人物 画像= 女子生徒イ  名前= 女性客]
えっ、でもメニューに書いてあるんだけど。[next]

[人物右 遠い 画像= カレンびっくり  名前= 恋ヶ窪カレン]
確認してきます……！！！[next]
[人物右消去]
[枠消去]
[ま][ま][ま][ま]
[枠]
[人物右 遠い 画像= カレン残念  名前= 恋ヶ窪カレン]
あの……手違いで今日はレモンティーは……[next]

[人物左 遠い 画像= 女子生徒ア  名前= 女性客]
…………[next]

[人物 画像= 女子生徒イ  名前= 女性客]
…………[next]

[人物右 遠い 画像= カレン残念  名前= 恋ヶ窪カレン]
申し訳ありません……[next]

[人物左 遠い 画像= 女子生徒ア  名前= 女性客]
……そう。じゃあ、いいです。[next]

[人物 画像= 女子生徒イ  名前= 女性客]
行こっか？[next]

[人物左 遠い 画像= 女子生徒ア  名前= 女性客]
うん。[next]

[人物左消去]
[人物消去]

[人物右 画像= カレンうーん  名前= 恋ヶ窪カレン]
…………[next]

[人物右消去]

[モノローグ]
そのあともなかなか注文を取りに来ない、[n]
メニューに書いてある商品がない……とお客さんを[n]
怒らせる場面が何度もあった。[next]

[カレンへ]も、小平も頑張ってくれていたけど……[next]

[モノローグ終了]

[人物左 画像= ヨシオ困惑  名前= 小平ヨシオ]
[姓]！ 厨房の人手が足りない！[n]
こちらに入ってくれ！[next]

[人物右 画像= カレンおこ  名前= 恋ヶ窪カレン]
それどころじゃないわ、注文を取る店員の方は[n]
これ以上減らせないわよ！[n]
[カレンより]くんはこのままフロアをやって！[next]

[人物左 画像= ヨシオ困惑  名前= 小平ヨシオ]
注文を取る前に、商品が提供できる環境を[n]
整えるべきではないのか！？[next]

[自分]
二人とも……ごめん……[n]
俺がもっとしっかりしていれば……[next]
[jump target="*カフェ合流"]
*カフェ失敗x

*カフェ成功

*カレン
[場面転換][背景 画像= 教室][枠]
[jump target="*カレンけんか" cond="f.カレンけんか"]
[表情 画像= カレン  名前= 恋ヶ窪カレン]

[モノローグ]
[カレンへ]が店の奥のキーボードを弾いている。[n]
とてもいいＢＧＭだ。[next]
[モノローグ終了]

[自分]
さすがだね、[カレンへ]。[n]
本格喫茶って感じが出るよ。[next]

[人物 画像= カレンしゃべる  名前= 恋ヶ窪カレン]
そんなことないわ。[n]
ただ好きなピアノを弾かせてもらっているだけよ。[next]

でもこんな風にそれぞれの特技を活かせる文化祭に[n]
できたのも[カレンより]くんのおかげね。[next]
[表情 画像= カレン  名前= 恋ヶ窪カレン]

[自分]
そんな、俺のおかげだなんて言い過ぎだよ。[n]
俺はただ、文化祭をみんなと楽しくできたらいいなぁって[n]
思ってやってきただけだから……[next]

[人物 画像= カレンしゃべる  名前= 恋ヶ窪カレン]
そういうところが実行委員に向いていたのよ、きっと。[next]

自分に自信を持ってもいいんじゃないかしら？[next]
[表情 画像= カレン  名前= 恋ヶ窪カレン]

[自分]
そ、そうかな……？[n]
[カレンへ]に言われるとそんな気がしてくるよ。[next]

[人物 画像= カレンしゃべる  名前= 恋ヶ窪カレン]
他の人の様子も見に行ってあげたらどう？[n]
何か困っている人がいたら、手助けするのが[n]
[カレンより]くんの役目でしょう？[next]
[表情 画像= カレン  名前= 恋ヶ窪カレン]

[自分]
うん、[カレンへ]も何かあったらすぐに言ってね。[n]
俺にできることなら何でもするから。[next]

[人物 画像= カレンにこ  名前= 恋ヶ窪カレン]
ふふ、ありがとう、またあとでね。[next]
[jump target="*カレンx"]

*カレンけんか
[表情 画像= カレン  名前= 恋ヶ窪カレン]
[モノローグ]
[カレンへ]が店の奥のキーボードを弾いている。[n]
とてもいいＢＧＭだ。[next]
[モノローグ終了]

[自分]
……さすがだね、[カレンへ]。[n]
本格喫茶って感じが出るよ。[next]

[人物 画像= カレン発言  名前= 恋ヶ窪カレン]
そんなことないわ。[n]
ただ好きなピアノを弾かせてもらっているだけよ。[next]

でもこんな風にそれぞれの特技を活かせる文化祭に[n]
できたのもみんなのおかげね。[next]
[表情 画像= カレン真顔  名前= 恋ヶ窪カレン]

[自分]
そうだね……[next]

[人物 画像= カレンねえ  名前= 恋ヶ窪カレン]
あと、いろいろ手伝ってくれてありがとう。[n]
あなたが頑張ってくれたの、とても励みになったわ。[next]

自分に自信を持ってもいいんじゃないかしら？[next]
[表情 画像= カレン心配  名前= 恋ヶ窪カレン]

[自分]
そ、そうかな……？[n]
[カレンへ]に言われるとそんな気がしてくるよ。[next]

[人物 画像= カレン残念  名前= 恋ヶ窪カレン]
他の人の様子も見に行ってあげたらどう？[n]
何か困っている人がいたら、手助けするのが[n]
[カレンより]くんの役目でしょう？[next]
[表情 画像= カレン心配  名前= 恋ヶ窪カレン]

[自分]
うん、[カレンへ]も何かあったらすぐに言ってね。[n]
俺にできることなら何でもするから。[next]

[人物 画像= カレンうーん  名前= 恋ヶ窪カレン]
そう、ありがとう……[next]
*カレンx

*ヨシオ
[場面転換][背景 画像= 教室][枠]

[人物 画像= ヨシオ自信  名前= 小平ヨシオ]
これを２番テーブルに運んでくれ。[n]
その次は３番テーブルの注文を取りに行って……[next]

[自分]
小平、何か困ったことはあるか？[next]

[人物 画像= ヨシオどや  名前= 小平ヨシオ]
ふふ、見てくれ、この完璧な采配を！[n]
どの客にも待たせることなくフロアは回っているぞ。[next]

[自分]
ははっ、それは良かったよ。[next]

(小平を店員にしないで指示係にしたのは正解だったな。[n]
　正直、接客できるか不安だったし……)[next]

[人物 画像= ヨシオきりっ  名前= 小平ヨシオ]
感謝しているぞ、[姓]。[next]

[自分]
えっ？ 突然どうしたんだよ？[next]

[人物 画像= ヨシオふむ  名前= 小平ヨシオ]
去年の文化祭も僕のクラスは出店だったんだが、[n]
クラスメイトからはあまり店に出ないでくれ、と言われてな。[next]

[表情 画像= ヨシオ説明  名前= 小平ヨシオ]
本多からも[n]
「ヨッシーって店員さんって感じしないから仕方ないよ」[n]
と言われる始末だ……[next]

[表情 画像= ヨシオ優しい  名前= 小平ヨシオ]
だから今年も当日はあまり出番がないと思ってたんだが[n]
こんな風に機会を与えてくれたこと、感謝している。[next]

[自分]
小平……[next]

今日一日、残りも頼むよ。[n]
喫茶店がうまくいくかどうか、小平にかかってるんだから。[next]

[人物 画像= ヨシオどや  名前= 小平ヨシオ]
当然だ、この僕にかかれば[n]
売上を３倍にすることも不可能ではないっ！[next]
*ヨシオx

[jump target="*イズミx" cond="!f.イズミ参加"]
*イズミ
[場面転換][背景 画像= 教室][枠]
[表情 画像=イズミむすっ]
[自分]
本多さん、何か困ったことない？[n]
大丈夫？[next]

[人物 画像= イズミおい  名前= 本多イズミ]
客多すぎ！ 注文多すぎ！[n]
厨房のこともちょっとは考えてよね！[next]
[表情 画像=イズミむすっ]

[自分]
あはは……[next]

[人物 画像= イズミやったぜ  名前= 本多イズミ]
まあ、それだけお客さん入ってるってことだし。[n]
嬉しい悲鳴ってやつ？[next]
[表情 画像=イズミ]

[自分]
うん、本多さんの焼いてくれたお菓子、おいしいって[n]
お客さんからも評判だよ。[next]

本当に、本多さんがお菓子作り得意で助かったよ。[n]
俺と恋ヶ窪さんだと料理の知識はさっぱりだったから……[next]

[人物 画像= イズミ仕方ない  名前= 本多イズミ]
でも、文化祭なかったらお菓子作りが特技なんて[n]
みんなに知ってもらえなかっただろうな。[next]

バレンタインでもないのに、お菓子焼いて来るなんて[n]
なんだか恥ずかしくてできないし。[next]
[表情 画像=イズミ]

[自分]
じゃあ、これからはたまにでいいから持ってきてよ。[n]
クラスのみんなも食べたいだろうし。[next]

[人物 画像= イズミしゃべる  名前= 本多イズミ]
じゃあ、そうしよっかなー[n]
これで、うちのお菓子を食べて、彼氏になってくれる人が[n]
いるといいんだけど！[next]
[表情 画像=イズミ]

[自分]
う、うん、そうだね……[next]

[人物 画像= イズミやったぜ  名前= 本多イズミ]
なーに？ なんか文句ある？[next]
[表情 画像=イズミ]

[自分]
いや、なんでもない！ じゃあ俺、別の人のところ行くから！[n]
何か困ったことあったら呼んで！[next]
*イズミx

[jump target="*カケルx" cond="!f.カケル参加"]
*カケル
[場面転換][背景 画像= 教室]

[表情左 遠い 画像= 女子生徒ア  名前= 女性客]
[表情 画像= 女子生徒イ  名前= 女性客]
[枠]
[人物右 遠い 画像= カケルにこ  名前= 梶野カケル]
いらっしゃいませ、ご注文は何になさいますか。[next]
[表情右遠い 画像=カケルふっ]

[人物左 遠い 画像= 女子生徒ア  名前= 女性客]
えーっと、うーん、どうしよう？ 何がいいかな？[next]

[人物 画像= 女子生徒イ  名前= 女性客]
えー、どれもいいなぁ、迷っちゃうよ〜[next]

[人物右 遠い 画像= カケルにこ  名前= 梶野カケル]
オレのオススメは、これかな。[n]
甘すぎなくて好きなんだ。[next]
[表情右遠い 画像= カケルふっ]

[人物左 遠い 画像= 女子生徒ア  名前= 女性客]
そう言うなら……[n]
店員さん、かっこいいし……[next]

[人物 画像= 女子生徒イ  名前= 女性客]
うん、これにします。[n]
ね、かっこいいもん。[next]

[人物右 遠い 画像= カケル安らか  名前= 梶野カケル]
ありがとうございます。失礼いたします。[next]

[人物消去]
[人物左消去]
[人物右消去]


[表情 画像= カケル  名前= 梶野カケル]
[自分]
梶野、さすが人気あるな……[n]
何か困ったことはある？[next]

[人物 画像= カケルはあ  名前= 梶野カケル]
正直女子に騒がれ過ぎて困ってるけど。[n]
まあ、オレが役に立てるのこれくらいだしな。[next]
[表情 画像=カケル]

[自分]
これくらい、なんて言うなよ！[n]
俺は梶野みたいにうまく接客できない。[next]

梶野が文化祭に参加してくれて本当によかったって[n]
俺は思ってるんだ。[next]

[人物 画像= カケルにこ  名前= 梶野カケル]
[姓]……[next]

[if exp="f.ミドリ参加"]……まあ、お前の頼みだしな。[n]
[else]……まあ、たまには良いトコ見せないとな。[n]
[endif]
最後まで頑張るよ。[next]
[表情 画像=カケルふっ]

[自分]
ああ！[n]
また何か困ったことがあったらすぐに相談してよ。[next]
*カケルx

[jump target="*ミドリx" cond="!f.ミドリ参加"]
*ミドリ
[場面転換][背景 画像= 教室][枠]

[人物 画像= ミドリ発言  名前= 美園ミドリ]
よいしょっと……[next]
[表情 画像=ミドリうーん]

[自分]
美園さん、どうしたの？[next]

[人物 画像= ミドリ苦笑  名前= 美園ミドリ]
あ、[姓]くん。[next]

あの、内装で、布がはがれてるところがあったから[n]
補強してるところなの。[next]
[表情 画像=ミドリ]

[自分]
一人じゃあ、大変でしょ。[n]
俺も手伝うよ。[next]

[人物 画像= ミドリぎくっ  名前= 美園ミドリ]
そ、そんな、悪いよ、大丈夫……[next]

[自分]
一人より二人でやった方が早いからさ。[next]

[人物 画像= ミドリ苦笑  名前= 美園ミドリ]
ありがとう……[next]
[枠消去]

[間][間][間][間]

[枠]
[人物 画像= ミドリ発言  名前= 美園ミドリ]
あのね、[姓]くん、色々その……ありがとう。[next]
[表情 画像=ミドリうーん]

[自分]
え、俺、何もしてないよ？[next]

[人物 画像= ミドリ苦笑  名前= 美園ミドリ]
カケル君のこともそうなんだけど……[next]

去年からやりたいって思ってた本格喫茶が[n]
文化祭でちゃんとできたのは[姓]くんのおかげだから。[n]
私、今、すごく嬉しくて……[next]
[表情 画像=ミドリ]

[自分]
俺の方こそ美園さんに感謝しないといけないよ。[next]

[人物 画像= ミドリ発言  名前= 美園ミドリ]
え？[next]

[自分]
美園さんが本格喫茶って案を出してくれなかったら[n]
今、うちのクラスは何をしていたのかわからない。[next]

それに美園さんがこうやって内装にこだわって[n]
色々と準備してくれたから今日があるんだ。[next]

[人物 画像= ミドリ苦笑  名前= 美園ミドリ]
[姓]くん……[next]
[表情 画像=ミドリ]

[自分]
よし、できた。[n]
また、何か困ったことがあったらいつでも呼んでくれていいから。[next]

[人物 画像= ミドリ笑顔  名前= 美園ミドリ]
うん……！[next]
*ミドリx

[jump target="*マユx" cond="!f.マユ参加"]
*マユ
[場面転換][背景 画像= 教室][枠]

[人物 画像= マユ笑顔  名前= 桜マユ]
魔法少女くーも☆ＤＯＮ！[n]
今日も世界を救っちゃうよ〜[next]

[自分]
はりきってるね、桜さん。[n]
文化祭のコスプレ大会出るんだっけ。[next]

[人物 画像= マユむう  名前= 桜マユ]
気持ちまでしっかりなりきるのがコスプレは大事なんだよ〜[n]
ほら、[姓]くんにも魔法かけちゃうぞ！[next]

[自分]
あはは……[next]

でもうちのクラスの様子も見てから大会に行って欲しいな。[n]
桜さんのデザインした制服、結構評判だから。[next]

[人物 画像= マユえっ  名前= 桜マユ]
そ、そうなの……？[next]

[自分]
うん、動きやすい上に可愛いって[n]
店員してる生徒からも、お客さんからも話題になってるよ。[n]
きっとみんなから褒められるんじゃないかな。[next]

[人物 画像= マユはわわ  名前= 桜マユ]
ボク、そういうの、慣れてないから……[n]
もう、行くねっ！[next]

[自分]
あっ、待って……！[next]

[人物 画像= マユ  名前= 桜マユ]
…………[next]

[表情 画像= マユ笑顔  名前= 桜マユ]

ありがとう、[姓]くん。[n]
ボク、ちょっとだけ、誰かの役に立てたみたい。[next]

[自分]
桜さん……[next]

[人物 画像= マユ  名前= 桜マユ]
魔法少女くーも☆ＤＯＮ！[n]
文化祭の平和はボクが守るのだー！[next]
*マユx

[jump target="*マリx" cond="!f.マリ参加"]
*マリ
[場面転換][背景 画像= 教室][枠]

[自分]
さっきから来店するお客さんがどんどん増えてる……[n]
どうしたんだ……？[next]

[人物 画像= マリ  名前= 貫井マリ]
あっ、[姓]！[n]
これからあと10人来るんだけど席あるかな？[next]

[表情 画像= マリうん  名前= 貫井マリ]

[自分]
えっと……[n]
５人ずつ半分にわければ大丈夫そうだよ。[next]

さっきからお客さんの数が増えてるんだけど[n]
もしかして貫井さんの呼び込みのおかげ？[next]

[人物 画像= マリえっ  名前= 貫井マリ]
えっ、あたしはただテニス部とか、[n]
あと他の運動部の子に声かけただけで……[next]
[表情 画像=マリうん]

[人物左 遠い 画像= 女子生徒ア  名前= テニス部員]
あ、マリ！[n]
マリのお店ってここ？[next]

[人物 画像= マリあはは  名前= 貫井マリ]
うん、そうなんだ。[n]
入って、入って！[next]

[人物右 遠い 画像= 女子生徒イ  名前= テニス部員]
貫井先輩、来ちゃいました！[n]
うわー、素敵な喫茶店！[n]
何かオススメのメニューありますか？[next]

[人物 画像= マリあはは  名前= 貫井マリ]
ありがとう！[n]
マドレーヌがすっごく美味しいの。[n]
良かったら、食べてみてね！[next]

[表情 画像= マリうん  名前= 貫井マリ]

[人物左消去]
[人物右消去]

[自分]
こんなにお客さんが来るなんて……[n]
貫井さんの呼び込みのおかげだよ！[next]
[if exp="f.マリけんか"]
	[人物 画像=マリうーん 名前=貫井マリ]
	…………[next]
	[表情 画像=マリ真面目]
	[姓]って、ほんと人をほめるのがうまいよね。[next]
	[表情 画像=マリ悲しい]
	
	[自分]
	え、そうかな……[next]
	[jump target="*マリx"]
[endif]

[人物 画像= マリ  名前= 貫井マリ]
そ、そんなことない、っていうか……[n]
[姓]のおかげっていうか……[next]

[自分]
え？[next]

[人物 画像= マリ真面目  名前= 貫井マリ]
確かに、あたし顔は広いんだけど[n]
後輩や同期から人気があるわけじゃあないし……[next]

[表情 画像= マリよし  名前= 貫井マリ]
でも、[姓]が色々と相談に乗ってくれたおかげで[n]
少し自分に自信が持てるようになったっていうか。[next]
[表情 画像=マリ]
それ以来、ちょっと周りとの距離も近くなった気がしてね。[next]

あたしの呼び込みでみんな来てくれるようになったのも[n]
きっと、そういうのがあったからと思うんだ。[next]
[表情 画像=マリうん]

[自分]
貫井さん……[next]

[人物 画像= マリあはは  名前=貫井マリ]
つまり、[姓]、その……ありがとう！[next]
[表情 画像=マリうん]

[自分]
う、うん……！[n]
また、何か困ったことがあったらいつでも言ってね。[next]

[if exp="f.マリ攻略"]
[人物 画像=マリ哀愁の笑み 名前=貫井マリ]
あと、あのさ……[next]

[自分]
ん？[next]

[人物 画像=マリあちゃー 名前=貫井マリ]
今日の後夜祭……どうかな？[n]
なんちゃって。[next]
[表情 画像=マリうーん]

[自分]
あはは、わかった。いいよ。[next]

[人物 画像=マリあはは 名前=貫井マリ]
よし、今日も残り、頑張るぞ！[ま][ま] おー！[next]
[endif]
*マリx
*カフェ合流

*後夜祭発表
[BGM停止 時間=2000]
[場面転換]
[背景 画像= 体育館][枠]
[cancelskip]

[モノローグ]
二日間の文化祭が終わり、後夜祭……[next]
[BGM停止]
[BGM 曲=文化祭発表.ogg 音量=80]
文化祭の来場者や人気の出し物などの結果が発表される。[next]

去年の俺だったら全然興味がなかったけど[n]
クラス実行委員を務めた今年は少し緊張するな……[next]
[モノローグ終了]

[人物 画像= 女子生徒ア  名前= 文化祭実行委員長]
みなさん文化祭楽しみましたかー？[SE buf=1 音=歓声 音量=50][next]

じゃあ、早速お待ちかねの結果発表です！[next]

;[BGM停止 時間=3000]
[モノローグ]
[fadese buf=1 time=1000]
来場者数や様々なイベントの結果のまとめが発表される。[next]

そして……[next]
[モノローグ終了]

[人物 画像= 女子生徒ア  名前= 文化祭実行委員長]
さて、今年の文化祭もそろそろおしまいです！[n]
文化祭に来てくれたお客さんに、[n]
最も楽しかった企画に投票していただきました！[next]

それでは結果発表です！[next]

;-----------------------------ここから発表分岐

[jump target="*発表失敗x" cond="f.進捗 >= 100"]
*発表失敗
三位……[ま][ま][n]
[SE buf=0 音=シンバル 音量=50]３年１組 焼きそば屋台[SE buf=2 音=拍手短い 音量=50][SE buf=1 音=歓声 音量=50] 「バーニング☆ヌードル！」[fadese buf=1 time=1000][ま][ま][ま][ま][ま][next]
[SE停止 buf=1]
二位……[ま][ま][n]
[SE buf=0 音=シンバル 音量=50]３年４組 お化け屋敷[SE buf=2 音=拍手短い 音量=50] 「恐怖の廃病院」[fadese buf=1 time=1000][ま][ま][ま][ま][ま][next]
[SE停止 buf=1]
[SE buf=2 音=ドラムロール 音量=100]そして一位は……[ま][ま][ま][next]
[BGM停止]
[fadese buf=2 time=500]
[ま][ま][ま]
[SE buf=1 音=シンバル 音量=70]
３年３組 数学占い[SE buf=2 音=歓声 音量=80] 「タカＴ大御殿」！！[SE buf=0 音=拍手長い 音量=60][ま][ま][ま][ま][ま][next]

一位になったクラスの実行委員さんは壇上に出てきてくださーい！[next]
[人物消去]

[fadese buf=0 time=500]
[fadese buf=1 time=500]
[fadese buf=2 time=500]

[BGM 曲=piano2-悲しい.ogg 音量=50]
[人物左 画像= カレン残念  名前= 恋ヶ窪カレン]
そうよね……お客さん怒らせたりしてしまったもの。[next]

[人物右 画像= ヨシオ説明  名前= 小平ヨシオ]
少ない人数で努力はしたが……無理だったということだ。[next]

[自分]
…………[next]

[人物右 画像= ヨシオふむ  名前= 小平ヨシオ]
今年の反省を活かすことを考える……[n]
それが我々にできる精一杯の事だ。[next]
[表情右 画像=ヨシオ説明]
屈辱ではあるが……[ま][ま]現実を受け入れるしかあるまい……！[next]

[モノローグ]
俺たち三人はがっくりと肩を落とし[n]
それ以上会話することがしばらくできなかった。[next]
[BGM停止 時間=2000]
[モノローグ終了]
[jump target="*発表合流"]
*発表失敗x

*発表成功
三位……[ま][ま][n]
[SE buf=0 音=シンバル 音量=50]３年４組 お化け屋敷[SE buf=2 音=拍手短い 音量=50][SE buf=1 音=歓声 音量=50] 「恐怖の廃病院」[fadese buf=1 time=1000][ま][ま][ま][ま][ま][next]
[SE停止 buf=1]
二位……[ま][ま][n]
[SE buf=0 音=シンバル 音量=50]３年３組 数学占い[SE buf=2 音=拍手短い 音量=50] 「タカＴ大御殿」[fadese buf=1 time=1000][ま][ま][ま][ま][ま][next]
[SE停止 buf=1]
[SE buf=2 音=ドラムロール 音量=100]そして一位は……[ま][ま][ま][next]

[fadese buf=2 time=500]
[ま][ま][ま]
[SE buf=1 音=シンバル 音量=70]
２年２組 本格喫茶[SE buf=2 音=歓声 音量=80] 「カフェ・コンチェルト」！！[SE buf=0 音=拍手長い 音量=60][ま][ま][ま][ま][ま][next]

[if exp="f.進捗 >= 150"]
審査員の中でも満場一致で選ばれました！！[SE buf=1 音=拍手長い 音量=100][n]
秋ヶ谷高校の歴史に刻まれる素晴らしいカフェだと[n]
[SE buf=2 音=歓声 音量=60]先生からの高い評価をいただきましたー！！！[next]
[endif]

一位になったクラスの実行委員さんは壇上に出てきてくださーい！[next]
[人物消去]

[fadese buf=2 time=1000]

[人物 画像= カレン  名前= 恋ヶ窪カレン]
[if exp="f.カレンけんか"]
[表情 画像=カレン真顔]
……えっと、行きましょうか。[next]
[自分]
うん……[next]
[elsif exp="f.カレン攻略"]
[名]くん、行こっか？[next]
[自分]
うん……！！[next]
[else]
[カレンより]くん、行きましょう？[next]
[自分]
うん……！！[next]
[endif]

[場面転換][背景 画像=体育館][枠]

[表情左 画像= カレン  名前= 恋ヶ窪カレン]
[人物右 画像= 女子生徒ア  名前= 文化祭実行委員長]
一位おめでとうございます！[n]
[SE buf=2 音=拍手長い 音量=60]賞状と粗品をどうぞ！[next]

[自分]
ありがとうございます！[next]

[モノローグ]
壇上からはクラスのみんなの笑顔が見える。[next]
[モノローグ終了]

[if exp="f.カレンけんか"]
[人物左 画像= カレン発言  名前= 恋ヶ窪カレン]
[カレンより]くん、私達やり遂げたのね……[n]
最初はどうなることかと思ったけど。[next]
[表情左 画像=カレン真顔]

[自分]
うん、本当に[カレンへ]がいて良かった。[n]
一位になったのは[カレンへ]のおかげだよ。[next]

[人物左 画像= カレンねえ  名前= 恋ヶ窪カレン]
ううん、[カレンより]くんがいたからこそよ。[n]
私ひとりじゃクラスを[ルビ 読み=まと]纏められなかった。[next]

[else]

[人物左 画像= カレンしゃべる  名前= 恋ヶ窪カレン]
[カレンより]くん、私達やり遂げたのね……[n]
最初はどうなることかと思ったけど。[next]
[表情左 画像=カレンにこ]

[自分]
うん、本当に[カレンへ]がいて良かった。[n]
一位になったのは[カレンへ]のおかげだよ。[next]

[人物左 画像= カレン哀愁  名前= 恋ヶ窪カレン]
ううん、[カレンより]くんがいたからこそよ。[n]
私ひとりじゃクラスを[ルビ 読み=まと]纏められなかった。[n]
本当にありがとう。[next]
[endif]
[jump target="*発表合流"]
*発表成功x
*発表合流

;-----------------------------ここからエンディング分岐

[jump target="*失敗カフェx" cond="ending != 3"]
*失敗カフェ
[cancelskip]
[場面転換]
[背景 画像= 通学路夕方][枠]
[人物 画像= カズキ  名前= 国分寺カズキ]
おーい[カラス]、待てよ、[名]！[next]

[自分]
カズキ……[next]

[人物 画像= カズキへえ  名前= 国分寺カズキ]
なーに、[BGM 曲=カズキエンド.ogg 音量=40 ループ=false]一人で暗い顔して帰ってんだよ？[n]
一緒に帰ろうぜ。[next]
[表情 画像=カズキ]

[自分]
うん……[next]

[人物 画像=カズキしゃべる 名前=国分寺カズキ]
落ち込むのもわかるけどさ、[ま][ま]元気出せよ。[next]

[表情 画像= カズキにこ]
まあ、俺のクラスの「筋肉アトラクション ＹＯ☆ＳＡ☆ＫＵ」も[n]
賞取れなかったしな。[next]
[表情 画像=カズキ残念]
っていうか入賞してたのみんな三年生のクラスだったじゃん。[n]
二年生の俺達じゃ仕方ないところもあるって。[next]
[表情 画像=カズキうーん]

[自分]
単純にクラス出し物がうまくいかなかったって悔しさも[n]
勿論あるんだけど……[next]

[人物 画像= カズキへえ  名前= 国分寺カズキ]
他にもなんかあるのか？[next]
[表情 画像=カズキ]

[自分]
うまくいかなかった原因って、[n]
結局クラスを[ルビ 読み=まと]纏められなかったってことなんだよな。[next]

クラス実行委員になればクラスに友達ができて[n]
少しは居場所ができるかと思ったけど……[next]

むしろみんなの仲を引き裂いてしまったような……[next]

[人物 画像= カズキへえ  名前= 国分寺カズキ]
何言ってんだよ！[n]
[名]はちゃんと頑張ってたじゃねーか。[next]
[表情 画像=カズキしゃべる]
そのことは、俺がちゃんと知ってる。[next]
[表情 画像=カズキにこ]
だって、親友だもんな！[next]

[自分]
カズキ……[next]

[人物 画像= カズキ  名前= 国分寺カズキ]
それに……[next]

[自分]
それに？[next]
[人物消去]

[場面転換]
[背景 画像=カズキ一枚絵][枠]

[人物 画像= なし  名前= 国分寺カズキ]
たとえクラスでうまくいかなくたって[next]

お前には、俺がいるだろ？[next]

[自分]
……うん！[next]

[メッセージ]
こうして俺の文化祭クラス実行委員の仕事は幕を閉じた。[next]

でも、俺は気づいたんだ。[next]

学校の明るいところで活躍するよりも……[next]

カズキと一緒に毎日ネトゲをする、[n]
これが俺の青春なんだ！！[next]

エンド５[r]
「 失敗カフェ 」[r]
[スコア表示]
[cancelautomode][next]
[タイトルに戻る]
*失敗カフェx

[jump target="*三人の精鋭x" cond="ending != 4"]
*三人の精鋭
[cancelskip]
[場面転換]
[背景 画像= ファイヤー][枠]

[モノローグ]
俺の文化祭は成功に終わった。[n]
今まで居場所がないと感じていたクラスだったけど……[next]
[モノローグ終了]

[if exp="!f.カレンけんか"]
[表情左 画像=カレン]
[表情右 画像=ヨシオ]
[メッセージ]
今では、この二人が俺の大切な仲間だ。[next]
[endif]
[if exp="f.カレンけんか"]
[表情右 画像=ヨシオ]
[メッセージ]
今では、こいつが俺の大切な仲間だ。[next]
[endif]

[人物右 画像=ヨシオ説明 名前=小平ヨシオ]
厳しい戦いだったが、なんとかやり遂げたな……[next]
[表情右 画像=ヨシオふっ]

[人物左 画像=カレンしゃべる 名前=恋ヶ窪カレン]
みんなで頑張らなくちゃダメって最初は思ってたけど……[next]
[表情左 画像=カレンふふふ]
もっと気楽に考えても良かったのね。[next]
[表情左 画像=カレンしゃべる]
さあ、後夜祭に行きましょう。[next]

[自分]
二人とも……ありがとう！[next]

エンド４[r]
「 三人の精鋭 」[r]
[スコア表示]
[cancelautomode][next]
[タイトルに戻る]

*三人の精鋭x

[jump target="*文化祭成功x" cond="ending != 5"]
*文化祭成功
[cancelskip]
[場面転換]
[背景 画像= ファイヤー][枠]

[モノローグ]
俺の文化祭は大成功に終わった。[n]
今まで居場所がないと感じていたクラスだったけど……[next]
[モノローグ終了]

[メッセージ]
[if exp="f.マユ参加"][表情左遠い 画像= マユ  名前= 桜マユ][endif]
[if exp="f.イズミ参加"][表情 画像= イズミ  名前= 本多イズミ][endif]
[表情右遠い 画像= ヨシオ  名前= 小平ヨシオ]

たくさんの[next]
[人物全消去]

[if exp="f.ミドリ参加"][表情左遠い 画像= ミドリ  名前= 美園ミドリ][endif]
[if exp="f.カケル参加"][表情 画像= カケル  名前= 梶野カケル][endif]
[if exp="f.マリ参加"][表情右遠い 画像= マリ  名前= 貫井マリ][endif]

友達ができた。[next]
[人物全消去]

[表情右 画像= カレン  名前= 恋ヶ窪カレン]
[人物左 画像= ヨシオ自信  名前= 小平ヨシオ]
ほら、[姓]、後夜祭だぞ！[next]

[人物右 画像= カレンしゃべる  名前= 恋ヶ窪カレン]
踊りに行きましょう！[next]

[自分]
うん！[next]


エンドロール[next]
エンド５[r]
「 文化祭成功 」[r]
[スコア表示]
[cancelautomode][next]
[タイトルに戻る]
*文化祭成功x

[jump target="*秋空のコンチェルトx" cond="ending != 6"]
*秋空のコンチェルト
[cancelskip]
[場面転換]
[背景 画像=体育館][枠]

[モノローグ]
壇上から降りてくると前原先生の姿が目に入った。[next]
[モノローグ終了]

[人物 画像= 前原先生しゃべる  名前= 前原先生]
[姓]、よくやったな。[n]
君ならやってくれると思っていたよ。[next]
[表情 画像=前原先生]

[自分]
そんな……[n]
前原先生が実行委員をやるように背中を押してくれたからです。[next]

[人物 画像= 前原先生目閉じ  名前= 前原先生]
いや、友達と関わって、クラス全体の雰囲気を変えてくれた。[n]
それは君自身の力だよ。[next]
[表情 画像=前原先生]

[自分]
もしかして、先生……全部見てたんじゃ……？[next]

[人物 画像= 前原先生目閉じ  名前= 前原先生]
さあ、何の事だろうね？[next]

[自分]
……ありがとうございました！[next]

[場面転換]
[背景 画像= ファイヤー][枠]

[モノローグ]
俺の文化祭は大成功に終わった。[n]
今まで居場所がないと感じていたクラスだったけど……[next]
[モノローグ終了]

[表情右 画像= カケル]
[人物左 画像= マリ  名前= 貫井マリ]
ねえねえ、せっかくだから写真撮ろうよ！[next]

[人物右 画像= カケルにい  名前= 梶野カケル]
やっぱり実行委員は真ん中がいいんじゃないか。[next]

[人物全消去]

[人物左 画像= イズミ悪だくみ  名前= 本多イズミ]
ヨッシーはデカいから後ろ下がってよね。[next]

[人物 画像= ヨシオ困惑  名前= 小平ヨシオ]
むむっ……仕方ないな。[next]

[人物右 画像= マユ笑顔  名前= 桜マユ]
じゃあボクはズミねえのとなりー！[next]
[人物全消去]

[人物左 画像= ミドリしゃべる  名前= 美園ミドリ]
前原先生が写真撮ってくれるって。[next]

[人物右 画像= カレンしゃべる  名前= 恋ヶ窪カレン]
早く並びましょう？[n]
キャンプファイヤーもあるのだから。[next]
[人物全消去]

[人物 画像= なし  名前= 前原先生]
じゃあ、撮るからね。[n]
３・[ま][ま]２・[ま][ま]１！[ま][ま][next]

※一枚絵出す

[モノローグ]
たくさんの友達ができた。[next]

仲間が支えてくれたからここまで来ることができたんだ。[next]

[if exp="f.マリ攻略 && f.カレン攻略"]
[表情左 画像=カレンおこ]
[表情右 画像=マリもう知らない]
……実は、このあと色々あったけど、[next]
[表情左 画像=カレン哀愁]
[表情右 画像=マリうん]
カレンとマリの二人と付き合うこともできた！[next]
[elsif exp="f.マリ攻略"]
[表情 画像=マリ]
……それに、貫井さんと付き合うこともできた！[next]
[elsif exp="f.カレン攻略"]
[表情 画像=カレンにこ]
……それに、カレンと付き合うこともできた！[next]
[endif]
[人物全消去]
俺の高校生活、一番の思い出ができたかもしれない……！[next]

※エンドロール

[メッセージ]
[if exp="f.カレン攻略 + f.マリ攻略"][実績解除 名前=実績２０：充実した高校生活][endif]
[if exp="f.カレン攻略 && f.マリ攻略"][実績解除 名前=実績２１：全てを知り尽くした男][endif]
エンド６[r]
「 秋空のコンチェルト 」[r]
[スコア表示]
[cancelautomode][next]

[タイトルに戻る]
*秋空のコンチェルトx

[jump target="*高嶺のお嬢様x" cond="ending != 7"]
*高嶺のお嬢様
[cancelskip]
[場面転換]
[背景 画像=体育館][枠]
[BGM停止]

[モノローグ]
[if exp="f.進捗 >= 100"]
檀上から降りたあと、[カレンへ]が切り出した。[next]
[endif]
[if exp="f.進捗 < 100"]
いや、いつまでもクヨクヨしてはいられない。[n]
俺は文化祭の成功以上に価値のあるものを手に入れたんだ。[next]

体育館から人が散り始めたとき、[カレンへ]が切り出した。[next]
[endif]
[モノローグ終了]

[人物 画像=カレンねえ 名前=恋ヶ窪カレン]
[名]くん、[BGM 曲=恋愛.ogg 音量=50]約束したの覚えてる？[next]

[自分]
えっと、約束……なんだっけ。[next]

[人物 画像=カレンややおこ 名前=恋ヶ窪カレン]
もう、キャンプファイアー！[next]
[表情 画像=カレンむっ]

[自分]
あ、そうだ。覚えてるよ。[n]
一緒に踊ろう、カレン。[next]

[人物 画像=カレンうーん 名前=恋ヶ窪カレン]
…………[next]

[自分]
今日さ、一緒に踊ったら……[n]
俺たちが付き合ってたってこと、みんなにバレちゃうね。[next]

[人物 画像=カレンかああ 名前=恋ヶ窪カレン]
…………[next]
[表情 画像=カレンにこ]
……いいの。[next]

[場面転換]
[背景 画像=ファイヤー][枠]
[人物右 画像=カレンしゃべる 名前=恋ヶ窪カレン]
ねえ、[名]くん。[next]

[自分]
なあに、カレン。[next]

[人物右 画像=カレンふふふ 名前=恋ヶ窪カレン]
動物園の次は、どこに遊びに行く？[next]

[自分]
どうしようかな。[next]

カレンのお家にあいさつに行こうかな……[next]

[表情右 画像=カレンかああ]
……いや、冗談だよ。[next]

[人物右 画像=カレン哀愁 名前=恋ヶ窪カレン]
もう……[名]くんったら。[next]
[表情右 画像=カレンにこ]
それは[ま]まだ、[ま]だーめ。[next]

※エンドロールが入ります。

[メッセージ]
[if exp="f.カレン攻略 + f.マリ攻略"][実績解除 名前=実績２０：充実した高校生活][endif]
エンド７[r]
「 高嶺のお嬢様 」[r]
[スコア表示]
[cancelautomode][next]
[タイトルに戻る]

*高嶺のお嬢様x

[jump target="*迷える突撃娘x" cond="ending != 8"]
*迷える突撃娘
[cancelskip]
[場面転換]
[背景 画像=体育館][枠]
[BGM停止]
[モノローグ]
[if exp="f.進捗 >= 100"]
檀上から降りたあと、貫井さんが切り出した。[next]
[endif]
[if exp="f.進捗 < 100"]
いや、いつまでもクヨクヨしてはいられない。[n]
俺は文化祭の成功以上に価値のあるものを手に入れたんだ。[next]

体育館から人が散り始めたとき、貫井さんが切り出した。[next]
[endif]
[モノローグ終了]

[人物 画像=マリよし 名前=貫井マリ]
ねえ、[姓]！[BGM 曲=恋愛.ogg 音量=50][n]
ほーらっ！ キャンプファイアーだよ。[next]
[表情 画像=マリ決意]

[自分]
え……[ま]でも、キャンプファイアーで一緒に踊ってたら、[n]
カップルだって分かっちゃうよね？[next]

なんだか照れくさいな、あはは……[next]

[人物 画像=マリえっ 名前=貫井マリ]
え、いいじゃん。[n]
だって、あたしたち……[next]
[表情 画像=マリ]
付き合ってるんだよ？[next]
[表情 画像=マリうん]

[自分]
そ、そうだけど……[next]

[人物 画像=マリ哀愁の笑み 名前=貫井マリ]
それにあたし、[ま]今度こそ決めたんだ……[next]
[表情 画像=マリ]
今度は[姓]が迷ってること、色々決めてあげるって！[next]

[場面転換]
[背景 画像=ファイヤー][枠]

[人物右 画像=マリあちゃー 名前=貫井マリ]
はあ……[ま][ま]はあ……[next]

うちで練習したときは……[n]
もうちょっと上手く、[ま]できたんだけどなー……[next]

[自分]
え！？ [ま][ま]踊り練習してたの？[n]
今日のために……[next]

なんか俺、[ま]下手くそでごめん。[next]

[人物右 画像=マリうん 名前=貫井マリ]
うん、いいの[ま]いいの。[ま][ま][姓]はそのままで。[next]
[表情右 画像=マリあはは]
だって、あたしがしたくてしてることなんだから！[next]

[モノローグ]
この子は一度決めたら、[ま]なんだかとっても真っすぐで[n]
危なっかしいこともあるけど……[next]

つらいこと、苦しいことに出会っても、[n]
貫井さんと一緒だったら、[n]
いつだって真っすぐ乗り越えて行けそうな気がする……[next]

そんなエネルギーを、俺は感じたんだ！！[next]
[モノローグ終了]
※エンドロールが入ります。

[メッセージ]
[if exp="f.カレン攻略 + f.マリ攻略"][実績解除 名前=実績２０：充実した高校生活][endif]
エンド８[r]
「 迷える突撃娘 」[r]
[スコア表示]
[cancelautomode][next]
[タイトルに戻る]

*迷える突撃娘x

[jump target="*悔い改めよx" cond="ending != 9"]
*悔い改めよ
[cancelskip]
[場面転換][BGM停止]
[背景 画像=体育館][枠]
[モノローグ]
文化祭の結果はともかく、[n]
俺は学園生活の充実感に浮かれていた。[next]

二人の女の子から好かれるなんて困っちゃうなあ。[n]
まるで梶野カケルみたいじゃないか、アハハ。[next]
[モノローグ終了]

[メッセージ]
さーて、[n]
後夜祭のキャンプファイアー、どうしようかな。
[二択 ア=カレンと踊ろう イ=マリと踊ろう]
[jump target="*マリと踊る" cond=イ]
*カレンと踊る
[人物 画像=カレンしゃべる 名前=恋ヶ窪カレン]
[名]くん、踊りに行きましょう。[next]

[自分]
カレン、行こうか……[next]
[表情 画像=カレンにこ]

[人物右遠い 画像=マリえっ 名前=貫井マリ]
え……ウソ……[姓]？[next]

[表情右遠い 画像=マリ必死]
なんで？[n]
恋ヶ窪さん！？[n]
さっき約束したよね！[ま] どういうことなの……？[next]
[表情 画像=カレン真顔]

[自分]
あれ？ 貫井さん……[n]
どうしてそこに！？[next]

[jump target="*マリと踊るx"]

*マリと踊る
[人物 画像=マリ 名前=貫井マリ]
[姓]、踊りに行くよ。キャンプファイアー！[next]

[自分]
貫井さん、行こうか……[next]
[表情 画像=マリうん]

[人物右遠い 画像=カレンびっくり 名前=恋ヶ窪カレン]
え……ウソ……[名]くん？[next]

なんで？[n]
貫井さん！？[n]
この前約束したじゃない！[ま] どういうことなの……？[next]
[表情 画像=マリうーん]

[自分]
あれ？ カレ……恋ヶ窪さん！？[n]
どうしてそこに！？[next]

*マリと踊るx

[場面転換]
[背景 画像=ファイヤー][枠]

[表情左 画像=カレンややおこ]
[表情右 画像=マリ必死]
[モノローグ]
問い詰められた俺は、すべてを話した。[next]

カレンと付き合いながら、[n]
貫井さんともいい感じになっていたということ……[next]

二人とも本気で好きだし、片方を選ぶなんて[n]
できないということ……[next]

これが本当の修羅場だ……[n]
ああ……[ま]いっそのこと灰になって、どこかへ飛んで行きたい。[next]
[モノローグ終了]

[表情左 画像=カレン真顔]
[表情右 画像=マリ決意]

[自分]
本当にごめん……！[n]
俺が全部悪かったんだ。[next]

許してください。[next]

[BGM 曲=シンフォニア.ogg 音量=50 ループ=false]

[人物左 画像=カレンにこ 名前=恋ヶ窪カレン]
許すわけないじゃない？[next]

[人物右 画像=マリあはは 名前=貫井マリ]
こりゃあ、とんだクズ野郎だな。[next]
[表情右 画像=マリ決意]

[人物左 画像=カレン哀愁 名前=恋ヶ窪カレン]
私ね、いい勉強になったと思うの。[n]
やっぱり男ってケモノね。[next]

[人物右 画像=マリあちゃー 名前=貫井マリ]
いやー、ちゃんと知っておいて良かったなー！[n]
あたしは男を見る目が無いんだなあって……[next]
[表情左 画像=カレン真顔]

[自分]
あはは、二人とも勉強になって良かったよ……[next]

[人物右 画像=マリ哀愁の笑み 名前=貫井マリ]
ねえ、カレンちゃん。どうするこいつ。[next]

[人物左 画像=カレン発言 名前=恋ヶ窪カレン]
ちょっと、あの中で反省してもらおうかしら。[next]

[自分]
あの……[SE 音=ガーン.ogg 音量=50]あの中！！？[next]

[人物左 画像=カレンにこ 名前=恋ヶ窪カレン]
本当に反省しているんだったら、[n]
神様が奇跡を起こしてくれると思わない？ ねえ、マリ。[next]

[人物右 画像=マリあはは 名前=貫井マリ]
あー、いいね！ それ。[next]

[表情右 画像=マリあちゃー]
じゃあ、後夜祭終わったときに、半分でも残ってたら[n]
反省したってことでいいかな？ [名]くん？[next]

[人物左 画像=カレン哀愁 名前=恋ヶ窪カレン]
ちゃんと悔い改めて、奇跡が起こるといいわねえ。[next]

[場面転換][枠]

[モノローグ]
……[姓][名]の冒険の記録は、ここで終わっている。[next]
[モノローグ終了]

[人物 画像=前原先生目閉じ 名前=前原先生]
やれやれ……[next]
[人物消去]

[メッセージ]
[if exp="f.カレン攻略 + f.マリ攻略"][実績解除 名前=実績２０：充実した高校生活][endif]
エンド９[r]
「 悔い改めよ 」[r]
[スコア表示]
[cancelautomode][next]

[タイトルに戻る]

*悔い改めよx

[タイトルに戻る]
