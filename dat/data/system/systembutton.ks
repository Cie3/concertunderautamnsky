@if exp="typeof(global.systembutton_object) == 'undefined'"
@iscript

// ��ʂɁu�Z�[�u�v�u���[�h�v�̃{�^����\������T���v��

// ���b�Z�[�W���C���̃N���A���Ƃɂ����̃{�^���� button �^�O�ŕ\�����邱�Ƃł�
// �����ł��܂����A���܂肻��ł͌������ǂ��Ȃ��ł��B
// ���̃T���v���ł́A�u�Z�[�u�v�Ɓu���[�h�v�̃{�^�����܂񂾃��C������ʏ��
// �\��������̂ł��B
// ���̗�̓t���[�Z�[�u���[�h�œ��삵�܂��B���낢������ł���Ǝv���܂��B



class SystemButtonLayer extends ButtonLayer
	// �N���b�N���ꂽ�Ƃ��Ɏ��s����֐����w��ł���{�^�����C��
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
	var x = 510; // ���� x �ʒu
	var y = 300; // ���� y �ʒu

	var foreSeen = false; // �\��ʂ̃{�^��������
	var backSeen = false; // ����ʂ̃{�^��������

	var foreButtons = []; // �\��ʂ̃{�^���̔z��
	var backButtons = []; // ����ʂ̃{�^���̔z��

	function SystemButtonPlugin()
	{
		// SystemButtonPlugin �R���X�g���N�^

		createButtons(kag.fore.base, foreButtons); // �\��ʂ̃{�^�����쐬
		createButtons(kag.back.base, backButtons);

		realign(); // �Ĕz�u

		setObjProp(foreButtons, 'visible', foreSeen = false);
		setObjProp(backButtons, 'visible', backSeen = false);
			// ��\����
		onStableStateChanged(kag.inStable);
	}

	function finalize()
	{
		// �{�^���𖳌���
		for(var i = 0; i < foreButtons.count; i++)
			invalidate foreButtons[i];
		for(var i = 0; i < backButtons.count; i++)
			invalidate backButtons[i];

		super.finalize(...);
	}

	function setObjProp(array, member, value)
	{
		// array �̊e�����o�̃v���p�e�B�̐ݒ�
		for(var i = array.count - 1; i >= 0; i--) array[i][member] = value;
	}

	function createButtons(parent, array)
	{
		// parent ��e���C���Ƃ��ă{�^�����쐬���Aarray �ɓo�^����B
		// �{�^���͕\��ʂƗ���ʂ̗����ɑ΂��č쐬�����̂Œ��ӁB

		// �{�^����ǉ�����ɂ́A������Q�l�ɂ��� ���낢��ǉ����Ă��������B

		var obj;
		
		array.add(obj = new SystemButtonLayer(kag, parent, onBackButtonClick));
		obj.loadImages('�{�^��back');
		obj.hint = '����܂ł̕��͂�ǂݒ����܂�'; // 0

		array.add(obj = new SystemButtonLayer(kag, parent, onAutoButtonClick));
		obj.loadImages('�{�^��auto');
		obj.hint = '�N���b�N�����Ɏ����Ői�݂܂�'; // 1

		array.add(obj = new SystemButtonLayer(kag, parent, onTitleButtonClick));
		obj.loadImages('�{�^��title');
		obj.hint = '�Z�[�u�����Ƀ^�C�g���ɖ߂�܂�'; // 2

		array.add(obj = new SystemButtonLayer(kag, parent, onExitButtonClick));
		obj.loadImages('�{�^��exit');
		obj.hint = '�Q�[�����I�����܂�'; // 3

		array.add(obj = new SystemButtonLayer(kag, parent, onScreenButtonClick));
		obj.loadImages('�{�^��screen');
		obj.hint = '�S��ʕ\���ƃE�B���h�E�\����؂�ւ��܂�'; // 4

		array.add(obj = new SystemButtonLayer(kag, parent, onSeedButtonClick));
		obj.loadImages('�{�^����');
		obj.hint = '��b�̎���m�F���܂�'; // 5

		array.add(obj = new SystemButtonLayer(kag, parent, onLoadButtonClick));
		obj.loadImages('�{�^��load');
		obj.hint = '�����ɖ߂��Ă�蒼���܂�'; // 6

/*		// �{�^�� 0 (�Z�[�u)
		array.add(obj = new SystemButtonLayer(kag, parent, onSaveButtonClick));
		obj.loadImages('YesButton'); // save �{�^���p�摜��ǂݍ���

		// �{�^�� 1 (���[�h)
		array.add(obj = new SystemButtonLayer(kag, parent, onLoadButtonClick));
		obj.loadImages('NoButton'); // load �{�^���p�摜��ǂݍ���

		// �����ł� 'YesButton' �Ƃ� 'NoButton' �Ƃ���ǂݍ���ł��܂���
		// �����Ƃ����摜���쐬���Ă����Ƃ����t�@�C�������w�肷���
		// �悢�ł��傤�B�{�^���p�摜�̍����� button �^�O�p�摜�̍���
		// �Ɠ����ł��B
*/	}

	function realign()
	{
		// �{�^���̍Ĕz�u
		// ���̃��\�b�h�́A�{�^���� x y �ʒu���牡���ɔz�u����
		var fore, back, count, btn_x;

		count = foreButtons.count;
		btn_x = 0;
		for(var i = 0; i < count; i++)
		{
			var xpos = btn_x + x;
			var obj;

			obj = backButtons[i];
			obj.setPos(xpos, y);
			obj.absolute = 2000000-3; // �d�ˍ��킹�����̓��b�Z�[�W����������

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
		kag.tagHandlers.playse(%["storage" => "�I��.ogg", "buf" => "1"]);	}
	
	function onSaveButtonClick()
	{
		// �Z�[�u �{�^���������ꂽ
		kag.saveBookMarkToFileWithAsk();
	}

	function onLoadButtonClick()
	{
		// ���[�h �{�^���������ꂽ
		//kag.loadBookMarkFromFileWithAsk();
		playSound();
		var res;
		if(f.�� == 0) {
			res = askYesNo('�̂���P���̒��ɖ߂��Ă�蒼���܂��B', '���ɖ߂�');
		} else {
			res = askYesNo('�����ɖ߂��Ă�蒼���܂��B', '���ɖ߂�');
		}
		playSound();
		if(res) {
			kag.process('macro.ks', '*���ɖ߂�');
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
		if(�I�[�g�Z�[�u�\) {
			res = askYesNo('�Z�[�u�����Ƀ^�C�g���ɖ߂�܂��B', '�^�C�g���ɖ߂�');
			playSound();
		}
		if(res) {
			kag.process('macro.ks', '*�^�C�g���ɖ߂�');
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
		kag.process('macro.ks', '*�I������');
	}
	
	function onSeedButtonClick() {
		playSound();
		kag.process('macro.ks', '*��b�̎�\��');
	}
	
	function setMode(mode) {
		for(var i = foreButtons.count; i-->0;) {
			foreButtons[i].visible = false;
		}
		if(mode == 0) { // �S����
		} else if(mode == 1) { // ������
			foreButtons[0].visible = true; // back
			foreButtons[1].visible = true; // auto
			foreButtons[6].visible = true; // load
			foreButtons[4].visible = true; // screen
		} else if(mode == 2) { // �^�C�g��
			foreButtons[3].visible = true; // exit
			foreButtons[4].visible = true; // screen
		} else if(mode == 3) { // ����
			foreButtons[2].visible = true; // title
			foreButtons[4].visible = true; // screen
		} else if(mode == 4) { // ��
			foreButtons[0].visible = true; // back
			foreButtons[1].visible = true; // auto
			foreButtons[6].visible = true; // load
			foreButtons[4].visible = true; // screen
			foreButtons[5].visible = true; // ��
		} else if(mode == 5) { // ������
			foreButtons[2].visible = true; // title
			foreButtons[4].visible = true; // screen
			foreButtons[5].visible = true; // ��
		} else if(mode == 6) { // ������
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
		// �I�v�V������ݒ�
		setObjProp(foreButtons, 'visible', foreSeen = +elm.forevisible) if elm.forevisible !== void;
		setObjProp(backButtons, 'visible', backSeen = +elm.backvisible) if elm.backvisible !== void;
		var poschanged = false;
		(x = +elm.left, poschanged = true) if elm.left !== void;
		(y = +elm.top, poschanged = true) if elm.top !== void;
		if(poschanged) realign(); // �\���ʒu�̕ύX
	}


	function onStore(f, elm)
	{
		// �x��ۑ�����Ƃ�
		var dic = f.systemButtons = %[];
			// f.systemButtons �Ɏ����z����쐬
		dic.foreVisible = foreSeen;
		dic.backVisible = backSeen;
		dic.left = x;
		dic.top = y;
			// �e���������z��ɋL�^
	}

	function onRestore(f, clear, elm)
	{
		// �x��ǂݏo���Ƃ�
		var dic = f.systemButtons;
		if(dic === void)
		{
			// systemButtons �̏�񂪞x�ɕۑ�����Ă��Ȃ�
			setObjProp(foreButtons, 'visible', foreSeen = false);
			setObjProp(backButtons, 'visible', backSeen = false);
		}
		else
		{
			// systemButtons �̏�񂪞x�ɕۑ�����Ă���
			setOptions(%[ forevisible : dic.foreVisible, backvisible : dic.backVisible,
				left : dic.left, top : dic.top]);
				// �I�v�V������ݒ�
		}
	}

	function onStableStateChanged(stable)
	{
		// �u����v( s l p �̊e�^�O�Œ�~�� ) ���A
		// �u���s���v ( ����ȊO ) ���̏�Ԃ��ς�����Ƃ��ɌĂ΂��

		// ���s���͊e�{�^���𖳌��ɂ���
		setObjProp(foreButtons, 'enabled', stable);
		setObjProp(backButtons, 'enabled', stable);
	}

	function onMessageHiddenStateChanged(hidden)
	{
		return;
		// ���b�Z�[�W���C�������[�U�̑���ɂ���ĉB�����Ƃ��A�����Ƃ���
		// �Ă΂��B���b�Z�[�W���C���ƂƂ��ɕ\��/��\����؂�ւ������Ƃ���
		// �����Őݒ肷��B
		if(hidden)
		{
			setObjProp(foreButtons, 'visible', false);
			setObjProp(backButtons, 'visible', false);
		}
		else
		{
			// foreSeen, backSeen �́A�{�^�����{���\�����ł��������ǂ������L�^���Ă���
			setObjProp(foreButtons, 'visible', foreSeen);
			setObjProp(backButtons, 'visible', backSeen);
		}
	}

	function onCopyLayer(toback)
	{
		// ���C���̕\�������̏��̃R�s�[

		// backlay �^�O��g�����W�V�����̏I�����ɌĂ΂��

		// �����Ń��C���Ɋւ��ăR�s�[���ׂ��Ȃ̂�
		// �\��/��\���̏�񂾂�

		if(toback)
		{
			// �\����
			for(var i = foreButtons.count; i-->0;) {
				backButtons[i].visible = foreButtons[i].visible;
			}
			//setObjProp(backButtons, 'visible', foreButtons[0].visible);
			backSeen = foreSeen;
		}
		else
		{
			// �����\
			for(var i = foreButtons.count; i-->0;) {
				foreButtons[i].visible = backButtons[i].visible;
			}
			//setObjProp(foreButtons, 'visible', backButtons[0].visible);
			foreSeen = backSeen;
		}
	}

	function onExchangeForeBack()
	{
		// ���ƕ\�̊Ǘ���������

		// children = true �̃g�����W�V�����ł́A�g�����W�V�����I������
		// �\��ʂƗ���ʂ̃��C���\���������������ւ��̂ŁA
		// ����܂� �\��ʂ��Ǝv���Ă������̂�����ʂɁA����ʂ��Ǝv����
		// �������̂��\��ʂɂȂ��Ă��܂��B�����̃^�C�~���O�ł��̏���
		// ����ւ���΁A�����͐����Ȃ��ōςށB

		// �����ŕ\��ʁA����ʂ̃��C���Ɋւ��ĊǗ����ׂ��Ȃ̂�
		// foreButtons �� backButton �AforeSeen �� backSeen �̕ϐ�����
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
	// �v���O�C���I�u�W�F�N�g���쐬���A�o�^����

@endscript
@endif
;
; �}�N���̓o�^
@macro name="sysbtopt"
@eval exp="systembutton_object.setOptions(mp)"
; mp ���}�N���ɓn���ꂽ���������������z��I�u�W�F�N�g
@endmacro
@return


