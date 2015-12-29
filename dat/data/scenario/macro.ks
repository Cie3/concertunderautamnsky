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
; 14……日付
; 15……曜日
; 16-18……誰と話す顔アイコン
; 20-22……説明用画像

[eval exp="var 黒棒"]
[eval exp="var 赤棒"]
[eval exp="var 黄棒"]
[eval exp="var ハート"]
[eval exp="var 日付"]
[eval exp="var lay日付 = 15"]
[eval exp="var lay曜日 = 14"]
[eval exp="var 曜日画像"]
[eval exp="var システムボタン = true"]
[iscript]
var lay顔 = 16;
var lay説明 = 20;

var personC = false; // 中央に人がいるか
var personR = false; // 右側に人がいるか
var personL = false; // 左側に人がいるか
[endscript]
;[eval exp="hasSeed('無効なタネ')"]


[macro name=n]
[wait time=200]
[履歴なし出力 改行]
[endmacro]

[macro name=next]
[wait time=200 cond=kag.autoMode]
[wait time=200 cond=kag.autoMode]
[wait time=200 cond=kag.autoMode]
[wait time=200 cond=kag.autoMode]
[wait time=200 cond=kag.autoMode]
[l]
[履歴出力 改行]
[backlay layer=message0]
[backlay layer=message1]
[current layer="message0" page="back"]
[er]
[transskip]
[current layer="message0" page="fore"]
[backlay]
[endmacro]

[macro name=next2]
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
;[transskip]
;[backlay layer=message0]
;[backlay layer=message1]
[endmacro]

[macro name=枠消去]
[layopt layer=message0 page=back visible=false]
[layopt layer=message1 page=back visible=false]
[transskip]
[backlay layer=message0]
[backlay layer=message1]
[endmacro]

[macro name=履歴出力]
[history output=&f.履歴許可]
[current layer=message2 page=back]
[ch text=%内容 cond="mp.内容 != void"]
[if exp="mp.改行"][r][endif]
[er]
[current layer=message0]
[endmacro]

[macro name=履歴なし出力]
[history output=false]
[emb exp="mp.内容"]
[if exp="mp.改行"][r][endif]
[history output=&f.履歴許可]
[endmacro]

[macro name=名前欄]
[履歴出力 改行]
[履歴出力 内容="&'＊' + mp.名前 + '＊'" 改行]
[current layer=message1 page=back]
[style align=center]
[nowait]
[履歴なし出力 内容="%名前"]
[endnowait]
[current layer=message0]
[endmacro]

[macro name=メッセージ]
[履歴出力 改行]
[position layer=message1 page=back frame="ネームボックス自分"]
[position layer=message0 page=back frame="テキストボックス自分"]
[layopt layer=message1 page=back visible=false]
[transskip]
[backlay layer=message1]
[current layer=message0][er]
[endmacro]

[macro name=自分]
[position layer=message1 page=back frame="ネームボックス自分"]
[position layer=message0 page=back frame="テキストボックス自分"]
[if exp="!personC"]
	[position layer=message1 page=back left=460]
[elsif exp="!personL"]
	[position layer=message1 page=back left=220]
[elsif exp="!personR"]
	[position layer=message1 page=back left=700]
[else]
	[position layer=message1 page=back left=460]
[endif]

[layopt layer=message1 page=back visible=true]
[名前欄 自分 名前="&f.姓+f.名"]
[transskip]
[backlay layer=message1]
[current layer=message0][er]
[endmacro]

[macro name=モノローグ]
[メッセージ]
[layopt layer=&layerモノローグ page=back visible=true]
[transskip]
[endmacro]

[macro name=モノローグ終了]
[layopt layer=&layerモノローグ page=back visible=false]
[transskip]
[endmacro]

[macro name=表情]
[eval exp="personC = true"]
[image storage=%画像 layer=1 page=back visible=true]
[eval exp="mp.tmp0 = kag.back.layers[1].width, mp.tmp1 = kag.fore.base.width, mp.tmp0 = (mp.tmp1 - mp.tmp0) / 2"]
[layopt layer=1 page=back left=&mp.tmp0]
[transskip]
[endmacro]

[macro name=表情左]
[eval exp="personL = true"]
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
[eval exp="personR = true"]
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
[eval exp="personC = true"]
[position layer=message1 page=back frame="ネームボックス"]
[position layer=message0 page=back frame="テキストボックス"]
[position layer=message1 page=back left=460]
[layopt layer=message1 page=back visible=true]
[名前欄 名前=%名前]
[表情 画像=%画像]
;[backlay layer=message1]
;[backlay layer=1]
[transskip]
[endmacro]

