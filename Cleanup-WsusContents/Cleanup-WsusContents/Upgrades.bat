@echo off
cls
set InstallDirectory=C:\Tools\Scripts\Wsus

echo %InstallDirectory% �� Cleanup-WsusContents.ps1 ���R�s�[���܂� (�㏑���C���X�g�[��)
echo - �����Windows 10�@�\�X�V�v���O�����̃����[�X�̂��тɃ����e�i���X���K�v�ł��邱�Ƃ𗝉����Ă�������
echo.
echo.
echo �C���X�g�[�����n�߂Ă��悢�ꍇ�͉����L�[�������Ă�������...
pause > nul

copy /y Assets\Settings.Current.json Assets\Settings.Current.json.old
xcopy /erchy "%~dp0*" "%InstallDirectory%\"
cd /d "%InstallDirectory%\"
del Cleanup-WsusContents.pssproj
del Install.bat
del Upgrades.bat
move "Assets\Uninstall.bat" "Uninstall.bat"
cls

echo ���E�^�p�ɉ����� Settings.Current.json ���L�q���Ă�������
echo.
echo - �u��������ꂽ�X�V�v���O����������
echo - �yBETA�z�N���C�A���g����K�v�Ƃ��ꂽ�X�V�v���O�����ɑ΂��āA�w�肵���O���[�v�Ɏw�肵�����Ԃ��o�ߌ�ɏ��F����
echo - WSUS�̃N���[���A�b�v (�폜���ꂽ�Â��X�V�v���O����, ���k���ꂽ�X�V�v���O����, �폜���ꂽ�Â��X�V�v���O����, ������ꂽ�f�B�X�N�̈�)
echo - WSUS DB �C���f�b�N�X�̍č\�� (https://gallery.technet.microsoft.com/scriptcenter/6f8cde49-5c52-4abd-9820-f1d270ddea61)
echo - �󂫗̈悪���Ȃ��Ȃ肪���Ȋ��ŁA�X�N���v�g������ɓ��삷�邽�߂̃_�~�[�t�@�C�� (4GB) ���쐬
echo ## �@�\�X�V�v���O����
echo - ����: Windows 10, �o�[�W���� 1903���܂ދ@�\�X�V�v���O����
echo - ����: 64�r�b�g�ňȊO�̋@�\�X�V�v���O����
echo - ����: �R���V���[�}�[ �G�f�B�V����
echo ## �i���X�V�v���O����
echo - ����: Windows 10, �o�[�W���� 1909 64�r�b�g�ňȊO�̕i���X�V�v���O����
echo - ����: Windows 8.1 64�r�b�g�ňȊO�̕i���X�V�v���O����
echo ## Office
echo - ����: 64�r�b�g�Ō����̍X�V�v���O����

echo.
echo.
ping localhost -n 4 > nul
notepad "Assets\Settings.Current.json"
cls
