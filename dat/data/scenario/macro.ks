[call storage=ExtHistoryLayer.ks]
[history historytag=false]
; 履歴設定
[call storage=systembutton.ks]
; システムボタン
[loadplugin module="wuvorbis.dll"]
[bgmopt gvolume=80]
; ogg vorbis
[eval exp="kag.askOnClose=false"]
; 閉じるときに確認しない

[laycount messages=3]
;メッセージ初期化---------------------------
[position layer=message0 frame=image/テキストボックス.png left=180 top=570 margint=16 marginl=40]
[position layer=message1 frame=image/ネームボックス.png left=1280 top=519 margint=14 marginl=0]
[position layer=message2 frame=image/選択枠 left=20 top=270 margint=16 marginl=24]
[current layer=message2]
[deffont edge="true" edgecolor="0x442211" size="24" color="0xFFFFFF" face="ＭＳ ゴシック"]
[resetfont]
[current layer=message1]
[deffont edge="true" edgecolor="0xFFFFFF" size="24" color="0x222211" face="ＭＳ ゴシック"]
[resetfont]
[current layer=message0]
[deffont edge="true" edgecolor="0xFFFFFF" size="24" color="0x222211" face="ＭＳ ゴシック"]
; メッセージレイヤは３枚用意する
; message0→セリフを表示する
; message1→人物名を表示する
; message2→選択肢を表示する
;-------------------------------------------
[iscript]
var layerモノローグ = 9;

function モノローグ初期化() {
	var layer = kag.back.layers[layerモノローグ];
	layer.setSize(1280, 720);
	layer.fillRect(0, 0, 1280, 720, 0x000000);
	layer.opacity = 100;
	layer.visible = false;
	layer = kag.fore.layers[layerモノローグ];
	layer.setSize(1280, 720);
	layer.fillRect(0, 0, 1280, 720, 0x000000);
	layer.opacity = 100;
	layer.visible = false;
}
[endscript]
;-------------------------------------------
[eval exp="モノローグ初期化()"]
[resetfont]
[layopt layer=message0 page=fore visible=false]
[layopt layer=message1 page=fore visible=false]
[layopt layer=message2 page=fore visible=false]
[backlay layer=message0]
[backlay layer=message1]
[backlay layer=message2]
; すべてのメッセージレイヤを不可視にする

[eval exp="var ア, イ, ウ, エ, オ, カ, キ, ク, ケ, コ, サ, シ"]
; 選択肢変数を１２用意する
[eval exp="var BGM音量 = 100"]
;BGM音量を保持する

[laycount layers=30]
; レイヤーは30枚, 0-29
; 0……なし
; 1……人物中央
; 2……人物左
; 3……人物右
; 5……体力気力日付
; 9……モノローグ
; 10-13……体力棒

[eval exp="var 黒棒"]
[eval exp="var 赤棒"]
[eval exp="var 黄棒"]
[eval exp="var ハート"]
[eval exp="var システムボタン = true"]
;[eval exp="hasSeed('無効なタネ')"]


[macro name=n]
[wait time=200]
[history output=false]
[r]
[history output=true]
[endmacro]

[macro name=next]
[wait time=200 cond=kag.autoMode]
[wait time=200 cond=kag.autoMode]
[wait time=200 cond=kag.autoMode]
[wait time=200 cond=kag.autoMode]
[wait time=200 cond=kag.autoMode]
[l][r][er]
[endmacro]

[macro name=間]
[wait time=150]
[endmacro]

[macro name=ま][間]
[endmacro]

[macro name=transskip]
[if exp="kag.skipMode<=1"]
[trans method=crossfade time=100]
[else]
[trans method=crossfade time=0]
[endif]
[wt]
[endmacro]

[macro name=枠]
[position layer=message1 page=back frame="ネームボックス自分"]
[position layer=message0 page=back frame="テキストボックス自分"]
[layopt layer=message0 page=back visible=true]
[layopt layer=message1 page=back visible=false]
[transskip]
[backlay layer=message0]
[backlay layer=message1]
[endmacro]

[macro name=枠消去]
[layopt layer=message0 page=back visible=false]
[layopt layer=message1 page=back visible=false]
[transskip]
[backlay layer=message0]
[backlay layer=message1]
[er][r][er]
;[cancelskip]
[endmacro]

[macro name=名前欄]
[history output=true]
[current layer=message0 page=back]
[nowait]
[er][r]＊ [ch text=%名前] ＊[er]
[history output=false]
[current layer=message1 page=back]
[style align=center][ch text=%名前]
[history output=true]
[current layer=message0]
[endnowait]
[endmacro]

