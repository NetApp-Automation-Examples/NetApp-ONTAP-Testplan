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


*Initial Connectivity Test and Version*
real    0m2.156s
user    0m2.021s
sys     0m0.389s

**Cluster Configuration**

*Basic*
real    1m33.155s
user    0m20.262s
sys     0m3.238s

*Advanced*
real    0m31.240s
user    0m17.447s
sys     0m3.167s

*Administrative Authentication*
real    0m44.061s
user    0m15.535s
sys     0m2.384s

**SVM (Vserver) Configuration**
real    0m47.796s
user    0m16.529s
sys     0m2.952s

**NFS Storage & Export Configuration**
real    0m52.979s
user    0m17.514s
sys     0m5.329s

**SMB Storage & Share Configuration**
real    2m6.211s
user    0m37.379s
sys     0m6.984s

**Reverts**
31
real    0m35.957s
user    0m8.358s
sys     0m2.436s

32
real    1m11.672s
user    0m14.255s
sys     0m2.189s

revert-00*
real    2m1.052s
user    0m38.970s
sys     0m7.839s