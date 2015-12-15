[eval exp="f.現在='昼休み'"]
[eval exp="f.昼休み=true, f.放課後=false"]
;強制イベント


[iscript]
var str = f.日 + '昼休み';
var 話しかけた人数 = 0;
var 出現ア = 出現[str + 'ア'];
var 出現イ = 出現[str + 'イ'];
var 出現ウ = 出現[str + 'ウ'];
var アに話しかける, イに話しかける, ウに話しかける;
[endscript]


*誰に話しかけようかな

[場面転換]
[背景 画像=廊下]
[BGM 曲=05日常.ogg buf=2 音量=50]

[iscript]
var 末尾 = 話しかけた人数 == 2 ? '（' + 会話３人目 + '）' : '';
アに話しかける = 出現ア == '' ? '' : 出現ア + 'に話しかける' + 末尾;
イに話しかける = 出現イ == '' ? '' : 出現イ + 'に話しかける' + 末尾;
ウに話しかける = 出現ウ == '' ? '' : 出現ウ + 'に話しかける' + 末尾;
[endscript]

[if exp="出現ア == '' && 出現イ == '' && 出現ウ ==''"]
	[枠]
	[SE 音= "チャイムR.ogg" 音量=40]
	昼休みも、もう終わりか。[next]
	[枠消去]
	[return]
[endif]

[枠]
昼休みは何をしよう。
[四択 ア= &アに話しかける イ= &イに話しかける ウ= &ウに話しかける エ= 何もしない]

;[call storage="自宅朝.ks" target="*会話の種"]

[if exp=ア]
	[枠消去]
	[if exp="話しかけた人数==2"][体力 変化=&会話３人目][endif]
	[call storage="&'scenario/個別/' + 出現ア + '.ks'"]
	[eval exp="出現ア='', 話しかけた人数+=1"]
[elsif exp=イ]
	[枠消去]
	[if exp="話しかけた人数==2"][体力 変化=&会話３人目][endif]
	[call storage="&'scenario/個別/' + 出現イ + '.ks'"]
	[eval exp="出現イ='', 話しかけた人数+=1"]
[elsif exp=ウ]
	[枠消去]
	[if exp="話しかけた人数==2"][体力 変化=&会話３人目][endif]
	[call storage="&'scenario/個別/' + 出現ウ + '.ks'"]
	[eval exp="出現ウ='', 話しかけた人数+=1"]
[elsif exp=エ]
	[if exp="出現ア == '前原先生' && f.日 == 23"]
		そうだ、面談に行くのを忘れてた！[next]
		[call storage="&'scenario/個別/' + 出現ア + '.ks'"]
		[eval exp="出現ア='', 話しかけた人数+=1"]
	[endif]
	[SE 音= "チャイムR.ogg" buf=2 音量=40]
	昼休みも、もう終わりか。[next]
	[枠消去]
	[return]
[endif]

[jump target= *誰に話しかけようかな]
