[iscript]
// ファイルをまたいで使われる変数
tf.result = false;
tf.result2 = false;
tf.セーブラベル = '';
f.現在; // 朝,昼休み,放課後,夜,文化祭準備などが入ります
if(sf.昼休み != true) sf.昼休み = true;
else sf.昼休み = false;
f.昼休み = sf.昼休み;
f.放課後 = !sf.昼休み;
f.trial = f.trial; // 体験版の場合true

// 定数値
var シナリオ消費 = -6;
var 会話３人目 = -3;
var 招集消費 = -10;
var 進捗招集 = 1;
var 進捗参加 = 2;
var 告白消費 = -20;

// 定数：学習で消費する体力
var 授業２消費 = -15;
var 授業１消費 = -5;
var 授業０消費 = +5;
var 自宅学習消費 = -20;
var 補習消費 = -36;

// 定数：学習で上昇する成績
var 授業２上昇 = 8;
var 授業１上昇割合 = 0.05;
var 授業０上昇 = 0;
var 自宅学習上昇 = 10;
var 補習後の成績 = 50;

// 定数：睡眠の回復式＝floor(a + 生命 * b + 体力 * c)
var 睡眠回復a = 20; // 回復基礎値……必ずこれ以上は回復する
var 睡眠回復b = 0.1; // 生命ボーナス……生命ゲージが大きいほど回復する
var 睡眠回復c = -0.3; // 体力ペナルティ……体力が多いほど回復しない
var 睡眠学力低下 = -4;

var 進捗２ = 3;
var 進捗１ = 1;
var 進捗０ = 0;
var 準備２ = -30;
var 準備１ = -10;
var 準備０ = 0;
var 休日回復 = 15;
var 色：文字 = 0x222211;
var 色：文字２ = 0xFFFFFF;
var 色：種 = 0xffdd88;
var 色：種２ = 0xaa5544;
var 色：種無限 = 0x88ddff;
var 色：種無限２ = 0x4455aa;
var 色：強化 = 0xff3344;
var 種の期限標準 = 6;

// セーブされる変数
f.姓 = '小金井';
f.名 = 'マサト';
f.種 = void;
f.種詳細 = void;
f.種期限 = void;
f.種無限 = void;
f.足跡 = void;
f.月 = 9;
f.週 = 1;
f.曜日= '平日１';
f.日 = 23;
f.体力 = 100;
f.生命 = 100;
f.学力 = 50;
f.進捗 = 0;
// 参加⇒言わなくても来てくれる
// 招集⇒招集した回だけ来てくれる
// 不参加⇒関係が決裂した
f.マリ参加 = 0;
f.マリ招集 = 0;
f.マリ不参加 = 0;
f.イズミ参加 = 0;
f.イズミ招集 = 0;
f.イズミ不参加 = 0;
f.マユ参加 = 0;
f.マユ招集 = 0;
f.カケル参加 = 0;
f.カケル招集 = 0;
f.ミドリ参加 = 0;
f.ミドリ招集 = 0;
f.ミドリ不参加 = 0;
f.モブ男招集 = 0;
f.モブ女招集 = 0;
//
f.マリデート = 0;
f.マリけんか = 0;
f.マリ攻略 = 0;
f.カレンデート = 0;
f.カレンけんか = 0;
f.カレン攻略 = 0;
f.休日準備 = 0;
// 平日１にテストが行われ、平日２に点数が開示される
f.試験の点数 = 0;
f.放課後レッスン = 0;

// 栄養ドリンク
f.イズミ栄養ドリンク = 0;
f.ミドリ栄養ドリンク = 0;
f.マリ栄養ドリンク = 0;
f.マリ恋愛栄養ドリンク = 0;
f.カレン恋愛栄養ドリンク = 0;

// 恋愛ブースト
f.カレン加速 = 0;
f.マリ加速 = 0;
f.主人公加速 = 0;
f.カケル加速 = 0;
f.ミドリ加速 = 0;
f.ヨシオ加速 = 0;
f.マユ加速 = 0;
f.イズミ加速 = 0;