[macro name=メッセージ]
[position layer=message1 page=back frame="ネームボックス自分"]
[position layer=message0 page=back frame="テキストボックス自分"]
[layopt layer=message1 page=back visible=false]
[transskip]
[backlay layer=message1]
[current layer=message0]
[endmacro]

[macro name=自分2]
[メッセージ]
[position layer=message1 page=back left=460]
[layopt layer=message1 page=back visible=true]
[名前欄 名前=自分]
[backlay layer=message1]
[er][r][er]
[endmacro]

[macro name=自分]
[position layer=message1 page=back frame="ネームボックス自分"]
[position layer=message0 page=back frame="テキストボックス自分"]
[position layer=message1 page=back left=300]
[layopt layer=message1 page=back visible=true]
[名前欄 自分 名前="&f.姓+f.名"]
[transskip]
[backlay layer=message1]
[er][r][er]
[endmacro]

[macro name=モノローグ]
[メッセージ]
[history output=true]
[current layer=message0 page=back]
[er][r][er]
[layopt layer=&layerモノローグ page=back visible=true]
[current layer=message0]
[transskip]
[endmacro]

[macro name=モノローグ終了]
[layopt layer=&layerモノローグ page=back visible=false]
[transskip]
[endmacro]

[macro name=表情]
[image storage=%画像 layer=1 page=back visible=true]
[eval exp="mp.tmp0 = kag.back.layers[1].width, mp.tmp1 = kag.fore.base.width, mp.tmp0 = (mp.tmp1 - mp.tmp0) / 2"]
[layopt layer=1 page=back left=&mp.tmp0]
[transskip]
[endmacro]

[macro name=表情左]
[eval exp="var dx = 440"]
[eval exp="dx -= 120" cond="mp.遠い"]
[image storage=%画像 layer=2 page=back visible=true]
[eval exp="mp.tmp0 = kag.back.layers[2].width, mp.tmp0 = -mp.tmp0 / 2 + dx"]
[layopt layer=2 page=back left=&mp.tmp0]
[transskip]
[endmacro]

[macro name=表情左遠い]
[表情左 遠い 画像=%画像 名前=%名前]
[endmacro]

[macro name=表情右]
[eval exp="var dx = 440"]
[eval exp="dx -= 120" cond="mp.遠い"]
[image storage=%画像 layer=3 page=back visible=true]
[eval exp="mp.tmp0 = kag.back.layers[3].width, mp.tmp1 = kag.fore.base.width, mp.tmp0 = mp.tmp1 - mp.tmp0 / 2 - dx"]
[layopt layer=3 page=back left=&mp.tmp0]
[transskip]
[endmacro]

[macro name=表情右遠い]
[表情右 遠い 画像=%画像 名前=%名前]
[endmacro]

[macro name=人物]
[position layer=message1 page=back frame="ネームボックス"]
[position layer=message0 page=back frame="テキストボックス"]
[position layer=message1 page=back left=460]
[layopt layer=message1 page=back visible=true]
[名前欄 名前=%名前]
[表情 画像=%画像]
[backlay layer=message1]
[backlay layer=1]
[er][r][er]
[endmacro]

[macro name=人物消去]
[layopt layer=1 page=back visible=false]
[transskip]
[current layer=message1][er][backlay layer=message1][current layer=message0]
[backlay layer=1]
[endmacro]

[macro name=人物左]
[position layer=message1 page=back frame="ネームボックス"]
[position layer=message0 page=back frame="テキストボックス"]
[position layer=message1 page=back left=220]
[layopt layer=message1 page=back visible=true]
[名前欄 名前=%名前]
[表情左 画像=%画像 遠い=%遠い]
[backlay layer=message1]
[backlay layer=2]
[er][r][er]
[endmacro]

[macro name=人物左遠い]
[人物左 遠い 画像=%画像 名前=%名前]
[endmacro]

[macro name=人物左消去]
[layopt layer=2 page=back visible=false]
[transskip]
[current layer=message1][er][backlay layer=message1][current layer=message0]
[backlay layer=2]
[endmacro]

[macro name=人物右]
[position layer=message1 page=back frame="ネームボックス"]
[position layer=message0 page=back frame="テキストボックス"]
[position layer=message1 page=back left=700]
[layopt layer=message1 page=back visible=true]
[名前欄 名前=%名前]
[表情右 画像=%画像 遠い=%遠い]
[backlay layer=message1]
[backlay layer=3]
[er][r][er]
[endmacro]

