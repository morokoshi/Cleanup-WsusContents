@echo off
cls
echo ���̃X�N���v�g������t�H���_�[�ƃ^�X�N���폜���܂�
pause

SchTasks /Delete /TN "Cleanup-WsusContents"
del "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Wsus�R���e���c�̃N���[���A�b�v.lnk"
rd /s /q "%~dp0"
