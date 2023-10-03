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


Initial Connectivity Test and Version
real    0m2.156s
user    0m2.021s
sys     0m0.389s

Cluster Configuration

SVM (Vserver) Configuration


NFS Export Configuration


SMB Share Configuration