[macro name=人物右遠い]
[人物右 遠い 画像=%画像 名前=%名前]
[endmacro]

[macro name=人物右消去]
[layopt layer=3 page=back visible=false]
[transskip]
[current layer=message1][er][backlay layer=message1][current layer=message0]
[backlay layer=3]
[endmacro]

[macro name=人物全消去]
[layopt layer=1 page=back visible=false]
[layopt layer=2 page=back visible=false]
[layopt layer=3 page=back visible=false]
[transskip]
[current layer=message1][er][backlay layer=message1][current layer=message0]
[backlay layer=1]
[backlay layer=2]
[backlay layer=3]
[endmacro]

[macro name=背景]
[eval exp="mp.時間=400" cond="mp.時間===void"]
[image storage=%画像 layer=base page=back]
[if exp="kag.skipMode<=1"]
[trans layer=base method=crossfade time=%時間]
[else]
[trans layer=base method=crossfade time=0]
[endif]
[wt]
[endmacro]

[macro name=背景教室]
[if exp="f.昼休み"][背景 画像=教室][else][背景 画像=教室放課後][endif]
[endmacro]

[macro name=背景廊下]
[if exp="f.昼休み"][背景 画像=廊下][else][背景 画像=教室夕方][endif]
[endmacro]

[macro name=背景階段]
[if exp="f.昼休み"][背景 画像=階段昼][else][背景 画像=階段夕方][endif]
[endmacro]

[macro name=背景屋上]
[if exp="f.昼休み"][背景 画像=屋上昼][else][背景 画像=屋上][endif]
[endmacro]

[macro name=場面転換]
[人物全消去]
[枠消去]
[SE停止 buf=0 時間=1000]
[SE停止 buf=1 時間=1000]
[SE停止 buf=2 時間=1000]
[layopt layer=&layerモノローグ page=back visible=false]
;モノローグ終了
[背景 画像=黒]
[endmacro]

[macro name=姓]
[emb exp="f.姓"]
[endmacro]
[macro name=名]
[emb exp="f.名"]
[endmacro]

[macro name=二択]
[四択 ア=%ア イ=%イ ウ="" エ=""]
[endmacro]

[macro name=三択]
[四択 ア=%ア イ=%イ ウ=%ウ エ=""]
[endmacro]

[macro name=四択]
[eval exp="ア=mp.ア, イ=mp.イ, ウ=mp.ウ, エ=mp.エ"]
[call storage=macro.ks target=*f四択]
[endmacro]

[macro name=十二択]
[eval exp="clearChoice(), ア=mp.ア, イ=mp.イ, ウ=mp.ウ, エ=mp.エ, オ=mp.オ, カ=mp.カ, キ=mp.キ, ク=mp.ク, ケ=mp.ケ, コ=mp.コ, サ=mp.サ, シ=mp.シ"]
[call storage=macro.ks target=*f十二択]
[endmacro]

[macro name=ルビ]
[ruby text=%読み]
[endmacro]

[macro name=BGM]
[eval exp="mp.音量=100" cond="mp.音量===void"]
[eval exp="BGM音量 = mp.音量"]
[if exp="kag.bgm.currentBuffer.status=='play'"]
[xchgbgm storage=%曲 time=500 overlap=500 loop=%ループ]
[fadebgm volume=%音量 time=500]
[else]
[bgmopt volume=%音量]
[playbgm storage=%曲 loop=%ループ]
[endif]
[endmacro]

[macro name=BGM停止]
[eval exp="mp.時間=500" cond="mp.時間===void"]
[if exp="kag.skipMode>1"][stopbgm]
[else][fadeoutbgm time=%時間][endif]
[endmacro]

[macro name=BGM中断]
[if exp="kag.skipMode>1"][pausebgm]
[else][fadepausebgm time=500][endif]
[endmacro]

[macro name=BGM再開]
[bgmopt volume=&BGM音量]
[resumebgm]
[endif]
[endmacro]

[macro name=SE]
[if exp="kag.skipMode<=1"]
[seopt volume=%音量 buf=%buf]
[playse storage=%音 buf=%buf]
[endif]
[endmacro]

[macro name=SE停止]
[eval exp="mp.時間=100" cond="mp.時間===void"]
[fadeoutse buf=%buf time=%時間]
[endmacro]

[macro name=カラス]
[SE 音=カラス.ogg 音量=50 buf=2]
[endmacro]

