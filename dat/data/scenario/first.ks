;http://www5d.biglobe.ne.jp/~gakai/ 背景素材
;http://taira-komori.jpn.org/freesound.html 倒れる音
;http://soundeffect-lab.info/sound/animal/ チュンチュン
;http://taira-komori.jpn.org/daily02.html 紙をめくる
;http://commons.nicovideo.jp/material/nc105293 カラス
;http://soundeffect-lab.info/sound/anime/ しずく、キラキラリ
;http://pocket-se.info/archives/tag/%E7%B5%B6%E6%9C%9B/ ガーン

[title name=秋空のコンチェルト]
[call storage=macro.ks]

;=================================================
; タイトル画面
;=================================================
*初期化

[history enabled=false]
[eval exp= "var testfile = 'シナリオテスト.txt'"]
[eval exp= "var testplay = Storages.isExistentStorage(testfile)"]
[eval exp="f.trial = false"]
; 体験版の場合true

[if exp="f.trial"]
	[枠]
	本日は、創作視聴覚文化研究部のブースにお越し頂き、[n]
	誠にありがとうございます。[next]
	
	シミュレーションゲームの体験版として[n]
	ゲーム内４日間（約10分）のプレイをお楽しみください。[next]
	
	[人物 画像=なし 名前=操作方法][nowait]
	クリック・Enter　→　読み進める[r]
	Space　　　　　　→　セリフ枠消去[r]
	マウスホイール　 →　バックログ表示[next][endnowait]
	[人物消去]
	[枠消去]
	[jump target="*起動"]
[endif]

[jump target= *起動 cond= testplay]
[背景 画像=ロゴ]

[wait time=1000]
[背景 画像=黒]

