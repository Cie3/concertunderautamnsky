[iscript]
var セーブスロット候補 = void;
// セーブスロット候補 は、ロードしただけで書き換わるし、タイトルに戻ると消える
// sf.セーブスロット前回の番号 は、セーブをしないと書き換わらない
var オートセーブ可能 = 0;
// ロードしてから１日過ぎないとオートセーブが発動しない

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

var slota, slotb, slotc, slotd, slote, slotf, slotg, slotg, sloth, sloti, slotj, slotz;

function updateSlotName() {
	slota = 'Ａ：' + sf.セーブスロットＡ;
	slotb = 'Ｂ：' + sf.セーブスロットＢ;
	slotc = 'Ｃ：' + sf.セーブスロットＣ;
	slotd = 'Ｄ：' + sf.セーブスロットＤ;
	slote = 'Ｅ：' + sf.セーブスロットＥ;
	slotf = 'Ｆ：' + sf.セーブスロットＦ;
	slotg = 'Ｇ：' + sf.セーブスロットＧ;
	sloth = 'Ｈ：' + sf.セーブスロットＨ;
	sloti = 'Ｉ：' + sf.セーブスロットＩ;
	slotj = 'Ｊ：' + sf.セーブスロットＪ;
	slotz = '自動：' + sf.セーブスロット自動;
}
updateSlotName();

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
[if exp="セーブスロット候補 === void"]
	;ロード画面、またはオートセーブからの再開
	[emb exp="numToSlot(sf.セーブスロット前回の番号)"]
[else]
	[emb exp="numToSlot(セーブスロット候補)"]
[endif]
[endmacro]

[macro name=上書き確認]
[if exp="mp.スロット=='データなし'"]
	[eval exp="tf.result = false, セーブスロット候補 = mp.番号"]
[else]
	[nowait]
	すでにデータが存在します。[r]
	上書きしますか？
	[endnowait]
	[二択 ア=やっぱりやめる イ=上書きする]
	[if exp=ア]
		[eval exp="tf.result = true"]
	[else]
		[eval exp="tf.result = false, セーブスロット候補 = mp.番号"]
	[endif]
[endif]
[endmacro]

[return]

*ロード
[eval exp="var 再開スロット = void"]
[nowait]前回の続きは、[font color="&色：強化"]スロット[セーブスロット][resetfont] のデータです。[endnowait]
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
[else][return]
[endif]
[return cond="再開スロット===void"]
[BGM停止]
[枠消去]
[背景 画像=黒]
[load place=0 cond="再開スロット==0"]
[eval exp="セーブスロット候補 = 再開スロット"]
[load place=&セーブスロット候補]


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
[else][eval cond="tf.result = true"]
[endif]
[return]

*セーブ
;[call storage="セーブロード.ks"]
[nowait]
[if exp="セーブスロット候補 != void"]
	現在、[font color="&色：強化"]スロット[セーブスロット][resetfont] のデータをプレイ中。[r]
[else]
	現在、オートセーブをプレイ中。最後にセーブしたスロットは[emb exp="numToSlot(sf.セーブスロット前回の番号)"]です。[r]
[endif]
	セーブ先はどこにしますか？[r]
	[font color="&色：強化"][emb exp="saveLabel()"][resetfont]
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
[else][eval cond="tf.result = true"]
[endif]
[return cond="tf.result"]
[call target="*セーブ実行"]
[nowait]
スロット[セーブスロット]にセーブしました。[next]
[endnowait]
[return]

*セーブ実行

[eval exp="sf.セーブスロット前回の番号 = セーブスロット候補"]
[eval exp="sf['セーブスロット' + numToSlot(セーブスロット候補)] = saveLabel()"]
[save place="&セーブスロット候補"]
[eval exp="オートセーブ可能 = 0"]
[eval exp="updateSlotName()"]
[return]

*オートセーブ

[eval exp="sf.セーブスロット自動 = saveLabel()"]
[save place="0"]

[return]
