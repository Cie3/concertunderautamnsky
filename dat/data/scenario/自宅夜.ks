[cancelautomode]
[場面転換]
[背景 画像=部屋夜]
[BGM停止]
[wb]
[BGM 曲= 自室夜.ogg  ループ= 1  音量= 70]
[枠]
[メッセージ]

*夜
[nowait]寝る前に、何かすることは？[endnowait]
[eval exp="var 選択肢勉強 = 'テスト対策の勉強 (' + 自宅学習消費 + ')'"]
[if exp="f.日 == 1"][二択 ア= もう寝る]
[elsif exp= "f.曜日!='平日２' || f.休日準備 != 0"][二択 ア= もう寝る  イ= &選択肢勉強]
[else][三択 ア= もう寝る  イ= &選択肢勉強  ウ= 休日準備に招集する]
[endif]

[if exp= ア]
	[if exp="f.日==22 && f.休日準備==0"]
		最初の週は、休日準備の連絡をしてから寝よう。[next]
		[jump target="*夜"]
	[endif]
[elsif exp= イ]
	問題集を解いて[SE 音= 紙をめくる 音量= 50]勉強だ！
	[体力 変化= &自宅学習消費]
	[next]
	最初の点数は [emb exp="f.学力"]点[n]
	[学力 変化= &自宅学習上昇]
	今回の点数は [emb exp="f.学力"]点 か。[n]
	[if exp= "f.学力 > 80"]これなら大丈夫だ。[cancelskip][next]
	[elsif exp= "f.学力 > 70"]まあ、いい感じだ。[cancelskip][next]
	[elsif exp= "f.学力 > 55"]微妙だな……[cancelskip][next]
	[elsif exp= "f.学力 > 45"]まずい気がする。[cancelskip][next]
	[else]ダメだなこりゃ。[cancelskip][next]
	[endif]
	[jump target= *夜]
[else]
	[if exp= "f.マリデート != 0"]
		あ、明日は貫井さんとの約束があるんだった。[n]
		招集をかけるのはやめておこう。[next]
		[if exp="f.カレンデート != 0"]
			まてよ、恋ヶ窪さんとも約束を……[n]
			えええ！？ まずい！[n]
			どうしよう！！？[next]
		[endif]
	[elsif exp= "f.カレンデート != 0"]
		あ、明日は恋ヶ窪さんとの約束があるんだった。[n]
		招集をかけるのはやめておこう。[next]
	[else]
		「明日は文化祭の準備をするので集まってください」[n]
		よし、クラス全体に連絡しておいたぞ。[next]
		[eval exp= "f.休日準備 = 1"]
		[実績解除 名前=実績１０：休日招集だ]
	[endif]
	[jump target= *夜]
[endif]

[枠消去]
[BGM停止]
[背景 画像= 月夜]
[wb]
[BGM 曲= 眠れR.ogg  ループ= 0  音量= 50]
[背景 画像= 黒  時間= 5000]
[wt]
[wait time= 1000]

*回復

[睡眠回復]

[return]
