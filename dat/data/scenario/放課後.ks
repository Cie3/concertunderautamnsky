[eval exp="f.����='���ی�'"]
[eval exp="f.���x��=false, f.���ی�=true"]
[BGM��~]
[wb]

;�����C�x���g
[call storage="scenario/�C�x���g/23�N���X���C�g.ks" cond="f.��==23"]

;���ی㏀��
[call storage="��������.ks" cond="f.�j��=='�����Q' && f.��!=22"]
[call storage= "scenario/�C�x���g/22�����.ks" cond="f.��==22"]

[��ʓ]��]
[�w�i �摜=�����[�� ����=1000]

[iscript]
var str = f.�� + '���ی�';
var �o���A = �o��[str + '�A'];
var �o���C = �o��[str + '�C'];
var �o���E = �o��[str + '�E'];
[endscript]

[BGM ���[�v=true ����=50 ��=�[���.ogg]

*�N�ɘb�������悤����

[iscript]
�A�ɘb�������� = �o���A == '' ? '' : �o���A + '�ɘb��������';
�C�ɘb�������� = �o���C == '' ? '' : �o���C + '�ɘb��������';
�E�ɘb�������� = �o���E == '' ? '' : �o���E + '�ɘb��������';
var �A�� = '�������ƋA�� (+' + ���މ� + ')';
[endscript]

*���\��
[�g]
[���b�Z�[�W]
[�{�^���\����]
[nowait]
�����̎��Ƃ͑S�ďI������B[r]
�A��O�ɒN�Ƙb�������B
[endnowait]
[�N�Ƙb�� ���O="&��ʒu�����O(�o���A, �o���C, �o���E, 0)" �ʒu="0"]
[�N�Ƙb�� ���O="&��ʒu�����O(�o���A, �o���C, �o���E, 1)" �ʒu="1"]
[�N�Ƙb�� ���O="&��ʒu�����O(�o���A, �o���C, �o���E, 2)" �ʒu="2"]
[�l�� �A= &�A�ɘb�������� �C= &�C�ɘb�������� �E= &�E�ɘb�������� �G=&�A��]
[�N�Ƙb������]
[�{�^���\��]
[if exp=�A]
	[�g����]
	[call storage="&'scenario/��/' + �o���A + '.ks'"]
[elsif exp=�C]
	[�g����]
	[call storage="&'scenario/��/' + �o���C + '.ks'"]
[elsif exp=�E]
	[�g����]
	[call storage="&'scenario/��/' + �o���E + '.ks'"]
[elsif exp=�G]
	[�̗� �ω�=&���މ�]
	�悵�A�A�邩�B[next]
	[��ʓ]��]
	[�w�i �摜=�ʊw�H�[��]
[else]
	[jump target= *���\��]
[endif]

[return]
