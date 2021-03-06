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
アに話しかける = 出現ア == '' ? '' : fullname(出現ア) + 'に話しかける' + 末尾;
イに話しかける = 出現イ == '' ? '' : fullname(出現イ) + 'に話しかける' + 末尾;
ウに話しかける = 出現ウ == '' ? '' : fullname(出現ウ) + 'に話しかける' + 末尾;
[endscript]

[if exp="出現ア == '' && 出現イ == '' && 出現ウ ==''"]
	[枠]
	[メッセージ]
	[SE 音= "チャイムR.ogg" 音量=40]
	昼休みも、もう終わりか。[next]
	[枠消去]
	[return]
[endif]

*種を表示
[枠]
[メッセージ]

[if exp="f.説明 == '授業'"]
	[eval exp="f.説明 = '昼休み'"]
	[cancelskip]
	[image layer="&lay説明" storage="説明昼休み" visible="true" opacity="191"]
	[backlay layer="&lay説明"]
	[nowait]昼休みは何をしよう。[endnowait][next]
	[人物 画像=なし 名前=操作ガイド]
	昼休みの説明をします。[next]
	[layopt layer="&lay説明" opacity="255"]
	[image layer="&lay説明+1" storage="説明選択肢前原" visible="true"]
	[backlay]
	昼休みには、基本的に３人が出てきます。[n]
	（今日は前原先生しかいませんが……）[next]
	１人目、２人目は、体力を消費せずに話しかけることができます。[n]
	しかし、[font color=&色：強化]３人目は体力３を消費[resetfont]します。[next]
	余裕がない日は、話す相手は２人にとどめておくと良いかもしれません。[next]
	さあ、いよいよ前原先生と面談が始まります！[next]
	[メッセージ]
	[layopt layer="&lay説明" visible="false"][backlay]
	[layopt layer="&lay説明 + 1" visible="false"][backlay]
[endif]

[ボタン表示種]
[nowait]昼休みは何をしよう。[endnowait]
[誰と話す 名前="&顔位置→名前(出現ア, 出現イ, 出現ウ, 0)" 位置="0"]
[誰と話す 名前="&顔位置→名前(出現ア, 出現イ, 出現ウ, 1)" 位置="1"]
[誰と話す 名前="&顔位置→名前(出現ア, 出現イ, 出現ウ, 2)" 位置="2"]
[四択 ア= &アに話しかける イ= &イに話しかける ウ= &ウに話しかける エ= 何もしない]
[誰と話す消去]
[if exp="ア || イ || ウ || エ"][ボタン表示][endif]

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
[else]
	[jump target= *種を表示]
[endif]

[jump target= *誰に話しかけようかな]
