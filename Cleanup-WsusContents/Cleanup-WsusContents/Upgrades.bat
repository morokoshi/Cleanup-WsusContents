@echo off
cls
set InstallDirectory=C:\Tools\Scripts\Wsus

echo %InstallDirectory% �� Cleanup-WsusContents.ps1 ���R�s�[���܂� (�㏑���C���X�g�[��)
echo - �����Windows 10�@�\�X�V�v���O�����̃����[�X�̂��тɃ����e�i���X���K�v�ł��邱�Ƃ𗝉����Ă�������
echo.
echo.
echo �C���X�g�[�����n�߂Ă��悢�ꍇ�͉����L�[�������Ă�������...
pause > nul

xcopy /erchy "%~dp0*" "%InstallDirectory%\"
cd /d "%InstallDirectory%\"
del Cleanup-WsusContents.pssproj
del Install.bat
del Upgrades.bat
move "Assets\Uninstall.bat" "Uninstall.bat"
cls

echo ���E�^�p�ɉ����� Settings.Current.json ���L�q���Ă�������
echo.
echo - FeatureUpdatesFilter.FileNames: ����Ń��e�[���ł�Windows 10�̋@�\�X�V�v���O������Windows 10, �o�[�W���� 1903�܂ł̋@�\�X�V�v���O���������ۂ��܂�
echo -- %InstallDirectory%\Filters\FeatureUpdates\ �̃t�@�C������ǉ����邱�Ƃɂ��A�Ώۂ𑝂₷���Ƃ��ł��܂�
echo - IsDeclineFeatureUpdatesClientBusiness: ����ł͖@�l�������C�Z���X���i�̋@�\�X�V�v���O�����̋��ۂ������ł�
echo - IsDeclineFeatureUpdatesClientConsumer: ����ł�OEM�EDSP���i�����X�V�v���O�����̋��ۂ��L���ł�
echo - QualityUpdatesFilter.FileNames: �����Windows 8.1 64�r�b�g��, Windows 10, �o�[�W���� 1909 64�r�b�g�ňȊO�̕i���X�V�v���O���������ۂ��܂�
echo -- %InstallDirectory%\Filters\QualityUpdates\ �̃t�@�C������ǉ����邱�Ƃɂ��A�Ώۂ𑝂₷���Ƃ��ł��܂�
echo - IsDeclineMsOfficeUpdates: ����ł� TargetMsOfficeArchitecture �Ŏw�肵��Office�����X�V�v���O�����̋��ۂ��L���ł�
echo - TargetMsOfficeArchitecture: ����ł�64�r�b�g�ł�Office�����X�V�v���O���������ۂ���܂�
echo - ReservedFile: �ݒ�͎b�菈�u�ł��B���p�[�e�B�V�������ɂق��̃V�X�e������������ꍇ��FSRM�ɂ��N�H�[�^�[�Ȃǂ��������Ă�������
echo.
echo.
ping localhost -n 4 > nul
notepad "Settings.Current.json"
cls
