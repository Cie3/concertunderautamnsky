[eval exp="�I�[�g�Z�[�u�\ = 1"]
*�Z�[�u|&saveLabel()
[eval exp= "f.����=today()"]

[jump storage="�����Փ���.ks" cond="f.�� == 0"]
[if exp="f.��==19 && f.trial"]
	[�w�i �摜=���S]
	[�g][���b�Z�[�W]
	����ꂳ�܂ł����B�����ő̌��ł͏I���ł��B[n]
	�Ō�܂Ńv���C���Ē����A���肪�Ƃ��������܂����B[next]
	
	�u�H��̃R���`�F���g�v�P�Q���̃R�~�P�ŔЕz�\��A[n]
	�ȍ~�A�v�����ł̔z�M�ɂȂ�܂��B���y���݂ɁI�I[next]
	[jump storage="macro.ks" target="*�I������"]
[endif]

[call storage=macro.ks]

[�{�^���\������]
[BGM��~]

[SE ��=�`�����`����.ogg ���[�v=0 ����=50]
[�g]
[���b�Z�[�W]
;�̗͖_��\��
[�̗� �ω�= 0]
[eval exp="���t�\��()"]
[nowait][emb exp="f.����"] [emb exp="'(�����Ղ܂ł��� ' + f.�� + '��)'"][endnowait][next]


;��b�̎���P���i�߂�
[eval exp= "manageSeed()"]

[SE��~]
[�w�i �摜=����]
[BGM ��= 08���.ogg  ���[�v= 1  ����= 50]


[if exp="typeof global.�Z�[�u�\ != 'undefined'"]
	;���[�h��������͂�����ʂ�Ȃ�
	[if exp="f.�� == 23"]
	
		;���������K���Z�[�u����
		[call storage="�Z�[�u���[�h.ks" target="*�Z�[�u���s" cond="!f.trial"]
	[endif]
[endif]

*��

[if exp="f.���� == '���ی�'"]
	[eval exp="f.���� = '���'"]
	[cancelskip]
	[image layer="&lay����" storage="�������" visible="true" opacity="191"][backlay]
	[nowait]�P�����n�߂�O�ɁA�m�F���邱�Ƃ́H[endnowait][next]
	[�l�� �摜=�Ȃ� ���O=����K�C�h]
	�Z�[�u�̐��������܂��B[next]
	[layopt layer="&lay����" opacity="255"][backlay]
	[image layer="&lay����+1" storage="��������Z�[�u" visible="true"][backlay]
	���N����ƁA�Z�[�u�����邱�Ƃ��ł��܂��B[n]
	10�̃X���b�g������̂ŁA�X�g�[���[���i�ނ��Ƃ�[n]
	�ʃX���b�g�ɃZ�[�u����ƁA�l�݂ɂ����Ȃ�܂��B[next]
	�܂��A�����J�n����Ǝ����ŃZ�[�u���s���邽�߁A[n]
	�ȒP�ɂ��̓��̒������蒼�����Ƃ��ł��܂��B[next]
	[layopt layer="&lay����" opacity="191"][backlay]
	[image layer="&lay����+1" storage="��������^�C�g��" visible="true"][backlay]
	��蒼���Ƃ��ɂ́A�^�C�g���{�^���������܂��傤�B[n]
	���̃{�^���͂��ł��������Ƃ��ł��܂��B[next]
	
	����ő���������I���܂��B[next]
	[���b�Z�[�W]
	[layopt layer="&lay����+1" visible="false"][backlay]
	[layopt layer="&lay����" visible="false"][backlay]
[endif]

[nowait]�P�����n�߂�O�ɁA�m�F���邱�Ƃ́H[endnowait]
[�{�^���\��������]
[eval exp="var �i�� = (f.�� >= 21 ? '' : '�i����������')"]
[�l�� �A= �����J�n�I  �C= �����͉��̓� �E=&�i��  �G= �Z�[�u]
[�{�^���\������]
[if exp= �A]
	;endif �܂Œ��s
[elsif exp= �C]
	[if exp= "f.�� == 23"]
		�����͐搶�Ƃ̖ʒk�̓����B[n]
		��������ꂽ�肷��񂾂낤���B[next]
	[elsif exp= "f.�� == 22"]
		�����͕����Ղ̃N���X�ψ������߂�����B[n]
		�����c�c���Ă݂悤���ȁB[next]
	[elsif exp= "f.�� == 21"]
		�����͏��߂Ă̋x���������B[n]
		�C�������Ă����Ȃ��ƁB[next]
	[elsif exp= "f.�� == 20 || f.�� == 14 || f.�� == 8"]
		�����͓��ɉ����Ȃ��ȁB[n]
		�����Ղ̂��߂ɉ����ł��邱�Ƃ����Ă������B[next]
	[elsif exp= "f.�� == 19 || f.�� == 13 || f.�� == 7"]
		�����͕����Ղ̏�������������B[n]
		�����Ŋ撣���Đi�߂Ă������B[next]
	[elsif exp= "f.�� == 18 || f.�� == 15 || f.�� == 12 || f.�� == 9 || f.�� == 6 || f.�� == 3"]
		[if exp= "f.�}���f�[�g != 0"]
			�����͊ш䂳��Ɩ񑩂�����񂾁B[next]
			[if exp="f.�J�����f�[�g != 0"]
				����A�����E����Ƃ��񑩂����Ă����悤�ȁc�c[next]
			[endif]
		[elsif exp= "f.�J�����f�[�g != 0"]
			�����͗����E����Ɩ񑩂�����񂾁B[next]
		[elsif exp= "f.�x������ != 0"]
			�����͕����Ղ̏��������邼�B[next]
		[else]
			�����͉����Ȃ����A�������x�߂邼�B[next]
		[endif]
	[elsif exp= "f.�� == 17 || f.�� == 11 || f.�� == 5 || f.�� == 2"]
		�����͏��e�X�g���B������Ɗ撣��Ȃ��ƁB[next]
	[elsif exp= "f.�� == 16 || f.�� == 10 || f.�� == 4"]
		�����͕����Ղ̏�������������B[n]
		���e�X�g�̕�K������Ȃ���΂����񂾂��ǁc�c[next]
	[elsif exp= "f.�� == 1"]
		�����ՑO�̍Ō�̏��������B[n]
		�C���������߂Ă������B[next]
	[else]
		���悢�敶���Ֆ{�Ԃ��B[n]
		[if exp= "f.�i�� >= 100"]���܂Ŋ撣���Ă������A�����Ƃ��܂������͂����B
		[elsif exp= "f.�i�� >= 50"]�ǂ��Ȃ�񂾂낤�c�c
		[else]�����A�ǂ��ɂł��Ȃ�B
		[endif]
		[next]
	[endif]
	[jump target= *��]
[elsif exp=�E]
	�����Տ����̐i�݋�́c�c [font color="&�F�F����"][emb exp="f.�i��"]��[resetfont] ���B[n]
	[if exp="f.�i�� >= 100"]�������v�������B
	[elsif exp="f.�i�� >= 80"]���Ƃ�����Ƃ��B
	[elsif exp="f.�i�� >= 60"]���\�ł��Ă����ȁB
	[elsif exp="f.�i�� >= 40"]�O���ɏ���Ă����B
	[elsif exp="f.�i�� >= 20"]�܂��܂����̂�͒����B
	[elsif exp="f.�i�� >= 0"]�܂��n�܂����΂��肾�B
	[endif]
	[next]
	[jump target="*��"]
[elsif exp=�G]
	[call storage="�Z�[�u���[�h.ks" target="*�Z�[�u"]
	[jump target=*��]
[else]
	[jump target="*��"]
[endif]

[if exp="�I�[�g�Z�[�u�\ == 1"]
	[if exp="f.�� != 23"]
		;�I�[�g�Z�[�u����
		[call storage="�Z�[�u���[�h.ks" target="*�I�[�g�Z�[�u"]
		[nowait]�I�[�g�Z�[�u���܂����B[endnowait][��][��][��][��][er]
	[else]
		;�����Z�[�u
		[call storage="�Z�[�u���[�h.ks" target="*�Z�[�u���s"]
	[endif]
[endif]

[�g����]
[return]
