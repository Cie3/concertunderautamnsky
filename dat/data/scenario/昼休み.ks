[eval exp="f.����='���x��'"]
[eval exp="f.���x��=true, f.���ی�=false"]
;�����C�x���g


[iscript]
var str = f.�� + '���x��';
var �b���������l�� = 0;
var �o���A = �o��[str + '�A'];
var �o���C = �o��[str + '�C'];
var �o���E = �o��[str + '�E'];
var �A�ɘb��������, �C�ɘb��������, �E�ɘb��������;
[endscript]


*�N�ɘb�������悤����

[��ʓ]��]
[�w�i �摜=�L��]
[BGM ��=05����.ogg buf=2 ����=50]

[iscript]
var ���� = �b���������l�� == 2 ? '�i' + ��b�R�l�� + '�j' : '';
�A�ɘb�������� = �o���A == '' ? '' : �o���A + '�ɘb��������' + ����;
�C�ɘb�������� = �o���C == '' ? '' : �o���C + '�ɘb��������' + ����;
�E�ɘb�������� = �o���E == '' ? '' : �o���E + '�ɘb��������' + ����;
[endscript]

[if exp="�o���A == '' && �o���C == '' && �o���E ==''"]
	[�g]
	[SE ��= "�`���C��R.ogg" ����=40]
	���x�݂��A�����I��肩�B[next]
	[�g����]
	[return]
[endif]

[�g]
���x�݂͉������悤�B
[�l�� �A= &�A�ɘb�������� �C= &�C�ɘb�������� �E= &�E�ɘb�������� �G= �������Ȃ�]

;[call storage="���.ks" target="*��b�̎�"]

[if exp=�A]
	[�g����]
	[if exp="�b���������l��==2"][�̗� �ω�=&��b�R�l��][endif]
	[call storage="&'scenario/��/' + �o���A + '.ks'"]
	[eval exp="�o���A='', �b���������l��+=1"]
[elsif exp=�C]
	[�g����]
	[if exp="�b���������l��==2"][�̗� �ω�=&��b�R�l��][endif]
	[call storage="&'scenario/��/' + �o���C + '.ks'"]
	[eval exp="�o���C='', �b���������l��+=1"]
[elsif exp=�E]
	[�g����]
	[if exp="�b���������l��==2"][�̗� �ω�=&��b�R�l��][endif]
	[call storage="&'scenario/��/' + �o���E + '.ks'"]
	[eval exp="�o���E='', �b���������l��+=1"]
[elsif exp=�G]
	[if exp="�o���A == '�O���搶' && f.�� == 23"]
		�������A�ʒk�ɍs���̂�Y��Ă��I[next]
		[call storage="&'scenario/��/' + �o���A + '.ks'"]
		[eval exp="�o���A='', �b���������l��+=1"]
	[endif]
	[SE ��= "�`���C��R.ogg" buf=2 ����=40]
	���x�݂��A�����I��肩�B[next]
	[�g����]
	[return]
[endif]

[jump target= *�N�ɘb�������悤����]
