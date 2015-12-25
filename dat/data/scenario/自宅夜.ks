[cancelautomode]
[場面転換]
[背景 画像=部屋夜]
[BGM停止]
[wb canskip=true]
[BGM 曲= 自室夜.ogg  ループ= 1  音量= 70]
[枠]
[メッセージ]

*夜
[nowait]寝る前に、何かすることは？[endnowait]
[eval exp="var 選択肢勉強 = 'テスト対策の勉強 (' + 自宅学習消費 + ')'"]
[if exp="f.日 == 1"][二択 ア= もう寝る（いよいよ文化祭当日です）]
[elsif exp= "f.曜日!='平日２' || f.休日準備 != 0"][二択 ア= もう寝る  イ= &選択肢勉強]
[else][三択 ア= もう寝る  イ= &選択肢勉強  ウ="&'休日準備に招集する (' + 休日招集消費 + ')'"]
[endif]

[if exp= ア]
	[if exp="f.休日準備 == 0 && f.曜日 == '平日２'"]
		[if exp="f.日 == 22"]
			最初の週は、休日準備の連絡をしてから寝よう。[next]
			[jump target="*夜"]
		[elsif exp="f.日 == 1 || f.カレンデート + f.マリデート > 0"]
			;文化祭前夜なら警告を出さない
			;デートの予定があるなら警告を出さない
		[else]
			;準備をしていない場合は警告
			[nowait]
			休日準備をせずに、家で休みますか？[r]
			（休んだ場合には生命力が回復します）
			[endnowait]
			[二択 ア=休日は休む イ=もう少し考え直す]
			[if exp="ア"]
				;そのまま
			[else]
				[jump target="*夜"]
			[endif]
		[endif]
	[endif]
[elsif exp= イ]
	問題集を解いて[SE 音= 紙をめくる 音量= 50]勉強だ！
	[体力 変化= &自宅学習消費]
	[next]
	最初の点数は [emb exp="f.学力"]点[n]
	[学力 変化= &自宅学習上昇]
	今回の点数は [font color="&色：強化" cond="f.学力 >= 85"][emb exp="f.学力"]点[resetfont] か。[n]
	[if exp="f.学力 < 45"]ダメダメだ……
	[elsif exp="f.学力 < 55"]このままではまずい……
	[elsif exp="f.学力 < 65"]ちょっと心配だけど、まあ大丈夫か。
	[elsif exp="f.学力 < 75"]まあまあ、無難な感じだ。
	[elsif exp="f.学力 < 85"]結構いい感じだ。
	[elsif exp="f.学力 < 100"]これならいける！
	[endif]
	[cancelskip]
	[next]
	
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
		[体力 変化=&休日招集消費]
		「明日は文化祭の準備をするので集まってください」[n]
		よし、クラス全体に連絡しておいたぞ。[next]
		[eval exp= "f.休日準備 = 1"]
	[endif]
	[jump target= *夜]
[endif]

[枠消去]
[BGM停止]
[背景 画像= 月夜]
[wb]
[BGM 曲= 眠れR.ogg  ループ= 0  音量= 50]

*次の日へ
[eval exp="f.日-=1"]
[if exp="f.曜日=='平日２'"][eval exp="f.曜日='週末'"]
[elsif exp="f.曜日=='平日１'"][eval exp="f.曜日='平日２'"]
[else]
	[eval exp="f.曜日='平日１', f.週+=1"]
	[if exp="f.週>4"][eval exp="f.週=1, f.月+=1"]
	[endif]
[endif]
[eval exp="f.曜日 = '当日'" cond="f.日 == 0"]

[eval exp="日付表示(0)"]
[背景 画像= 黒  時間= 5000]
[wt]
[wait time= 1000]

[jump storage="ゲームオーバー.ks" target="*ed2" cond="f.カレンデート > 0 && f.マリデート > 0"]
*回復

[睡眠回復]

[return]
