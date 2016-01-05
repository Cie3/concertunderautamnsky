
[call storage=自宅朝.ks]
; 2行目は[call storage=自宅朝.ks]に固定しないと戻り先ERRORになる。

[eval exp="f.履歴許可 = true"]
[history output=true]
[ボタン表示]
[if exp="f.曜日!='週末'"]
	[call storage=登校.ks]
	[call storage=授業.ks]
	[call storage=昼休み.ks]
	[call storage=放課後.ks]
[else]
	[if exp= "f.休日準備 != 0"]
		[call storage= 休日準備.ks]
	[elsif exp="f.カレンデート > 0"]
		[call storage="scenario/個別/カレン.ks"]
	[elsif exp="f.マリデート > 0"]
		[call storage="scenario/個別/マリ.ks"]
	[else]
		[枠][メッセージ]
		今日は思いっきり休むぞ〜！！[next]
		[場面転換]
		[休日回復]
		[背景 画像=部屋夜]
		[枠][メッセージ]
		何もしなかったし、しっかり休めた気がする。[n]
		明日から本気出そう。[next]
		[実績解除 名前=実績９：羽をのばす]
		[枠消去]
	[endif]
[endif]
[ボタン表示自室夜]
[eval exp="f.履歴許可 = false"]
[history output=false]
[call storage= 自宅夜.ks]

[jump storage= 毎日.ks]


