[iscript]
// �t�@�C�����܂����Ŏg����ϐ�
tf.result = false;
tf.result2 = false;
tf.�Z�[�u���x�� = '';
f.����; // ��,���x��,���ی�,��,�����Տ����Ȃǂ�����܂�
if(sf.���x�� != true) sf.���x�� = true;
else sf.���x�� = false;
f.���x�� = sf.���x��;
f.���ی� = !sf.���x��;
f.trial = f.trial; // �̌��ł̏ꍇtrue

// �萔�l
var �V�i���I���� = -6;
var ��b�R�l�� = -3;
var ���W���� = -10;
var �i�����W = 1;
var �i���Q�� = 2;
var �������� = -20;

// �萔�F�w�K�ŏ����̗�
var ���ƂQ���� = -15;
var ���ƂP���� = -5;
var ���ƂO���� = +5;
var ����w�K���� = -20;
var ��K���� = -36;

// �萔�F�w�K�ŏ㏸���鐬��
var ���ƂQ�㏸ = 8;
var ���ƂP�㏸���� = 0.05;
var ���ƂO�㏸ = 0;
var ����w�K�㏸ = 10;
var ��K��̐��� = 50;

// �萔�F�����̉񕜎���floor(a + ���� * b + �̗� * c)
var ������a = 20; // �񕜊�b�l�c�c�K������ȏ�͉񕜂���
var ������b = 0.1; // �����{�[�i�X�c�c�����Q�[�W���傫���قǉ񕜂���
var ������c = -0.3; // �̗̓y�i���e�B�c�c�̗͂������قǉ񕜂��Ȃ�
var �����w�͒ቺ = -4;

var �i���Q = 3;
var �i���P = 1;
var �i���O = 0;
var �����Q = -30;
var �����P = -10;
var �����O = 0;
var �x���� = 15;
var �F�F���� = 0x222211;
var �F�F�����Q = 0xFFFFFF;
var �F�F�� = 0xffdd88;
var �F�F��Q = 0xaa5544;
var �F�F�햳�� = 0x88ddff;
var �F�F�햳���Q = 0x4455aa;
var �F�F���� = 0xff3344;
var ��̊����W�� = 6;

// �Z�[�u�����ϐ�
f.�� = '������';
f.�� = '�}�T�g';
f.�� = void;
f.��ڍ� = void;
f.����� = void;
f.�햳�� = void;
f.���� = void;
f.�� = 9;
f.�T = 1;
f.�j��= '�����P';
f.�� = 23;
f.�̗� = 100;
f.���� = 100;
f.�w�� = 50;
f.�i�� = 0;
// �Q���ˌ���Ȃ��Ă����Ă����
// ���W�ˏ��W�����񂾂����Ă����
// �s�Q���ˊ֌W�����􂵂�
f.�}���Q�� = 0;
f.�}�����W = 0;
f.�}���s�Q�� = 0;
f.�C�Y�~�Q�� = 0;
f.�C�Y�~���W = 0;
f.�C�Y�~�s�Q�� = 0;
f.�}���Q�� = 0;
f.�}�����W = 0;
f.�J�P���Q�� = 0;
f.�J�P�����W = 0;
f.�~�h���Q�� = 0;
f.�~�h�����W = 0;
f.�~�h���s�Q�� = 0;
f.���u�j���W = 0;
f.���u�����W = 0;
//
f.�}���f�[�g = 0;
f.�}������ = 0;
f.�}���U�� = 0;
f.�J�����f�[�g = 0;
f.�J�������� = 0;
f.�J�����U�� = 0;
f.�x������ = 0;
// �����P�Ƀe�X�g���s���A�����Q�ɓ_�����J�������
f.�����̓_�� = 0;
f.���یヌ�b�X�� = 0;

// �h�{�h�����N
f.�C�Y�~�h�{�h�����N = 0;
f.�~�h���h�{�h�����N = 0;
f.�}���h�{�h�����N = 0;
f.�}�������h�{�h�����N = 0;
f.�J���������h�{�h�����N = 0;

// �����u�[�X�g
f.�J�������� = 0;
f.�}������ = 0;
f.��l������ = 0;
f.�J�P������ = 0;
f.�~�h������ = 0;
f.���V�I���� = 0;
f.�}������ = 0;
f.�C�Y�~���� = 0;

function countEndings(){
	var n = 0;
	n += (int)sf.�G���h�O�F���ݏo���Ȃ��������;
	n += (int)sf.�G���h�P�F�Ȃ̌��E;
	n += (int)sf.�G���h�Q�F�_�u���u�b�L���O;
	n += (int)sf.�G���h�R�F���s�J�t�F;
	n += (int)sf.�G���h�S�F�O�l�̐��s;
	n += (int)sf.�G���h�T�F�����Ր���;
	n += (int)sf.�G���h�U�F�H��̃R���`�F���g;
	n += (int)sf.�G���h�V�F����̂���l;
	n += (int)sf.�G���h�W�F�����錳�C��;
	n += (int)sf.�G���h�X�F�������߂�;
	return n;
}
function allEndings(){
	return 10;
}
function countAchievements() {
	var n = 0;
	n += (int)sf.���тO�F�N���X�ψ��̐S��;
	n += (int)sf.���тP�F�C�Y�~���Q��;
	n += (int)sf.���тQ�F�}�����Q��;
	n += (int)sf.���тR�F�J�P�����Q��;
	n += (int)sf.���тS�F�~�h�����Q��;
	n += (int)sf.���тT�F�}�����Q��;
	n += (int)sf.���тU�F���یヌ�b�X��;
	n += (int)sf.���тV�F�w�N���;
	n += (int)sf.���тW�F�ԓ_������s;
	n += (int)sf.���тX�F�H���̂΂�;
	n += (int)sf.���тP�O�F�x�����W��;
	n += (int)sf.���тP�P�F�f�[�g�I�H;
	n += (int)sf.���тP�Q�F�C�Y�~�̕s�M;
	n += (int)sf.���тP�R�F���`���ᔽ;
	n += (int)sf.���тP�S�F�~�h���̔ߌ�;
	n += (int)sf.���тP�T�F�L���[�s�b�h;
	n += (int)sf.���тP�U�F���u;
	n += (int)sf.���тP�V�F��������;
	n += (int)sf.���тP�W�F�ߘJ�����O;
	n += (int)sf.���тP�X�F�i���P�T�O��;
	n += (int)sf.���тQ�O�F�[���������Z����;
	n += (int)sf.���тQ�P�F�S�Ă�m��s�������j;
	return n;
}
function allAchievements() {
	return 22;
}

[endscript]
[return]

*�V�X�e���ϐ��N���A
[iscript]
// �Z�[�u�֘A
sf.�Z�[�u�X���b�g�O��̔ԍ� =
sf.�Z�[�u�X���b�g�` =
sf.�Z�[�u�X���b�g�a =
sf.�Z�[�u�X���b�g�b =
sf.�Z�[�u�X���b�g�c =
sf.�Z�[�u�X���b�g�d =
sf.�Z�[�u�X���b�g�e =
sf.�Z�[�u�X���b�g�f =
sf.�Z�[�u�X���b�g�g =
sf.�Z�[�u�X���b�g�h =
sf.�Z�[�u�X���b�g�i =
sf.�Z�[�u�X���b�g���� =
// �G���f�B���O�֘A
sf.�G���h�O�F���ݏo���Ȃ�������� =
sf.�G���h�P�F�Ȃ̌��E =
sf.�G���h�Q�F�_�u���u�b�L���O =
sf.�G���h�R�F���s�J�t�F =
sf.�G���h�S�F�O�l�̐��s =
sf.�G���h�T�F�����Ր��� =
sf.�G���h�U�F�H��̃R���`�F���g =
sf.�G���h�V�F����̂���l =
sf.�G���h�W�F�����錳�C�� =
sf.�G���h�X�F�������߂� =
// ���ъ֘A
sf.���тO�F�N���X�ψ��̐S�� =
sf.���тP�F�C�Y�~���Q�� =
sf.���тQ�F�}�����Q�� =
sf.���тR�F�J�P�����Q�� =
sf.���тS�F�~�h�����Q�� =
sf.���тT�F�}�����Q�� =
sf.���тU�F���یヌ�b�X�� =
sf.���тV�F�w�N��� =
sf.���тW�F�ԓ_������s =
sf.���тX�F�H���̂΂� =
sf.���тP�O�F�x�����W�� =
sf.���тP�P�F�f�[�g�I�H =
sf.���тP�Q�F�C�Y�~�̕s�M =
sf.���тP�R�F���`���ᔽ =
sf.���тP�S�F�~�h���̔ߌ� =
sf.���тP�T�F�L���[�s�b�h =
sf.���тP�U�F���u =
sf.���тP�V�F�������� =
sf.���тP�W�F�ߘJ�����O =
sf.���тP�X�F�i���P�T�O�� =
sf.���тQ�O�F�[���������Z���� =
sf.���тQ�P�F�S�Ă�m��s�������j =
void;

[endscript]
[return]

;��b�̎탁��
;�l���W�܂�Ȃ��x������
;�J�P���͏��q�ƒ����ǂ�
;�~�h���̌˘f��
;�~�h���̎���
