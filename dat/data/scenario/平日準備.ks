[eval exp="�l���v�Z()"]
[jump target="*���یヌ�b�X��" cond="f.���یヌ�b�X��"]

[eval exp="f.���������� = 1"]
[��ʓ]��]
[eval exp="var �����̐i�� = 0"]
[BGM ��=�����Տ���01.ogg ����=50 ���[�v]
[�w�i �摜=�������ی�]
[�g]
[�l�� �摜=�J�������� ���O=�����E�J����]
�����Ղ̏������n�߂܂��傤���B[next]
[eval exp="�����̐i�� += �i���Q�� + f.�J��������"]

[�l�� �摜=���V�I ���O=�������V�I]
�H���\���m�F����Ɓc�c[n]
�����̐i���� [emb exp="f.�i��"]�� ���ĂƂ��낾�낤���B[next]
[eval exp="�����̐i�� += �i���Q�� + f.���V�I����"]

[if exp="f.���u�j���W"]
	[�l�� �摜=�j�q���k�A ���O=�j�q���k]
	���A[��]�B[n]
	�l�͂��̏��ނ�搶�̂Ƃ���Ɏ����Ă����΂����񂾂�ˁB[next]
	[eval exp="�����̐i�� += �i�����W"]
[endif]

[if exp="f.�}���Q��"]
	[�l�� �摜=�}�����͂� ���O=�ш�}��]
	���q���W�߂�ɂ́A�ł������ŔƖڗ��r���ł���I[n]
	���Ƃ́A�^�����̋��Z�̏I������オ�`�����X�A���ƁB[next]
	[eval exp="�����̐i�� += �i���Q�� + f.�}������"]
[elsif exp="f.�}�����W"]
	[�l�� �摜=�}������ ���O=�ш�}��]
	��`�����Ƃ��邩�ȁc�c�H[n]
	������ƐE�����s���Ă������񂾂��ǁB[next]
	[eval exp="�����̐i�� += �i�����W"]
[endif]

[if exp="f.�J�P���Q��"]
	[�l�� �摜=�J�P���ɂ� ���O=����J�P��]
	���̐ڋq�}�j���A���A�܂����P�ł��������ȁB[next]
	[eval exp="�����̐i�� += �i���Q�� + f.�J�P������"]
