@echo off
cls
set InstallDirectory=C:\Tools\Scripts\Wsus

echo %InstallDirectory% �� Cleanup-WsusContents.ps1 ���R�s�[���܂� (�㏑���C���X�g�[��)
echo - �����Windows 10�@�\�X�V�v���O�����̃����[�X�̂��тɃ����e�i���X���K�v�ł��邱�Ƃ𗝉����Ă�������
echo - ���j��2:00�Ƀo�b�N�O���E���h�Ŏ��s����^�X�N��o�^���܂�
echo - ���O�t�@�C���� %InstallDirectory%\Logs\ �ɕۑ�����܂��̂ŁA���s�O��ŎQ�l�ɂ��Ă�������
echo.
echo �C���X�g�[���f�B���N�g���̕ύX�������ꍇ�́A�ȉ��̃t�@�C���̏C�����K�v�ł�
echo - Wsus�R���e���c�̃N���[���A�b�v.lnk
echo - Assets\Task-Cleanup-WsusContents (Monthly).xml
echo.
echo.
echo �C���X�g�[�����n�߂Ă��悢�ꍇ�͉����L�[�������Ă�������...
pause > nul

xcopy /erchy "%~dp0*" "%InstallDirectory%\"
cd /d "%InstallDirectory%\"
cls

@rem echo ���ɐݒ�t�@�C��������ꍇ�A�㏑������Ȃ����Ƃ��������߂��܂�
@rem copy "Assets\Settings.Default.json" "Settings.Current.json"
@rem cls
@rem explorer /n,"%InstallDirectory%\Filters\FeatureUpdates\"
@rem explorer /n,"%InstallDirectory%\Filters\QualityUpdates\"

echo ���E�^�p�ɉ����� Settings.Current.json ���L�q���Ă�������
echo.
echo - FeatureUpdatesFilter.FileNames: ����Ń��e�[���ł�Windows 10�̋@�\�X�V�v���O������Windows 10, �o�[�W���� 1809�ȊO�̋@�\�X�V�v���O���������ۂ��܂�
echo -- %InstallDirectory%\Filters\FeatureUpdates\ �̃t�@�C������ǉ����邱�Ƃɂ��A�Ώۂ𑝂₷���Ƃ��ł��܂�
echo - QualityUpdatesFilter.FileNames: �����Windows 7 Service Pack 1 32�r�b�g��, Windows 8.1 64�r�b�g��, Windows 10, �o�[�W���� 1809 64�r�b�g�ňȊO�̕i���X�V�v���O���������ۂ��܂�
echo -- %InstallDirectory%\Filters\QualityUpdates\ �̃t�@�C������ǉ����邱�Ƃɂ��A�Ώۂ𑝂₷���Ƃ��ł��܂�
echo - IsDeclineMsOfficeUpdates: ����ł� TargetMsOfficeArchitecture �Ŏw�肵��Office�����X�V�v���O�����̋��ۂ��L���ł�
echo - TargetMsOfficeArchitecture: ����ł�64�r�b�g�ł�Office�����X�V�v���O���������ۂ���܂�
echo - ReservedFile: �ݒ�͎b�菈�u�ł��B���p�[�e�B�V�������ɂق��̃V�X�e������������ꍇ��FSRM�ɂ��N�H�[�^�[�Ȃǂ��������Ă��������B
echo.
echo.
ping localhost -n 4 > nul
notepad "Settings.Current.json"
cls

@rem SchTasks /Create /Xml "%InstallDirectory%\Assets\Task-Cleanup-WsusContents (Weekly).xml" /TN "Cleanup-WsusContents"
@rem copy /y "Wsus�R���e���c�̃N���[���A�b�v.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Wsus�R���e���c�̃N���[���A�b�v.lnk"
@rem cls

@rem echo ������s�ɂ͎��Ԃ�������ꍇ������܂��B���؂��܂߁A���炩���ߎ��s���Ă������Ƃ��������߂��܂��B
@rem ping localhost -n 4 > nul
@rem explorer /n,"%InstallDirectory%\Wsus�R���e���c�̃N���[���A�b�v.lnk"