[if exp="sf.セーブスロット前回の番号 === void"]
	[ボタン表示]
	[BGM 曲=空虚R.ogg ループ=0 音量=70]
	[wait time=1000]
	[枠]
	俺は、[ルビ 読み=あき]秋[ルビ 読み=が]ヶ[ルビ 読み=や]谷高校に通っている２年生だ。[next]
	学年が変わってから、そろそろ半年になる。[n]
	正直、クラスには馴染めていない。[n]
	別に、一人ぼっちというわけじゃない。[next]
	隣のクラスには親友のカズキだっているし、[n]
	去年同じクラスだった奴とは仲良くやっている。[next]
	だからなのか……[n]
	今は、１年の時は楽しかったな、と思いながら[n]
	家と学校を往復するだけの退屈な高校生活だ。[next]
	夏の宿題は早めに終わらせたけど、[n]
	何をするわけでもなく、毎日ネトゲに明け暮れて[n]
	気が付いたらもう二学期だった。[next]
	変わらなきゃな、と思うことはあるけど[n]
	そう簡単に変われたら苦労はないよな……[next]
	[BGM 曲=空虚2R.ogg ループ=0 音量=80]
	ところが、２学期が始まって[n]
	こんな俺に、チャンスがめぐってきた。[next]
	11月に行われる文化祭のクラス委員、か。[next]
	今まで踏み出せなかった一歩になるかもしれない……[n]
	そう信じてみたんだ。[next]
	[[制作] 東京学芸大学 創作視聴覚文化研究部＠３０３Ｃ[n]
	　　　 チーム「本格喫茶 カフェ・コンチェルト」[next]
	[ボタン消去]
	[枠消去]
[endif]

[wait time=1000]

*起動

[call storage="変数.ks"]
[call storage="出現パターン.ks"]
[call storage="セーブロード.ks"]

[history output= false]

[BGM 曲= タイトル画面.ogg  ループ= 0  音量= 50]
[背景 画像=秋空のコンチェルト]
[ボタン表示タイトル]

*メニュー
[枠消去]
[eval exp= "var testplay = Storages.isExistentStorage(testfile)"]
[if exp="testplay"]
	[二択 ア= シナリオテストプレイ イ= 通常起動]
	[if exp= イ]
		[eval exp= "testplay = false"]
	[endif]
[endif]
[枠消去]
[jump target= *edit cond="testplay"]

[if exp="sf.セーブスロット前回の番号===void || f.trial"]
	[四択 ア="" イ=最初から ウ=やりこみ エ=初期化]
[else]
	[四択 ア=続きから イ=最初から ウ=やりこみ エ=初期化]
[endif]

[枠]
[if exp=ア]
	[call storage="セーブロード.ks" target="*ロード"]
	[jump target=*メニュー]
[elsif exp=イ]
	[eval exp="tf.result = false"]
	[call storage="セーブロード.ks" target="*最初から" cond="!f.trial"]
	[jump target=*メニュー cond="tf.result"]
[elsif exp=ウ]
	[position layer= message0 frame= image/テキストボックス縦長.png  left= 180  top= 50  margint= 13  marginl= 40]
	[nowait]
	実績 ([emb exp="countAchievements()"]/[emb exp="allAchievements()"])
	[font size=20][r]

	[if exp="sf.実績０：寝坊の危機!==void"]
		[font color=&色：種２]
		0. 寝坊の危機………………★朝、操作をせずに一分間経過した[r]
	[else]
		[font color=&色：文字]
		0. 寝坊の危機………………　オフトゥンの吸引力[r]
	[endif]

	[if exp="sf.実績１：イズミが参加!==void"]
		[font color=&色：種２]
		1. イズミが参加……………★イズミが文化祭準備に参加するようになった[r]
	[else]
		[font color=&色：文字]
		1. イズミが参加……………　イズミを文化祭準備に参加させよう[r]
	[endif]

	[if exp="sf.実績２：マリが参加!==void"]
		[font color=&色：種２]
		2. マリが参加………………★マリが文化祭準備に参加するようになった[r]
	[else]
		[font color=&色：文字]
		2. マリが参加………………　マリを文化祭準備に参加させよう[r]
	[endif]

	[if exp="sf.実績３：カケルが参加!==void"]
		[font color=&色：種２]
		3. カケルが参加……………★カケルが文化祭準備に参加するようになった[r]
	[else]
		[font color=&色：文字]
		3. カケルが参加……………　カケルを文化祭準備に参加させよう[r]
	[endif]

	[if exp="sf.実績４：ミドリが参加!==void"]
		[font color=&色：種２]
		4. ミドリが参加……………★ミドリが文化祭準備に参加するようになった[r]
	[else]
		[font color=&色：文字]
		4. ミドリが参加……………　ミドリを文化祭準備に参加させよう[r]
	[endif]

	[if exp="sf.実績５：マユが参加!==void"]
		[font color=&色：種２]
		5. マユが参加………………★マユが文化祭準備に参加するようになった[r]
	[else]
		[font color=&色：文字]
		5. マユが参加………………　マユを文化祭準備に参加させよう[r]
	[endif]

	[if exp="sf.実績６：放課後レッスン!==void"]
		[font color=&色：種２]
		6. 放課後レッスン…………★50点未満でシエ先生の補習授業を受けた[r]
	[else]
		[font color=&色：文字]
		6. 放課後レッスン…………　試験に完全敗北する[r]
	[endif]

	[if exp="sf.実績７：学年主席!==void"]
		[font color=&色：種２]
		7. 学年主席…………………★俺の右に出る者はいない[r]
	[else]
		[font color=&色：文字]
		7. 学年主席…………………　試験で最高点を取る[r]
	[endif]

	[if exp="sf.実績８：赤点水平飛行!==void"]
		[font color=&色：種２]
		8. 赤点水平飛行……………★試験で50～54点を取った[r]
	[else]
		[font color=&色：文字]
		8. 赤点水平飛行……………　試験でギリギリを攻める[r]
	[endif]

	[if exp="sf.実績９：羽をのばす!==void"]
		[font color=&色：種２]
		9. 羽をのばす………………★休日に何もせずしっかり回復した[r]
	[else]
		[font color=&色：文字]
		9. 羽をのばす………………　休日に、あえて何もしないという選択[r]
	[endif]

	[if exp="sf.実績１０：休日招集だ!==void"]
		[font color=&色：種２]
		10.休日招集だ………………★休日招集をした[r]
	[else]
		[font color=&色：文字]
		10.休日招集だ………………　みんなを週末の文化祭準備に呼び出そう[r]
	[endif]

	[if exp="sf.実績１１：デート！？!==void"]
		[font color=&色：種２]
		11.デート！？………………★女の子と初めてのデートをした[r]
	[else]
		[font color=&色：文字]
		11.デート！？………………　リアルに充実した高校生活のはじまり[r]
	[endif]

	[if exp="sf.実績１２：イズミの不信!==void"]
		[font color=&色：種２]
		12.イズミの不信……………★イズミとカレンの関係が修復不能になった[r]
	[else]
		[font color=&色：文字]
		12.イズミの不信……………　イズミとカレンの関係をこじらせよう[r]
	[endif]

	[if exp="sf.実績１３：守秘義務違反!==void"]
		[font color=&色：種２]
		13.守秘義務違反……………★マリの恋心をカズキにバラした[r]
	[else]
		[font color=&色：文字]
		13.守秘義務違反……………　大事な秘密を漏洩しよう[r]
	[endif]

	[if exp="sf.実績１４：ミドリの悲劇!==void"]
		[font color=&色：種２]
		14.ミドリの悲劇……………★ミドリとカケルは別れてしまった[r]
	[else]
		[font color=&色：文字]
		14.ミドリの悲劇……………　ミドリも寂しい人にしてしまおう[r]
	[endif]

	[if exp="sf.実績１５：キューピッド!==void"]
		[font color=&色：種２]
		15.キューピッド……………★マリとカケルをくっつけた[r]
	[else]
		[font color=&色：文字]
		15.キューピッド……………　人物相関図を大きく書き換えよう[r]
	[endif]

	[if exp="sf.実績１６：放置!==void"]
		[font color=&色：種２]
		16.放置………………………★最終デートでカレンを放置して帰った[r]
	[else]
		[font color=&色：文字]
		16.放置………………………　カレンを放置して帰ろう[r]
	[endif]

	[if exp="sf.実績１７：仲たがい!==void"]
		[font color=&色：種２]
		17.仲たがい…………………★最終デートでマリと仲たがいした[r]
	[else]
		[font color=&色：文字]
		17.仲たがい…………………　マリと仲たがいしよう[r]
	[endif]

	[if exp="sf.実績１８：過労死寸前!==void"]
		[font color=&色：種２]
		18.過労死寸前………………★生命が20以下の状態で文化祭当日を迎えた[r]
	[else]
		[font color=&色：文字]
		18.過労死寸前………………　全力で命を削って最終日を迎えよう[r]
	[endif]

	[if exp="sf.実績１９：進捗１５０％!==void"]
		[font color=&色：種２]
		19.進捗１５０％……………★文化祭準備の進捗を150%以上にした[r]
	[else]
		[font color=&色：文字]
		19.進捗１５０％……………　効率だけを考えるのだ[r]
	[endif]

	[if exp="sf.実績２０：充実した高校生活!==void"]
		[font color=&色：種２]
		20.充実した高校生活………★文化祭も恋愛も成功させた[r]
	[else]
		[font color=&色：文字]
		20.充実した高校生活………　文化祭も恋愛も抜かりなく[r]
	[endif]

	[if exp="sf.実績２１：全てを知り尽くした男!==void"]
		[font color=&色：種２]
		21.全てを知り尽くした男…★文化祭成功・恋愛成就・全員参加、の３条件を満たした[r]
	[else]
		[font color=&色：文字]
		21.全てを知り尽くした男…　文化祭成功・恋愛成就・全員参加、の３条件を満たす[r]
	[endif]

	[next]
	
	[resetfont]
	エンディング ([emb exp="countEndings()"]/[emb exp="allEndings()"])
	[font size=20][r]
 
	[if exp="sf.エンド０：踏み出せなかった一歩 !==void"][font color=&色：種２]
		0.踏み出せなかった一歩…★立候補せずにゲームオーバー
	[else][font color=&色：文字]
		0.踏み？？？？？？一歩…　俺は退屈な毎日を繰り返すばかりだった
	[endif][r]

	[if exp="sf.エンド１：己の限界 !==void"][font color=&色：種２]
		1. 己の限界…………………★体力を使い果たしてゲームオーバー
	[else][font color=&色：文字]
		1. 己の？？…………………　頑張り過ぎは体に毒
	[endif][r]

	[if exp="sf.エンド２：ダブルブッキング !==void"][font color=&色：種２]
		2. ダブルブッキング………★デートの予定が被ってゲームオーバー
	[else][font color=&色：文字]
		2. ？？？？？キング………　まさかデートの予定が被るとは……
	[endif][r]

	[if exp="sf.エンド３：失敗カフェ !==void"][font color=&色：種２]
		3. 失敗カフェ………………★文化祭は不成功に終わった
	[else][font color=&色：文字]
		3. ？？カフェ………………　いわゆるバットエンドです
	[endif][r]

	[if exp="sf.エンド４：三人の精鋭 !==void"][font color=&色：種２]
		4. 三人の精鋭………………★カレン・ヨシオと３人でクリア
	[else][font color=&色：文字]
		4. 三人の？？………………　皆の助けなんて必要ない
	[endif][r]

	[if exp="sf.エンド５：文化祭成功 !==void"][font color=&色：種２]
		5. 文化祭成功………………★他のエンドの条件を満たさずに文化祭を成功させた
	[else][font color=&色：文字]
		5. 文化祭？？………………　いわゆる通常エンドです
	[endif][r]

	[if exp="sf.エンド６：秋空のコンチェルト !==void"][font color=&色：種２]
		6. 秋空のコンチェルト……★全員が文化祭準備に参加してクリア
	[else][font color=&色：文字]
		6. ？？の？？？？？？……　いわゆるグッドエンドです
	[endif][r]

	[if exp="sf.エンド７：高嶺のお嬢様 !==void"][font color=&色：種２]
		7. 高嶺のお嬢様……………★カレンと結ばれた
	[else][font color=&色：文字]
		7. ？？？お嬢様……………　ヒロイン攻略
	[endif][r]

	[if exp="sf.エンド７：迷える元気娘 !==void"][font color=&色：種２]
		8. 迷える元気娘……………★マリと結ばれた
	[else][font color=&色：文字]
		8. ？？？元気娘……………　ヒロイン攻略
	[endif][r]

	[if exp="sf.エンド９：悔い改めよ !==void"][font color=&色：種２]
		9. 悔い改めよ………………★カレン・マリに二股をかけた
	[else][font color=&色：文字]
		9. 悔？？？よ………………　若き日の過ちといったところか
	[endif][r]
	
	
	[resetfont]
	[next]
	[endnowait]
	[position layer= message0 frame= image/テキストボックス.png  left= 180  top= 570  margint= 13  marginl= 40]
	[jump target=*メニュー]
[elsif exp=エ]
	セーブデータ・やりこみデータを削除しますか？
	[二択 ア=削除しない イ=削除する]
	[jump target=*メニュー cond="ア"]
	バックアップを取っておかない限り、元には戻せません。
	[二択 ア=削除しない イ=削除する]
	[jump target=*メニュー cond="ア"]
	[call storage="変数.ks" target="*システム変数クリア"]
	[BGM停止]
	[背景 画像= 黒]
	完全に削除しました。[next]
	[枠消去]
	[jump target=*初期化]
[endif]

*edit
[er]
[枠]
[nowait]
俺の名前は 
[edit color="0x0000FF" length=140 maxchars=14 name=f.姓] 
[edit color="0x0000FF" length=160 maxchars=16 name=f.名]
。[ルビ 読み=あき]秋[ルビ 読み=が]ヶ[ルビ 読み=や]谷高校、２年２組の生徒だ。
[r][r]
　　　　　　　　[link target= *ck_name]<これで始める>[endlink]　　　[link target= *cancel_name]<キャンセル>[endlink]
[endnowait]
[s]
*cancel_name
[SE 音= 選択  音量= 40 buf= 1]
[er]
[枠消去]
[jump target= *メニュー]
*ck_name
[SE 音= 選択  音量= 40 buf= 1]
[commit]
[er]
[if exp= "widthStr(f.姓) > 5"]
俺の苗字が長すぎる。[next]
[jump target= *edit]
[endif]
[if exp= "widthStr(f.名) > 6"]
俺の名前が長すぎる。[next]
[jump target= *edit]
[endif]
[if exp= "widthStr(f.名+f.姓) > 10"]
俺の苗字と名前が全体的に長すぎる。[next]
[jump target= *edit]
[endif]
[if exp= "f.姓.length == 0"]
俺の苗字がない。[next]
[jump target= *edit]
[endif]
[if exp= "f.姓 == '恋ヶ窪' || f.姓 == '小平' || f.姓 == '貫井' || f.姓 == '本多' || f.姓 == '桜' || f.姓 == '梶野' || f.姓 == '美園'"]
[姓]はクラスメイトにいるけど……
[二択 ア= ＯＫ イ= キャンセル]
[jump target= *edit cond=イ]
[endif]
[if exp= "f.名.length == 0"]
俺の名前がない。[next]
[jump target= *edit]
[endif]
[if exp= "f.名 == 'カレン' || f.名 == 'ヨシオ' || f.名 == 'マリ' || f.名 == 'イズミ' || f.名 == 'マユ' || f.名 == 'カケル' || f.名 == 'ミドリ'"]
[名]はクラスメイトにいるけど……
[二択 ア= ＯＫ イ= キャンセル]
[jump target= *edit cond=イ]
[endif]

[枠消去]

[fadeoutbgm time=500]
[背景 画像=黒]
[wb]

[if exp= testplay]
	[体力 変化= 0]
	[ボタン表示]
	[call storage= "シナリオテスト.txt"]
	[タイトルに戻る]
[endif]

[jump storage=毎日.ks]
