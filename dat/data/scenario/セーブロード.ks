[iscript]
if(sf.セーブスロットＡ===void) sf.セーブスロットＡ = 'データなし';
if(sf.セーブスロットＢ===void) sf.セーブスロットＢ = 'データなし';
if(sf.セーブスロットＣ===void) sf.セーブスロットＣ = 'データなし';
if(sf.セーブスロットＤ===void) sf.セーブスロットＤ = 'データなし';
if(sf.セーブスロットＥ===void) sf.セーブスロットＥ = 'データなし';
if(sf.セーブスロットＦ===void) sf.セーブスロットＦ = 'データなし';
if(sf.セーブスロットＧ===void) sf.セーブスロットＧ = 'データなし';
if(sf.セーブスロットＨ===void) sf.セーブスロットＨ = 'データなし';
if(sf.セーブスロットＩ===void) sf.セーブスロットＩ = 'データなし';
if(sf.セーブスロットＪ===void) sf.セーブスロットＪ = 'データなし';
if(sf.セーブスロット自動===void) sf.セーブスロット自動 = 'データなし';

var slota = 'Ａ：' + sf.セーブスロットＡ;
var slotb = 'Ｂ：' + sf.セーブスロットＢ;
var slotc = 'Ｃ：' + sf.セーブスロットＣ;
var slotd = 'Ｄ：' + sf.セーブスロットＤ;
var slote = 'Ｅ：' + sf.セーブスロットＥ;
var slotf = 'Ｆ：' + sf.セーブスロットＦ;
var slotg = 'Ｇ：' + sf.セーブスロットＧ;
var sloth = 'Ｈ：' + sf.セーブスロットＨ;
var sloti = 'Ｉ：' + sf.セーブスロットＩ;
var slotj = 'Ｊ：' + sf.セーブスロットＪ;
var slotz = '自動：' + sf.セーブスロット自動;

function numToSlot(n) {
	if(tf.numToSlot === void) {
		tf.numToSlot = ['自動', 'Ａ', 'Ｂ', 'Ｃ', 'Ｄ', 'Ｅ', 'Ｆ', 'Ｇ', 'Ｈ', 'Ｉ', 'Ｊ'];
	}
	if(n >= tf.numToSlot.count) {
		System.inform("tf.numToSlot のインデックス限界を超えました");
	}
	return tf.numToSlot[n];
}
[endscript]

[macro name=セーブスロット]
[emb exp="numToSlot(sf.セーブスロット前回の番号)"]
[endmacro]

[macro name=上書き確認]
[if exp="mp.スロット=='データなし'"]
	[eval exp="tf.result = false, tf.セーブスロット候補 = mp.番号"]
[else]
	[nowait]
	すでにデータが存在します。[r]
	上書きしますか？
	[endnowait]
	[二択 ア=やっぱりやめる イ=上書きする]
	[if exp=ア]
		[eval exp="tf.result = true"]
	[else]
		[eval exp="tf.result = false, tf.セーブスロット候補 = mp.番号"]
	[endif]
[endif]
[endmacro]

[return]

*ロード

[nowait]前回の続きは、[セーブスロット]のデータです。[endnowait]
[eval exp="var 再開スロット = void"]
[十二択 ア=&slota イ=&slotb ウ=&slotc エ=&slotd オ=&slote カ=&slotf キ=&slotg ク=&sloth ケ=&sloti コ=&slotj サ=&slotz シ=戻る]
[if exp=ア][eval exp="再開スロット=1" cond="sf.セーブスロットＡ!='データなし'"]
[elsif exp=イ][eval exp="再開スロット=2" cond="sf.セーブスロットＢ!='データなし'"]
[elsif exp=ウ][eval exp="再開スロット=3" cond="sf.セーブスロットＣ!='データなし'"]
[elsif exp=エ][eval exp="再開スロット=4" cond="sf.セーブスロットＤ!='データなし'"]
[elsif exp=オ][eval exp="再開スロット=5" cond="sf.セーブスロットＥ!='データなし'"]
[elsif exp=カ][eval exp="再開スロット=6" cond="sf.セーブスロットＦ!='データなし'"]
[elsif exp=キ][eval exp="再開スロット=7" cond="sf.セーブスロットＧ!='データなし'"]
[elsif exp=ク][eval exp="再開スロット=8" cond="sf.セーブスロットＨ!='データなし'"]
[elsif exp=ケ][eval exp="再開スロット=9" cond="sf.セーブスロットＩ!='データなし'"]
[elsif exp=コ][eval exp="再開スロット=10" cond="sf.セーブスロットＪ!='データなし'"]
[elsif exp=サ][eval exp="再開スロット=0" cond="sf.セーブスロット自動!='データなし'"]
[elsif exp=シ][return]
[endif]
[return cond="再開スロット===void"]
[BGM停止]
[枠消去]
[背景 画像=黒]
[load place=0 cond="再開スロット==0"]
[eval exp="tf.セーブスロット候補 = 再開スロット"]
[load place=&tf.セーブスロット候補]