[macro name=人物消去]
[eval exp="personC = false"]
[layopt layer=1 page=back visible=false]
[transskip]
;[current layer=message1][er][backlay layer=message1][current layer=message0]
;[backlay layer=1]
[endmacro]

[macro name=人物左]
[eval exp="personL = true"]
[position layer=message1 page=back frame="ネームボックス"]
[position layer=message0 page=back frame="テキストボックス"]
[position layer=message1 page=back left=220]
[layopt layer=message1 page=back visible=true]
[名前欄 名前=%名前]
[表情左 画像=%画像 遠い=%遠い]
;[backlay layer=message1]
;[backlay layer=2]
[transskip]
[endmacro]

[macro name=人物左遠い]
[人物左 遠い 画像=%画像 名前=%名前]
[endmacro]

[macro name=人物左消去]
[eval exp="personL = false"]
[layopt layer=2 page=back visible=false]
[transskip]
;[current layer=message1][er][backlay layer=message1][current layer=message0]
;[backlay layer=2]
[endmacro]

[macro name=人物右]
[eval exp="personR = true"]
[position layer=message1 page=back frame="ネームボックス"]
[position layer=message0 page=back frame="テキストボックス"]
[position layer=message1 page=back left=700]
[layopt layer=message1 page=back visible=true]
[名前欄 名前=%名前]
[表情右 画像=%画像 遠い=%遠い]
;[backlay layer=message1]
;[backlay layer=3]
[transskip]
[endmacro]

[macro name=人物右遠い]
[人物右 遠い 画像=%画像 名前=%名前]
[endmacro]

[macro name=人物右消去]
[eval exp="personR = false"]
[layopt layer=3 page=back visible=false]
[transskip]
;[current layer=message1][er][backlay layer=message1][current layer=message0]
;[backlay layer=3]
[endmacro]

[macro name=人物全消去]
[eval exp="personC = false"]
[eval exp="personL = false"]
[eval exp="personR = false"]
[layopt layer=1 page=back visible=false]
[layopt layer=2 page=back visible=false]
[layopt layer=3 page=back visible=false]
[transskip]
;[current layer=message1][er][backlay layer=message1][current layer=message0]
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
[if exp="f.昼休み"][背景 画像=教室][else][背景 画像=教室夕方][endif]
[endmacro]

[macro name=背景廊下]
[if exp="f.昼休み"][背景 画像=廊下][else][背景 画像=廊下夕方][endif]
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
[履歴出力 改行]
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
	[メッセージ]
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
[eval exp="f[mp.名前 + '招集'] = 0"]
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

[macro name=ボタン表示種]
[eval exp="global.systembutton_object.setMode(4)"]
[endmacro]

[macro name="ボタン表示自室種"]
[eval exp="global.systembutton_object.setMode(5)"]
[endmacro]

[macro name=ボタン消去]
[sysbtopt forevisible=false backvisible=false]
[eval exp="global.systembutton_object.setMode(0)"]
[endmacro]



[macro name=タイトルに戻る]
[jump storage=macro.ks target=*タイトルに戻る]
[endmacro]

[macro name="誰と話す"]
[eval exp="mp.位置 = (int)mp.位置"]
;マクロ引数「位置」は0,1,2でなければならない。
;マクロ引数「名前」は登場人物の名前でなければならない。
[if exp="mp.位置 != 0 && mp.位置 != 1 && mp.位置 != 2"]
	[eval exp="System.inform('エラー：顔アイコンの位置が0,1,2ではない')"]
[endif]
;layn: レイヤー番号
[eval exp="var layn = lay顔 + mp.位置"]
[eval exp="var path = 'fgimage/でふぉ/でふぉ小' + mp.名前"]
[image storage="&path" layer="&layn" page="fore"]
[eval exp="var idxLayer = 1001000 + 10000 + mp.位置"]
[eval exp="var posx = 410 - mp.位置 * 25"]
[eval exp="var posy = 272 + mp.位置 * 30"]
[layopt layer="&layn" index="&idxLayer" left="&posx" top="&posy" visible="true"]
[endmacro]

[macro name="誰と話す消去"]
[layopt layer="&lay顔 + 0" visible="false" page="back"]
[layopt layer="&lay顔 + 1" visible="false" page="back"]
[layopt layer="&lay顔 + 2" visible="false" page="back"]
[transskip]
[backlay]
[endmacro]