[macro name=ぺらり]
[SE 音=紙をめくる.ogg 音量=50]
[endmacro]

[macro name=いい話だなあ]
[BGM ループ 音量=60 曲=いい話だなあ.ogg]
[endmacro]

[macro name=実績解除]
[if exp="sf[mp.名前] != 1"]
	[cancelskip]
	[bgmopt volume=&"BGM音量/2"]
	[SE 音=クリア.ogg 音量=50]
	[emb exp="mp.名前"] ★達成★[ws][fadebgm volume=&"BGM音量" time=500][next]
	[eval exp="sf[mp.名前] = 1"]
[endif]
[endmacro]

[macro name=種入手]
;[種入手 名前=俺が立候補？ 詳細=前原先生にすすめられた。 期限=3]
[eval exp="mp.期限=&種の期限標準" cond="mp.期限===void"]
[eval exp="gainSeed(mp.名前, mp.詳細, mp.期限, false)"]
[モノローグ]
[cancelskip]
[SE 音=手に入れた.ogg 音量=40 buf=1]
[nowait]※会話の種 [font color=0xdd4400][emb exp=mp.名前][resetfont] を手に入れた。[r]
（使用期限 [emb exp=mp.期限]日・１回限り）[endnowait][next]
[モノローグ終了]
[endmacro]

[macro name=無限種入手]
;[無限種入手 名前=俺が立候補？ 詳細=前原先生にすすめられた。 期限=3]
[eval exp="mp.期限=&種の期限標準" cond="mp.期限===void"]
[eval exp="gainSeed(mp.名前, mp.詳細, mp.期限, true)"]
[モノローグ]
[cancelskip]
[SE 音=手に入れた.ogg 音量=40 buf=1]
[nowait]※会話の種 [font color=0x0066ff][emb exp=mp.名前][resetfont] を手に入れた。[r]
（使用期限 [emb exp=mp.期限]日・回数制限なし）[endnowait][next]
[モノローグ終了]
[endmacro]

[macro name=種分岐]
;[種分岐 ア=俺が立候補？ イ=うまくやれる 体力=-3]
[eval exp="ア=mp.ア, イ=mp.イ"]
[eval exp="var 体力消費量 = mp.体力"]
[eval exp="体力消費量 = 0" cond="体力消費量 ===void"]
[call storage=macro.ks target=*種二択]
[endmacro]

[macro name=日付ジャンプ]
[call storage=%ジャンプ cond="f.今日==mp.日付"]
[endmacro]

[macro name=学力]
[eval exp=学力変化((int)mp.変化)]
[endmacro]

[macro name=体力]
;[体力 変化=5]のように使用する
[eval exp="tf.i = 0"]
[eval exp="tf.変化 = (int)mp.変化"]
[call storage="macro.ks" target=*体力減少 cond="tf.変化 < 0"]
[call storage="macro.ks" target=*体力増加 cond="tf.変化 > 0"]
[eval exp=棒()]
[if exp="f.生命 <= 0"]
	[cancelskip]
	[jump storage=ゲームオーバー.ks target="*ed1"]
[endif]
[endmacro]

[macro name=プラナリア回復]
[call storage="macro.ks" target="*プラナリア回復"]
[eval exp=棒()]
[endmacro]

[macro name=休日回復]
[eval exp="tf.生命 = Math.min(100, f.生命 + 休日回復)"]
[call storage="macro.ks" target="*休日回復"]
[eval exp=棒()]
[endmacro]

[macro name=睡眠回復]
[体力 変化=&"Math.floor(睡眠回復a + f.生命 * 睡眠回復b + f.体力 * 睡眠回復c)"]
[学力 変化 =&睡眠学力低下]
[endmacro]

;[足跡 名前=カケルが仲間になった]
[macro name=足跡]
[eval exp="足跡つける(mp.名前)"]
[endmacro]

[macro name=参加]
[eval exp="f[mp.名前 + '参加'] = 1"]
[メッセージ]
[emb exp="fullname(mp.名前)"]が文化祭準備に参加するようになった！[next]
[endmacro]

[macro name=不参加]
[eval exp="f[mp.名前 + '不参加'] = 1"]
[メッセージ]
[emb exp="fullname(mp.名前)"]が文化祭準備に参加しなくなった……[next]
[endmacro]

