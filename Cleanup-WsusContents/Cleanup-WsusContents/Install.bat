@echo off
cls
set InstallDirectory=C:\Tools\Scripts\Wsus
echo ���̃X�N���v�g�� %InstallDirectory% �ɃR�s�[���܂�
pause

xcopy /erchy "%~dp0*" "%InstallDirectory%\"
cd /d "%InstallDirectory%\"
cls

echo ���ɐݒ�t�@�C��������ꍇ�A�㏑������Ȃ����Ƃ��������߂��܂�
copy "Assets\Settings.Default.json" "Settings.Current.json"
cls
explorer /n,"%InstallDirectory%\Filters\FeatureUpdates\
explorer /n,"%InstallDirectory%\Filters\QualityUpdates\
echo ���E�^�p�ɉ����Đݒ���L�q���Ă�������
echo .
echo - FeatureUpdatesFilter.FileNames: �����Windows 10, �o�[�W���� 1809�ȊO�̋@�\�X�V�v���O���������ۂ��܂�
echo - QualityUpdatesFilter.FileNames: �����Windows 7 Service Pack 1 32�r�b�g��, Windows 8.1 64�r�b�g��, Windows 10, �o�[�W���� 1809 64�r�b�g�ňȊO�̕i���X�V�v���O���������ۂ��܂�
echo - IsDeclineMsOfficeUpdates: ����ł� TargetMsOfficeArchitecture �Ŏw�肵��Office�����X�V�v���O�����̋��ۂ������ł�
echo - TargetMsOfficeArchitecture: ����ł�64�r�b�g�ł�Office�����X�V�v���O���������ۂ���܂�
echo - ReservedFile.Path: [�󂫗̈悪���Ȃ��Ȃ肪���Ȋ�����] WSUS�̃R���e���c�̃��[�g�f�B���N�g�����w�肵�܂�
echo - ReservedFile.Size: [�󂫗̈悪���Ȃ��Ȃ肪���Ȋ�����] ��������t�@�C���T�C�Y (�����4GB)
notepad "Settings.Current.json"
cls

SchTasks /Create /Xml "%InstallDirectory%\Assets\Task-Cleanup-WsusContents (Weekly).xml" /TN "Cleanup-WsusContents"
copy /y "Wsus�R���e���c�̃N���[���A�b�v.lnk" "%UserProfile%\Desktop\Wsus�R���e���c�̃N���[���A�b�v.lnk"