[elsif exp="f.�J�P�����W"]
	[�l�� �摜=�J�P���߂��炵 ���O=����J�P��]
	����ȃe�L�g�[�ȃe�[�u���z�u�ő��v���c�c�H[n]
	�܂��A�������B[next]
	[eval exp="�����̐i�� += �i�����W"]
[endif]

[if exp="f.�C�Y�~�Q��"]
	[�l�� �摜=�C�Y�~�ւ� ���O=�{���C�Y�~]
	���[��A������ƒ����̎菇�ɋÂ肷�������ȁ[[n]
	���Ƃ́A�ޗ��̒��B�ꏊ�����߂Ȃ��ƂˁB[next]
	[eval exp="�����̐i�� += �i���Q��"]
[elsif exp="f.�C�Y�~���W"]
	[�l�� �摜=�C�Y�~�͂� ���O=�{���C�Y�~]
	�����̃��V�s�A���M���Ԃ����ȉ߂���񂶂�Ȃ��́H[n]
	�����Ɗm�F���Ă�́H[next]
	[eval exp="�����̐i�� += �i�����W"]
[endif]

[if exp="f.�}���Q��"]
	[�l�� �摜=�}�� ���O=���}��]
	���̃G�v�����̃A�N�Z���g�͎̂Ă���������[n]
	��肷����ƃR�X�v�����Č���ꂿ�Ⴄ�̂ł���B[next]
	[eval exp="�����̐i�� += �i���Q�� + f.�}������"]
[elsif exp="f.�}�����W"]
	[�l�� �摜=�}���͂�� ���O=���}��]
	�����ƁA�����ƁH[n]
	���b�V�[�A������΂����́`�H[next]
	[eval exp="�����̐i�� += �i�����W"]
[endif]


[if exp="f.���u�����W"]
	[�l�� �摜=���q���k�A ���O=���q���k]
	�����E����B������ׂĂ݂�Ƃ����̂́A[n]
	����Ȋ����ł�����ł����H[next]
	[eval exp="�����̐i�� += �i�����W"]
[endif]

[if exp="f.�~�h���Q��"]
	[�l�� �摜=�~�h���Ί� ���O=�����~�h��]
	�����̃e�[�u���ɂˁA���킢���o�����̃N���X���������Ǝv���́B[n]
	�˂��A�J�P������B[next]
	[eval exp="�����̐i�� += �i���Q�� + f.�~�h������"]
[elsif exp="f.�~�h�����W"]
	[�l�� �摜=�~�h���͂� ���O=�����~�h��]
	�͂��c�c[n]
	���j���[�Ɠ������Č����Ă��c�c[next]
	[eval exp="�����̐i�� += �i�����W"]
[endif]

[�l������]

[���b�Z�[�W]
���͂ǂꂭ�炢�撣�낤���c�c
[if exp="f.���� + f.�̗� > -�����R"]
	[�l�� �A="&'�S�͓����� ('+�����Q+')'" �C="&'�K�x�ɂ�� ('+�����P+')'" �E="&'���Ă邾�� ('+�����O+')'" �G="&'���ɂ̒Ǎ��� ('+�����R+')'"]
[else]
	[�l�� �A="&'�S�͓����� ('+�����Q+')'" �C="&'�K�x�ɂ�� ('+�����P+')'" �E="&'���Ă邾�� ('+�����O+')'"]
[endif]
[�g����]
[if exp=�A]
	[�̗� �ω�=&�����Q]
	[eval exp="�����̐i�� += �i���Q + f.��l������"]
[elsif exp=�C]
	[�̗� �ω�=&�����P]
	[eval exp="�����̐i�� += �i���P + f.��l������"]
[elsif exp=�E]
	[�̗� �ω�=&�����O]
	[eval exp="�����̐i�� += �i���O"]
[elsif exp=�G]
	[BGM ��="�����Տ���03.ogg" ����=60]
	[�̗� �ω�=&�����R]
	[eval exp="�����̐i�� += �i���R + f.��l������"]
[endif]

[call storage="scenario/��/�}��.ks" cond="����('�}���Q��') && !����('�����Ղ̔����o���I��')"]

[�w�i �摜=�����[��]

*�i���\��

[cancelskip]
[�g][���b�Z�[�W]
[nowait]
�Q���ҁF����   �J����  ���V�I
[ch text="  �C�Y�~" cond="f.�C�Y�~�Q�� + f.�C�Y�~���W"]
[ch text="   �}�� " cond="f.�}���Q�� + f.�}�����W"]
[ch text="  �J�P��" cond="f.�J�P���Q�� + f.�J�P�����W"]
[ch text="  �~�h��" cond="f.�~�h���Q�� + f.�~�h�����W"]
[ch text="   �}�� " cond="f.�}���Q�� + f.�}�����W"]
[ch text="  �j���k" cond="f.���u�j���W"]
[ch text="  �����k" cond="f.���u�����W"][r]
�v���x�F[style autoreturn=false]
[font color=&�F�F���� cond=f.��l������]
[ch text="&�i���Q + f.��l������ +'�� '" cond="�A"]
[ch text="&�i���P + f.��l������ +'�� '" cond="�C"]
[ch text="&�i���O +'�� '" cond="�E"]
[ch text="&�i���R + f.��l������ +'�� '" cond="�G"]
[font color=&�F�F����]
�{  
[font color=&�F�F���� cond=f.�J��������]
[emb exp="�i���Q�� + f.�J��������"]�� 
[font color=&�F�F����]
�{  
[font color=&�F�F���� cond=f.���V�I����]
[emb exp="�i���Q�� + f.���V�I����"]�� 
[font color=&�F�F����]

[if exp="f.�C�Y�~�Q��"]
	�{  [font color=&�F�F���� cond=f.�C�Y�~����][emb exp="�i���Q�� + f.�C�Y�~����"]�� 
[elsif exp="f.�C�Y�~���W"]
	�{  [emb exp="�i�����W"]�� 
[endif]
[font color=&�F�F����]

[if exp="f.�}���Q��"]
	�{  [font color=&�F�F���� cond=f.�}������][emb exp="�i���Q�� + f.�}������"]�� 
[elsif exp="f.�}�����W"]
	�{  [emb exp="�i�����W"]�� 
[endif]
[font color=&�F�F����]

[if exp="f.�J�P���Q��"]
	�{  [font color=&�F�F���� cond=f.�J�P������][emb exp="�i���Q�� + f.�J�P������"]�� 
[elsif exp="f.�J�P�����W"]
	�{  [emb exp="�i�����W"]�� 
[endif]
[font color=&�F�F����]

[if exp="f.�~�h���Q��"]
	�{  [font color=&�F�F���� cond=f.�~�h������][emb exp="�i���Q�� + f.�~�h������"]�� 
[elsif exp="f.�~�h�����W"]
	�{  [emb exp="�i�����W"]�� 
[endif]
[font color=&�F�F����]

[if exp="f.�}���Q��"]
	�{  [font color=&�F�F���� cond=f.�}������][emb exp="�i���Q�� + f.�}������"]�� 
[elsif exp="f.�}�����W"]
	�{  [emb exp="�i�����W"]�� 
[endif]
[font color=&�F�F����]

[ch text="&'�{  '+(�i�����W)+'�� '" cond="f.���u�j���W"]
[ch text="&'�{  '+(�i�����W)+'�� '" cond="f.���u�����W"]
[style autoreturn=true][r]
�i�����F[emb exp="f.�i��"]��  ��
[eval exp="f.�i��+=�����̐i��"]
  [font color=&�F�F���� cond="f.�i�� >= 100"][emb exp="f.�i�� + �����̐i��"]��[resetfont][next]
[endnowait]
[if exp="f.�i�� >= 150"][���щ��� ���O=���тP�X�F�i���P�T�O��][endif]
[���m���[�O�I��]
[BGM��~ ���� = 2000]
[����]
���\�i�񂾂ˁB�݂�Ȃ��肪�Ƃ��B[next]
[�g����]
[iscript]
f.�C�Y�~���W = f.�}�����W = f.�J�P�����W = f.�~�h�����W = f.�}�����W = f.���u�j���W = f.���u�����W = 0;
[endscript]
[eval exp="f.���������� = 0"]
[return]


*���یヌ�b�X��
[��ʓ]��]
[�w�i �摜=�������C]
[BGM ��=���C�̋���.ogg ����=50]
[�g]
[eval exp="f.���یヌ�b�X�� = 0"]

[�l�� �摜=�������� ���O= �p��̃V�G=�T��]
���ꂩ����ی���ʃ��b�X�����n�߂�B[next]

�����ɍ��i�ł��Ȃ������򓙐��̏��N�A[n]
�Ȃ̕s�׋���p���āA�S�����ւ��Ȃ����B[next]

��K�̌��ʂ�������܂ŗe�͂͂��Ȃ��B[n]
�ł���悤�ɂȂ�܂ŋA��Ȃ��Ɗo�債�Ă������Ƃ��B[next]

���ȏ��Ǝ������g���Č����ߌ`���̖��������B[n]
�ł����҂���A����������s���B[next]

�͂��߁I[next]
[�g����]
[�̗� �ω�=&��K����]
[�w�� �ω�=&"��K��̐��� - f.�����̓_��"]

[BGM��~ ����=2000]
[�w�i �摜=�����[��]
[�l������]

[�g]
[���b�Z�[�W]
�������āA����[�J���X]���ی�ׂ͒�Ă��܂����B[n]
���͂�����ƕ׋����悤�c�c[next]

[���щ��� ���O=���тU�F���یヌ�b�X��]

��������A�����Ղ̏����Ɍ�����Ȃ��ƁI�I[next]

[��ʓ]��]
[�w�i �摜=�����[��]
[BGM ��=�����Տ���01.ogg ����=50 ���[�v]

[�g]
[����]
���߂�I�I[n]
��K���I������炱��Ȏ��ԂɂȂ�������āc�c[next]

[�l�� ���O=�����E�J���� �摜=�J�����ނ�]
�c�c�c�c[next]

[�l�� ���O=�������V�I �摜=���V�I���f]
�����A�V�G�搶�̕��ی���ʃ��b�X���Ƃ����̂�[n]
�s�s�`���ł͂Ȃ������̂��ȁc�c[next]

[�l�� ���O=�����E�J���� �摜=�J�������[��]
�c�c�܂��A����l�����łȂ�Ƃ��i�߂Ă�������B[next]

[�l������]
[eval exp="var �����̐i�� = 4"]
[if exp="f.�}���Q��"][eval exp="�����̐i�� += �i���Q��"]
[elsif exp="f.�}�����W"][eval exp="�����̐i�� += �i�����W"]
[endif]
[if exp="f.�J�P���Q��"][eval exp="�����̐i�� += �i���Q��"]
[elsif exp="f.�J�P�����W"][eval exp="�����̐i�� += �i�����W"]
[endif]
[if exp="f.�C�Y�~�Q��"][eval exp="�����̐i�� += �i���Q��"]
[elsif exp="f.�C�Y�~���W"][eval exp="�����̐i�� += �i�����W"]
[endif]
[if exp="f.�}���Q��"][eval exp="�����̐i�� += �i���Q��"]
[elsif exp="f.�}�����W"][eval exp="�����̐i�� += �i�����W"]
[endif]
[if exp="f.�~�h���Q��"][eval exp="�����̐i�� += �i���Q��"]
[elsif exp="f.�~�h�����W"][eval exp="�����̐i�� += �i�����W"]
[endif]
[if exp="f.���u�j���W"][eval exp="�����̐i�� += �i�����W"][endif]
[if exp="f.���u�����W"][eval exp="�����̐i�� += �i�����W"][endif]

[eval exp="�A=0,�C=0,�E=1,�G=0"]
;�I�����E��I�񂾂̂��Č�����
[jump target="*�i���\��"]