;デバッグ時に任意にフラグをON/OFFできる
;同時に同名の会話の種も取得する
;[足跡デバッグ 名前=カケルが仲間になった]
[macro name=足跡デバッグ]
[if exp=testplay]
	[eval exp = "var s = ' ×'"]
	[eval exp = "var s = ' ○'" cond="足跡(mp.名前)"]
	[eval exp = "var a = '足跡デバッグ：変更しない' + s"]
	[eval exp = "var b = mp.名前 + ' ○'"]
	[eval exp = "var c = mp.名前 + ' ×'"]
	[三択 ア=&a イ=&b ウ=&c]
	[if exp=イ]
		[eval exp="足跡つける(mp.名前)"]
		[eval exp="gainSeed(mp.名前, '', 0, 0)"]
	[elsif exp=ウ]
		[eval exp="足跡けす(mp.名前)"]
	[endif]
[endif]
[endmacro]

[macro name=ボタン表示]
;[sysbtopt forevisible=true backvisible=true mode=1]
[eval exp="global.systembutton_object.setMode(1)"]
[endmacro]

[macro name=ボタン表示タイトル]
;[sysbtopt forevisible=true backvisible=true mode=2]
[eval exp="global.systembutton_object.setMode(2)"]
[endmacro]

[macro name=ボタン表示自室]
[eval exp="global.systembutton_object.setMode(3)"]
[endmacro]

[macro name=ボタン消去]
[sysbtopt forevisible=false backvisible=false]
[eval exp="global.systembutton_object.setMode(0)"]
[endmacro]

[macro name=タイトルに戻る]
[jump storage=macro.ks target=*タイトルに戻る]
[endmacro]

[iscript]

// 文字列が全角文字で何文字相当なのかを計測する
function widthStr(s) {
	if(s === void) return 0;
	var i, sz = s.length;
	var res = sz;
	for(i = 0; i < sz; ++i) {
		if(s[i] <= "~") res -= 0.5;
	}
	return res;
}

// sという会話のタネが格納されている場所を返す
// 存在する→0以上のインデックス
// 存在しない→-1
function findSeed(s) {
	if(f.種 === void) return -1;
	var count = f.種.count;
	for(var i = 0; i < count; i++) {
		if(f.種[i] == s) {
			return i;
		}
	}
	return -1;
}

// 種を取得する関数
// s:種の名前 desc:種の説明 limit:使用期限あと何日
function gainSeed(s, desc, limit, inf) {
	if(f.種 ===void) f.種 = new Array();
	if(f.種詳細 ===void) f.種詳細 = new Array();
	if(f.種期限 ===void) f.種期限 = new Array();
	if(f.種無限 ===void) f.種無限 = new Array();
	var count = f.種.count;
	f.種[count] = s;
	f.種詳細[count] = desc;
	f.種期限[count] = limit;
	f.種無限[count] = inf;
}

// タネの使用期限をひとつ減らし、無効になったタネを削除して詰める
// 無効になった種＝使用期限が負の種、または、名前が空白の種
function manageSeed() {
	if(f.種 ===void) f.種 = new Array();
	if(f.種詳細 ===void) f.種詳細 = new Array();
	if(f.種期限 ===void) f.種期限 = new Array();
	if(f.種無限 ===void) f.種無限 = new Array();
	var count = f.種.count;
	for(var i = 0; i < count; i++) {
		f.種期限[i]--;
	}
	var fill = 0; // 次に詰めるべき場所
	// 種を詰める動作
	for(var i = 0; i < count; i++) {
		if(f.種期限[i] >= 0 && f.種[i] !==void) {
			f.種[fill] = f.種[i];
			f.種詳細[fill] = f.種詳細[i];
			f.種期限[fill] = f.種期限[i];
			f.種無限[fill] = f.種無限[i];
			fill++;
		}
	}
	// 配列を縮める
	f.種.count = fill;
	f.種詳細.count = fill;
	f.種期限.count = fill;
	f.種無限.count = fill;
}

// 指定したインデックスの種を使用する。
// 種のインデックスを得るためには、findSeed(s)を使う。
function useSeed(idx) {
	if(idx == -1 || idx >= f.種.count) return;
	if(!f.種無限[idx]) f.種[idx] = void;
}

function countSeed() {
	if(f.種 ===void) return 0;
	return f.種.count;
}

function today() {
	var mon;
	if(f.月 == 9) mon = '９';
	if(f.月 == 10) mon = '１０';
	if(f.月 == 11) mon = '１１';
	var week;
	if(f.週 == 1) week = '１';
	if(f.週 == 2) week = '２';
	if(f.週 == 3) week = '３';
	if(f.週 == 4) week = '４';
	return mon + '月' + week + '週 ' + f.曜日;
}

