[eval exp="var �Z�[�u�\ = true"]
[eval exp= "f.����=today()"]
[eval exp= "tf.�Z�[�u���x��=f.�� + f.�� + '(�c��' + f.�� + '��)' + f.�j��"]
*�Z�[�u|&tf.�Z�[�u���x��
[eval exp= "f.����=today()"]
[eval exp= "tf.�Z�[�u���x��=f.�� + f.�� + '(�c��' + f.�� + '��)' + f.�j��"]

[jump storage="�����Փ���.ks" cond="f.�� == 0"]
[if exp="f.��==19 && f.trial"]
	[�w�i �摜=���S]
	[�g]
	����ꂳ�܂ł����B�����ő̌��ł͏I���ł��B[n]
	�Ō�܂Ńv���C���Ē����A���肪�Ƃ��������܂����B[next]
	
	�u�H��̃R���`�F���g�v�P�Q���̃R�~�P�ŔЕz�\��A[n]
	�ȍ~�A�v�����ł̔z�M�ɂȂ�܂��B���y���݂ɁI�I[next]
	[jump storage="macro.ks" target="*�I������"]
[endif]

[call storage=macro.ks]

[�{�^���\������]
[BGM��~]

[eval exp="var n=(new Date()).getTime()"]
[SE ��=�`�����`����.ogg ���[�v=0 ����=50]
[�g]
[���b�Z�[�W]
;�̗͖_��\��
[�̗� �ω�= 0]
[eval exp="���t�\��()"]
[nowait][emb exp="f.����"] [emb exp="'(�����Ղ܂ł��� ' + f.�� + '��)'"][endnowait][next]
[eval exp="n=((new Date()).getTime()-n)\1000"]

;��b�̎���P���i�߂�
[eval exp= "manageSeed()"]

[SE��~]
[�w�i �摜=����]
[BGM ��= 08���.ogg  ���[�v= 1  ����= 50]

[if exp="n>50"]
	���ԂȂ����ԂȂ��A��������Ȏ��Ԃ��c�c[if exp="sf.���Q�V�̊�@===void"]�i�����Q�V�̊�@�j[endif][n]
	[eval exp="sf.���Q�V�̊�@=1"]
[endif]

[if exp="typeof global.�Z�[�u�\ != 'undefined'"]
	;���[�h��������͂�����ʂ�Ȃ�
	[if exp="f.�� == 23"]
	
		;���������K���Z�[�u����
		[call storage="�Z�[�u���[�h.ks" target="*�Z�[�u���s" cond="!f.trial"]
	[endif]
[endif]
*��

[nowait]�P�����n�߂�O�ɁA�m�F���邱�Ƃ́H[endnowait]

;	[��擾 ���O=���������H �ڍ�=�O���搶�ɂ����߂�ꂽ�B ����=3]
;	[��擾 ���O=���������Q�H �ڍ�=�O���搶�ɂ����߂�ꂽ�B ����=4]
;	[��擾 ���O=���������R�H �ڍ�=�O���搶�ɂ����߂�ꂽ�B ����=5]


[�l�� �A= �����J�n�I  �C= ��b�̎�  �E= �����͉��̓�  �G= �Z�[�u]
[if exp= �A]
[elsif exp= �C]
	[call target=*��b�̎�\�� storage="macro.ks"]
	[jump target=*��]
[elsif exp= �E]
	[if exp= "f.��>0"]�����Ղ܂ŁA����[emb exp= "f.��"]�����B[n][endif]
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
[else]
	[call storage="�Z�[�u���[�h.ks" target="*�Z�[�u"]
	[jump target=*��]
[endif]

[if exp="typeof global.�Z�[�u�\ != 'undefined'"]
	[if exp="f.�� != 23"]
		;�I�[�g�Z�[�u����
		[call storage="�Z�[�u���[�h.ks" target="*�I�[�g�Z�[�u"]
	[endif]
[endif]

[�g����]
[return]
