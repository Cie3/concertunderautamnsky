@if exp="typeof(global.systembutton_object) == 'undefined'"
@iscript

// 画面に「セーブ」「ロード」のボタンを表示するサンプル

// メッセージレイヤのクリアごとにこれらのボタンを button タグで表示することでも
// 実現できますが、あまりそれでは効率が良くないです。
// このサンプルでは、「セーブ」と「ロード」のボタンを含んだレイヤを画面上に
// 表示するものです。
// この例はフリーセーブモードで動作します。いろいろ改造できると思います。



class SystemButtonLayer extends ButtonLayer
	// クリックされたときに実行する関数を指定できるボタンレイヤ
{
	var onClickFunction;

	function SystemButtonLayer(window, parent, func)
	{
		super.ButtonLayer(window, parent);
		focusable = false;
		visible = true;
		onClickFunction = func;
	}

	function finalize()
	{
		super.finalize(...);
	}

	function onClick()
	{
		super.onClick(...);
	}

	function onMouseUp(x, y, button, shift)
	{
		if(enabled && button == mbLeft)
			onClickFunction(this);
		super.onMouseUp(...);
	}

}



class SystemButtonPlugin extends KAGPlugin
{
	var x = 510; // 初期 x 位置
	var y = 300; // 初期 y 位置

	var foreSeen = false; // 表画面のボタンが可視か
	var backSeen = false; // 裏画面のボタンが可視か

	var foreButtons = []; // 表画面のボタンの配列
	var backButtons = []; // 裏画面のボタンの配列

	function SystemButtonPlugin()
	{
		// SystemButtonPlugin コンストラクタ

		createButtons(kag.fore.base, foreButtons); // 表画面のボタンを作成
		createButtons(kag.back.base, backButtons);

		realign(); // 再配置

		setObjProp(foreButtons, 'visible', foreSeen = false);
		setObjProp(backButtons, 'visible', backSeen = false);
			// 非表示に
		onStableStateChanged(kag.inStable);
	}

	function finalize()
	{
		// ボタンを無効化
		for(var i = 0; i < foreButtons.count; i++)
			invalidate foreButtons[i];
		for(var i = 0; i < backButtons.count; i++)
			invalidate backButtons[i];

		super.finalize(...);
	}

	function setObjProp(array, member, value)
	{
		// array の各メンバのプロパティの設定
		for(var i = array.count - 1; i >= 0; i--) array[i][member] = value;
	}

	function createButtons(parent, array)
	{
		// parent を親レイヤとしてボタンを作成し、array に登録する。
		// ボタンは表画面と裏画面の両方に対して作成されるので注意。

		// ボタンを追加するには、これを参考にして いろいろ追加してください。

		var obj;
		
		array.add(obj = new SystemButtonLayer(kag, parent, onBackButtonClick));
		obj.loadImages('ボタンback');
		obj.hint = 'これまでの文章を読み直します'; // 0

		array.add(obj = new SystemButtonLayer(kag, parent, onAutoButtonClick));
		obj.loadImages('ボタンauto');
		obj.hint = 'クリックせずに自動で進みます'; // 1

		array.add(obj = new SystemButtonLayer(kag, parent, onTitleButtonClick));
		obj.loadImages('ボタンtitle');
		obj.hint = 'セーブせずにタイトルに戻ります'; // 2

		array.add(obj = new SystemButtonLayer(kag, parent, onExitButtonClick));
		obj.loadImages('ボタンexit');
		obj.hint = 'ゲームを終了します'; // 3

		array.add(obj = new SystemButtonLayer(kag, parent, onScreenButtonClick));
		obj.loadImages('ボタンscreen');
		obj.hint = '全画面表示とウィンドウ表示を切り替えます'; // 4

		array.add(obj = new SystemButtonLayer(kag, parent, onSeedButtonClick));
		obj.loadImages('ボタン種');
		obj.hint = '会話の種を確認します'; // 5

		array.add(obj = new SystemButtonLayer(kag, parent, onLoadButtonClick));
		obj.loadImages('ボタンload');
		obj.hint = '今朝に戻ってやり直します'; // 6

/*		// ボタン 0 (セーブ)
		array.add(obj = new SystemButtonLayer(kag, parent, onSaveButtonClick));
		obj.loadImages('YesButton'); // save ボタン用画像を読み込む

		// ボタン 1 (ロード)
		array.add(obj = new SystemButtonLayer(kag, parent, onLoadButtonClick));
		obj.loadImages('NoButton'); // load ボタン用画像を読み込む

		// ここでは 'YesButton' とか 'NoButton' とかを読み込んでいますが
		// ちゃんとした画像を作成してちゃんとしたファイル名を指定すると
		// よいでしょう。ボタン用画像の作り方は button タグ用画像の作り方
		// と同じです。
*/	}