function 棒() {
if(黒棒 ===void){ // レイヤーが作られていない場合
	var x = 840;
	var y = 16;
	黒棒 = new Array();
	黒棒[0] = kag.back.layers[10];
	黒棒[1] = kag.fore.layers[10];
	黒棒[0].loadImages(%[storage:'黒棒.png']);
	黒棒[1].loadImages(%[storage:'黒棒.png']);
	黒棒[0].setSizeToImageSize();
	黒棒[1].setSizeToImageSize();
	黒棒[0].visible = 黒棒[1].visible = true;
	黒棒[0].setPos(x, y);
	黒棒[1].setPos(x, y);
	赤棒 = new Array();
	赤棒[0] = kag.back.layers[11];
	赤棒[1] = kag.fore.layers[11];
	赤棒[0].loadImages(%[storage:'赤棒.png']);
	赤棒[1].loadImages(%[storage:'赤棒.png']);
	赤棒[0].setSizeToImageSize();
	赤棒[1].setSizeToImageSize();
	赤棒[0].visible = 赤棒[1].visible = true;
	赤棒[0].setPos(x + 2, y + 2);
	赤棒[1].setPos(x + 2, y + 2);
	黄棒 = new Array();
	黄棒[0] = kag.back.layers[12];
	黄棒[1] = kag.fore.layers[12];
	黄棒[0].loadImages(%[storage:'黄棒.png']);
	黄棒[1].loadImages(%[storage:'黄棒.png']);
	黄棒[0].setSizeToImageSize();
	黄棒[1].setSizeToImageSize();
	黄棒[0].visible = 黄棒[1].visible = true;
	黄棒[0].setPos(x + 2, y + 2);
	黄棒[1].setPos(x + 2, y + 2);
	ハート = new Array();
	ハート[0] = kag.back.layers[13];
	ハート[1] = kag.fore.layers[13];
	ハート[0].loadImages(%[storage:'ハート小.png']);
	ハート[1].loadImages(%[storage:'ハート小.png']);
	ハート[0].setSizeToImageSize();
	ハート[1].setSizeToImageSize();
	ハート[0].visible = ハート[1].visible = true;
	ハート[0].setPos(x - 40, y - 5);
	ハート[1].setPos(x - 40, y - 5);
}
赤棒[0].width = 400 * f.生命 \ 100;
赤棒[1].width = 赤棒[0].width;
黄棒[0].width = 400 * f.体力 \ 100;
黄棒[1].width = 黄棒[0].width;
}

function 棒消去(){
if(黒棒 !==void){
黒棒[0].visible = false;
赤棒[0].visible = false;
黄棒[0].visible = false;
ハート[0].visible = false;
黒棒[1].visible = false;
赤棒[1].visible = false;
黄棒[1].visible = false;
ハート[1].visible = false;
}
}

function 学力変化(変化) {
f.学力 += 変化;
f.学力 = Math.min((int)95, f.学力);
f.学力 = Math.max((int)0, f.学力);
}

function 文化祭準備(頑張り) {
var n = f.マリ参加 * 2 + f.マリ招集 * 1;
n += f.イズミ参加 * 2 + f.イズミ招集 * 1;
n += f.マユ参加 * 2 + f.マユ招集 * 1;
n += f.カケル参加 * 2 + f.カケル招集 * 1;
n += f.ミドリ参加 * 2 + f.ミドリ招集 * 1;
n += f.モブ招集 * 1;
n += 主人公の頑張り;
if(主人公の頑張り == 1){n += 2;}
if(主人公の頑張り == 2){n += 2;}
f.マリ招集 = f.イズミ招集 = f.マユ招集 = f.カケル招集 = f.ミドリ招集 = f.モブ招集 = 0;
f.進捗 += n;
}

function 授業(頑張り) {
if(頑張り == 0){
	体力変化(5);
}else if(頑張り == 1){
	体力変化(-5);
	学力変化(f.学力 \ 20);
}else{
	体力変化(-10);
	学力変化(8);
}
}

// フラグを立てる
function 足跡つける(name) {
	if(f.足跡 ===void) f.足跡 = %[];
	f.足跡[name] = true;
}

// フラグを下げる
function 足跡けす(name) {
	if(f.足跡 ===void) f.足跡 = %[];
	f.足跡[name] = void;
}

// フラグをtrue/falseで返す
function 足跡(name) {
	if(f.足跡 ===void) return false;
	var res = f.足跡[name];
	if(res ===void) res = false;
	return res;
}