[macro name="状況設定"]
[if exp="testplay"]
	[四択 ア=のこり15日 イ=のこり12日 ウ=のこり９日 エ=のこり６日]
	[if exp="ア"]
		[eval exp="f.日 = 15"]
	[elsif exp="イ"]
		[eval exp="f.日 = 12"]
	[elsif exp="ウ"]
		[eval exp="f.日 = 9"]
	[elsif exp="エ"]
		[eval exp="f.日 = 6"]
	[endif]
	
	[十二択 ア=進捗１０％ イ=進捗３０％ ウ=進捗５０％ エ=７０％ オ=９０％ カ=１３０％ キ=１７０％]
	[if exp="ア"]
		[eval exp="f.進捗 = 10"]
	[elsif exp="イ"]
		[eval exp="f.進捗 = 30"]
	[elsif exp="ウ"]
		[eval exp="f.進捗 = 50"]
	[elsif exp="エ"]
		[eval exp="f.進捗 = 70"]
	[elsif exp="オ"]
		[eval exp="f.進捗 = 90"]
	[elsif exp="カ"]
		[eval exp="f.進捗 = 130"]
	[elsif exp="キ"]
		[eval exp="f.進捗 = 170"]
	[endif]

	[三択 ア=カレンなし イ=カレン攻略 ウ=カレンけんか]
	[if exp="ア"]
	[elsif exp="イ"]
		[eval exp="f.カレン攻略 = 1"]
	[elsif exp="ウ"]
		[eval exp="f.カレンけんか = 1"]
	[endif]

	[四択 ア=マリなし イ=マリ攻略 ウ=マリけんか エ=マリ参加]
	[if exp="ア"]
	[elsif exp="イ"]
		[eval exp="f.マリ参加 = f.マリ攻略 = 1"]
	[elsif exp="ウ"]
		[eval exp="f.マリ参加 = f.マリけんか = 1"]
	[elsif exp="エ"]
		[eval exp="f.マリ参加 = 1"]
	[endif]

	[四択 ア=イズミマユなし イ=イズミ参加 ウ=マユ参加 エ=両方参加]
	[if exp="ア"]
	[elsif exp="イ"]
		[eval exp="f.イズミ参加 = 1"]
	[elsif exp="ウ"]
		[eval exp="f.マユ参加 = 1"]
	[elsif exp="エ"]
		[eval exp="f.イズミ参加 = f.マユ参加 = 1"]
	[endif]

	[四択 ア=カケルミドリなし イ=カケル参加 ウ=ミドリ参加 エ=両方参加]
	[if exp="ア"]
	[elsif exp="イ"]
		[eval exp="f.カケル参加 = 1"]
	[elsif exp="ウ"]
		[eval exp="f.ミドリ参加 = 1"]
	[elsif exp="エ"]
		[eval exp="f.カケル参加 = f.ミドリ参加 = 1"]
	[endif]
[endif]
[endmacro]

[macro name="背景準備教室"]
[if exp="f.曜日 == '週末'"]
	[背景 画像=空き教室]
[else]
	[背景 画像=教室放課後]
[endif]
[endmacro]