	function realign()
	{
		// ボタンの再配置
		// このメソッドは、ボタンを x y 位置から横一列に配置する
		var fore, back, count, btn_x;

		count = foreButtons.count;
		btn_x = 0;
		for(var i = 0; i < count; i++)
		{
			var xpos = btn_x + x;
			var obj;

			obj = backButtons[i];
			obj.setPos(xpos, y);
			obj.absolute = 2000000-3; // 重ね合わせ順序はメッセージ履歴よりも奥

			obj = foreButtons[i];
			obj.setPos(xpos, y);
			obj.absolute = 2000000-3;

			btn_x += obj.width;
		}
		//////
		backButtons[0].setPos(1130, 600);
		foreButtons[0].setPos(1130, 600);
		backButtons[1].setPos(1130, 660);
		foreButtons[1].setPos(1130, 660);
		backButtons[2].setPos(40, 660);
		foreButtons[2].setPos(40, 660);
		backButtons[3].setPos(40, 660);
		foreButtons[3].setPos(40, 660);
		backButtons[4].setPos(40, 600);
		foreButtons[4].setPos(40, 600);
		backButtons[5].setPos(40, 450);
		foreButtons[5].setPos(40, 450);
		backButtons[6].setPos(40, 660);
		foreButtons[6].setPos(40, 660);
	}


	function playSound() {
		kag.tagHandlers.seopt(%["volume" => "40", "buf" => "1"]);
		kag.tagHandlers.playse(%["storage" => "選択.ogg", "buf" => "1"]);	}
	
	function onSaveButtonClick()
	{
		// セーブ ボタンが押された
		kag.saveBookMarkToFileWithAsk();
	}

	function onLoadButtonClick()
	{
		// ロード ボタンが押された
		//kag.loadBookMarkFromFileWithAsk();
		playSound();
		var res;
		if(f.日 == 0) {
			res = askYesNo('のこり１日の朝に戻ってやり直します。', '朝に戻る');
		} else {
			res = askYesNo('今朝に戻ってやり直します。', '朝に戻る');
		}
		playSound();
		if(res) {
			kag.process('macro.ks', '*朝に戻る');
		}
	}
	
	function onBackButtonClick() {
		playSound();
		kag.showHistory();
	}
	
	function onAutoButtonClick() {
		playSound();
		kag.enterAutoMode();
	}
	
	function onTitleButtonClick() {
		playSound();
		var res = true;
		if(オートセーブ可能) {
			res = askYesNo('セーブせずにタイトルに戻ります。', 'タイトルに戻る');
			playSound();
		}
		if(res) {
			kag.process('macro.ks', '*タイトルに戻る');
		}
	}
	
	function onScreenButtonClick() {
		if(kag.fullScreened) {
			kag.onWindowedMenuItemClick(kag);
		} else {
			kag.onFullScreenMenuItemClick(kag);
		}
	}

	function onExitButtonClick() {
		playSound();
		kag.process('macro.ks', '*終了処理');
	}
	
	function onSeedButtonClick() {
		playSound();
		kag.process('macro.ks', '*会話の種表示');
	}
	
	function setMode(mode) {
		for(var i = foreButtons.count; i-->0;) {
			foreButtons[i].visible = false;
		}
		if(mode == 0) { // 全消去
		} else if(mode == 1) { // いつもの
			foreButtons[0].visible = true; // back
			foreButtons[1].visible = true; // auto
			foreButtons[6].visible = true; // load
			foreButtons[4].visible = true; // screen
		} else if(mode == 2) { // タイトル
			foreButtons[3].visible = true; // exit
			foreButtons[4].visible = true; // screen
		} else if(mode == 3) { // 自室
			foreButtons[2].visible = true; // title
			foreButtons[4].visible = true; // screen
		} else if(mode == 4) { // 種
			foreButtons[0].visible = true; // back
			foreButtons[1].visible = true; // auto
			foreButtons[6].visible = true; // load
			foreButtons[4].visible = true; // screen
			foreButtons[5].visible = true; // 種
		} else if(mode == 5) { // 自室朝
			foreButtons[2].visible = true; // title
			foreButtons[4].visible = true; // screen
			foreButtons[5].visible = true; // 種
		} else if(mode == 6) { // 自室夜
			foreButtons[6].visible = true; // load
			foreButtons[4].visible = true; // screen
		}
		for(var i = foreButtons.count; i-->0;) {
			backButtons[i].visible = foreButtons[i].visible;
		}
		realign();
	}
	
