;http://www5d.biglobe.ne.jp/~gakai/ �w�i�f��
;http://taira-komori.jpn.org/freesound.html �|��鉹
;http://soundeffect-lab.info/sound/animal/ �`�����`����
;http://taira-komori.jpn.org/daily02.html �����߂���
;http://commons.nicovideo.jp/material/nc105293 �J���X
;http://soundeffect-lab.info/sound/anime/ �������A�L���L����
;http://pocket-se.info/archives/tag/%E7%B5%B6%E6%9C%9B/ �K�[��

[title name=�H��̃R���`�F���g]
[call storage=macro.ks]

;=================================================
; �^�C�g�����
;=================================================
*������

[history enabled=false]
[eval exp= "var testfile = '�V�i���I�e�X�g.txt'"]
[eval exp= "var testplay = Storages.isExistentStorage(testfile)"]
[eval exp="f.trial = false"]
; �̌��ł̏ꍇtrue

[if exp="f.trial"]
	[�g]
	�{���́A�n�쎋���o�����������̃u�[�X�ɂ��z�������A[n]
	���ɂ��肪�Ƃ��������܂��B[next]
	
	�V�~�����[�V�����Q�[���̑̌��łƂ���[n]
	�Q�[�����S���ԁi��10���j�̃v���C�����y���݂��������B[next]
	
	[�l�� �摜=�Ȃ� ���O=������@][nowait]
	�N���b�N�EEnter�@���@�ǂݐi�߂�[r]
	Space�@�@�@�@�@�@���@�Z���t�g����[r]
	�}�E�X�z�C�[���@ ���@�o�b�N���O�\��[next][endnowait]
	[�l������]
	[�g����]
	[jump target="*�N��"]
[endif]

[jump target= *�N�� cond= testplay]
[�w�i �摜=���S]

[wait time=1000]
[�w�i �摜=��]

[if exp="sf.�Z�[�u�X���b�g�O��̔ԍ� === void"]
	[�{�^���\��]
	[BGM ��=��R.ogg ���[�v=0 ����=70]
	[wait time=1000]
	[�g]
	���́A[���r �ǂ�=����]�H[���r �ǂ�=��]��[���r �ǂ�=��]�J���Z�ɒʂ��Ă���Q�N�����B[next]
	�w�N���ς���Ă���A���낻�딼�N�ɂȂ�B[n]
	�����A�N���X�ɂ͓���߂Ă��Ȃ��B[n]
	�ʂɁA��l�ڂ����Ƃ����킯����Ȃ��B[next]
	�ׂ̃N���X�ɂ͐e�F�̃J�Y�L�����Ă��邵�A[n]
	���N�����N���X�������z�Ƃ͒��ǂ�����Ă���B[next]
	������Ȃ̂��c�c[n]
	���́A�P�N�̎��͊y���������ȁA�Ǝv���Ȃ���[n]
	�ƂƊw�Z���������邾���̑ދ��ȍ��Z�������B[next]
	�Ă̏h��͑��߂ɏI��点�����ǁA[n]
	��������킯�ł��Ȃ��A�����l�g�Q�ɖ�������[n]
	�C���t�����������w���������B[next]
	�ς��Ȃ���ȁA�Ǝv�����Ƃ͂��邯��[n]
	�����ȒP�ɕς�ꂽ���J�͂Ȃ���ȁc�c[next]
	[BGM ��=��2R.ogg ���[�v=0 ����=80]
	�Ƃ��낪�A�Q�w�����n�܂���[n]
	����ȉ��ɁA�`�����X���߂����Ă����B[next]
	11���ɍs���镶���Ղ̃N���X�ψ��A���B[next]
	���܂œ��ݏo���Ȃ���������ɂȂ邩������Ȃ��c�c[n]
	�����M���Ă݂��񂾁B[next]
	[[����] �����w�|��w �n�쎋���o�������������R�O�R�b[n]
	�@�@�@ �`�[���u�{�i�i�� �J�t�F�E�R���`�F���g�v[next]
	[�{�^������]
	[�g����]
[endif]

[wait time=1000]

*�N��

[call storage="�ϐ�.ks"]
[call storage="�o���p�^�[��.ks"]
[call storage="�Z�[�u���[�h.ks"]

[history output= false]

[BGM ��= �^�C�g�����.ogg  ���[�v= 0  ����= 50]
[�w�i �摜=�H��̃R���`�F���g]
[�{�^���\���^�C�g��]

*���j���[
[�g����]
[eval exp= "var testplay = Storages.isExistentStorage(testfile)"]
[if exp="testplay"]
	[��� �A= �V�i���I�e�X�g�v���C �C= �ʏ�N��]
	[if exp= �C]
		[eval exp= "testplay = false"]
	[endif]
[endif]
[�g����]
[jump target= *edit cond="testplay"]

[if exp="sf.�Z�[�u�X���b�g�O��̔ԍ�===void || f.trial"]
	[�l�� �A="" �C=�ŏ����� �E=��肱�� �G=������]
[else]
	[�l�� �A=�������� �C=�ŏ����� �E=��肱�� �G=������]
[endif]

[�g]
[if exp=�A]
	[call storage="�Z�[�u���[�h.ks" target="*���[�h"]
	[jump target=*���j���[]
[elsif exp=�C]
	[eval exp="tf.result = false"]
	[call storage="�Z�[�u���[�h.ks" target="*�ŏ�����" cond="!f.trial"]
	[jump target=*���j���[ cond="tf.result"]
[elsif exp=�E]
	[position layer= message0 frame= image/�e�L�X�g�{�b�N�X�c��.png  left= 180  top= 50  margint= 13  marginl= 40]
	[nowait]
	���� ([emb exp="countAchievements()"]/[emb exp="allAchievements()"])
	[font size=20][r]

	[if exp="sf.���тO�F�Q�V�̊�@!==void"]
		[font color=&�F�F��Q]
		0. �Q�V�̊�@�c�c�c�c�c�c�����A����������Ɉꕪ�Ԍo�߂���[r]
	[else]
		[font color=&�F�F����]
		0. �Q�V�̊�@�c�c�c�c�c�c�@�I�t�g�D���̋z����[r]
	[endif]

	[if exp="sf.���тP�F�C�Y�~���Q��!==void"]
		[font color=&�F�F��Q]
		1. �C�Y�~���Q���c�c�c�c�c���C�Y�~�������Տ����ɎQ������悤�ɂȂ���[r]
	[else]
		[font color=&�F�F����]
		1. �C�Y�~���Q���c�c�c�c�c�@�C�Y�~�𕶉��Տ����ɎQ�������悤[r]
	[endif]

	[if exp="sf.���тQ�F�}�����Q��!==void"]
		[font color=&�F�F��Q]
		2. �}�����Q���c�c�c�c�c�c���}���������Տ����ɎQ������悤�ɂȂ���[r]
	[else]
		[font color=&�F�F����]
		2. �}�����Q���c�c�c�c�c�c�@�}���𕶉��Տ����ɎQ�������悤[r]
	[endif]

	[if exp="sf.���тR�F�J�P�����Q��!==void"]
		[font color=&�F�F��Q]
		3. �J�P�����Q���c�c�c�c�c���J�P���������Տ����ɎQ������悤�ɂȂ���[r]
	[else]
		[font color=&�F�F����]
		3. �J�P�����Q���c�c�c�c�c�@�J�P���𕶉��Տ����ɎQ�������悤[r]
	[endif]

	[if exp="sf.���тS�F�~�h�����Q��!==void"]
		[font color=&�F�F��Q]
		4. �~�h�����Q���c�c�c�c�c���~�h���������Տ����ɎQ������悤�ɂȂ���[r]
	[else]
		[font color=&�F�F����]
		4. �~�h�����Q���c�c�c�c�c�@�~�h���𕶉��Տ����ɎQ�������悤[r]
	[endif]

	[if exp="sf.���тT�F�}�����Q��!==void"]
		[font color=&�F�F��Q]
		5. �}�����Q���c�c�c�c�c�c���}���������Տ����ɎQ������悤�ɂȂ���[r]
	[else]
		[font color=&�F�F����]
		5. �}�����Q���c�c�c�c�c�c�@�}���𕶉��Տ����ɎQ�������悤[r]
	[endif]

	[if exp="sf.���тU�F���یヌ�b�X��!==void"]
		[font color=&�F�F��Q]
		6. ���یヌ�b�X���c�c�c�c��50�_�����ŃV�G�搶�̕�K���Ƃ��󂯂�[r]
	[else]
		[font color=&�F�F����]
		6. ���یヌ�b�X���c�c�c�c�@�����Ɋ��S�s�k����[r]
	[endif]

	[if exp="sf.���тV�F�w�N���!==void"]
		[font color=&�F�F��Q]
		7. �w�N��ȁc�c�c�c�c�c�c�����̉E�ɏo��҂͂��Ȃ�[r]
	[else]
		[font color=&�F�F����]
		7. �w�N��ȁc�c�c�c�c�c�c�@�����ōō��_�����[r]
	[endif]

	[if exp="sf.���тW�F�ԓ_������s!==void"]
		[font color=&�F�F��Q]
		8. �ԓ_������s�c�c�c�c�c��������50�`54�_�������[r]
	[else]
		[font color=&�F�F����]
		8. �ԓ_������s�c�c�c�c�c�@�����ŃM���M�����U�߂�[r]
	[endif]

	[if exp="sf.���тX�F�H���̂΂�!==void"]
		[font color=&�F�F��Q]
		9. �H���̂΂��c�c�c�c�c�c���x���ɉ���������������񕜂���[r]
	[else]
		[font color=&�F�F����]
		9. �H���̂΂��c�c�c�c�c�c�@�x���ɁA�����ĉ������Ȃ��Ƃ����I��[r]
	[endif]

	[if exp="sf.���тP�O�F�x�����W��!==void"]
		[font color=&�F�F��Q]
		10.�x�����W���c�c�c�c�c�c���x�����W������[r]
	[else]
		[font color=&�F�F����]
		10.�x�����W���c�c�c�c�c�c�@�݂�Ȃ��T���̕����Տ����ɌĂяo����[r]
	[endif]

	[if exp="sf.���тP�P�F�f�[�g�I�H!==void"]
		[font color=&�F�F��Q]
		11.�f�[�g�I�H�c�c�c�c�c�c�����̎q�Ə��߂Ẵf�[�g������[r]
	[else]
		[font color=&�F�F����]
		11.�f�[�g�I�H�c�c�c�c�c�c�@���A���ɏ[���������Z�����̂͂��܂�[r]
	[endif]

	[if exp="sf.���тP�Q�F�C�Y�~�̕s�M!==void"]
		[font color=&�F�F��Q]
		12.�C�Y�~�̕s�M�c�c�c�c�c���C�Y�~�ƃJ�����̊֌W���C���s�\�ɂȂ���[r]
	[else]
		[font color=&�F�F����]
		12.�C�Y�~�̕s�M�c�c�c�c�c�@�C�Y�~�ƃJ�����̊֌W�������点�悤[r]
	[endif]

	[if exp="sf.���тP�R�F���`���ᔽ!==void"]
		[font color=&�F�F��Q]
		13.���`���ᔽ�c�c�c�c�c���}���̗��S���J�Y�L�Ƀo������[r]
	[else]
		[font color=&�F�F����]
		13.���`���ᔽ�c�c�c�c�c�@�厖�Ȕ閧��R�k���悤[r]
	[endif]

	[if exp="sf.���тP�S�F�~�h���̔ߌ�!==void"]
		[font color=&�F�F��Q]
		14.�~�h���̔ߌ��c�c�c�c�c���~�h���ƃJ�P���͕ʂ�Ă��܂���[r]
	[else]
		[font color=&�F�F����]
		14.�~�h���̔ߌ��c�c�c�c�c�@�~�h�����₵���l�ɂ��Ă��܂���[r]
	[endif]

	[if exp="sf.���тP�T�F�L���[�s�b�h!==void"]
		[font color=&�F�F��Q]
		15.�L���[�s�b�h�c�c�c�c�c���}���ƃJ�P������������[r]
	[else]
		[font color=&�F�F����]
		15.�L���[�s�b�h�c�c�c�c�c�@�l�����֐}��傫�����������悤[r]
	[endif]

	[if exp="sf.���тP�U�F���u!==void"]
		[font color=&�F�F��Q]
		16.���u�c�c�c�c�c�c�c�c�c���ŏI�f�[�g�ŃJ��������u���ċA����[r]
	[else]
		[font color=&�F�F����]
		16.���u�c�c�c�c�c�c�c�c�c�@�J��������u���ċA�낤[r]
	[endif]

	[if exp="sf.���тP�V�F��������!==void"]
		[font color=&�F�F��Q]
		17.���������c�c�c�c�c�c�c���ŏI�f�[�g�Ń}���ƒ�����������[r]
	[else]
		[font color=&�F�F����]
		17.���������c�c�c�c�c�c�c�@�}���ƒ����������悤[r]
	[endif]

	[if exp="sf.���тP�W�F�ߘJ�����O!==void"]
		[font color=&�F�F��Q]
		18.�ߘJ�����O�c�c�c�c�c�c��������20�ȉ��̏�Ԃŕ����Փ������}����[r]
	[else]
		[font color=&�F�F����]
		18.�ߘJ�����O�c�c�c�c�c�c�@�S�͂Ŗ�������čŏI�����}���悤[r]
	[endif]

	[if exp="sf.���тP�X�F�i���P�T�O��!==void"]
		[font color=&�F�F��Q]
		19.�i���P�T�O���c�c�c�c�c�������Տ����̐i����150%�ȏ�ɂ���[r]
	[else]
		[font color=&�F�F����]
		19.�i���P�T�O���c�c�c�c�c�@�����������l����̂�[r]
	[endif]

	[if exp="sf.���тQ�O�F�[���������Z����!==void"]
		[font color=&�F�F��Q]
		20.�[���������Z�����c�c�c�������Ղ�����������������[r]
	[else]
		[font color=&�F�F����]
		20.�[���������Z�����c�c�c�@�����Ղ�������������Ȃ�[r]
	[endif]

	[if exp="sf.���тQ�P�F�S�Ă�m��s�������j!==void"]
		[font color=&�F�F��Q]
		21.�S�Ă�m��s�������j�c�������Ր����E�������A�E�S���Q���A�̂R�����𖞂�����[r]
	[else]
		[font color=&�F�F����]
		21.�S�Ă�m��s�������j�c�@�����Ր����E�������A�E�S���Q���A�̂R�����𖞂���[r]
	[endif]

	[next]
	
	[resetfont]
	�G���f�B���O ([emb exp="countEndings()"]/[emb exp="allEndings()"])
	[font size=20][r]
 
	[if exp="sf.�G���h�O�F���ݏo���Ȃ�������� !==void"][font color=&�F�F��Q]
		0.���ݏo���Ȃ���������c������₹���ɃQ�[���I�[�o�[
	[else][font color=&�F�F����]
		0.���݁H�H�H�H�H�H����c�@���͑ދ��Ȗ������J��Ԃ��΂��肾����
	[endif][r]

	[if exp="sf.�G���h�P�F�Ȃ̌��E !==void"][font color=&�F�F��Q]
		1. �Ȃ̌��E�c�c�c�c�c�c�c���̗͂��g���ʂ����ăQ�[���I�[�o�[
	[else][font color=&�F�F����]
		1. �Ȃ́H�H�c�c�c�c�c�c�c�@�撣��߂��͑̂ɓ�
	[endif][r]

	[if exp="sf.�G���h�Q�F�_�u���u�b�L���O !==void"][font color=&�F�F��Q]
		2. �_�u���u�b�L���O�c�c�c���f�[�g�̗\�肪����ăQ�[���I�[�o�[
	[else][font color=&�F�F����]
		2. �H�H�H�H�H�L���O�c�c�c�@�܂����f�[�g�̗\�肪���Ƃ́c�c
	[endif][r]

	[if exp="sf.�G���h�R�F���s�J�t�F !==void"][font color=&�F�F��Q]
		3. ���s�J�t�F�c�c�c�c�c�c�������Ղ͕s�����ɏI�����
	[else][font color=&�F�F����]
		3. �H�H�J�t�F�c�c�c�c�c�c�@������o�b�g�G���h�ł�
	[endif][r]

	[if exp="sf.�G���h�S�F�O�l�̐��s !==void"][font color=&�F�F��Q]
		4. �O�l�̐��s�c�c�c�c�c�c���J�����E���V�I�ƂR�l�ŃN���A
	[else][font color=&�F�F����]
		4. �O�l�́H�H�c�c�c�c�c�c�@�F�̏����Ȃ�ĕK�v�Ȃ�
	[endif][r]

	[if exp="sf.�G���h�T�F�����Ր��� !==void"][font color=&�F�F��Q]
		5. �����Ր����c�c�c�c�c�c�����̃G���h�̏����𖞂������ɕ����Ղ𐬌�������
	[else][font color=&�F�F����]
		5. �����ՁH�H�c�c�c�c�c�c�@������ʏ�G���h�ł�
	[endif][r]

	[if exp="sf.�G���h�U�F�H��̃R���`�F���g !==void"][font color=&�F�F��Q]
		6. �H��̃R���`�F���g�c�c���S���������Տ����ɎQ�����ăN���A
	[else][font color=&�F�F����]
		6. �H�H�́H�H�H�H�H�H�c�c�@������O�b�h�G���h�ł�
	[endif][r]

	[if exp="sf.�G���h�V�F����̂���l !==void"][font color=&�F�F��Q]
		7. ����̂���l�c�c�c�c�c���J�����ƌ��΂ꂽ
	[else][font color=&�F�F����]
		7. �H�H�H����l�c�c�c�c�c�@�q���C���U��
	[endif][r]

	[if exp="sf.�G���h�V�F�����錳�C�� !==void"][font color=&�F�F��Q]
		8. �����錳�C���c�c�c�c�c���}���ƌ��΂ꂽ
	[else][font color=&�F�F����]
		8. �H�H�H���C���c�c�c�c�c�@�q���C���U��
	[endif][r]

	[if exp="sf.�G���h�X�F�������߂� !==void"][font color=&�F�F��Q]
		9. �������߂�c�c�c�c�c�c���J�����E�}���ɓ�҂�������
	[else][font color=&�F�F����]
		9. ���H�H�H��c�c�c�c�c�c�@�Ⴋ���̉߂��Ƃ������Ƃ��납
	[endif][r]
	
	
	[resetfont]
	[next]
	[endnowait]
	[position layer= message0 frame= image/�e�L�X�g�{�b�N�X.png  left= 180  top= 570  margint= 13  marginl= 40]
	[jump target=*���j���[]
[elsif exp=�G]
	�Z�[�u�f�[�^�E��肱�݃f�[�^���폜���܂����H
	[��� �A=�폜���Ȃ� �C=�폜����]
	[jump target=*���j���[ cond="�A"]
	�o�b�N�A�b�v������Ă����Ȃ�����A���ɂ͖߂��܂���B
	[��� �A=�폜���Ȃ� �C=�폜����]
	[jump target=*���j���[ cond="�A"]
	[call storage="�ϐ�.ks" target="*�V�X�e���ϐ��N���A"]
	[BGM��~]
	[�w�i �摜= ��]
	���S�ɍ폜���܂����B[next]
	[�g����]
	[jump target=*������]
[endif]

*edit
[er]
[�g]
[nowait]
���̖��O�� 
[edit color="0x0000FF" length=140 maxchars=14 name=f.��] 
[edit color="0x0000FF" length=160 maxchars=16 name=f.��]
�B[���r �ǂ�=����]�H[���r �ǂ�=��]��[���r �ǂ�=��]�J���Z�A�Q�N�Q�g�̐��k���B
[r][r]
�@�@�@�@�@�@�@�@[link target= *ck_name]<����Ŏn�߂�>[endlink]�@�@�@[link target= *cancel_name]<�L�����Z��>[endlink]
[endnowait]
[s]
*cancel_name
[SE ��= �I��  ����= 40 buf= 1]
[er]
[�g����]
[jump target= *���j���[]
*ck_name
[SE ��= �I��  ����= 40 buf= 1]
[commit]
[er]
[if exp= "widthStr(f.��) > 5"]
���̕c������������B[next]
[jump target= *edit]
[endif]
[if exp= "widthStr(f.��) > 6"]
���̖��O����������B[next]
[jump target= *edit]
[endif]
[if exp= "widthStr(f.��+f.��) > 10"]
���̕c���Ɩ��O���S�̓I�ɒ�������B[next]
[jump target= *edit]
[endif]
[if exp= "f.��.length == 0"]
���̕c�����Ȃ��B[next]
[jump target= *edit]
[endif]
[if exp= "f.�� == '�����E' || f.�� == '����' || f.�� == '�ш�' || f.�� == '�{��' || f.�� == '��' || f.�� == '����' || f.�� == '����'"]
[��]�̓N���X���C�g�ɂ��邯�ǁc�c
[��� �A= �n�j �C= �L�����Z��]
[jump target= *edit cond=�C]
[endif]
[if exp= "f.��.length == 0"]
���̖��O���Ȃ��B[next]
[jump target= *edit]
[endif]
[if exp= "f.�� == '�J����' || f.�� == '���V�I' || f.�� == '�}��' || f.�� == '�C�Y�~' || f.�� == '�}��' || f.�� == '�J�P��' || f.�� == '�~�h��'"]
[��]�̓N���X���C�g�ɂ��邯�ǁc�c
[��� �A= �n�j �C= �L�����Z��]
[jump target= *edit cond=�C]
[endif]

[�g����]

[fadeoutbgm time=500]
[�w�i �摜=��]
[wb]

[if exp= testplay]
	[�̗� �ω�= 0]
	[�{�^���\��]
	[call storage= "�V�i���I�e�X�g.txt"]
	[�^�C�g���ɖ߂�]
[endif]

[jump storage=����.ks]
