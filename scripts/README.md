# NetApp ONTAP Automation Examples

To run **Ansible** install netapp-lib requests module:
`python3 -m pip install netapp-lib requests`
`python3 -m pip install ansible`
`ansible-galaxy collection install netapp.ontap`

To run **python** install netapp-ontap module:
`python3 -m pip install netapp-ontap`
`python3 scripts/volume_operations.py -h`
`python3 scripts/volume_operations.py -c cliuster1 -u admin`

To run **PowerShell** install NetApp.ONTAP module:
`Import-Module NetApp.ONTAP`
`Show-NcHelp`
`Connect-NaController cluster1 -Credential admin -HTTPS`
`get-NcCifsShareACL -vserverContent ntap-svm01-nas`