// 選択肢をすべて未選択状態にする
function clearChoice() {
	ア = イ = ウ = エ = オ = カ = キ = ク = ケ = コ = サ = シ = false;
}

function fullname(s) {
	if(s == 'イズミ') return '本多イズミ';
	if(s == 'マユ') return '桜マユ';
	if(s == 'ヨシオ') return '小平ヨシオ';
	if(s == 'カレン') return '恋ヶ窪カレン';
	if(s == 'カケル') return '梶野カケル';
	if(s == 'ミドリ') return '美園ミドリ';
	if(s == 'マリ') return '貫井マリ';
	if(s == 'カズキ') return '国分寺カズキ';
	if(s == '前原先生') return '前原先生';
	return '[警告：不正な名前です]';
}

[endscript]

[return]

*f四択
[iscript]
var len = Math.max(widthStr(ア), widthStr(イ));
len = Math.max(len, widthStr(ウ));
len = Math.max(len, widthStr(エ));
var wid = len * 38 + 20;
[endscript]
[nowait]
[current layer=message0 page=back]
[er][r][r][er][ch text="----- 選択肢 ---------------------"][r][er]
[current layer=message2]
[layopt layer=message2 page=fore visible=true]
[style autoreturn=false]
[if exp=ア!=''][link target=*f選択ア][emb exp="ア"][endlink][r][endif]
[if exp=イ!=''][link target=*f選択イ][emb exp="イ"][endlink][r][endif]
[if exp=ウ!=''][link target=*f選択ウ][emb exp="ウ"][endlink][r][endif]
[if exp=エ!=''][link target=*f選択エ][emb exp="エ"][endlink][r][endif]
[style autoreturn=true]
[current layer=message0 page=back]
[er][ch text="----------------------------------"][r][er]
[current layer=message0]
[endnowait]
[s]
*f選択エ
[eval exp="ア=false, イ=false, ウ=false, エ=true"]
[jump target=*f選択合流]
*f選択ウ
[eval exp="ア=false, イ=false, ウ=true, エ=false"]
[jump target=*f選択合流]
*f選択イ
[eval exp="ア=false, イ=true, ウ=false, エ=false"]
[jump target=*f選択合流]
*f選択ア
[eval exp="ア=true, イ=false, ウ=false, エ=false"]
*f選択合流
[cancelskip]
[SE 音=選択 音量=40 buf=1]
[layopt layer=message2 page=fore visible=false]
[current layer=message2]
[er]
[current layer=message0]
[er]
[return]

*f十二択
[nowait]
[current layer=message0 page=back]
[er][r][r][er][ch text="----- 選択肢 ---------------------"][r][er]
[current layer=message2]
[position frame="選択枠セーブ" top=200]
[font size=17]
[layopt layer=message2 page=fore visible=true]
[style autoreturn=false]
[if exp=ア!=''][link target=*f十二択合流 exp="clearChoice(), ア=true"][emb exp="ア"][endlink][r][endif]
[if exp=イ!=''][link target=*f十二択合流 exp="clearChoice(), イ=true"][emb exp="イ"][endlink][r][endif]
[if exp=ウ!=''][link target=*f十二択合流 exp="clearChoice(), ウ=true"][emb exp="ウ"][endlink][r][endif]
[if exp=エ!=''][link target=*f十二択合流 exp="clearChoice(), エ=true"][emb exp="エ"][endlink][r][endif]
[if exp=オ!=''][link target=*f十二択合流 exp="clearChoice(), オ=true"][emb exp="オ"][endlink][r][endif]
[if exp=カ!=''][link target=*f十二択合流 exp="clearChoice(), カ=true"][emb exp="カ"][endlink][r][endif]
[if exp=キ!=''][link target=*f十二択合流 exp="clearChoice(), キ=true"][emb exp="キ"][endlink][r][endif]
[if exp=ク!=''][link target=*f十二択合流 exp="clearChoice(), ク=true"][emb exp="ク"][endlink][r][endif]
[if exp=ケ!=''][link target=*f十二択合流 exp="clearChoice(), ケ=true"][emb exp="ケ"][endlink][r][endif]
[if exp=コ!=''][link target=*f十二択合流 exp="clearChoice(), コ=true"][emb exp="コ"][endlink][r][endif]
[if exp=サ!=''][link target=*f十二択合流 exp="clearChoice(), サ=true"][emb exp="サ"][endlink][r][endif]
[if exp=シ!=''][link target=*f十二択合流 exp="clearChoice(), シ=true"][emb exp="シ"][endlink][r][endif]
[resetfont]
[style autoreturn=true]
[current layer=message0 page=back]
[er][ch text="----------------------------------"][r][er]
[current layer=message0]
[endnowait]
[s]
*f十二択合流
[cancelskip]
[SE 音=選択 音量=40 buf=1]
[layopt layer=message2 page=fore visible=false]
[current layer=message2]
[position frame="選択枠" top=270]
[er]
[current layer=message0]
[er]
[return]

