@echo off
cls
set InstallDirectory=C:\Tools\Scripts\Wsus

cls
echo �R�s�[�ς݂�ODBC Driver��sqlcmd Utility���C���X�g�[�����Ă��܂�...
Installers\VC_redist.x64.exe /install /passive
msiexec /i Installers\msodbcsql_17.4.2.1_x64.msi /passive IACCEPTMSODBCSQLLICENSETERMS=YES
msiexec /i Installers\MsSqlCmdLnUtils.msi /passive IACCEPTMSSQLCMDLNUTILSLICENSETERMS=YES

cls
echo (�C���X�g�[���̗L���Ɋ֌W�Ȃ��\������Ă��܂�)
echo SQL�̃����e�i���X�Ȃǂ𓮍삳���邽�߂ɁAWSUS���C���X�g�[������Ă���T�[�o�[�ɂĎ��s����邱�Ƃ��������߂��܂�
echo.
echo �܂��ASQL�̃����e�i���X�ɂ�ODBC Driver��sqlcmd Utility���K�v�ɂȂ�܂�
echo ���O�ɃC���X�g�[�����ς܂��Ă�������
echo - https://docs.microsoft.com/ja-jp/sql/tools/sqlcmd-utility
echo - https://www.microsoft.com/ja-JP/download/details.aspx?id=56567
echo - https://aka.ms/vs/15/release/vc_redist.x64.exe
echo.
echo.
pause
cls
echo %InstallDirectory% �� Cleanup-WsusContents.ps1 ���R�s�[���܂�
echo - �����Windows 10�@�\�X�V�v���O�����̃����[�X�̂��тɃ����e�i���X���K�v�ł��邱�Ƃ𗝉����Ă�������
echo - ���j��2:00�Ƀo�b�N�O���E���h�Ŏ��s����^�X�N��o�^���܂�
echo - Cleanup-WsusContents.ps1 �̃��O�t�@�C���� %InstallDirectory%\Logs\ �ɕۑ�����܂��̂ŁA����I�Ɋm�F����邱�Ƃ��������߂��܂�
echo.
echo �C���X�g�[���f�B���N�g���̕ύX�������ꍇ�́A�ȉ��̃t�@�C���̏C�����K�v�ł�
echo - Wsus�R���e���c�̃N���[���A�b�v.lnk
echo - Assets\Task-Cleanup-WsusContents (Monthly).xml
echo.
echo (���̑��V���[�g�J�b�g�͒��ڃv���O�����ŎQ�Ƃ��܂���̂ŁA�K�X�����p��������)
echo.
echo.
echo �C���X�g�[�����n�߂Ă��悢�ꍇ�͉����L�[�������Ă�������...
pause > nul
cls

xcopy /erchy "%~dp0*" "%InstallDirectory%\"
cd /d "%InstallDirectory%\"
del Cleanup-WsusContents.pssproj
del Install.bat
del Upgrades.bat
move "Assets\Uninstall.bat" "Uninstall.bat"
cls

echo ���ɐݒ�t�@�C��������ꍇ�A�㏑������Ȃ����Ƃ��������߂��܂�
copy "Assets\Settings.Current.json" "Settings.Current.json"
cls
@rem explorer /n,"%InstallDirectory%\Filters\FeatureUpdates\"
@rem explorer /n,"%InstallDirectory%\Filters\QualityUpdates\"

echo �W���ňȉ��̐ݒ肪����Ă��܂��̂ŁA���E�^�p�ɉ����� Settings.Current.json ���L�q���Ă�������
echo.
echo * �@�\�X�V�v���O����
echo - ����: Windows 10, �o�[�W���� 1903���܂ދ@�\�X�V�v���O����
echo - ����: 64�r�b�g�ňȊO�̋@�\�X�V�v���O����
echo - ����: �R���V���[�}�[ �G�f�B�V����
echo * �i���X�V�v���O����
echo - ����: Windows 10, �o�[�W���� 1909 64�r�b�g�ňȊO�̕i���X�V�v���O����
echo - ����: Windows 8.1 64�r�b�g�ňȊO�̕i���X�V�v���O����
echo * Office
echo - ����: 64�r�b�g�Ō����̍X�V�v���O����
echo * �yBETA�z�N���C�A���g����K�v�Ƃ��ꂽ�X�V�v���O�����ɑ΂��āA�������F����O���[�v
echo - �i���X�V�v���O����: �X�V�v���O���������[�X����15���o�ߌ�A"���ׂẴR���s���[�^�["�ɏ��F����܂�
echo - �i���X�V�v���O����: �X�V�v���O���������[�X����5���o�ߌ�A"��s�K�p-�i���X�V�v���O����"�ɏ��F����܂�
echo - �@�\�X�V�v���O����: �X�V�v���O���������[�X����60���o�ߌ�A"��s�K�p-�@�\�X�V�v���O����"�ɏ��F����܂�
echo.
echo.
ping localhost -n 4 > nul
notepad "Settings.Current.json"
cls

SchTasks /Create /Xml "%InstallDirectory%\Assets\Task-Cleanup-WsusContents (Weekly).xml" /TN "Cleanup-WsusContents"
copy /y "Wsus�R���e���c�̃N���[���A�b�v.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Wsus�R���e���c�̃N���[���A�b�v.lnk"
cls

echo ������s�ɂ͎��Ԃ�������ꍇ������܂��B���؂��܂߁A���炩���ߎ��s���Ă������Ƃ��������߂��܂��B
ping localhost -n 4 > nul
explorer /n,"%InstallDirectory%\Wsus�R���e���c�̃N���[���A�b�v.lnk"