*最初から

[nowait]
新しく始めます。[r]
セーブ先はどこにしますか？
[endnowait]
[十二択 ア=&slota イ=&slotb ウ=&slotc エ=&slotd オ=&slote カ=&slotf キ=&slotg ク=&sloth ケ=&sloti コ=&slotj サ=戻る]
[if exp=ア][上書き確認 スロット="&sf.セーブスロットＡ" 番号=1]
[elsif exp=イ][上書き確認 スロット="&sf.セーブスロットＢ" 番号=2]
[elsif exp=ウ][上書き確認 スロット="&sf.セーブスロットＣ" 番号=3]
[elsif exp=エ][上書き確認 スロット="&sf.セーブスロットＤ" 番号=4]
[elsif exp=オ][上書き確認 スロット="&sf.セーブスロットＥ" 番号=5]
[elsif exp=カ][上書き確認 スロット="&sf.セーブスロットＦ" 番号=6]
[elsif exp=キ][上書き確認 スロット="&sf.セーブスロットＧ" 番号=7]
[elsif exp=ク][上書き確認 スロット="&sf.セーブスロットＨ" 番号=8]
[elsif exp=ケ][上書き確認 スロット="&sf.セーブスロットＩ" 番号=9]
[elsif exp=コ][上書き確認 スロット="&sf.セーブスロットＪ" 番号=10]
[elsif exp=サ][eval cond="tf.result = true"]
[endif]
[return]

*セーブ
[call storage="セーブロード.ks"]
[nowait]
スロット[セーブスロット]のデータをプレイ中。[r]
セーブ先はどこにしますか？
[endnowait]
[十二択 ア=&slota イ=&slotb ウ=&slotc エ=&slotd オ=&slote カ=&slotf キ=&slotg ク=&sloth ケ=&sloti コ=&slotj サ=戻る]
[eval exp="tf.result = false"]
[if exp=ア][上書き確認 スロット="&sf.セーブスロットＡ" 番号=1]
[elsif exp=イ][上書き確認 スロット="&sf.セーブスロットＢ" 番号=2]
[elsif exp=ウ][上書き確認 スロット="&sf.セーブスロットＣ" 番号=3]
[elsif exp=エ][上書き確認 スロット="&sf.セーブスロットＤ" 番号=4]
[elsif exp=オ][上書き確認 スロット="&sf.セーブスロットＥ" 番号=5]
[elsif exp=カ][上書き確認 スロット="&sf.セーブスロットＦ" 番号=6]
[elsif exp=キ][上書き確認 スロット="&sf.セーブスロットＧ" 番号=7]
[elsif exp=ク][上書き確認 スロット="&sf.セーブスロットＨ" 番号=8]
[elsif exp=ケ][上書き確認 スロット="&sf.セーブスロットＩ" 番号=9]
[elsif exp=コ][上書き確認 スロット="&sf.セーブスロットＪ" 番号=10]
[elsif exp=サ][eval cond="tf.result = true"]
[endif]
[return cond="tf.result"]
[call target="*セーブ実行"]
[nowait]
スロット[セーブスロット]にセーブしました。[next]
[endnowait]

[return]

*セーブ実行

[eval exp="sf.セーブスロット前回の番号 = tf.セーブスロット候補"]
[eval exp="sf['セーブスロット' + numToSlot(tf.セーブスロット候補)] = tf.セーブラベル"]
[save place="&tf.セーブスロット候補"]

[return]

*オートセーブ

[eval exp="sf.セーブスロット自動 = tf.セーブラベル"]
[save place="0"]

[return]