*種二択
[iscript]
var idxSeed = (int)findSeed(ア);
var len = Math.max(widthStr(ア), 18);
var fontsize = (int)(18 * 24 / len);
var inf = false;
if(idxSeed >= 0) inf = f.種無限[idxSeed];
var fontcolor = 色：種;
if(inf) fontcolor = 色：種無限;
[endscript]
[cancelskip]
[nowait]
[current layer=message0 page=back]
[r][r][er][ch text="----- 選択肢 ---------------------"][r][er]
[current layer=message2]
[layopt layer=message2 page=fore visible=true]

[style autoreturn=false]
[if exp="idxSeed < 0"]
	[font color=0x999999 size=&fontsize]会話の種を使う（[emb exp=体力消費量]）[r][[[emb exp=ア]][resetfont][r][r]
[else]
	[link target=*f種選択ア]会話の種を使う（[emb exp=体力消費量]）[r][font color=&fontcolor size=&fontsize][[[emb exp=ア]][resetfont][endlink][r][r]
[endif]
[link target=*f種選択イ][emb exp=イ][endlink][r]
[style autoreturn=true]
[endnowait]
[current layer=message0 page=back]
[er][ch text="----------------------------------"][r][er]
[current layer=message0]
[SE 音=選択肢.ogg 音量=60 buf=2]
[s]
*f種選択イ
[eval exp="ア=false, イ=true, ウ=false, エ=false"]
[eval exp="体力消費量 = 0"]
[jump target=*f種選択合流]
*f種選択ア
[eval exp="useSeed(idxSeed), ア=true, イ=false, ウ=false, エ=false"]
*f種選択合流
[cancelskip]
[SE 音=選択 音量=40 buf=1]
[layopt layer=message2 page=fore visible=false]
[current layer=message2]
[er]
[current layer=message0]
[er]
[体力 変化=&体力消費量]
[return]

function 体力変化(変化) {
f.体力 += 変化;
if(f.体力 < 0) {
	f.生命 += f.体力;
	f.体力 = 0;
}
f.体力 = Math.min(f.体力, f.生命);
}

*体力減少
[eval exp=棒()]
[eval exp="tf.変化 = -f.生命 - f.体力" cond="-tf.変化 > f.生命 + f.体力"]
[if exp="f.体力 == 0"]
[eval exp="f.生命 -= 1"]
[else]
[eval exp="f.体力 -= 1"]
[endif]
[eval exp="tf.変化 += 1"]
[wait time=50]
[jump storage="macro.ks" target=*体力減少 cond="tf.変化 !=0"]
[return]

*体力増加
[eval exp=棒()]
[eval exp="tf.変化 = f.生命 - f.体力" cond="tf.変化 > f.生命 - f.体力"]
[if exp="tf.変化 > 0"]
[eval exp="f.体力 += 1"]
[eval exp="tf.変化 -= 1"]
[wait time=50]
[endif]
[jump storage="macro.ks" target=*体力増加 cond="tf.変化 !=0"]
[return]

*プラナリア回復
[eval exp=棒()]
[return cond="f.生命 >= 100"]
[if exp="f.生命 > 70"][eval exp="f.生命 += 1"]
[elsif exp="f.生命 > 40"][eval exp="f.生命 += 2"]
[else][eval exp="f.生命 += 3"]
[endif]
[wait time=50]
[jump target="*プラナリア回復"]

*休日回復
[eval exp=棒()]
[return cond="f.生命 >= tf.生命"]
[eval exp="f.生命 += 1"]
[wait time=50]
[jump target="*休日回復"]

*タイトルに戻る
[ボタン消去]
[eval exp="棒消去()"]
[eval exp="kag.historyLayer.clear()"]
[layopt layer=&layerモノローグ page=fore visible=false]
[layopt layer=&layerモノローグ page=back visible=false]
[BGM停止]
[SE停止]
[人物全消去]
[枠消去]
[jump storage=first.ks target=*起動]

*終了処理
[ボタン消去]
[BGM停止]
[SE停止]
[枠消去]
[背景 画像=黒 時間=400]
[close]
