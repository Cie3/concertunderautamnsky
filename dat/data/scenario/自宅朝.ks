[eval exp="オートセーブ可能 = 1"]
*セーブ|&saveLabel()
[eval exp= "f.今日=today()"]

[jump storage="文化祭当日.ks" cond="f.日 == 0"]
[if exp="f.日==19 && f.trial"]
	[背景 画像=ロゴ]
	[枠][メッセージ]
	お疲れさまでした。ここで体験版は終了です。[n]
	最後までプレイして頂き、ありがとうございました。[next]
	
	「秋空のコンチェルト」１２月のコミケで頒布予定、[n]
	以降、Ｗｅｂでの配信になります。お楽しみに！！[next]
	[jump storage="macro.ks" target="*終了処理"]
[endif]

[call storage=macro.ks]

[ボタン表示自室]
[BGM停止]

[SE 音=チュンチュン.ogg ループ=0 音量=50]
[枠]
[メッセージ]
;体力棒を表示
[体力 変化= 0]
[eval exp="日付表示()"]
[nowait][emb exp="f.今日"] [emb exp="'(文化祭まであと ' + f.日 + '日)'"][endnowait][next]


;会話の種を１日進める
[eval exp= "manageSeed()"]

[SE停止]
[背景 画像=部屋]
[BGM 曲= 08自宅朝.ogg  ループ= 1  音量= 50]


[if exp="typeof global.セーブ可能 != 'undefined'"]
	;ロードした直後はここを通らない
	[if exp="f.日 == 23"]
	
		;初日だけ必ずセーブする
		[call storage="セーブロード.ks" target="*セーブ実行" cond="!f.trial"]
	[endif]
[endif]

*朝

[if exp="f.説明 == '放課後'"]
	[eval exp="f.説明 = '自宅朝'"]
	[cancelskip]
	[image layer="&lay説明" storage="説明自宅朝" visible="true" opacity="191"][backlay]
	[nowait]１日を始める前に、確認することは？[endnowait][next]
	[人物 画像=なし 名前=操作ガイド]
	セーブの説明をします。[next]
	[layopt layer="&lay説明" opacity="255"][backlay]
	[image layer="&lay説明+1" storage="説明自宅朝セーブ" visible="true"][backlay]
	朝起きると、セーブをすることができます。[n]
	10個のスロットがあるので、ストーリーが進むごとに[n]
	別スロットにセーブすると、詰みにくくなります。[next]
	また、活動開始すると自動でセーブが行われるため、[n]
	簡単にその日の朝からやり直すことができます。[next]
	[layopt layer="&lay説明" opacity="191"][backlay]
	[image layer="&lay説明+1" storage="説明自宅朝タイトル" visible="true"][backlay]
	やり直すときには、タイトルボタンを押しましょう。[n]
	このボタンはいつでも押すことができます。[next]
	
	これで操作説明を終わります。[next]
	[メッセージ]
	[layopt layer="&lay説明+1" visible="false"][backlay]
	[layopt layer="&lay説明" visible="false"][backlay]
[endif]

[nowait]１日を始める前に、確認することは？[endnowait]
[ボタン表示自室種]
[eval exp="var 進捗 = (f.日 >= 21 ? '' : '進捗率を見る')"]
[四択 ア= 活動開始！  イ= 今日は何の日 ウ=&進捗  エ= セーブ]
[ボタン表示自室]
[if exp= ア]
	;endif まで直行
[elsif exp= イ]
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
[elsif exp=ウ]
	文化祭準備の進み具合は…… [font color="&色：強化"][emb exp="f.進捗"]％[resetfont] か。[n]
	[if exp="f.進捗 >= 100"]もう大丈夫そうだ。
	[elsif exp="f.進捗 >= 80"]あとちょっとだ。
	[elsif exp="f.進捗 >= 60"]結構できてきたな。
	[elsif exp="f.進捗 >= 40"]軌道に乗ってきた。
	[elsif exp="f.進捗 >= 20"]まだまだ道のりは長い。
	[elsif exp="f.進捗 >= 0"]まだ始まったばかりだ。
	[endif]
	[next]
	[jump target="*朝"]
[elsif exp=エ]
	[call storage="セーブロード.ks" target="*セーブ"]
	[jump target=*朝]
[else]
	[jump target="*朝"]
[endif]

[if exp="オートセーブ可能 == 1"]
	[if exp="f.日 != 23"]
		;オートセーブする
		[call storage="セーブロード.ks" target="*オートセーブ"]
		[nowait]オートセーブしました。[endnowait][ま][ま][ま][ま][er]
	[else]
		;初日セーブ
		[call storage="セーブロード.ks" target="*セーブ実行"]
	[endif]
[endif]

[枠消去]
[return]