	function setOptions(elm)
	{
		// オプションを設定
		setObjProp(foreButtons, 'visible', foreSeen = +elm.forevisible) if elm.forevisible !== void;
		setObjProp(backButtons, 'visible', backSeen = +elm.backvisible) if elm.backvisible !== void;
		var poschanged = false;
		(x = +elm.left, poschanged = true) if elm.left !== void;
		(y = +elm.top, poschanged = true) if elm.top !== void;
		if(poschanged) realign(); // 表示位置の変更
	}


	function onStore(f, elm)
	{
		// 栞を保存するとき
		var dic = f.systemButtons = %[];
			// f.systemButtons に辞書配列を作成
		dic.foreVisible = foreSeen;
		dic.backVisible = backSeen;
		dic.left = x;
		dic.top = y;
			// 各情報を辞書配列に記録
	}

	function onRestore(f, clear, elm)
	{
		// 栞を読み出すとき
		var dic = f.systemButtons;
		if(dic === void)
		{
			// systemButtons の情報が栞に保存されていない
			setObjProp(foreButtons, 'visible', foreSeen = false);
			setObjProp(backButtons, 'visible', backSeen = false);
		}
		else
		{
			// systemButtons の情報が栞に保存されている
			setOptions(%[ forevisible : dic.foreVisible, backvisible : dic.backVisible,
				left : dic.left, top : dic.top]);
				// オプションを設定
		}
	}

	function onStableStateChanged(stable)
	{
		// 「安定」( s l p の各タグで停止中 ) か、
		// 「走行中」 ( それ以外 ) かの状態が変わったときに呼ばれる

		// 走行中は各ボタンを無効にする
		setObjProp(foreButtons, 'enabled', stable);
		setObjProp(backButtons, 'enabled', stable);
	}

	function onMessageHiddenStateChanged(hidden)
	{
		return;
		// メッセージレイヤがユーザの操作によって隠されるとき、現れるときに
		// 呼ばれる。メッセージレイヤとともに表示/非表示を切り替えたいときは
		// ここで設定する。
		if(hidden)
		{
			setObjProp(foreButtons, 'visible', false);
			setObjProp(backButtons, 'visible', false);
		}
		else
		{
			// foreSeen, backSeen は、ボタンが本来表示中であったかどうかを記録している
			setObjProp(foreButtons, 'visible', foreSeen);
			setObjProp(backButtons, 'visible', backSeen);
		}
	}

	function onCopyLayer(toback)
	{
		// レイヤの表←→裏の情報のコピー

		// backlay タグやトランジションの終了時に呼ばれる

		// ここでレイヤに関してコピーすべきなのは
		// 表示/非表示の情報だけ

		if(toback)
		{
			// 表→裏
			for(var i = foreButtons.count; i-->0;) {
				backButtons[i].visible = foreButtons[i].visible;
			}
			//setObjProp(backButtons, 'visible', foreButtons[0].visible);
			backSeen = foreSeen;
		}
		else
		{
			// 裏→表
			for(var i = foreButtons.count; i-->0;) {
				foreButtons[i].visible = backButtons[i].visible;
			}
			//setObjProp(foreButtons, 'visible', backButtons[0].visible);
			foreSeen = backSeen;
		}
	}

	function onExchangeForeBack()
	{
		// 裏と表の管理情報を交換

		// children = true のトランジションでは、トランジション終了時に
		// 表画面と裏画面のレイヤ構造がそっくり入れ替わるので、
		// それまで 表画面だと思っていたものが裏画面に、裏画面だと思って
		// いたものが表画面になってしまう。ここのタイミングでその情報を
		// 入れ替えれば、矛盾は生じないで済む。

		// ここで表画面、裏画面のレイヤに関して管理すべきなのは
		// foreButtons と backButton 、foreSeen と backSeen の変数だけ
		var tmp;

		tmp = backButtons;
		backButtons = foreButtons;
		foreButtons = tmp;

		tmp = backSeen;
		backSeen = foreSeen;
		foreSeen = tmp;
	}
}

kag.addPlugin(global.systembutton_object = new SystemButtonPlugin(kag));
	// プラグインオブジェクトを作成し、登録する

@endscript
@endif
;
; マクロの登録
@macro name="sysbtopt"
@eval exp="systembutton_object.setOptions(mp)"
; mp がマクロに渡された属性を示す辞書配列オブジェクト
@endmacro
@return


