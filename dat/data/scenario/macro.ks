[call storage=ExtHistoryLayer.ks]
[history historytag=false]
; ����ݒ�
[call storage=systembutton.ks]
; �V�X�e���{�^��
[loadplugin module="wuvorbis.dll"]
[bgmopt gvolume=80]
; ogg vorbis
[eval exp="kag.askOnClose=false"]
; ����Ƃ��Ɋm�F���Ȃ�

[laycount messages=3]
;���b�Z�[�W������---------------------------
[position layer=message0 frame=image/�e�L�X�g�{�b�N�X.png left=180 top=570 margint=16 marginl=40]
[position layer=message1 frame=image/�l�[���{�b�N�X.png left=1280 top=519 margint=14 marginl=0]
[position layer=message2 frame=image/�I��g left=20 top=270 margint=16 marginl=24]
[current layer=message2]
[deffont edge="true" edgecolor="0x442211" size="24" color="0xFFFFFF" face="�l�r �S�V�b�N"]
[resetfont]
[current layer=message1]
[deffont edge="true" edgecolor="0xFFFFFF" size="24" color="0x222211" face="�l�r �S�V�b�N"]
[resetfont]
[current layer=message0]
[deffont edge="true" edgecolor="0xFFFFFF" size="24" color="0x222211" face="�l�r �S�V�b�N"]
; ���b�Z�[�W���C���͂R���p�ӂ���
; message0���Z���t��\������
; message1���l������\������
; message2���I������\������
;-------------------------------------------
[iscript]
var layer���m���[�O = 9;

function ���m���[�O������() {
	var layer = kag.back.layers[layer���m���[�O];
	layer.setSize(1280, 720);
	layer.fillRect(0, 0, 1280, 720, 0x000000);
	layer.opacity = 100;
	layer.visible = false;
	layer = kag.fore.layers[layer���m���[�O];
	layer.setSize(1280, 720);
	layer.fillRect(0, 0, 1280, 720, 0x000000);
	layer.opacity = 100;
	layer.visible = false;
}
[endscript]
;-------------------------------------------
[eval exp="���m���[�O������()"]
[resetfont]
[layopt layer=message0 page=fore visible=false]
[layopt layer=message1 page=fore visible=false]
[layopt layer=message2 page=fore visible=false]
[backlay layer=message0]
[backlay layer=message1]
[backlay layer=message2]
; ���ׂẴ��b�Z�[�W���C����s���ɂ���

[eval exp="var �A, �C, �E, �G, �I, �J, �L, �N, �P, �R, �T, �V"]
; �I�����ϐ����P�Q�p�ӂ���
[eval exp="var BGM���� = 100"]
;BGM���ʂ�ێ�����

[laycount layers=30]
; ���C���[��30��, 0-29
; 0�c�c�Ȃ�
; 1�c�c�l������
; 2�c�c�l����
; 3�c�c�l���E
; 5�c�c�̗͋C�͓��t
; 9�c�c���m���[�O
; 10-13�c�c�̗͖_

[eval exp="var ���_"]
[eval exp="var �Ԗ_"]
[eval exp="var ���_"]
[eval exp="var �n�[�g"]
[eval exp="var �V�X�e���{�^�� = true"]
;[eval exp="hasSeed('�����ȃ^�l')"]


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

[macro name=��]
[wait time=150]
[endmacro]

[macro name=��][��]
[endmacro]

[macro name=transskip]
[if exp="kag.skipMode<=1"]
[trans method=crossfade time=100]
[else]
[trans method=crossfade time=0]
[endif]
[wt]
[endmacro]

[macro name=�g]
[position layer=message1 page=back frame="�l�[���{�b�N�X����"]
[position layer=message0 page=back frame="�e�L�X�g�{�b�N�X����"]
[layopt layer=message0 page=back visible=true]
[layopt layer=message1 page=back visible=false]
[transskip]
[backlay layer=message0]
[backlay layer=message1]
[endmacro]

[macro name=�g����]
[layopt layer=message0 page=back visible=false]
[layopt layer=message1 page=back visible=false]
[transskip]
[backlay layer=message0]
[backlay layer=message1]
[er][r][er]
;[cancelskip]
[endmacro]

[macro name=���O��]
[history output=true]
[current layer=message0 page=back]
[nowait]
[er][r]�� [ch text=%���O] ��[er]
[history output=false]
[current layer=message1 page=back]
[style align=center][ch text=%���O]
[history output=true]
[current layer=message0]
[endnowait]
[endmacro]

[macro name=���b�Z�[�W]
[position layer=message1 page=back frame="�l�[���{�b�N�X����"]
[position layer=message0 page=back frame="�e�L�X�g�{�b�N�X����"]
[layopt layer=message1 page=back visible=false]
[transskip]
[backlay layer=message1]
[current layer=message0]
[endmacro]

[macro name=����2]
[���b�Z�[�W]
[position layer=message1 page=back left=460]
[layopt layer=message1 page=back visible=true]
[���O�� ���O=����]
[backlay layer=message1]
[er][r][er]
[endmacro]

[macro name=����]
[position layer=message1 page=back frame="�l�[���{�b�N�X����"]
[position layer=message0 page=back frame="�e�L�X�g�{�b�N�X����"]
[position layer=message1 page=back left=300]
[layopt layer=message1 page=back visible=true]
[���O�� ���� ���O="&f.��+f.��"]
[transskip]
[backlay layer=message1]
[er][r][er]
[endmacro]

[macro name=���m���[�O]
[���b�Z�[�W]
[history output=true]
[current layer=message0 page=back]
[er][r][er]
[layopt layer=&layer���m���[�O page=back visible=true]
[current layer=message0]
[transskip]
[endmacro]

[macro name=���m���[�O�I��]
[layopt layer=&layer���m���[�O page=back visible=false]
[transskip]
[endmacro]

[macro name=�\��]
[image storage=%�摜 layer=1 page=back visible=true]
[eval exp="mp.tmp0 = kag.back.layers[1].width, mp.tmp1 = kag.fore.base.width, mp.tmp0 = (mp.tmp1 - mp.tmp0) / 2"]
[layopt layer=1 page=back left=&mp.tmp0]
[transskip]
[endmacro]

[macro name=�\�]
[eval exp="var dx = 440"]
[eval exp="dx -= 120" cond="mp.����"]
[image storage=%�摜 layer=2 page=back visible=true]
[eval exp="mp.tmp0 = kag.back.layers[2].width, mp.tmp0 = -mp.tmp0 / 2 + dx"]
[layopt layer=2 page=back left=&mp.tmp0]
[transskip]
[endmacro]

[macro name=�\�����]
[�\� ���� �摜=%�摜 ���O=%���O]
[endmacro]

[macro name=�\��E]
[eval exp="var dx = 440"]
[eval exp="dx -= 120" cond="mp.����"]
[image storage=%�摜 layer=3 page=back visible=true]
[eval exp="mp.tmp0 = kag.back.layers[3].width, mp.tmp1 = kag.fore.base.width, mp.tmp0 = mp.tmp1 - mp.tmp0 / 2 - dx"]
[layopt layer=3 page=back left=&mp.tmp0]
[transskip]
[endmacro]

[macro name=�\��E����]
[�\��E ���� �摜=%�摜 ���O=%���O]
[endmacro]

[macro name=�l��]
[position layer=message1 page=back frame="�l�[���{�b�N�X"]
[position layer=message0 page=back frame="�e�L�X�g�{�b�N�X"]
[position layer=message1 page=back left=460]
[layopt layer=message1 page=back visible=true]
[���O�� ���O=%���O]
[�\�� �摜=%�摜]
[backlay layer=message1]
[backlay layer=1]
[er][r][er]
[endmacro]

[macro name=�l������]
[layopt layer=1 page=back visible=false]
[transskip]
[current layer=message1][er][backlay layer=message1][current layer=message0]
[backlay layer=1]
[endmacro]

[macro name=�l����]
[position layer=message1 page=back frame="�l�[���{�b�N�X"]
[position layer=message0 page=back frame="�e�L�X�g�{�b�N�X"]
[position layer=message1 page=back left=220]
[layopt layer=message1 page=back visible=true]
[���O�� ���O=%���O]
[�\� �摜=%�摜 ����=%����]
[backlay layer=message1]
[backlay layer=2]
[er][r][er]
[endmacro]

[macro name=�l��������]
[�l���� ���� �摜=%�摜 ���O=%���O]
[endmacro]

[macro name=�l��������]
[layopt layer=2 page=back visible=false]
[transskip]
[current layer=message1][er][backlay layer=message1][current layer=message0]
[backlay layer=2]
[endmacro]

[macro name=�l���E]
[position layer=message1 page=back frame="�l�[���{�b�N�X"]
[position layer=message0 page=back frame="�e�L�X�g�{�b�N�X"]
[position layer=message1 page=back left=700]
[layopt layer=message1 page=back visible=true]
[���O�� ���O=%���O]
[�\��E �摜=%�摜 ����=%����]
[backlay layer=message1]
[backlay layer=3]
[er][r][er]
[endmacro]

[macro name=�l���E����]
[�l���E ���� �摜=%�摜 ���O=%���O]
[endmacro]

[macro name=�l���E����]
[layopt layer=3 page=back visible=false]
[transskip]
[current layer=message1][er][backlay layer=message1][current layer=message0]
[backlay layer=3]
[endmacro]

[macro name=�l���S����]
[layopt layer=1 page=back visible=false]
[layopt layer=2 page=back visible=false]
[layopt layer=3 page=back visible=false]
[transskip]
[current layer=message1][er][backlay layer=message1][current layer=message0]
[backlay layer=1]
[backlay layer=2]
[backlay layer=3]
[endmacro]

[macro name=�w�i]
[eval exp="mp.����=400" cond="mp.����===void"]
[image storage=%�摜 layer=base page=back]
[if exp="kag.skipMode<=1"]
[trans layer=base method=crossfade time=%����]
[else]
[trans layer=base method=crossfade time=0]
[endif]
[wt]
[endmacro]

[macro name=�w�i����]
[if exp="f.���x��"][�w�i �摜=����][else][�w�i �摜=�������ی�][endif]
[endmacro]

[macro name=�w�i�L��]
[if exp="f.���x��"][�w�i �摜=�L��][else][�w�i �摜=�����[��][endif]
[endmacro]

[macro name=�w�i�K�i]
[if exp="f.���x��"][�w�i �摜=�K�i��][else][�w�i �摜=�K�i�[��][endif]
[endmacro]

[macro name=�w�i����]
[if exp="f.���x��"][�w�i �摜=���㒋][else][�w�i �摜=����][endif]
[endmacro]

[macro name=��ʓ]��]
[�l���S����]
[�g����]
[SE��~ buf=0 ����=1000]
[SE��~ buf=1 ����=1000]
[SE��~ buf=2 ����=1000]
[layopt layer=&layer���m���[�O page=back visible=false]
;���m���[�O�I��
[�w�i �摜=��]
[endmacro]

[macro name=��]
[emb exp="f.��"]
[endmacro]
[macro name=��]
[emb exp="f.��"]
[endmacro]

[macro name=���]
[�l�� �A=%�A �C=%�C �E="" �G=""]
[endmacro]

[macro name=�O��]
[�l�� �A=%�A �C=%�C �E=%�E �G=""]
[endmacro]

[macro name=�l��]
[eval exp="�A=mp.�A, �C=mp.�C, �E=mp.�E, �G=mp.�G"]
[call storage=macro.ks target=*f�l��]
[endmacro]

[macro name=�\���]
[eval exp="clearChoice(), �A=mp.�A, �C=mp.�C, �E=mp.�E, �G=mp.�G, �I=mp.�I, �J=mp.�J, �L=mp.�L, �N=mp.�N, �P=mp.�P, �R=mp.�R, �T=mp.�T, �V=mp.�V"]
[call storage=macro.ks target=*f�\���]
[endmacro]

[macro name=���r]
[ruby text=%�ǂ�]
[endmacro]

[macro name=BGM]
[eval exp="mp.����=100" cond="mp.����===void"]
[eval exp="BGM���� = mp.����"]
[if exp="kag.bgm.currentBuffer.status=='play'"]
[xchgbgm storage=%�� time=500 overlap=500 loop=%���[�v]
[fadebgm volume=%���� time=500]
[else]
[bgmopt volume=%����]
[playbgm storage=%�� loop=%���[�v]
[endif]
[endmacro]

[macro name=BGM��~]
[eval exp="mp.����=500" cond="mp.����===void"]
[if exp="kag.skipMode>1"][stopbgm]
[else][fadeoutbgm time=%����][endif]
[endmacro]

[macro name=BGM���f]
[if exp="kag.skipMode>1"][pausebgm]
[else][fadepausebgm time=500][endif]
[endmacro]

[macro name=BGM�ĊJ]
[bgmopt volume=&BGM����]
[resumebgm]
[endif]
[endmacro]

[macro name=SE]
[if exp="kag.skipMode<=1"]
[seopt volume=%���� buf=%buf]
[playse storage=%�� buf=%buf]
[endif]
[endmacro]

[macro name=SE��~]
[eval exp="mp.����=100" cond="mp.����===void"]
[fadeoutse buf=%buf time=%����]
[endmacro]

[macro name=�J���X]
[SE ��=�J���X.ogg ����=50 buf=2]
[endmacro]

[macro name=�؂��]
[SE ��=�����߂���.ogg ����=50]
[endmacro]

[macro name=�����b���Ȃ�]
[BGM ���[�v ����=60 ��=�����b���Ȃ�.ogg]
[endmacro]

[macro name=���щ���]
[if exp="sf[mp.���O] != 1"]
	[cancelskip]
	[bgmopt volume=&"BGM����/2"]
	[SE ��=�N���A.ogg ����=50]
	[emb exp="mp.���O"] ���B����[ws][fadebgm volume=&"BGM����" time=500][next]
	[eval exp="sf[mp.���O] = 1"]
[endif]
[endmacro]

[macro name=�����]
;[����� ���O=���������H �ڍ�=�O���搶�ɂ����߂�ꂽ�B ����=3]
[eval exp="mp.����=&��̊����W��" cond="mp.����===void"]
[eval exp="gainSeed(mp.���O, mp.�ڍ�, mp.����, false)"]
[���m���[�O]
[cancelskip]
[SE ��=��ɓ��ꂽ.ogg ����=40 buf=1]
[nowait]����b�̎� [font color=0xdd4400][emb exp=mp.���O][resetfont] ����ɓ��ꂽ�B[r]
�i�g�p���� [emb exp=mp.����]���E�P�����j[endnowait][next]
[���m���[�O�I��]
[endmacro]

[macro name=���������]
;[��������� ���O=���������H �ڍ�=�O���搶�ɂ����߂�ꂽ�B ����=3]
[eval exp="mp.����=&��̊����W��" cond="mp.����===void"]
[eval exp="gainSeed(mp.���O, mp.�ڍ�, mp.����, true)"]
[���m���[�O]
[cancelskip]
[SE ��=��ɓ��ꂽ.ogg ����=40 buf=1]
[nowait]����b�̎� [font color=0x0066ff][emb exp=mp.���O][resetfont] ����ɓ��ꂽ�B[r]
�i�g�p���� [emb exp=mp.����]���E�񐔐����Ȃ��j[endnowait][next]
[���m���[�O�I��]
[endmacro]

[macro name=�핪��]
;[�핪�� �A=���������H �C=���܂����� �̗�=-3]
[eval exp="�A=mp.�A, �C=mp.�C"]
[eval exp="var �̗͏���� = mp.�̗�"]
[eval exp="�̗͏���� = 0" cond="�̗͏���� ===void"]
[call storage=macro.ks target=*����]
[endmacro]

[macro name=���t�W�����v]
[call storage=%�W�����v cond="f.����==mp.���t"]
[endmacro]

[macro name=�w��]
[eval exp=�w�͕ω�((int)mp.�ω�)]
[endmacro]

[macro name=�̗�]
;[�̗� �ω�=5]�̂悤�Ɏg�p����
[eval exp="tf.i = 0"]
[eval exp="tf.�ω� = (int)mp.�ω�"]
[call storage="macro.ks" target=*�̗͌��� cond="tf.�ω� < 0"]
[call storage="macro.ks" target=*�̗͑��� cond="tf.�ω� > 0"]
[eval exp=�_()]
[if exp="f.���� <= 0"]
	[cancelskip]
	[jump storage=�Q�[���I�[�o�[.ks target="*ed1"]
[endif]
[endmacro]

[macro name=�v���i���A��]
[call storage="macro.ks" target="*�v���i���A��"]
[eval exp=�_()]
[endmacro]

[macro name=�x����]
[eval exp="tf.���� = Math.min(100, f.���� + �x����)"]
[call storage="macro.ks" target="*�x����"]
[eval exp=�_()]
[endmacro]

[macro name=������]
[�̗� �ω�=&"Math.floor(������a + f.���� * ������b + f.�̗� * ������c)"]
[�w�� �ω� =&�����w�͒ቺ]
[endmacro]

;[���� ���O=�J�P�������ԂɂȂ���]
[macro name=����]
[eval exp="���Ղ���(mp.���O)"]
[endmacro]

[macro name=�Q��]
[eval exp="f[mp.���O + '�Q��'] = 1"]
[���b�Z�[�W]
[emb exp="fullname(mp.���O)"]�������Տ����ɎQ������悤�ɂȂ����I[next]
[endmacro]

[macro name=�s�Q��]
[eval exp="f[mp.���O + '�s�Q��'] = 1"]
[���b�Z�[�W]
[emb exp="fullname(mp.���O)"]�������Տ����ɎQ�����Ȃ��Ȃ����c�c[next]
[endmacro]

;�f�o�b�O���ɔC�ӂɃt���O��ON/OFF�ł���
;�����ɓ����̉�b�̎���擾����
;[���Ճf�o�b�O ���O=�J�P�������ԂɂȂ���]
[macro name=���Ճf�o�b�O]
[if exp=testplay]
	[eval exp = "var s = ' �~'"]
	[eval exp = "var s = ' ��'" cond="����(mp.���O)"]
	[eval exp = "var a = '���Ճf�o�b�O�F�ύX���Ȃ�' + s"]
	[eval exp = "var b = mp.���O + ' ��'"]
	[eval exp = "var c = mp.���O + ' �~'"]
	[�O�� �A=&a �C=&b �E=&c]
	[if exp=�C]
		[eval exp="���Ղ���(mp.���O)"]
		[eval exp="gainSeed(mp.���O, '', 0, 0)"]
	[elsif exp=�E]
		[eval exp="���Ղ���(mp.���O)"]
	[endif]
[endif]
[endmacro]

[macro name=�{�^���\��]
;[sysbtopt forevisible=true backvisible=true mode=1]
[eval exp="global.systembutton_object.setMode(1)"]
[endmacro]

[macro name=�{�^���\���^�C�g��]
;[sysbtopt forevisible=true backvisible=true mode=2]
[eval exp="global.systembutton_object.setMode(2)"]
[endmacro]

[macro name=�{�^���\������]
[eval exp="global.systembutton_object.setMode(3)"]
[endmacro]

[macro name=�{�^������]
[sysbtopt forevisible=false backvisible=false]
[eval exp="global.systembutton_object.setMode(0)"]
[endmacro]

[macro name=�^�C�g���ɖ߂�]
[jump storage=macro.ks target=*�^�C�g���ɖ߂�]
[endmacro]

[iscript]

// �����񂪑S�p�����ŉ����������Ȃ̂����v������
function widthStr(s) {
	if(s === void) return 0;
	var i, sz = s.length;
	var res = sz;
	for(i = 0; i < sz; ++i) {
		if(s[i] <= "~") res -= 0.5;
	}
	return res;
}

// s�Ƃ�����b�̃^�l���i�[����Ă���ꏊ��Ԃ�
// ���݂��遨0�ȏ�̃C���f�b�N�X
// ���݂��Ȃ���-1
function findSeed(s) {
	if(f.�� === void) return -1;
	var count = f.��.count;
	for(var i = 0; i < count; i++) {
		if(f.��[i] == s) {
			return i;
		}
	}
	return -1;
}

// ����擾����֐�
// s:��̖��O desc:��̐��� limit:�g�p�������Ɖ���
function gainSeed(s, desc, limit, inf) {
	if(f.�� ===void) f.�� = new Array();
	if(f.��ڍ� ===void) f.��ڍ� = new Array();
	if(f.����� ===void) f.����� = new Array();
	if(f.�햳�� ===void) f.�햳�� = new Array();
	var count = f.��.count;
	f.��[count] = s;
	f.��ڍ�[count] = desc;
	f.�����[count] = limit;
	f.�햳��[count] = inf;
}

// �^�l�̎g�p�������ЂƂ��炵�A�����ɂȂ����^�l���폜���ċl�߂�
// �����ɂȂ����큁�g�p���������̎�A�܂��́A���O���󔒂̎�
function manageSeed() {
	if(f.�� ===void) f.�� = new Array();
	if(f.��ڍ� ===void) f.��ڍ� = new Array();
	if(f.����� ===void) f.����� = new Array();
	if(f.�햳�� ===void) f.�햳�� = new Array();
	var count = f.��.count;
	for(var i = 0; i < count; i++) {
		f.�����[i]--;
	}
	var fill = 0; // ���ɋl�߂�ׂ��ꏊ
	// ����l�߂铮��
	for(var i = 0; i < count; i++) {
		if(f.�����[i] >= 0 && f.��[i] !==void) {
			f.��[fill] = f.��[i];
			f.��ڍ�[fill] = f.��ڍ�[i];
			f.�����[fill] = f.�����[i];
			f.�햳��[fill] = f.�햳��[i];
			fill++;
		}
	}
	// �z����k�߂�
	f.��.count = fill;
	f.��ڍ�.count = fill;
	f.�����.count = fill;
	f.�햳��.count = fill;
}

// �w�肵���C���f�b�N�X�̎���g�p����B
// ��̃C���f�b�N�X�𓾂邽�߂ɂ́AfindSeed(s)���g���B
function useSeed(idx) {
	if(idx == -1 || idx >= f.��.count) return;
	if(!f.�햳��[idx]) f.��[idx] = void;
}

function countSeed() {
	if(f.�� ===void) return 0;
	return f.��.count;
}

function today() {
	var mon;
	if(f.�� == 9) mon = '�X';
	if(f.�� == 10) mon = '�P�O';
	if(f.�� == 11) mon = '�P�P';
	var week;
	if(f.�T == 1) week = '�P';
	if(f.�T == 2) week = '�Q';
	if(f.�T == 3) week = '�R';
	if(f.�T == 4) week = '�S';
	return mon + '��' + week + '�T ' + f.�j��;
}

function �_() {
if(���_ ===void){ // ���C���[������Ă��Ȃ��ꍇ
	var x = 840;
	var y = 16;
	���_ = new Array();
	���_[0] = kag.back.layers[10];
	���_[1] = kag.fore.layers[10];
	���_[0].loadImages(%[storage:'���_.png']);
	���_[1].loadImages(%[storage:'���_.png']);
	���_[0].setSizeToImageSize();
	���_[1].setSizeToImageSize();
	���_[0].visible = ���_[1].visible = true;
	���_[0].setPos(x, y);
	���_[1].setPos(x, y);
	�Ԗ_ = new Array();
	�Ԗ_[0] = kag.back.layers[11];
	�Ԗ_[1] = kag.fore.layers[11];
	�Ԗ_[0].loadImages(%[storage:'�Ԗ_.png']);
	�Ԗ_[1].loadImages(%[storage:'�Ԗ_.png']);
	�Ԗ_[0].setSizeToImageSize();
	�Ԗ_[1].setSizeToImageSize();
	�Ԗ_[0].visible = �Ԗ_[1].visible = true;
	�Ԗ_[0].setPos(x + 2, y + 2);
	�Ԗ_[1].setPos(x + 2, y + 2);
	���_ = new Array();
	���_[0] = kag.back.layers[12];
	���_[1] = kag.fore.layers[12];
	���_[0].loadImages(%[storage:'���_.png']);
	���_[1].loadImages(%[storage:'���_.png']);
	���_[0].setSizeToImageSize();
	���_[1].setSizeToImageSize();
	���_[0].visible = ���_[1].visible = true;
	���_[0].setPos(x + 2, y + 2);
	���_[1].setPos(x + 2, y + 2);
	�n�[�g = new Array();
	�n�[�g[0] = kag.back.layers[13];
	�n�[�g[1] = kag.fore.layers[13];
	�n�[�g[0].loadImages(%[storage:'�n�[�g��.png']);
	�n�[�g[1].loadImages(%[storage:'�n�[�g��.png']);
	�n�[�g[0].setSizeToImageSize();
	�n�[�g[1].setSizeToImageSize();
	�n�[�g[0].visible = �n�[�g[1].visible = true;
	�n�[�g[0].setPos(x - 40, y - 5);
	�n�[�g[1].setPos(x - 40, y - 5);
}
�Ԗ_[0].width = 400 * f.���� \ 100;
�Ԗ_[1].width = �Ԗ_[0].width;
���_[0].width = 400 * f.�̗� \ 100;
���_[1].width = ���_[0].width;
}

function �_����(){
if(���_ !==void){
���_[0].visible = false;
�Ԗ_[0].visible = false;
���_[0].visible = false;
�n�[�g[0].visible = false;
���_[1].visible = false;
�Ԗ_[1].visible = false;
���_[1].visible = false;
�n�[�g[1].visible = false;
}
}

function �w�͕ω�(�ω�) {
f.�w�� += �ω�;
f.�w�� = Math.min((int)95, f.�w��);
f.�w�� = Math.max((int)0, f.�w��);
}

function �����Տ���(�撣��) {
var n = f.�}���Q�� * 2 + f.�}�����W * 1;
n += f.�C�Y�~�Q�� * 2 + f.�C�Y�~���W * 1;
n += f.�}���Q�� * 2 + f.�}�����W * 1;
n += f.�J�P���Q�� * 2 + f.�J�P�����W * 1;
n += f.�~�h���Q�� * 2 + f.�~�h�����W * 1;
n += f.���u���W * 1;
n += ��l���̊撣��;
if(��l���̊撣�� == 1){n += 2;}
if(��l���̊撣�� == 2){n += 2;}
f.�}�����W = f.�C�Y�~���W = f.�}�����W = f.�J�P�����W = f.�~�h�����W = f.���u���W = 0;
f.�i�� += n;
}

function ����(�撣��) {
if(�撣�� == 0){
	�̗͕ω�(5);
}else if(�撣�� == 1){
	�̗͕ω�(-5);
	�w�͕ω�(f.�w�� \ 20);
}else{
	�̗͕ω�(-10);
	�w�͕ω�(8);
}
}

// �t���O�𗧂Ă�
function ���Ղ���(name) {
	if(f.���� ===void) f.���� = %[];
	f.����[name] = true;
}

// �t���O��������
function ���Ղ���(name) {
	if(f.���� ===void) f.���� = %[];
	f.����[name] = void;
}

// �t���O��true/false�ŕԂ�
function ����(name) {
	if(f.���� ===void) return false;
	var res = f.����[name];
	if(res ===void) res = false;
	return res;
}

// �I���������ׂĖ��I����Ԃɂ���
function clearChoice() {
	�A = �C = �E = �G = �I = �J = �L = �N = �P = �R = �T = �V = false;
}

function fullname(s) {
	if(s == '�C�Y�~') return '�{���C�Y�~';
	if(s == '�}��') return '���}��';
	if(s == '���V�I') return '�������V�I';
	if(s == '�J����') return '�����E�J����';
	if(s == '�J�P��') return '����J�P��';
	if(s == '�~�h��') return '�����~�h��';
	if(s == '�}��') return '�ш�}��';
	if(s == '�J�Y�L') return '�������J�Y�L';
	if(s == '�O���搶') return '�O���搶';
	return '[�x���F�s���Ȗ��O�ł�]';
}

[endscript]

[return]

*f�l��
[iscript]
var len = Math.max(widthStr(�A), widthStr(�C));
len = Math.max(len, widthStr(�E));
len = Math.max(len, widthStr(�G));
var wid = len * 38 + 20;
[endscript]
[nowait]
[current layer=message0 page=back]
[er][r][r][er][ch text="----- �I���� ---------------------"][r][er]
[current layer=message2]
[layopt layer=message2 page=fore visible=true]
[style autoreturn=false]
[if exp=�A!=''][link target=*f�I���A][emb exp="�A"][endlink][r][endif]
[if exp=�C!=''][link target=*f�I���C][emb exp="�C"][endlink][r][endif]
[if exp=�E!=''][link target=*f�I���E][emb exp="�E"][endlink][r][endif]
[if exp=�G!=''][link target=*f�I���G][emb exp="�G"][endlink][r][endif]
[style autoreturn=true]
[current layer=message0 page=back]
[er][ch text="----------------------------------"][r][er]
[current layer=message0]
[endnowait]
[s]
*f�I���G
[eval exp="�A=false, �C=false, �E=false, �G=true"]
[jump target=*f�I������]
*f�I���E
[eval exp="�A=false, �C=false, �E=true, �G=false"]
[jump target=*f�I������]
*f�I���C
[eval exp="�A=false, �C=true, �E=false, �G=false"]
[jump target=*f�I������]
*f�I���A
[eval exp="�A=true, �C=false, �E=false, �G=false"]
*f�I������
[cancelskip]
[SE ��=�I�� ����=40 buf=1]
[layopt layer=message2 page=fore visible=false]
[current layer=message2]
[er]
[current layer=message0]
[er]
[return]

*f�\���
[nowait]
[current layer=message0 page=back]
[er][r][r][er][ch text="----- �I���� ---------------------"][r][er]
[current layer=message2]
[position frame="�I��g�Z�[�u" top=200]
[font size=17]
[layopt layer=message2 page=fore visible=true]
[style autoreturn=false]
[if exp=�A!=''][link target=*f�\������� exp="clearChoice(), �A=true"][emb exp="�A"][endlink][r][endif]
[if exp=�C!=''][link target=*f�\������� exp="clearChoice(), �C=true"][emb exp="�C"][endlink][r][endif]
[if exp=�E!=''][link target=*f�\������� exp="clearChoice(), �E=true"][emb exp="�E"][endlink][r][endif]
[if exp=�G!=''][link target=*f�\������� exp="clearChoice(), �G=true"][emb exp="�G"][endlink][r][endif]
[if exp=�I!=''][link target=*f�\������� exp="clearChoice(), �I=true"][emb exp="�I"][endlink][r][endif]
[if exp=�J!=''][link target=*f�\������� exp="clearChoice(), �J=true"][emb exp="�J"][endlink][r][endif]
[if exp=�L!=''][link target=*f�\������� exp="clearChoice(), �L=true"][emb exp="�L"][endlink][r][endif]
[if exp=�N!=''][link target=*f�\������� exp="clearChoice(), �N=true"][emb exp="�N"][endlink][r][endif]
[if exp=�P!=''][link target=*f�\������� exp="clearChoice(), �P=true"][emb exp="�P"][endlink][r][endif]
[if exp=�R!=''][link target=*f�\������� exp="clearChoice(), �R=true"][emb exp="�R"][endlink][r][endif]
[if exp=�T!=''][link target=*f�\������� exp="clearChoice(), �T=true"][emb exp="�T"][endlink][r][endif]
[if exp=�V!=''][link target=*f�\������� exp="clearChoice(), �V=true"][emb exp="�V"][endlink][r][endif]
[resetfont]
[style autoreturn=true]
[current layer=message0 page=back]
[er][ch text="----------------------------------"][r][er]
[current layer=message0]
[endnowait]
[s]
*f�\�������
[cancelskip]
[SE ��=�I�� ����=40 buf=1]
[layopt layer=message2 page=fore visible=false]
[current layer=message2]
[position frame="�I��g" top=270]
[er]
[current layer=message0]
[er]
[return]

*����
[iscript]
var idxSeed = (int)findSeed(�A);
var len = Math.max(widthStr(�A), 18);
var fontsize = (int)(18 * 24 / len);
var inf = false;
if(idxSeed >= 0) inf = f.�햳��[idxSeed];
var fontcolor = �F�F��;
if(inf) fontcolor = �F�F�햳��;
[endscript]
[cancelskip]
[nowait]
[current layer=message0 page=back]
[r][r][er][ch text="----- �I���� ---------------------"][r][er]
[current layer=message2]
[layopt layer=message2 page=fore visible=true]

[style autoreturn=false]
[if exp="idxSeed < 0"]
	[font color=0x999999 size=&fontsize]��b�̎���g���i[emb exp=�̗͏����]�j[r][[[emb exp=�A]][resetfont][r][r]
[else]
	[link target=*f��I���A]��b�̎���g���i[emb exp=�̗͏����]�j[r][font color=&fontcolor size=&fontsize][[[emb exp=�A]][resetfont][endlink][r][r]
[endif]
[link target=*f��I���C][emb exp=�C][endlink][r]
[style autoreturn=true]
[endnowait]
[current layer=message0 page=back]
[er][ch text="----------------------------------"][r][er]
[current layer=message0]
[SE ��=�I����.ogg ����=60 buf=2]
[s]
*f��I���C
[eval exp="�A=false, �C=true, �E=false, �G=false"]
[eval exp="�̗͏���� = 0"]
[jump target=*f��I������]
*f��I���A
[eval exp="useSeed(idxSeed), �A=true, �C=false, �E=false, �G=false"]
*f��I������
[cancelskip]
[SE ��=�I�� ����=40 buf=1]
[layopt layer=message2 page=fore visible=false]
[current layer=message2]
[er]
[current layer=message0]
[er]
[�̗� �ω�=&�̗͏����]
[return]

function �̗͕ω�(�ω�) {
f.�̗� += �ω�;
if(f.�̗� < 0) {
	f.���� += f.�̗�;
	f.�̗� = 0;
}
f.�̗� = Math.min(f.�̗�, f.����);
}

*�̗͌���
[eval exp=�_()]
[eval exp="tf.�ω� = -f.���� - f.�̗�" cond="-tf.�ω� > f.���� + f.�̗�"]
[if exp="f.�̗� == 0"]
[eval exp="f.���� -= 1"]
[else]
[eval exp="f.�̗� -= 1"]
[endif]
[eval exp="tf.�ω� += 1"]
[wait time=50]
[jump storage="macro.ks" target=*�̗͌��� cond="tf.�ω� !=0"]
[return]

*�̗͑���
[eval exp=�_()]
[eval exp="tf.�ω� = f.���� - f.�̗�" cond="tf.�ω� > f.���� - f.�̗�"]
[if exp="tf.�ω� > 0"]
[eval exp="f.�̗� += 1"]
[eval exp="tf.�ω� -= 1"]
[wait time=50]
[endif]
[jump storage="macro.ks" target=*�̗͑��� cond="tf.�ω� !=0"]
[return]

*�v���i���A��
[eval exp=�_()]
[return cond="f.���� >= 100"]
[if exp="f.���� > 70"][eval exp="f.���� += 1"]
[elsif exp="f.���� > 40"][eval exp="f.���� += 2"]
[else][eval exp="f.���� += 3"]
[endif]
[wait time=50]
[jump target="*�v���i���A��"]

*�x����
[eval exp=�_()]
[return cond="f.���� >= tf.����"]
[eval exp="f.���� += 1"]
[wait time=50]
[jump target="*�x����"]

*�^�C�g���ɖ߂�
[�{�^������]
[eval exp="�_����()"]
[eval exp="kag.historyLayer.clear()"]
[layopt layer=&layer���m���[�O page=fore visible=false]
[layopt layer=&layer���m���[�O page=back visible=false]
[BGM��~]
[SE��~]
[�l���S����]
[�g����]
[jump storage=first.ks target=*�N��]

*�I������
[�{�^������]
[BGM��~]
[SE��~]
[�g����]
[�w�i �摜=�� ����=400]
[close]
