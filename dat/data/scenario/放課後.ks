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
アに話しかける = 出現ア == '' ? '' : fullname(出現ア) + 'に話しかける';
イに話しかける = 出現イ == '' ? '' : fullname(出現イ) + 'に話しかける';
ウに話しかける = 出現ウ == '' ? '' : fullname(出現ウ) + 'に話しかける';
var 帰る = 'さっさと帰る (+' + 早退回復 + ')';
[endscript]

*種を表示
[枠]
[メッセージ]

[if exp="f.説明 == '会話の種'"]
	[eval exp="f.説明 = '放課後'"]
	[cancelskip]
	[image layer="&lay説明" storage="説明放課後" visible="true" opacity="191"][backlay]
	[nowait]
	今日の授業は全て終わった。[r]
	帰る前に誰と話そうか。
	[endnowait][next]
	[人物 画像=なし 名前=操作ガイド]
	放課後の説明をします。[next]
	[layopt layer="&lay説明" opacity="255"][backlay]
	[image layer="&lay説明+1" storage="説明放課後カズキ" visible="true"][backlay]
	放課後には、基本的に３人が出てきます。[n]
	（今日はカズキしかいませんが……）[next]
	昼休みと違い、放課後は [font color=&色：強化]１人しか話すことができません[resetfont]。[next]
	[image layer="&lay説明+1" storage="説明放課後早退" visible="true"][backlay]
	誰にも話さずに帰ると、体力が３回復します。[next]
	[layopt layer="&lay説明" opacity="191"][backlay]
	[image layer="&lay説明+1" storage="説明会話の種" visible="true"][backlay]
	誰と話すかを考えるには、どの会話の種を持っているかが[n]
	大きなヒントになります。[next]
	話しかける前に会話の種を確認するようにしましょう。[next]
	[layopt layer="&lay説明" opacity="191"][backlay]
	[image layer="&lay説明+1" storage="説明放課後ロード" visible="true"][backlay]
	朝に戻ってやり直すときは、ロードボタンを使います。[n]
	朝以外なら、このボタンはいつでも使えます。[next]
	[メッセージ]
	[layopt layer="&lay説明+1" visible="false"][backlay]
	[layopt layer="&lay説明" visible="false"][backlay]
[endif]

[ボタン表示種]
[nowait]
今日の授業は全て終わった。[r]
帰る前に誰と話そうか。
[endnowait]
[誰と話す 名前="&顔位置→名前(出現ア, 出現イ, 出現ウ, 0)" 位置="0"]
[誰と話す 名前="&顔位置→名前(出現ア, 出現イ, 出現ウ, 1)" 位置="1"]
[誰と話す 名前="&顔位置→名前(出現ア, 出現イ, 出現ウ, 2)" 位置="2"]
[四択 ア= &アに話しかける イ= &イに話しかける ウ= &ウに話しかける エ=&帰る]
[誰と話す消去]
[if exp="ア || イ || ウ || エ"][ボタン表示][endif]

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
	[体力 変化=&早退回復]
	よし、帰るか。[next]
	[場面転換]
	[背景 画像=通学路夕方]
[else]
	[jump target= *種を表示]
[endif]

[return]