[macro name=文化祭準備の曲]
[if exp="f.進捗 < 30"]
[BGM 曲=文化祭準備01.ogg 音量=50]
[elsif exp="f.進捗 < 50"]
[BGM 曲=文化祭準備04.ogg 音量=60]
[elsif exp="f.進捗 < 80"]
[BGM 曲=文化祭準備05.ogg 音量=60]
[elsif exp="f.進捗 < 100"]
[BGM 曲=文化祭準備06.ogg 音量=60]
[else]
[BGM 曲=文化祭準備07.ogg 音量=60]
[endif]
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
		if(f.種期限[i] >= 0 && f.種[i] !==void && f.種[i][0] != '※') {
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
	if(!f.種無限[idx]) {
		f.種[idx] = '※使用済：' + f.種[idx];
		f.種期限[idx] = -1; // 使用済みであることを明示
	}
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

// 0＝裏、1＝表
function 日付表示(page) {
	if(page === void) {
		日付表示(0);
		日付表示(1);
		return;
	}
	var x = 16;
	var y = 16;
	if(日付 === void) {
		日付 = new Array();
		曜日画像 = new Array();
	}
	日付[0] = kag.back.layers[lay日付];
	日付[1] = kag.fore.layers[lay日付];
	曜日画像[0] = kag.back.layers[lay曜日];
	曜日画像[1] = kag.fore.layers[lay曜日];
	var path = 'image/日付/日付' + f.日 + '.png';
	日付[page].loadImages(%[storage:path]);
	日付[page].setSizeToImageSize();
	日付[page].visible = true;
	日付[page].setPos(x, y);
	日付[page].opacity = 255;
	path = 'image/日付/曜日' + f.曜日 + '.png';
	曜日画像[page].loadImages(%[storage:path]);
	曜日画像[page].setSizeToImageSize();
	曜日画像[page].visible = true;
	曜日画像[page].setPos(x + 165, y - 25);
}

function 日付消去() {
	if(日付 !== void) {
		日付[0].visible = false;
		日付[1].visible = false;
		曜日画像[0].visible = false;
		曜日画像[1].visible = false;
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

function 人員計算() {
	// 重複状態を正規化する
	if(f.イズミ参加) f.イズミ招集 = 0;
	if(f.マユ参加) f.マユ招集 = 0;
	if(f.カケル参加) f.カケル招集 = 0;
	if(f.ミドリ参加) f.ミドリ招集 = 0;
	if(f.マリ参加) f.マリ招集 = 0;
	var a = 3; // 主人公＋カレン＋ヨシオ
	var b = f.イズミ参加 + f.マユ参加 + f.カケル参加 + f.ミドリ参加 + f.マリ参加;
	var c = f.イズミ招集 + f.マユ招集 + f.カケル招集 + f.ミドリ招集 + f.マリ招集;
	var d = f.モブ男招集 + f.モブ女招集;
	var r = a + b + c + d;
	// ８人より多い場合はモブを切り捨て
	if(r > 8) {
		r -= f.モブ女招集;
		f.モブ女招集 = 0;
	}
	if(r > 8) {
		r -= f.モブ男招集;
		f.モブ男招集 = 0;
	}
	return r;
}

function 顔位置→名前(ア, イ, ウ, 位置) {
	if(位置 == 0) {
		if(ア != '') return ア;
		if(イ != '') return イ;
		if(ウ != '') return ウ;
	}
	if(位置 == 1) {
		if(ア != '') {
			if(イ != '') return イ;
			if(ウ != '') return ウ;
		}
		if(イ != '') {
			if(ウ != '') return ウ;
		}
	}
	if(位置 == 2) {
		if(ア != '') {
			if(イ != '') {
				if(ウ != '') return ウ;
			}
		}
	}
	return '';
}

function saveLabel() {
	return f.姓 + f.名 + ' [' + f.進捗 + '％' + '] ' + '残り' + f.日 + '日 ' + f.曜日;
}

function scoreSpacer(n) {
	if(0 <= n && n <= 9) return '    ';
	if(10 <= n && n <= 99) return '   ';
	if(100 <= n && n <= 999) return '  ';
	return '';
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
[履歴出力 改行]
[履歴出力 内容="┏━━━ 選択肢 ━━━━━━━━━━━┓" 改行]
[if exp=ア!=''][履歴出力 内容="&'　' + ア" 改行][endif]
[if exp=イ!=''][履歴出力 内容="&'　' + イ" 改行][endif]
[if exp=ウ!=''][履歴出力 内容="&'　' + ウ" 改行][endif]
[if exp=エ!=''][履歴出力 内容="&'　' + エ" 改行][endif]
[履歴出力 内容="┗━━━━━━━━━━━━━━━━━━┛" 改行]
[履歴出力 改行]
[current layer=message2]
[layopt layer=message2 page=fore visible=true]
[style autoreturn=false]
[history output=false]
[if exp=ア!=''][link target=*f選択ア][emb exp="ア"][endlink][r][endif]
[if exp=イ!=''][link target=*f選択イ][emb exp="イ"][endlink][r][endif]
[if exp=ウ!=''][link target=*f選択ウ][emb exp="ウ"][endlink][r][endif]
[if exp=エ!=''][link target=*f選択エ][emb exp="エ"][endlink][r][endif]
[history output=&f.履歴許可]
[style autoreturn=true]
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
[履歴出力 改行]
[履歴出力 内容="----- 選択肢 ---------------------" 改行]
[current layer=message2]
[position frame="選択枠セーブ" top=200]
[layopt layer=message2 page=fore visible=true]
[style linespacing=7]
[style autoreturn=false]
[font size=16]
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
[resetstyle]
[style autoreturn=true]
[履歴出力 内容="----------------------------------" 改行]
[履歴出力 改行]
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
[履歴出力 改行]
[履歴出力 内容="┏━━━ 選択肢 ━━━━━━━━━━━┓" 改行]
[if exp="idxSeed < 0"][履歴出力 内容="&'　会話の種は使えません'" 改行]
[else][履歴出力 内容="&'　会話の種を使う'" 改行]
[endif]
[履歴出力 内容="&'　[' + ア + ']'" 改行]
[履歴出力 改行]
[if exp=イ!=''][履歴出力 内容="&'　' + イ" 改行][endif]
[履歴出力 内容="┗━━━━━━━━━━━━━━━━━━┛" 改行]
[履歴出力 改行]

[current layer=message2]
[layopt layer=message2 page=fore visible=true]

[history output=false]
[style autoreturn=false]
[if exp="idxSeed < 0"]
	[font color=0x999999 size=&fontsize]会話の種を使う（[emb exp=体力消費量]）[r][[[emb exp=ア]][resetfont][r][r]
[else]
	[link target=*f種選択ア]会話の種を使う（[emb exp=体力消費量]）[r][font color=&fontcolor size=&fontsize][[[emb exp=ア]][resetfont][endlink][r][r]
[endif]
[link target=*f種選択イ][emb exp=イ][endlink][r]
[style autoreturn=true]
[history output=&f.履歴許可]
[endnowait]

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
[eval exp="tf.変化 = f.生命 - f.体力" cond="tf.変化 + f.体力 > f.生命"]
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
[eval exp="日付消去()"]
[eval exp="kag.historyLayer.clear()"]
[eval exp="f.履歴許可=false"]
[cancelautomode]
[history enabled=false]
[layopt layer=&layerモノローグ page=back visible=false]
[layopt layer="&lay顔 + 0" page=back visible=false]
[layopt layer="&lay顔 + 1" page=back visible=false]
[layopt layer="&lay顔 + 2" page=back visible=false]
[layopt layer="&lay説明 + 0" page=back visible=false]
[layopt layer="&lay説明 + 1" page=back visible=false]
[layopt layer="&lay説明 + 2" page=back visible=false]
; 文字表示枠の初期化
[position layer= message0 frame= image/テキストボックス.png  left= 180  top= 570  margint= 13  marginl= 40 page="back"]
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

*会話の種表示
	;顔が残らないように
	[誰と話す消去]
	[eval exp="var automodeenabled = kag.autoMode > 1"]
	[history output=false]
	[position layer=message2 visible=false]
	[eval exp="var i=0, j=countSeed()"]
	[position layer= message0 frame= image/テキストボックス縦長.png  left= 180  top= 50  margint= 13  marginl= 40 page=back visible=true]
	[transskip]
	[backlay]
	[if exp= "j == 0"]
		[nowait]
		現在、会話の種を所持していません。[r]
		[r]
		会話の種は、誰かと会話をすることで手に入り、[r]
		他の人に使うことで、シナリオを進めることができます。[r]
		[r]
		使用期限があるので、タイミングを逃さないようにしましょう。
		[endnowait]
	[endif]
*ループA
	[if exp= "i < j"]
		[nowait]
		[if exp= "i % 6 == 0"]
			会話の種：[emb exp= "j"]個                              （[emb exp="(int)(j / 6) + 1"]ページ中 [emb exp="(int)(i / 6) + 1"]ページ目）[r][r]
		[endif]
		[emb exp= "i+1"].

		[if exp="f.種無限[i]"][font color=&色：種無限２]
		[else][font color=&色：種２]
		[endif]

		[emb exp= "f.種[i]"]
		[if exp="f.種期限[i] > -1"]
			[if exp="f.種期限[i] == 0"]（今日まで、
			[else]（あと[emb exp= "f.種期限[i]"]日、
			[endif]
			[if exp="f.種無限[i]"]回数制限なし）
			[else]１回限り）
			[endif]
		[endif]
		
		[resetfont]
		[font size= 20][r]
		[emb exp= "'     ' + f.種詳細[i]"]
		[eval exp= "i++"]
		[resetfont]
		[if exp= "i % 6 == 0 && i < j"]
			[next]
		[elsif exp= "i < j"]
			[r][r]
		[endif]
		[endnowait]
		[jump target= *ループA]
	[endif]
	[next]
	[position layer= message0 frame= image/テキストボックス.png  left= 180  top= 570  margint= 13  marginl= 40 page="back" visible="true"]
	[transskip]
	[backlay]
	[history output=&f.履歴許可]
	[eval exp="enterAutoMode()" cond="automodeenabled"]
[return]
