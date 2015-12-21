[eval exp="var セーブ可能 = true"]
[eval exp= "f.今日=today()"]
[eval exp= "tf.セーブラベル=f.姓 + f.名 + '(残り' + f.日 + '日)' + f.曜日"]
*セーブ|&tf.セーブラベル
[eval exp= "f.今日=today()"]
[eval exp= "tf.セーブラベル=f.姓 + f.名 + '(残り' + f.日 + '日)' + f.曜日"]

[jump storage="文化祭当日.ks" cond="f.日 == 0"]
[if exp="f.日==19 && f.trial"]
	[背景 画像=ロゴ]
	[枠]
	お疲れさまでした。ここで体験版は終了です。[n]
	最後までプレイして頂き、ありがとうございました。[next]
	
	「秋空のコンチェルト」１２月のコミケで頒布予定、[n]
	以降、Ｗｅｂでの配信になります。お楽しみに！！[next]
	[jump storage="macro.ks" target="*終了処理"]
[endif]

[call storage=macro.ks]

[ボタン表示自室]
[BGM停止]

[eval exp="var n=(new Date()).getTime()"]
[SE 音=チュンチュン.ogg ループ=0 音量=50]
[枠]
[メッセージ]
;体力棒を表示
[体力 変化= 0]
[eval exp="日付表示()"]
[nowait][emb exp="f.今日"] [emb exp="'(文化祭まであと ' + f.日 + '日)'"][endnowait][next]
[eval exp="n=((new Date()).getTime()-n)\1000"]

;会話の種を１日進める
[eval exp= "manageSeed()"]

[SE停止]
[背景 画像=部屋]
[BGM 曲= 08自宅朝.ogg  ループ= 1  音量= 50]

[if exp="n>50"]
	あぶないあぶない、もうこんな時間か……[if exp="sf.朝寝坊の危機===void"]（★朝寝坊の危機）[endif][n]
	[eval exp="sf.朝寝坊の危機=1"]
[endif]

[if exp="typeof global.セーブ可能 != 'undefined'"]
	;ロードした直後はここを通らない
	[if exp="f.日 == 23"]
	
		;初日だけ必ずセーブする
		[call storage="セーブロード.ks" target="*セーブ実行" cond="!f.trial"]
	[endif]
[endif]
*朝

[nowait]１日を始める前に、確認することは？[endnowait]

;	[種取得 名前=俺が立候補？ 詳細=前原先生にすすめられた。 期限=3]
;	[種取得 名前=俺が立候補２？ 詳細=前原先生にすすめられた。 期限=4]
;	[種取得 名前=俺が立候補３？ 詳細=前原先生にすすめられた。 期限=5]


[四択 ア= 活動開始！  イ= 会話の種  ウ= 今日は何の日  エ= セーブ]
[if exp= ア]
[elsif exp= イ]
	[call target=*会話の種表示 storage="macro.ks"]
	[jump target=*朝]
[elsif exp= ウ]
	[if exp= "f.日>0"]文化祭まで、あと[emb exp= "f.日"]日か。[n][endif]
	[if exp= "f.日 == 23"]
		今日は先生との面談の日だ。[n]
		何か言われたりするんだろうか。[next]
	[elsif exp= "f.日 == 22"]
		今日は文化祭のクラス委員を決める日だ。[n]
		立候補……してみようかな。[next]
	[elsif exp= "f.日 == 21"]
		今日は初めての休日準備だ。[n]
		気合を入れていかないと。[next]
	[elsif exp= "f.日 == 20 || f.日 == 14 || f.日 == 8"]
		今日は特に何もないな。[n]
		文化祭のために何かできることをしておこう。[next]
	[elsif exp= "f.日 == 19 || f.日 == 13 || f.日 == 7"]
		今日は文化祭の準備をする日だ。[n]
		ここで頑張って進めておこう。[next]
	[elsif exp= "f.日 == 18 || f.日 == 15 || f.日 == 12 || f.日 == 9 || f.日 == 6 || f.日 == 3"]
		[if exp= "f.マリデート != 0"]
			今日は貫井さんと約束があるんだ。[next]
			[if exp="f.カレンデート != 0"]
				あれ、恋ヶ窪さんとも約束をしていたような……[next]
			[endif]
		[elsif exp= "f.カレンデート != 0"]
			今日は恋ヶ窪さんと約束があるんだ。[next]
		[elsif exp= "f.休日準備 != 0"]
			今日は文化祭の準備をするぞ。[next]
		[else]
			今日は何もないし、ゆっくり休めるぞ。[next]
		[endif]
	[elsif exp= "f.日 == 17 || f.日 == 11 || f.日 == 5 || f.日 == 2"]
		今日は小テストだ。ちょっと頑張らないと。[next]
	[elsif exp= "f.日 == 16 || f.日 == 10 || f.日 == 4"]
		今日は文化祭の準備をする日だ。[n]
		小テストの補習が入らなければいいんだけど……[next]
	[elsif exp= "f.日 == 1"]
		文化祭前の最後の準備日だ。[n]
		気を引き締めていこう。[next]
	[else]
		いよいよ文化祭本番か。[n]
		[if exp= "f.進捗 >= 100"]今まで頑張ってきたし、きっとうまくいくはずだ。
		[elsif exp= "f.進捗 >= 50"]どうなるんだろう……
		[else]もう、どうにでもなれ。
		[endif]
		[next]
	[endif]
	[jump target= *朝]
[else]
	[call storage="セーブロード.ks" target="*セーブ"]
	[jump target=*朝]
[endif]

[if exp="typeof global.セーブ可能 != 'undefined'"]
	[if exp="f.日 != 23"]
		;オートセーブする
		[call storage="セーブロード.ks" target="*オートセーブ"]
	[endif]
[endif]

[枠消去]
[return]
