[iscript]
var �Z�[�u�X���b�g��� = void;
// �Z�[�u�X���b�g��� �́A���[�h���������ŏ�������邵�A�^�C�g���ɖ߂�Ə�����
// sf.�Z�[�u�X���b�g�O��̔ԍ� �́A�Z�[�u�����Ȃ��Ə��������Ȃ�
var �I�[�g�Z�[�u�\ = 0;
// ���[�h���Ă���P���߂��Ȃ��ƃI�[�g�Z�[�u���������Ȃ�

if(sf.�Z�[�u�X���b�g�`===void) sf.�Z�[�u�X���b�g�` = '�f�[�^�Ȃ�';
if(sf.�Z�[�u�X���b�g�a===void) sf.�Z�[�u�X���b�g�a = '�f�[�^�Ȃ�';
if(sf.�Z�[�u�X���b�g�b===void) sf.�Z�[�u�X���b�g�b = '�f�[�^�Ȃ�';
if(sf.�Z�[�u�X���b�g�c===void) sf.�Z�[�u�X���b�g�c = '�f�[�^�Ȃ�';
if(sf.�Z�[�u�X���b�g�d===void) sf.�Z�[�u�X���b�g�d = '�f�[�^�Ȃ�';
if(sf.�Z�[�u�X���b�g�e===void) sf.�Z�[�u�X���b�g�e = '�f�[�^�Ȃ�';
if(sf.�Z�[�u�X���b�g�f===void) sf.�Z�[�u�X���b�g�f = '�f�[�^�Ȃ�';
if(sf.�Z�[�u�X���b�g�g===void) sf.�Z�[�u�X���b�g�g = '�f�[�^�Ȃ�';
if(sf.�Z�[�u�X���b�g�h===void) sf.�Z�[�u�X���b�g�h = '�f�[�^�Ȃ�';
if(sf.�Z�[�u�X���b�g�i===void) sf.�Z�[�u�X���b�g�i = '�f�[�^�Ȃ�';
if(sf.�Z�[�u�X���b�g����===void) sf.�Z�[�u�X���b�g���� = '�f�[�^�Ȃ�';

var slota, slotb, slotc, slotd, slote, slotf, slotg, slotg, sloth, sloti, slotj, slotz;

function updateSlotName() {
	slota = '�`�F' + sf.�Z�[�u�X���b�g�`;
	slotb = '�a�F' + sf.�Z�[�u�X���b�g�a;
	slotc = '�b�F' + sf.�Z�[�u�X���b�g�b;
	slotd = '�c�F' + sf.�Z�[�u�X���b�g�c;
	slote = '�d�F' + sf.�Z�[�u�X���b�g�d;
	slotf = '�e�F' + sf.�Z�[�u�X���b�g�e;
	slotg = '�f�F' + sf.�Z�[�u�X���b�g�f;
	sloth = '�g�F' + sf.�Z�[�u�X���b�g�g;
	sloti = '�h�F' + sf.�Z�[�u�X���b�g�h;
	slotj = '�i�F' + sf.�Z�[�u�X���b�g�i;
	slotz = '�����F' + sf.�Z�[�u�X���b�g����;
}
updateSlotName();

function numToSlot(n) {
	if(tf.numToSlot === void) {
		tf.numToSlot = ['����', '�`', '�a', '�b', '�c', '�d', '�e', '�f', '�g', '�h', '�i'];
	}
	if(n >= tf.numToSlot.count) {
		System.inform("tf.numToSlot �̃C���f�b�N�X���E�𒴂��܂���");
	}
	return tf.numToSlot[n];
}
[endscript]

[macro name=�Z�[�u�X���b�g]
[if exp="�Z�[�u�X���b�g��� === void"]
	;���[�h��ʁA�܂��̓I�[�g�Z�[�u����̍ĊJ
	[emb exp="numToSlot(sf.�Z�[�u�X���b�g�O��̔ԍ�)"]
[else]
	[emb exp="numToSlot(�Z�[�u�X���b�g���)"]
[endif]
[endmacro]

[macro name=�㏑���m�F]
[if exp="mp.�X���b�g=='�f�[�^�Ȃ�'"]
	[eval exp="tf.result = false, �Z�[�u�X���b�g��� = mp.�ԍ�"]
[else]
	[nowait]
	���łɃf�[�^�����݂��܂��B[r]
	�㏑�����܂����H
	[endnowait]
	[��� �A=����ς��߂� �C=�㏑������]
	[if exp=�A]
		[eval exp="tf.result = true"]
	[else]
		[eval exp="tf.result = false, �Z�[�u�X���b�g��� = mp.�ԍ�"]
	[endif]
[endif]
[endmacro]

[return]

*���[�h
[eval exp="var �ĊJ�X���b�g = void"]
[nowait]�O��̑����́A[font color="&�F�F����"]�X���b�g[�Z�[�u�X���b�g][resetfont] �̃f�[�^�ł��B[endnowait]
[�\��� �A=&slota �C=&slotb �E=&slotc �G=&slotd �I=&slote �J=&slotf �L=&slotg �N=&sloth �P=&sloti �R=&slotj �T=&slotz �V=�߂�]
[if exp=�A][eval exp="�ĊJ�X���b�g=1" cond="sf.�Z�[�u�X���b�g�`!='�f�[�^�Ȃ�'"]
[elsif exp=�C][eval exp="�ĊJ�X���b�g=2" cond="sf.�Z�[�u�X���b�g�a!='�f�[�^�Ȃ�'"]
[elsif exp=�E][eval exp="�ĊJ�X���b�g=3" cond="sf.�Z�[�u�X���b�g�b!='�f�[�^�Ȃ�'"]
[elsif exp=�G][eval exp="�ĊJ�X���b�g=4" cond="sf.�Z�[�u�X���b�g�c!='�f�[�^�Ȃ�'"]
[elsif exp=�I][eval exp="�ĊJ�X���b�g=5" cond="sf.�Z�[�u�X���b�g�d!='�f�[�^�Ȃ�'"]
[elsif exp=�J][eval exp="�ĊJ�X���b�g=6" cond="sf.�Z�[�u�X���b�g�e!='�f�[�^�Ȃ�'"]
[elsif exp=�L][eval exp="�ĊJ�X���b�g=7" cond="sf.�Z�[�u�X���b�g�f!='�f�[�^�Ȃ�'"]
[elsif exp=�N][eval exp="�ĊJ�X���b�g=8" cond="sf.�Z�[�u�X���b�g�g!='�f�[�^�Ȃ�'"]
[elsif exp=�P][eval exp="�ĊJ�X���b�g=9" cond="sf.�Z�[�u�X���b�g�h!='�f�[�^�Ȃ�'"]
[elsif exp=�R][eval exp="�ĊJ�X���b�g=10" cond="sf.�Z�[�u�X���b�g�i!='�f�[�^�Ȃ�'"]
[elsif exp=�T][eval exp="�ĊJ�X���b�g=0" cond="sf.�Z�[�u�X���b�g����!='�f�[�^�Ȃ�'"]
[else][return]
[endif]
[return cond="�ĊJ�X���b�g===void"]
[BGM��~]
[�g����]
[�w�i �摜=��]
[load place=0 cond="�ĊJ�X���b�g==0"]
[eval exp="�Z�[�u�X���b�g��� = �ĊJ�X���b�g"]
[load place=&�Z�[�u�X���b�g���]


*�ŏ�����

[nowait]
�V�����n�߂܂��B[r]
�Z�[�u��͂ǂ��ɂ��܂����H
[endnowait]
[�\��� �A=&slota �C=&slotb �E=&slotc �G=&slotd �I=&slote �J=&slotf �L=&slotg �N=&sloth �P=&sloti �R=&slotj �T=�߂�]
[if exp=�A][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�`" �ԍ�=1]
[elsif exp=�C][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�a" �ԍ�=2]
[elsif exp=�E][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�b" �ԍ�=3]
[elsif exp=�G][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�c" �ԍ�=4]
[elsif exp=�I][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�d" �ԍ�=5]
[elsif exp=�J][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�e" �ԍ�=6]
[elsif exp=�L][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�f" �ԍ�=7]
[elsif exp=�N][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�g" �ԍ�=8]
[elsif exp=�P][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�h" �ԍ�=9]
[elsif exp=�R][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�i" �ԍ�=10]
[else][eval cond="tf.result = true"]
[endif]
[return]

*�Z�[�u
;[call storage="�Z�[�u���[�h.ks"]
[nowait]
[if exp="�Z�[�u�X���b�g��� != void"]
	���݁A[font color="&�F�F����"]�X���b�g[�Z�[�u�X���b�g][resetfont] �̃f�[�^���v���C���B[r]
[else]
	���݁A�I�[�g�Z�[�u���v���C���B�Ō�ɃZ�[�u�����X���b�g��[emb exp="numToSlot(sf.�Z�[�u�X���b�g�O��̔ԍ�)"]�ł��B[r]
[endif]
	�Z�[�u��͂ǂ��ɂ��܂����H[r]
	[font color="&�F�F����"][emb exp="saveLabel()"][resetfont]
[endnowait]
[�\��� �A=&slota �C=&slotb �E=&slotc �G=&slotd �I=&slote �J=&slotf �L=&slotg �N=&sloth �P=&sloti �R=&slotj �T=�߂�]
[eval exp="tf.result = false"]
[if exp=�A][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�`" �ԍ�=1]
[elsif exp=�C][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�a" �ԍ�=2]
[elsif exp=�E][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�b" �ԍ�=3]
[elsif exp=�G][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�c" �ԍ�=4]
[elsif exp=�I][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�d" �ԍ�=5]
[elsif exp=�J][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�e" �ԍ�=6]
[elsif exp=�L][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�f" �ԍ�=7]
[elsif exp=�N][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�g" �ԍ�=8]
[elsif exp=�P][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�h" �ԍ�=9]
[elsif exp=�R][�㏑���m�F �X���b�g="&sf.�Z�[�u�X���b�g�i" �ԍ�=10]
[else][eval cond="tf.result = true"]
[endif]
[return cond="tf.result"]
[call target="*�Z�[�u���s"]
[nowait]
�X���b�g[�Z�[�u�X���b�g]�ɃZ�[�u���܂����B[next]
[endnowait]
[return]

*�Z�[�u���s

[eval exp="sf.�Z�[�u�X���b�g�O��̔ԍ� = �Z�[�u�X���b�g���"]
[eval exp="sf['�Z�[�u�X���b�g' + numToSlot(�Z�[�u�X���b�g���)] = saveLabel()"]
[save place="&�Z�[�u�X���b�g���"]
[eval exp="�I�[�g�Z�[�u�\ = 0"]
[eval exp="updateSlotName()"]
[return]

*�I�[�g�Z�[�u

[eval exp="sf.�Z�[�u�X���b�g���� = saveLabel()"]
[save place="0"]

[return]
