[bgmopt gvolume=80]

[macro name=�����Տ����̋�]
[if exp="f.�i�� < 20"]
[BGM ��=�����Տ���01.ogg ����=60]
[elsif exp="f.�i�� < 40"]
[BGM ��=�����Տ���04.ogg ����=60]
[elsif exp="f.�i�� < 70"]
[BGM ��=�����Տ���05.ogg ����=60]
[elsif exp="f.�i�� < 100"]
[BGM ��=�����Տ���06.ogg ����=60]
[else]
[BGM ��=�����Տ���07.ogg ����=60]
[endif]
[endmacro]


[macro name=�J���X.ogg]
[SE ��=�J���X.ogg ����=50 buf=2]
[endmacro]

[macro name=�؂��.ogg]
[SE ��=�؂��.ogg ����=50 buf=2]
[endmacro]

[macro name=�I����.ogg]
[SE ��=�I����.ogg ����=60 buf=2]
[endmacro]

[macro name=�I��.ogg]
[SE ��=�I��.ogg ����=50 buf=1]
[endmacro]

[macro name=�N���A.ogg]
[SE ��=�N���A.ogg ����="&50"]
[endmacro]

[macro name=��ɓ��ꂽ.ogg]
[SE ��=��ɓ��ꂽ.ogg ����=45 buf=1]
[endmacro]

[macro name=�|��鉹.ogg]
[SE ��=�|��鉹.ogg ����="&50 + (int)mp.����" buf=2]
[endmacro]

[macro name=�`�����`����.ogg]
[SE ��=�`�����`����.ogg ���[�v=0 ����=50]
[endmacro]

[macro name=�K�[��.ogg]
[SE ��=�K�[��.ogg ����=50 buf=2]
[endmacro]

[macro name=�`���C��.ogg]
[SE ��=�`���C��R.ogg buf=2 ����=40]
[endmacro]

[macro name=�`���C���Q.ogg]
[SE ��=�`���C��2R.ogg buf=2 ����=40]
[endmacro]

[macro name=���݂킽��.ogg]
[SE ��=���݂킽��.ogg ����=80]
[endmacro]

[macro name=�L���L����.ogg]
[SE ��=�L���L����.ogg ����=80]
[endmacro]



[macro name=�����b���Ȃ�.ogg]
[BGM ���[�v ��=�����b���Ȃ�.ogg ����="&70 + (int)mp.����"]
[endmacro]

[macro name=��.ogg]
[BGM ��=��.ogg ���[�v=0 ����="&50 + (int)mp.����"]
[endmacro]

[macro name=��].ogg]
[BGM ��=��].ogg ���[�v=0 ����="&60 + (int)mp.����"]
[endmacro]

[macro name=�^�C�g��.ogg]
[BGM ��=�^�C�g��.ogg ���[�v=0 ����="&65 + (int)mp.����"]
[endmacro]

[macro name=�������.ogg]
[BGM ��=�������.ogg ����="&50"]
[endmacro]

[macro name=��炩����.ogg]
[BGM ��=��炩����.ogg ����=50]
[endmacro]

[macro name=����.ogg]
[BGM ��=����.ogg ����=70]
[endmacro]

[macro name=����.ogg]
[BGM ��=����.ogg ����=55]
[endmacro]

[macro name=���C�y.ogg]
[BGM ��=���C�y.ogg ����=55]
[endmacro]

[macro name=����.ogg]
[BGM ��=����.ogg ���[�v=0 ����=55]
[endmacro]

[macro name=����.ogg]
[BGM ��=����.ogg ����=70]
[endmacro]

[macro name=�Q�[���I�[�o�[.ogg]
[BGM ��=�Q�[���I�[�o�[.ogg ���[�v=0 ����=55]
[endmacro]

[macro name=���|�I�i��.ogg]
[BGM ��=���|�I�i�� ����=60]
[endmacro]

[macro name=�����Ք��\.ogg]
[BGM ��=�����Ք��\.ogg ����=75]
[endmacro]

[macro name=�߂���.ogg]
[BGM ��=�߂���.ogg ����=60]
[endmacro]

[macro name=�[���.ogg]
[BGM ��=�[���.ogg ����=55]
[endmacro]

[macro name=���.ogg]
[BGM ��=���.ogg ����=55]
[endmacro]

[macro name=�����.ogg]
[BGM ��=�����.ogg ����=70]
[endmacro]

[macro name=�j��.ogg]
[BGM ��=�j��.ogg ����=55]
[endmacro]

[macro name=�j�ǌ�.ogg]
[BGM ��=�j�ǌ�.ogg ���[�v=0 ����=55]
[endmacro]

[macro name=����.ogg]
[BGM ��=����.ogg ���[�v=0 ����=50]
[endmacro]

[macro name=���N���N.ogg]
[BGM ��=���N���N.ogg ����=60]
[endmacro]

[macro name=�������߂�.ogg]
[BGM ��=�������߂�.ogg ���[�v=0 ����=55]
[endmacro]

[macro name=���C�̋���.ogg]
[BGM ��=���C�̋���.ogg ����=55]
[endmacro]

[macro name=�J�Y�L.ogg]
[BGM ��=�J�Y�L.ogg ����=55 ���[�v=0]
[endmacro]

[macro name=�{��.ogg]
[BGM ��=�{��.ogg ����=65]
[endmacro]

[macro name=�J�T.ogg]
[BGM ��=�J�T.ogg ����=55]
[endmacro]

;[jump target="*�T�E���h�e�X�gx"]
[jump target="*�T�E���h�e�X�gx"]

*�T�E���h�e�X�g
[����.ogg]
[wait time=5000]
[���.ogg]
[wait time=5000]
[�߂���.ogg]
[wait time=5000]
[�����b���Ȃ�.ogg]
[wait time=5000]
[���N���N.ogg]
[wait time=5000]
[�J�Y�L.ogg]
[wait time=5000]
[�Q�[���I�[�o�[.ogg]
[wait time=5000]
[�������߂�.ogg]
[wait time=5000]
[�^�C�g��.ogg]
[wait time=5000]
[��炩����.ogg]
[wait time=5000]
[���C�̋���.ogg]
[wait time=5000]
[��.ogg]
[wait time=5000]
[��].ogg]
[wait time=5000]
[����.ogg]
[wait time=5000]
[�����.ogg]
[wait time=5000]
[�������.ogg]
[wait time=5000]
[�{��.ogg]
[wait time=5000]
[���C�y.ogg]
[wait time=5000]
[�j��.ogg]
[wait time=5000]
[�j�ǌ�.ogg]
[wait time=5000]
[�����Տ����̋�]
[wait time=5000]
[����.ogg]
[wait time=5000]
[���|�I�i��.ogg]
[wait time=5000]
[�����Ք��\.ogg]
[wait time=5000]
[����.ogg]
[wait time=5000]
[�J�T.ogg]1
[wait time=5000]
[�[���.ogg]
[wait time=5000]
[����.ogg]
[wait time=5000]

*�T�E���h�e�X�gx
[return]
