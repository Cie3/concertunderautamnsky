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
�A�ɘb�������� = �o���A == '' ? '' : fullname(�o���A) + '�ɘb��������';
�C�ɘb�������� = �o���C == '' ? '' : fullname(�o���C) + '�ɘb��������';
�E�ɘb�������� = �o���E == '' ? '' : fullname(�o���E) + '�ɘb��������';
var �A�� = '�������ƋA�� (+' + ���މ� + ')';
[endscript]

*���\��
[�g]
[���b�Z�[�W]

[if exp="f.���� == '��b�̎�'"]
	[eval exp="f.���� = '���ی�'"]
	[cancelskip]
	[image layer="&lay����" storage="�������ی�" visible="true" opacity="191"][backlay]
	[nowait]
	�����̎��Ƃ͑S�ďI������B[r]
	�A��O�ɒN�Ƙb�������B
	[endnowait][next]
	[�l�� �摜=�Ȃ� ���O=����K�C�h]
	���ی�̐��������܂��B[next]
	[layopt layer="&lay����" opacity="255"][backlay]
	[image layer="&lay����+1" storage="�������ی�J�Y�L" visible="true"][backlay]
	���ی�ɂ́A��{�I�ɂR�l���o�Ă��܂��B[n]
	�i�����̓J�Y�L�������܂��񂪁c�c�j[next]
	���x�݂ƈႢ�A���ی�� [font color=&�F�F����]�P�l�����b�����Ƃ��ł��܂���[resetfont]�B[next]
	[image layer="&lay����+1" storage="�������ی㑁��" visible="true"][backlay]
	�N�ɂ��b�����ɋA��ƁA�̗͂��R�񕜂��܂��B[next]
	[layopt layer="&lay����" opacity="191"][backlay]
	[image layer="&lay����+1" storage="������b�̎�" visible="true"][backlay]
	�N�Ƙb�������l����ɂ́A�ǂ̉�b�̎�������Ă��邩��[n]
	�傫�ȃq���g�ɂȂ�܂��B[next]
	�b��������O�ɉ�b�̎���m�F����悤�ɂ��܂��傤�B[next]
	[layopt layer="&lay����" opacity="191"][backlay]
	[image layer="&lay����+1" storage="�������یネ�[�h" visible="true"][backlay]
	���ɖ߂��Ă�蒼���Ƃ��́A���[�h�{�^�����g���܂��B[n]
	���ȊO�Ȃ�A���̃{�^���͂��ł��g���܂��B[next]
	[���b�Z�[�W]
	[layopt layer="&lay����+1" visible="false"][backlay]
	[layopt layer="&lay����" visible="false"][backlay]
[endif]

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
[if exp="�A || �C || �E || �G"][�{�^���\��][endif]

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
