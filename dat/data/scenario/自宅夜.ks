[cancelautomode]
[��ʓ]��]
[�w�i �摜=������]
[BGM��~]
[wb canskip=true]
[BGM ��= ������.ogg  ���[�v= 1  ����= 70]
[�g]
[���b�Z�[�W]

*��
[nowait]�Q��O�ɁA�������邱�Ƃ́H[endnowait]
[eval exp="var �I�����׋� = '�e�X�g�΍�̕׋� (' + ����w�K���� + ')'"]
[if exp="f.�� == 1"][��� �A= �����Q��i���悢�敶���Փ����ł��j]
[elsif exp= "f.�j��!='�����Q' || f.�x������ != 0"][��� �A= �����Q��  �C= &�I�����׋�]
[else][�O�� �A= �����Q��  �C= &�I�����׋�  �E="&'�x�������ɏ��W���� (' + �x�����W���� + ')'"]
[endif]

[if exp= �A]
	[if exp="f.�x������ == 0 && f.�j�� == '�����Q'"]
		[if exp="f.�� == 22"]
			�ŏ��̏T�́A�x�������̘A�������Ă���Q�悤�B[next]
			[jump target="*��"]
		[elsif exp="f.�� == 1 || f.�J�����f�[�g + f.�}���f�[�g > 0"]
			;�����ՑO��Ȃ�x�����o���Ȃ�
			;�f�[�g�̗\�肪����Ȃ�x�����o���Ȃ�
		[else]
			;���������Ă��Ȃ��ꍇ�͌x��
			[nowait]
			�x�������������ɁA�Ƃŋx�݂܂����H[r]
			�i�x�񂾏ꍇ�ɂ͐����͂��񕜂��܂��j
			[endnowait]
			[��� �A=�x���͋x�� �C=���������l������]
			[if exp="�A"]
				;���̂܂�
			[else]
				[jump target="*��"]
			[endif]
		[endif]
	[endif]
[elsif exp= �C]
	���W��������[SE ��= �����߂��� ����= 50]�׋����I
	[�̗� �ω�= &����w�K����]
	[next]
	�ŏ��̓_���� [emb exp="f.�w��"]�_[n]
	[�w�� �ω�= &����w�K�㏸]
	����̓_���� [font color="&�F�F����" cond="f.�w�� >= 85"][emb exp="f.�w��"]�_[resetfont] ���B[n]
	[if exp="f.�w�� < 45"]�_���_�����c�c
	[elsif exp="f.�w�� < 55"]���̂܂܂ł͂܂����c�c
	[elsif exp="f.�w�� < 65"]������ƐS�z�����ǁA�܂����v���B
	[elsif exp="f.�w�� < 75"]�܂��܂��A����Ȋ������B
	[elsif exp="f.�w�� < 85"]���\�����������B
	[elsif exp="f.�w�� < 100"]����Ȃ炢����I
	[endif]
	[cancelskip]
	[next]
	
	[jump target= *��]
[else]
	[if exp= "f.�}���f�[�g != 0"]
		���A�����͊ш䂳��Ƃ̖񑩂�����񂾂����B[n]
		���W��������̂͂�߂Ă������B[next]
		[if exp="f.�J�����f�[�g != 0"]
			�܂Ă�A�����E����Ƃ��񑩂��c�c[n]
			�������I�H �܂����I[n]
			�ǂ����悤�I�I�H[next]
		[endif]
	[elsif exp= "f.�J�����f�[�g != 0"]
		���A�����͗����E����Ƃ̖񑩂�����񂾂����B[n]
		���W��������̂͂�߂Ă������B[next]
	[else]
		[�̗� �ω�=&�x�����W����]
		�u�����͕����Ղ̏���������̂ŏW�܂��Ă��������v[n]
		�悵�A�N���X�S�̂ɘA�����Ă��������B[next]
		[eval exp= "f.�x������ = 1"]
	[endif]
	[jump target= *��]
[endif]

[�g����]
[BGM��~]
[�w�i �摜= ����]
[wb]
[BGM ��= ����R.ogg  ���[�v= 0  ����= 50]

*���̓���
[eval exp="f.��-=1"]
[if exp="f.�j��=='�����Q'"][eval exp="f.�j��='�T��'"]
[elsif exp="f.�j��=='�����P'"][eval exp="f.�j��='�����Q'"]
[else]
	[eval exp="f.�j��='�����P', f.�T+=1"]
	[if exp="f.�T>4"][eval exp="f.�T=1, f.��+=1"]
	[endif]
[endif]
[eval exp="f.�j�� = '����'" cond="f.�� == 0"]

[eval exp="���t�\��(0)"]
[�w�i �摜= ��  ����= 5000]
[wt]
[wait time= 1000]

[jump storage="�Q�[���I�[�o�[.ks" target="*ed2" cond="f.�J�����f�[�g > 0 && f.�}���f�[�g > 0"]
*��

[������]

[return]
