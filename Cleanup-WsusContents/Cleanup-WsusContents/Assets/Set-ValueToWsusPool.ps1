#
# Set_ValueToWsusPool.ps1
#
#Windows Server Update Services �̃x�X�g �v���N�e�B�X
#https://support.microsoft.com/ja-jp/help/4490414/windows-server-update-services-best-practices

Import-Module WebAdministration
$Script:WsusPoolPath = "iis:\AppPools\WsusPool"

Function Set-ValueWsusPool($ItemName, $DisplayName, $NewValue){
	$BeforeValue = (Get-ItemProperty $WsusPoolPath -Name $ItemName).Value
	Set-ItemProperty $WsusPoolPath -Name ([System.String]$ItemName) -Value $NewValue
	$AfterValue = (Get-ItemProperty $WsusPoolPath -Name $ItemName).Value
	Write-Host "$DisplayName (�ύX�O: $BeforeValue, �ύX��: $AfterValue)"
}

#���T�C�N���𖳌��ɂ��A�������������\������
Set-ValueWsusPool "queueLength" "(�S��)\�L���[�̒���" 2000
Set-ValueWsusPool "processModel.idleTimeout" "�v���Z�X���f��\�A�C�h����Ԃ̃^�C���A�E�g" "0:00:00"
Set-ValueWsusPool "processModel.pingingEnabled" "�v���Z�X���f��\Ping�̗L����" $false
Set-ValueWsusPool "recycling.periodicRestart.time" "���T�C�N��\����I�Ȋ���" "0:00:00"
Set-ValueWsusPool "recycling.periodicRestart.privateMemory" "���T�C�N��\�v���C�x�[�g����������" 4000000

#recycling.periodicRestart.privateMemory�̒l�͎b��l
#��L�ɂ����Ă��x�Ⴊ����ꍇ�͑��₷�E���������݂ɂđΏ�����
#https://social.msdn.microsoft.com/Forums/ja-JP/0dc69153-1d4e-4e91-bf91-df311424a8be/12300wsus?forum=jpsccmwsus