function countEndings(){
	var n = 0;
	n += (int)sf.エンド０：踏み出せなかった一歩;
	n += (int)sf.エンド１：己の限界;
	n += (int)sf.エンド２：ダブルブッキング;
	n += (int)sf.エンド３：失敗カフェ;
	n += (int)sf.エンド４：三人の精鋭;
	n += (int)sf.エンド５：文化祭成功;
	n += (int)sf.エンド６：秋空のコンチェルト;
	n += (int)sf.エンド７：高嶺のお嬢様;
	n += (int)sf.エンド８：迷える元気娘;
	n += (int)sf.エンド９：悔い改めよ;
	return n;
}
function allEndings(){
	return 10;
}
function countAchievements() {
	var n = 0;
	n += (int)sf.実績０：クラス委員の心得;
	n += (int)sf.実績１：イズミが参加;
	n += (int)sf.実績２：マリが参加;
	n += (int)sf.実績３：カケルが参加;
	n += (int)sf.実績４：ミドリが参加;
	n += (int)sf.実績５：マユが参加;
	n += (int)sf.実績６：放課後レッスン;
	n += (int)sf.実績７：学年主席;
	n += (int)sf.実績８：赤点水平飛行;
	n += (int)sf.実績９：羽をのばす;
	n += (int)sf.実績１０：休日招集だ;
	n += (int)sf.実績１１：デート！？;
	n += (int)sf.実績１２：イズミの不信;
	n += (int)sf.実績１３：守秘義務違反;
	n += (int)sf.実績１４：ミドリの悲劇;
	n += (int)sf.実績１５：キューピッド;
	n += (int)sf.実績１６：放置;
	n += (int)sf.実績１７：仲たがい;
	n += (int)sf.実績１８：過労死寸前;
	n += (int)sf.実績１９：進捗１５０％;
	n += (int)sf.実績２０：充実した高校生活;
	n += (int)sf.実績２１：全てを知り尽くした男;
	return n;
}
function allAchievements() {
	return 22;
}

[endscript]
[return]

*システム変数クリア
[iscript]
// セーブ関連
sf.セーブスロット前回の番号 =
sf.セーブスロットＡ =
sf.セーブスロットＢ =
sf.セーブスロットＣ =
sf.セーブスロットＤ =
sf.セーブスロットＥ =
sf.セーブスロットＦ =
sf.セーブスロットＧ =
sf.セーブスロットＨ =
sf.セーブスロットＩ =
sf.セーブスロットＪ =
sf.セーブスロット自動 =
// エンディング関連
sf.エンド０：踏み出せなかった一歩 =
sf.エンド１：己の限界 =
sf.エンド２：ダブルブッキング =
sf.エンド３：失敗カフェ =
sf.エンド４：三人の精鋭 =
sf.エンド５：文化祭成功 =
sf.エンド６：秋空のコンチェルト =
sf.エンド７：高嶺のお嬢様 =
sf.エンド８：迷える元気娘 =
sf.エンド９：悔い改めよ =
// 実績関連
sf.実績０：クラス委員の心得 =
sf.実績１：イズミが参加 =
sf.実績２：マリが参加 =
sf.実績３：カケルが参加 =
sf.実績４：ミドリが参加 =
sf.実績５：マユが参加 =
sf.実績６：放課後レッスン =
sf.実績７：学年主席 =
sf.実績８：赤点水平飛行 =
sf.実績９：羽をのばす =
sf.実績１０：休日招集だ =
sf.実績１１：デート！？ =
sf.実績１２：イズミの不信 =
sf.実績１３：守秘義務違反 =
sf.実績１４：ミドリの悲劇 =
sf.実績１５：キューピッド =
sf.実績１６：放置 =
sf.実績１７：仲たがい =
sf.実績１８：過労死寸前 =
sf.実績１９：進捗１５０％ =
sf.実績２０：充実した高校生活 =
sf.実績２１：全てを知り尽くした男 =
void;

[endscript]
[return]

;会話の種メモ
;人が集まらない休日準備
;カケルは女子と仲が良い
;ミドリの戸惑い
;ミドリの事情
