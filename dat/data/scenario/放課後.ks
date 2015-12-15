[eval exp="f.現在='放課後'"]
[eval exp="f.昼休み=false, f.放課後=true"]
[BGM停止]
[wb]

;強制イベント
[call storage="scenario/イベント/23クラスメイト.ks" cond="f.日==23"]

;放課後準備
[call storage="平日準備.ks" cond="f.曜日=='平日２' && f.日!=22"]
[call storage= "scenario/イベント/22立候補.ks" cond="f.日==22"]

[場面転換]
[背景 画像=教室夕方 時間=1000]

[iscript]
var str = f.日 + '放課後';
var 出現ア = 出現[str + 'ア'];
var 出現イ = 出現[str + 'イ'];
var 出現ウ = 出現[str + 'ウ'];
[endscript]

[BGM ループ=true 音量=50 曲=夕暮れ.ogg]

*誰に話しかけようかな

[iscript]
アに話しかける = 出現ア == '' ? '' : 出現ア + 'に話しかける';
イに話しかける = 出現イ == '' ? '' : 出現イ + 'に話しかける';
ウに話しかける = 出現ウ == '' ? '' : 出現ウ + 'に話しかける';
[endscript]

[枠]
今日の授業は全て終わった。[n]
帰る前に誰と話そうか。
[四択 ア= &アに話しかける イ= &イに話しかける ウ= &ウに話しかける エ= さっさと帰る(+2)]

[if exp=ア]
	[枠消去]
	[call storage="&'scenario/個別/' + 出現ア + '.ks'"]
[elsif exp=イ]
	[枠消去]
	[call storage="&'scenario/個別/' + 出現イ + '.ks'"]
[elsif exp=ウ]
	[枠消去]
	[call storage="&'scenario/個別/' + 出現ウ + '.ks'"]
[elsif exp=エ]
	[体力 変化=2]
	よし、帰るか。[next]
	[場面転換]
	[背景 画像=通学路夕方]
[endif]

[return]
