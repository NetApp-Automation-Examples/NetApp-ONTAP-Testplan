```shell

--> Cluster Configuration
PLAY [ONTAP-10-01 - Licenses] ******************************************************************************************************************************************************************************************************************************************************

TASK [Install licenses on storage cluster] *****************************************************************************************************************************************************************************************************************************************
skipping: [cluster1]
skipping: [cluster2]

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=0    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
cluster2                   : ok=0    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   


PLAY [ONTAP-10-02 - Physical Network] **********************************************************************************************************************************************************************************************************************************************

TASK [Create broadcast domains on storage cluster] *********************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=bc_data)
changed: [cluster2] => (item=bc_data)

TASK [Create interface groups on storage cluster] **********************************************************************************************************************************************************************************************************************************
changed: [cluster2] => (item=cluster2-01:a0a)
changed: [cluster1] => (item=cluster1-01:a0a)
changed: [cluster2] => (item=cluster2-02:a0a)
changed: [cluster1] => (item=cluster1-02:a0a)

TASK [Configure default network route on storage cluster] **************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
cluster2                   : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

[WARNING]: While constructing a mapping from /root/NetApp-ONTAP-Testplan/playbooks/ONTAP-10-03.yml, line 40, column 7, found a duplicate dict key (use_rest). Using last defined value only.

PLAY [ONTAP-10-03 - Network Services] **********************************************************************************************************************************************************************************************************************************************

TASK [Create DNS config on storage cluster] ****************************************************************************************************************************************************************************************************************************************
[WARNING]: With version 22.0.0 ONTAPI (ZAPI) has been deprecated. The final ONTAP version to support ZAPI is ONTAP 9.13.1.  ZAPI calls in these modules will continue to work for ONTAP versions that supports ZAPI.  You can update your playbook to use REST by adding use_rest:
always to your playbook.  More information can be found at: https://github.com/ansible-collections/netapp.ontap
changed: [cluster1]
changed: [cluster2]

TASK [Create NTP server on storage cluster] ****************************************************************************************************************************************************************************************************************************************
changed: [cluster2] => (item=0.us.pool.ntp.org)
changed: [cluster1] => (item=0.us.pool.ntp.org)
FAILED - RETRYING: [cluster2]: Create NTP server on storage cluster (5 retries left).
FAILED - RETRYING: [cluster1]: Create NTP server on storage cluster (5 retries left).
changed: [cluster2] => (item=1.us.pool.ntp.org)
changed: [cluster1] => (item=1.us.pool.ntp.org)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=5    changed=4    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
cluster2                   : ok=5    changed=4    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   


PLAY [ONTAP-10-04 - Storage Aggregates] ********************************************************************************************************************************************************************************************************************************************

TASK [Create data aggregates on storage cluster] ***********************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=cluster1-01:cluster1_01_aggr01)
changed: [cluster2] => (item=cluster2-01:cluster2_01_aggr01)
changed: [cluster1] => (item=cluster1-02:cluster1_02_aggr01)
changed: [cluster2] => (item=cluster2-02:cluster2_02_aggr01)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=6    changed=5    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
cluster2                   : ok=6    changed=5    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   


PLAY [ONTAP-10-05 - AutoSupport] ***************************************************************************************************************************************************************************************************************************************************

TASK [Send Test AutoSupport (Call Home)] *******************************************************************************************************************************************************************************************************************************************
changed: [cluster2]
changed: [cluster1]

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=7    changed=6    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
cluster2                   : ok=7    changed=6    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   


PLAY [ONTAP-11-01 - Cluster/Node Parameters] ***************************************************************************************************************************************************************************************************************************************

TASK [Set timezone on storage cluster] *********************************************************************************************************************************************************************************************************************************************
changed: [cluster1]
changed: [cluster2]

TASK [Create login banner and message of the day (MOTD) on storage cluster] ********************************************************************************************************************************************************************************************************
changed: [cluster1] => (item={'banner': '################ TEST BANNER ################\n# This system is currently in testing state #\n#############################################\n', 'scope': 'cluster', 'message': 'Welcome! Please note:\nThis system is not ready for production yet!\n'})
changed: [cluster2] => (item={'banner': '################ TEST BANNER ################\n# This system is currently in testing state #\n#############################################\n', 'scope': 'cluster', 'message': 'Welcome! Please note:\nThis system is not ready for production yet!\n'})

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=9    changed=8    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
cluster2                   : ok=9    changed=8    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

[WARNING]: While constructing a mapping from /root/NetApp-ONTAP-Testplan/playbooks/ONTAP-11-02.yml, line 18, column 3, found a duplicate dict key (post_tasks). Using last defined value only.

PLAY [ONTAP-11-02 - Administrative Domain Authentication] **************************************************************************************************************************************************************************************************************************

TASK [Check if any domain tunnel exists] *******************************************************************************************************************************************************************************************************************************************
fatal: [cluster2]: FAILED! => {"changed": false, "msg": {"code": "4", "message": "entry doesn't exist"}}
...ignoring
fatal: [cluster1]: FAILED! => {"changed": false, "msg": {"code": "4", "message": "entry doesn't exist"}}
...ignoring

TASK [Show all domain tunnel svms] *************************************************************************************************************************************************************************************************************************************************
skipping: [cluster1]
skipping: [cluster2]

TASK [Create SVM for domain tunnel (proxy)] ****************************************************************************************************************************************************************************************************************************************
changed: [cluster2] => (item={'name': 'cluster2_ad', 'dns': {'domains': ['demo.netapp.com'], 'servers': ['192.168.0.253']}, 'ipspace': {'name': 'Default'}, 'nfs': {'allowed': False}, 'cifs': {'allowed': True}, 'iscsi': {'allowed': False}, 'fcp': {'allowed': False}, 'ndmp': {'allowed': False}, 'nvme': {'allowed': False}, 'language': 'utf8mb4', 'comment': 'This is the tunnel SVM for cluster AD authentication'})
skipping: [cluster2] => (item={'name': 'ntap-svm03-backup', 'dns': {'domains': ['demo.netapp.com'], 'servers': ['192.168.0.253']}, 'auto_enable_analytics': True, 'auto_enable_activity_tracking': True, 'ipspace': {'name': 'Default'}, 'nfs': {'allowed': True, 'enabled': True}, 'cifs': {'allowed': True}, 'iscsi': {'allowed': False}, 'fcp': {'allowed': False}, 'ndmp': {'allowed': False}, 'nvme': {'allowed': False}, 'language': 'utf8mb4', 'comment': 'This is the primary backup SVM for testing'}) 
changed: [cluster1] => (item={'name': 'cluster1_ad', 'dns': {'domains': ['demo.netapp.com'], 'servers': ['192.168.0.253']}, 'ipspace': {'name': 'Default'}, 'nfs': {'allowed': False}, 'cifs': {'allowed': True}, 'iscsi': {'allowed': False}, 'fcp': {'allowed': False}, 'ndmp': {'allowed': False}, 'nvme': {'allowed': False}, 'language': 'utf8mb4', 'comment': 'This is the tunnel SVM for cluster AD authentication'})
skipping: [cluster1] => (item={'name': 'ntap-svm01-nas', 'dns': {'domains': ['demo.netapp.com'], 'servers': ['192.168.0.253']}, 'auto_enable_analytics': True, 'auto_enable_activity_tracking': True, 'ipspace': {'name': 'Default'}, 'nfs': {'allowed': True}, 'cifs': {'allowed': True}, 'iscsi': {'allowed': False}, 'fcp': {'allowed': False}, 'ndmp': {'allowed': False}, 'nvme': {'allowed': False}, 'language': 'utf8mb4', 'comment': 'This is the first SVM for NAS testing'}) 
skipping: [cluster1] => (item={'name': 'ntap-svm02-san', 'dns': {'domains': ['demo.netapp.com'], 'servers': ['192.168.0.253']}, 'auto_enable_analytics': True, 'auto_enable_activity_tracking': True, 'ipspace': {'name': 'Default'}, 'nfs': {'allowed': False}, 'cifs': {'allowed': True}, 'iscsi': {'allowed': True}, 'fcp': {'allowed': False}, 'ndmp': {'allowed': False}, 'nvme': {'allowed': False}, 'language': 'utf8mb4', 'comment': 'This is the second SVM for SAN testing'}) 

TASK [Create network interfaces on proxy SVM] **************************************************************************************************************************************************************************************************************************************
changed: [cluster2] => (item={'name': 'cluster2_ad', 'scope': 'svm', 'svm': {'name': 'cluster2_ad'}, 'ip': {'netmask': '24', 'address': '192.168.0.220', 'family': 'ipv4'}, 'location': {'home_node': {'name': 'cluster2-01'}, 'home_port': {'name': 'e0c'}, 'auto_revert': True}, 'service_policy': {'name': 'default-management'}})
changed: [cluster1] => (item={'name': 'cluster1_ad', 'scope': 'svm', 'svm': {'name': 'cluster1_ad'}, 'ip': {'netmask': '24', 'address': '192.168.0.210', 'family': 'ipv4'}, 'location': {'home_node': {'name': 'cluster1-01'}, 'home_port': {'name': 'e0c'}, 'auto_revert': True}, 'service_policy': {'name': 'default-management'}})
skipping: [cluster2] => (item={'name': 'ntap-svm03-backup', 'scope': 'svm', 'svm': {'name': 'ntap-svm03-backup'}, 'ip': {'netmask': '24', 'address': '192.168.0.221', 'family': 'ipv4'}, 'location': {'home_node': {'name': 'cluster2-01'}, 'home_port': {'name': 'e0c'}, 'auto_revert': True}, 'service_policy': {'name': 'default-data-files'}}) 
skipping: [cluster1] => (item={'name': 'ntap-svm01-nas', 'scope': 'svm', 'svm': {'name': 'ntap-svm01-nas'}, 'ip': {'netmask': '24', 'address': '192.168.0.211', 'family': 'ipv4'}, 'location': {'home_node': {'name': 'cluster1-01'}, 'home_port': {'name': 'e0c'}, 'auto_revert': True}, 'service_policy': {'name': 'default-data-files'}}) 
skipping: [cluster2] => (item={'name': 'cluster2-01_ic01', 'scope': 'cluster', 'ip': {'netmask': '24', 'address': '192.168.0.123', 'family': 'ipv4'}, 'location': {'home_node': {'name': 'cluster2-01'}, 'home_port': {'name': 'e0c'}, 'auto_revert': True}, 'service_policy': {'name': 'default-intercluster'}}) 
skipping: [cluster2] => (item={'name': 'cluster2-02_ic01', 'scope': 'cluster', 'ip': {'netmask': '24', 'address': '192.168.0.124', 'family': 'ipv4'}, 'location': {'home_node': {'name': 'cluster2-02'}, 'home_port': {'name': 'e0c'}, 'auto_revert': True}, 'service_policy': {'name': 'default-intercluster'}}) 
skipping: [cluster1] => (item={'name': 'ntap-svm02-san', 'scope': 'svm', 'svm': {'name': 'ntap-svm02-san'}, 'ip': {'netmask': '24', 'address': '192.168.0.212', 'family': 'ipv4'}, 'location': {'home_node': {'name': 'cluster1-02'}, 'home_port': {'name': 'e0c'}, 'auto_revert': True}, 'service_policy': {'name': 'default-data-files'}}) 
skipping: [cluster1] => (item={'name': 'cluster1-01_ic01', 'scope': 'cluster', 'ip': {'netmask': '24', 'address': '192.168.0.121', 'family': 'ipv4'}, 'location': {'home_node': {'name': 'cluster1-01'}, 'home_port': {'name': 'e0c'}, 'auto_revert': True}, 'service_policy': {'name': 'default-intercluster'}}) 
skipping: [cluster1] => (item={'name': 'cluster1-02_ic01', 'scope': 'cluster', 'ip': {'netmask': '24', 'address': '192.168.0.122', 'family': 'ipv4'}, 'location': {'home_node': {'name': 'cluster1-02'}, 'home_port': {'name': 'e0c'}, 'auto_revert': True}, 'service_policy': {'name': 'default-intercluster'}}) 

TASK [Configure default route on proxy SVM] ****************************************************************************************************************************************************************************************************************************************
skipping: [cluster1]
skipping: [cluster2]

TASK [Configure DNS on proxy SVM] **************************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item={'name': 'cluster1_ad', 'dns': {'domains': ['demo.netapp.com'], 'servers': ['192.168.0.253']}, 'ipspace': {'name': 'Default'}, 'nfs': {'allowed': False}, 'cifs': {'allowed': True}, 'iscsi': {'allowed': False}, 'fcp': {'allowed': False}, 'ndmp': {'allowed': False}, 'nvme': {'allowed': False}, 'language': 'utf8mb4', 'comment': 'This is the tunnel SVM for cluster AD authentication'})
skipping: [cluster1] => (item={'name': 'ntap-svm01-nas', 'dns': {'domains': ['demo.netapp.com'], 'servers': ['192.168.0.253']}, 'auto_enable_analytics': True, 'auto_enable_activity_tracking': True, 'ipspace': {'name': 'Default'}, 'nfs': {'allowed': True}, 'cifs': {'allowed': True}, 'iscsi': {'allowed': False}, 'fcp': {'allowed': False}, 'ndmp': {'allowed': False}, 'nvme': {'allowed': False}, 'language': 'utf8mb4', 'comment': 'This is the first SVM for NAS testing'}) 
skipping: [cluster1] => (item={'name': 'ntap-svm02-san', 'dns': {'domains': ['demo.netapp.com'], 'servers': ['192.168.0.253']}, 'auto_enable_analytics': True, 'auto_enable_activity_tracking': True, 'ipspace': {'name': 'Default'}, 'nfs': {'allowed': False}, 'cifs': {'allowed': True}, 'iscsi': {'allowed': True}, 'fcp': {'allowed': False}, 'ndmp': {'allowed': False}, 'nvme': {'allowed': False}, 'language': 'utf8mb4', 'comment': 'This is the second SVM for SAN testing'}) 
changed: [cluster2] => (item={'name': 'cluster2_ad', 'dns': {'domains': ['demo.netapp.com'], 'servers': ['192.168.0.253']}, 'ipspace': {'name': 'Default'}, 'nfs': {'allowed': False}, 'cifs': {'allowed': True}, 'iscsi': {'allowed': False}, 'fcp': {'allowed': False}, 'ndmp': {'allowed': False}, 'nvme': {'allowed': False}, 'language': 'utf8mb4', 'comment': 'This is the tunnel SVM for cluster AD authentication'})
skipping: [cluster2] => (item={'name': 'ntap-svm03-backup', 'dns': {'domains': ['demo.netapp.com'], 'servers': ['192.168.0.253']}, 'auto_enable_analytics': True, 'auto_enable_activity_tracking': True, 'ipspace': {'name': 'Default'}, 'nfs': {'allowed': True, 'enabled': True}, 'cifs': {'allowed': True}, 'iscsi': {'allowed': False}, 'fcp': {'allowed': False}, 'ndmp': {'allowed': False}, 'nvme': {'allowed': False}, 'language': 'utf8mb4', 'comment': 'This is the primary backup SVM for testing'}) 

TASK [Create active directory preferred domain controllers] ************************************************************************************************************************************************************************************************************************
skipping: [cluster2] => (item=ntap-svm03-backup) 
skipping: [cluster2]
changed: [cluster1] => (item=cluster1_ad)
skipping: [cluster1] => (item=ntap-svm01-nas) 

TASK [Create CIFS server on SVMs] **************************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item={'name': 'cluster1_ad', 'svm': {'name': 'cluster1_ad'}, 'ad_domain': {'fqdn': 'demo.netapp.com', 'organizational_unit': 'OU=Storage,DC=DEMO,DC=NETAPP,DC=COM'}, 'comment': 'This CIFS Server is for cluster AD authentication', 'enabled': True})
changed: [cluster2] => (item={'name': 'cluster2_ad', 'svm': {'name': 'cluster2_ad'}, 'ad_domain': {'fqdn': 'demo.netapp.com', 'organizational_unit': 'OU=Storage,DC=DEMO,DC=NETAPP,DC=COM'}, 'comment': 'This CIFS Server is for cluster AD authentication', 'enabled': True})
skipping: [cluster2] => (item={'name': 'svm03-backup', 'svm': {'name': 'ntap-svm03-backup'}, 'ad_domain': {'fqdn': 'demo.netapp.com', 'organizational_unit': 'OU=Storage,DC=DEMO,DC=NETAPP,DC=COM'}, 'comment': 'This CIFS Server is the default NAS backup location', 'enabled': True}) 
skipping: [cluster1] => (item={'name': 'svm01-nas', 'svm': {'name': 'ntap-svm01-nas'}, 'ad_domain': {'fqdn': 'demo.netapp.com', 'organizational_unit': 'OU=Storage,DC=DEMO,DC=NETAPP,DC=COM'}, 'comment': 'This CIFS Server is created for the primary NAS SVM', 'enabled': True}) 
skipping: [cluster1] => (item={'name': 'svm02-san', 'svm': {'name': 'ntap-svm02-san'}, 'ad_domain': {'fqdn': 'demo.netapp.com', 'organizational_unit': 'OU=Storage,DC=DEMO,DC=NETAPP,DC=COM'}, 'comment': 'This CIFS Server is created for the primary SAN SVM', 'enabled': True}) 

TASK [Patch additional SVM CIFS parameters - comment] ******************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=cluster1_ad)
changed: [cluster2] => (item=cluster2_ad)
skipping: [cluster2] => (item=ntap-svm03-backup) 
skipping: [cluster1] => (item=ntap-svm01-nas) 
skipping: [cluster1] => (item=ntap-svm02-san) 

TASK [Create domain tunnel for cluster AD authentication] **************************************************************************************************************************************************************************************************************************
changed: [cluster2]
changed: [cluster1]

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=17   changed=15   unreachable=0    failed=0    skipped=3    rescued=0    ignored=1   
cluster2                   : ok=16   changed=14   unreachable=0    failed=0    skipped=4    rescued=0    ignored=1   


PLAY [ONTAP-11-03 - Key Manager] ***************************************************************************************************************************************************************************************************************************************************

TASK [Configure onboard Key Manager] ***********************************************************************************************************************************************************************************************************************************************
changed: [cluster1]
changed: [cluster2]

TASK [Get all non-root aggregates] *************************************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Enable aggregate encryption on all aggregates] *******************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=cluster1_01_aggr01)
changed: [cluster2] => (item=cluster2_01_aggr01)
changed: [cluster1] => (item=cluster1_02_aggr01)
changed: [cluster2] => (item=cluster2_02_aggr01)

TASK [Get key manager configuration and backup] ************************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Display key manager configuration and backup] ********************************************************************************************************************************************************************************************************************************
ok: [cluster1] => {
    "msg": [
        [
            {
                "_links": {
                    "self": {
                        "href": "/api/security/key-managers/b3d1bd96-6de7-11ee-941c-00505685a7b2"
                    }
                },
                "is_default_data_at_rest_encryption_disabled": false,
                "onboard": {
                    "enabled": true,
                    "key_backup": "--------------------------BEGIN BACKUP--------------------------TmV0QXBwIEtleSBCbG9iAAEBAAAEAAAAcAEAAAAAAAAKLXPpAAAAACEAAAAAAAAAQAAAAAAAAACOjcCjAAAAAFZRkua55vU05QMQ2OaJei0986Y11JkecbivvDzjKjtmosQd0bNVaGuE4OJ9tUWDrmxhZHjtVgg9BImYHgUtKDAiAAAAAAAAACgAAAAAAAAA3WTh7gAAAAAAAAAAAAAAAAIAAAAAAAgAZJEIWvdeHr5RCAvHGclo+wAAAAAAAAAAIgAAAAAAAAAoAAAAAAAAAEOTcR0AAAAAAAAAAAAAAAACAAAAAAAJAGr3tJA/LRzUQRHwv+1aWvAAAAAAAAAAACQAAAAAAAAAgAAAAAAAAAB/M2QDAAAAAPFHGzwLwDLvp57yvvMt/TMdoMyiAwDXLtxc7pCkTO2kZ6xl3MoWjj4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABOZXRBcHAgS2V5IEJsb2IAAQEAAAMAAAAYAQAAAAAAAPNyvOcAAAAAIgAAAAAAAAAoAAAAAAAAAEOTcR0AAAAAAAAAAAAAAAACAAAAAAAJAGr3tJA/LRzUQRHwv+1aWvAAAAAAAAAAACIAAAAAAAAAKAAAAAAAAACozjurAAAAAAAAAAAAAAAAAgAAAAAAAQCYYLivFgphVqLClrRfBCe1AAAAAAAAAAAkAAAAAAAAAIAAAAAAAAAASPcYvQAAAAAPPRaVkmix08y0MIVKdGOdPUayj4P0p2zz9DDvsiH74ecMyaUIU3rpAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAE5ldEFwcCBLZXkgQmxvYgABAQAAAwAAABgBAAAAAAAAtND67gAAAAAiAAAAAAAAACgAAAAAAAAAQ5NxHQAAAAAAAAAAAAAAAAIAAAAAAAkAave0kD8tHNRBEfC/7Vpa8AAAAAAAAAAAIgAAAAAAAAAoAAAAAAAAAFhsvrwAAAAAAAAAAAAAAAACAAAAAAABALVYiRzozKuv/sYosvygx1QAAAAAAAAAACQAAAAAAAAAgAAAAAAAAABgptQpAAAAAEnmMOMuk32x3YoyatE4OB0fCWb952KBhcPtufmbn/LZ0voVATz/ds4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA---------------------------END BACKUP---------------------------"
                },
                "scope": "cluster",
                "uuid": "b3d1bd96-6de7-11ee-941c-00505685a7b2",
                "volume_encryption": {
                    "code": 0,
                    "message": "",
                    "supported": true
                }
            }
        ]
    ]
}
ok: [cluster2] => {
    "msg": [
        [
            {
                "_links": {
                    "self": {
                        "href": "/api/security/key-managers/b3d15e3f-6de7-11ee-a529-005056852224"
                    }
                },
                "is_default_data_at_rest_encryption_disabled": false,
                "onboard": {
                    "enabled": true,
                    "key_backup": "--------------------------BEGIN BACKUP--------------------------TmV0QXBwIEtleSBCbG9iAAEBAAAEAAAAcAEAAAAAAAAQ8e3gAAAAACEAAAAAAAAAQAAAAAAAAABlbEGpAAAAAIjdpyhPxNovqM2cbPXAqWw93G3P9Jy2aqDdinLqBxz2DMNQzJ4owpUubRhWHJay9+Du+3emiCiv1qF2fPYzC6giAAAAAAAAACgAAAAAAAAA3WTh7gAAAAAAAAAAAAAAAAIAAAAAAAgAZJEIWvdeHr5RCAvHGclo+wAAAAAAAAAAIgAAAAAAAAAoAAAAAAAAAEOTcR0AAAAAAAAAAAAAAAACAAAAAAAJAGr3tJA/LRzUQRHwv+1aWvAAAAAAAAAAACQAAAAAAAAAgAAAAAAAAAAvaSWUAAAAAN9hUEG9HNfOSScNBSt4u+3LOkweBGzLPHNwMO2HqkXIZG52axmcdmEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABOZXRBcHAgS2V5IEJsb2IAAQEAAAMAAAAYAQAAAAAAAACS6dwAAAAAIgAAAAAAAAAoAAAAAAAAAEOTcR0AAAAAAAAAAAAAAAACAAAAAAAJAGr3tJA/LRzUQRHwv+1aWvAAAAAAAAAAACIAAAAAAAAAKAAAAAAAAAAgIuT3AAAAAAAAAAAAAAAAAgAAAAAAAQBB1cmKXrN5yd+61QDa7VYYAAAAAAAAAAAkAAAAAAAAAIAAAAAAAAAAKfRJugAAAAAgayOzMrs+Exa80VOEBIIk+lSjI0+olEUbssn1UtZmOoQD02PinHSFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAE5ldEFwcCBLZXkgQmxvYgABAQAAAwAAABgBAAAAAAAA/7Bm+AAAAAAiAAAAAAAAACgAAAAAAAAAQ5NxHQAAAAAAAAAAAAAAAAIAAAAAAAkAave0kD8tHNRBEfC/7Vpa8AAAAAAAAAAAIgAAAAAAAAAoAAAAAAAAAG2uXeoAAAAAAAAAAAAAAAACAAAAAAABAL9BSa4VBPqhuieSZNK2+IUAAAAAAAAAACQAAAAAAAAAgAAAAAAAAACcJ0MfAAAAAHYfv7K8v2GnE/EO5Nr55I/6xIYhzIl2AuKIfCTfOFvXUp+yz7cck3IAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA---------------------------END BACKUP---------------------------"
                },
                "scope": "cluster",
                "uuid": "b3d15e3f-6de7-11ee-a529-005056852224",
                "volume_encryption": {
                    "code": 0,
                    "message": "",
                    "supported": true
                }
            }
        ]
    ]
}

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=22   changed=17   unreachable=0    failed=0    skipped=3    rescued=0    ignored=1   
cluster2                   : ok=21   changed=16   unreachable=0    failed=0    skipped=4    rescued=0    ignored=1   


PLAY [ONTAP-12-01 - Read-only Local User] ******************************************************************************************************************************************************************************************************************************************

TASK [Create local users with read-only privileges] ********************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=na_local_admin) 
skipping: [cluster2] => (item=na_local_admin) 
changed: [cluster2] => (item=na_local_ro)
skipping: [cluster2] => (item=DEMO\na_ad_admin_group) 
skipping: [cluster2] => (item=DEMO\na_ad_ro_group) 
changed: [cluster1] => (item=na_local_ro)
skipping: [cluster1] => (item=DEMO\na_ad_admin_group) 
skipping: [cluster1] => (item=DEMO\na_ad_ro_group) 

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=23   changed=18   unreachable=0    failed=0    skipped=3    rescued=0    ignored=1   
cluster2                   : ok=22   changed=17   unreachable=0    failed=0    skipped=4    rescued=0    ignored=1   


PLAY [ONTAP-12-02 - Administrative Local User] *************************************************************************************************************************************************************************************************************************************

TASK [Create local users with read-only privileges] ********************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=na_local_admin)
skipping: [cluster1] => (item=na_local_ro) 
skipping: [cluster1] => (item=DEMO\na_ad_admin_group) 
skipping: [cluster1] => (item=DEMO\na_ad_ro_group) 
changed: [cluster2] => (item=na_local_admin)
skipping: [cluster2] => (item=na_local_ro) 
skipping: [cluster2] => (item=DEMO\na_ad_admin_group) 
skipping: [cluster2] => (item=DEMO\na_ad_ro_group) 

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=24   changed=19   unreachable=0    failed=0    skipped=3    rescued=0    ignored=1   
cluster2                   : ok=23   changed=18   unreachable=0    failed=0    skipped=4    rescued=0    ignored=1   


PLAY [ONTAP-12-03 - Local User Access] *********************************************************************************************************************************************************************************************************************************************

TASK [Create test SVM with read-only account] **************************************************************************************************************************************************************************************************************************************
fatal: [cluster2]: FAILED! => {"changed": false, "msg": "Error in create: calling: svm/svms: got {'message': 'not authorized for that command', 'code': '6'}."}
fatal: [cluster1]: FAILED! => {"changed": false, "msg": "Error in create: calling: svm/svms: got {'message': 'not authorized for that command', 'code': '6'}."}

TASK [Printing rescue message - Expected error] ************************************************************************************************************************************************************************************************************************************
ok: [cluster1] => {
    "msg": [
        "This error was expected",
        "RO user na_local_ro cannot create ressources on the cluster"
    ]
}
ok: [cluster2] => {
    "msg": [
        "This error was expected",
        "RO user na_local_ro cannot create ressources on the cluster"
    ]
}

TASK [Printing rescue message - Unexpected error] **********************************************************************************************************************************************************************************************************************************
skipping: [cluster1]
skipping: [cluster2]

TASK [Create test SVM with admin account] ******************************************************************************************************************************************************************************************************************************************
changed: [cluster1]
changed: [cluster2]

TASK [Clean-up test SVM with admin account] ****************************************************************************************************************************************************************************************************************************************
changed: [cluster1]
changed: [cluster2]

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=27   changed=21   unreachable=0    failed=0    skipped=4    rescued=1    ignored=1   
cluster2                   : ok=26   changed=20   unreachable=0    failed=0    skipped=5    rescued=1    ignored=1   


PLAY [ONTAP-12-04 - Read-only Domain Group] ****************************************************************************************************************************************************************************************************************************************

TASK [Assign domain group read-only privileges on cluster] *************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=na_local_admin) 
skipping: [cluster2] => (item=na_local_admin) 
skipping: [cluster1] => (item=na_local_ro) 
skipping: [cluster1] => (item=DEMO\na_ad_admin_group) 
skipping: [cluster2] => (item=na_local_ro) 
skipping: [cluster2] => (item=DEMO\na_ad_admin_group) 
changed: [cluster1] => (item=DEMO\na_ad_ro_group)
changed: [cluster2] => (item=DEMO\na_ad_ro_group)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=28   changed=22   unreachable=0    failed=0    skipped=4    rescued=1    ignored=1   
cluster2                   : ok=27   changed=21   unreachable=0    failed=0    skipped=5    rescued=1    ignored=1   


PLAY [ONTAP-12-05 - Administrative Domain Group] ***********************************************************************************************************************************************************************************************************************************

TASK [Create local users with read-only privileges] ********************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=na_local_admin) 
skipping: [cluster1] => (item=na_local_ro) 
skipping: [cluster2] => (item=na_local_admin) 
skipping: [cluster2] => (item=na_local_ro) 
changed: [cluster1] => (item=DEMO\na_ad_admin_group)
skipping: [cluster1] => (item=DEMO\na_ad_ro_group) 
changed: [cluster2] => (item=DEMO\na_ad_admin_group)
skipping: [cluster2] => (item=DEMO\na_ad_ro_group) 

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=29   changed=23   unreachable=0    failed=0    skipped=4    rescued=1    ignored=1   
cluster2                   : ok=28   changed=22   unreachable=0    failed=0    skipped=5    rescued=1    ignored=1   


PLAY [ONTAP-04-06 - Domain User Access] ********************************************************************************************************************************************************************************************************************************************

TASK [Create test SVM with read-only account] **************************************************************************************************************************************************************************************************************************************
fatal: [cluster1]: FAILED! => {"changed": false, "msg": "Error in create: calling: svm/svms: got {'message': 'not authorized for that command', 'code': '6'}."}
fatal: [cluster2]: FAILED! => {"changed": false, "msg": "Error in create: calling: svm/svms: got {'message': 'not authorized for that command', 'code': '6'}."}

TASK [Printing rescue message - Expected error] ************************************************************************************************************************************************************************************************************************************
ok: [cluster1] => {
    "msg": [
        "This error was expected",
        "RO user DEMO\\na_ad_ro_user cannot create ressources on the cluster"
    ]
}
ok: [cluster2] => {
    "msg": [
        "This error was expected",
        "RO user DEMO\\na_ad_ro_user cannot create ressources on the cluster"
    ]
}

TASK [Printing rescue message - Unexpected error] **********************************************************************************************************************************************************************************************************************************
skipping: [cluster1]
skipping: [cluster2]

TASK [Create test SVM with admin account] ******************************************************************************************************************************************************************************************************************************************
changed: [cluster1]
changed: [cluster2]

TASK [Clean-up test SVM with admin account] ****************************************************************************************************************************************************************************************************************************************
changed: [cluster1]
changed: [cluster2]

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=32   changed=25   unreachable=0    failed=0    skipped=5    rescued=2    ignored=1   
cluster2                   : ok=31   changed=24   unreachable=0    failed=0    skipped=6    rescued=2    ignored=1   


PLAY [TAP-12-10 - Admin Multifactor Authentication] ********************************************************************************************************************************************************************************************************************************

TASK [Create local testuser with read-only account] ********************************************************************************************************************************************************************************************************************************
skipping: [cluster1]
skipping: [cluster2]

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=32   changed=25   unreachable=0    failed=0    skipped=6    rescued=2    ignored=1   
cluster2                   : ok=31   changed=24   unreachable=0    failed=0    skipped=7    rescued=2    ignored=1   


real    2m13.268s
user    0m49.144s
sys     0m7.429s


--> Data Storage Virtual Machine(SVM) Configuration

PLAY [ONTAP-20-01 - Storage Virtual Machines (SVMs)] *******************************************************************************************************************************************************************************************************************************

TASK [Create all SVMs for testing"] ************************************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=cluster1_ad) 
changed: [cluster1] => (item=ntap-svm01-nas)
changed: [cluster1] => (item=ntap-svm02-san)

TASK [Patch additional SVM parameters - auto_enable_analytics] *********************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=cluster1_ad) 
changed: [cluster1] => (item=ntap-svm01-nas)
changed: [cluster1] => (item=ntap-svm02-san)

TASK [Patch additional SVM parameters - auto_enable_activity_tracking] *************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=cluster1_ad) 
changed: [cluster1] => (item=ntap-svm01-nas)
changed: [cluster1] => (item=ntap-svm02-san)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=3    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-20-02 - SVM Logical Network] *******************************************************************************************************************************************************************************************************************************************

TASK [Create network interfaces on test SVMs] **************************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=cluster1_ad) 
changed: [cluster1] => (item=ntap-svm01-nas)
changed: [cluster1] => (item=ntap-svm02-san)
skipping: [cluster1] => (item=cluster1-01_ic01) 
skipping: [cluster1] => (item=cluster1-02_ic01) 

TASK [Configure default route on test SVMs] ****************************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=cluster1_ad) 
changed: [cluster1] => (item=ntap-svm01-nas)
changed: [cluster1] => (item=ntap-svm02-san)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=5    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-20-03 - SVM Network Services] ******************************************************************************************************************************************************************************************************************************************

TASK [Configure DNS on test SVMs] **************************************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=cluster1_ad) 
changed: [cluster1] => (item=ntap-svm01-nas)
changed: [cluster1] => (item=ntap-svm02-san)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=6    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-20-04 - SVM Data Protocol Setup] ***************************************************************************************************************************************************************************************************************************************

TASK [Configure NFS service on SVMs] ***********************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ntap-svm01-nas)

TASK [Patch additional SVM NFS parameters - v3-64bit-identifiers] ******************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ntap-svm01-nas)

TASK [Patch additional SVM NFS parameters - v4-64bit-identifiers] ******************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ntap-svm01-nas)

TASK [Create active directory preferred domain controllers] ************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=cluster1_ad) 
changed: [cluster1] => (item=ntap-svm01-nas)

TASK [Create CIFS server on SVMs] **************************************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=cluster1_ad) 
changed: [cluster1] => (item=svm01-nas)
changed: [cluster1] => (item=svm02-san)

TASK [Patch additional SVM CIFS parameters - comment] ******************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=cluster1_ad) 
changed: [cluster1] => (item=ntap-svm01-nas)
changed: [cluster1] => (item=ntap-svm02-san)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=12   changed=12   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


real    0m40.392s
user    0m14.625s
sys     0m2.079s


--> NAS Provisioning - Standard NFS Exports & SMB Shares

PLAY [ONTAP-31-01 - Export Policies & Rules] ***************************************************************************************************************************************************************************************************************************************

TASK [Create read-only export policy] **********************************************************************************************************************************************************************************************************************************************
changed: [cluster1]

TASK [Create read-only export policy rules for SVM root volume] ********************************************************************************************************************************************************************************************************************
changed: [cluster1]

TASK [Apply read-only export policy to SVM's root volume] **************************************************************************************************************************************************************************************************************************
changed: [cluster1]

TASK [Create read-write export policy] *********************************************************************************************************************************************************************************************************************************************
changed: [cluster1]

TASK [Create read-write export policy rules for SVM root volume] *******************************************************************************************************************************************************************************************************************
changed: [cluster1]

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=5    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-31-02 - Volumes & Qtrees] **********************************************************************************************************************************************************************************************************************************************

TASK [Create volume] ***************************************************************************************************************************************************************************************************************************************************************
[WARNING]: Cannot perform actions: modify when volume is offline.
changed: [cluster1]

TASK [Create qtrees] ***************************************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_31_vol_qt01)
changed: [cluster1] => (item=ontap_31_vol_qt02)
changed: [cluster1] => (item=ontap_31_vol_qt03)
changed: [cluster1] => (item=ontap_31_vol_qt04)
changed: [cluster1] => (item=ontap_31_vol_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
cluster1                   : ok=7    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-31-03 - Mount & Write (Volumes)] ***************************************************************************************************************************************************************************************************************************************

TASK [Ensure stale mounts are removed before proceding (in case a mount exists)] ***************************************************************************************************************************************************************************************************
ok: [centos1] => (item=ontap_31_vol_qt01)
ok: [centos1] => (item=ontap_31_vol_qt02)
ok: [centos1] => (item=ontap_31_vol_qt03)
ok: [centos1] => (item=ontap_31_vol_qt04)
ok: [centos1] => (item=ontap_31_vol_qt05)

TASK [Create mount directories] ****************************************************************************************************************************************************************************************************************************************************
changed: [centos1] => (item=ontap_31_vol_qt01)
changed: [centos1] => (item=ontap_31_vol_qt02)
changed: [centos1] => (item=ontap_31_vol_qt03)
changed: [centos1] => (item=ontap_31_vol_qt04)
changed: [centos1] => (item=ontap_31_vol_qt05)

TASK [Mount NFS export on Linux host] **********************************************************************************************************************************************************************************************************************************************
changed: [centos1] => (item=ontap_31_vol_qt01)
changed: [centos1] => (item=ontap_31_vol_qt02)
changed: [centos1] => (item=ontap_31_vol_qt03)
changed: [centos1] => (item=ontap_31_vol_qt04)
changed: [centos1] => (item=ontap_31_vol_qt05)

TASK [Create test file on each export] *********************************************************************************************************************************************************************************************************************************************
changed: [centos1] => (item=ontap_31_vol_qt01)
changed: [centos1] => (item=ontap_31_vol_qt02)
changed: [centos1] => (item=ontap_31_vol_qt03)
changed: [centos1] => (item=ontap_31_vol_qt04)
changed: [centos1] => (item=ontap_31_vol_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
cluster1                   : ok=7    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-31-04 - FlexGroup & Qtrees] ********************************************************************************************************************************************************************************************************************************************

TASK [Create FlexGroup] ************************************************************************************************************************************************************************************************************************************************************
changed: [cluster1]

TASK [Create qtrees] ***************************************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_31_fg_qt01)
changed: [cluster1] => (item=ontap_31_fg_qt02)
changed: [cluster1] => (item=ontap_31_fg_qt03)
changed: [cluster1] => (item=ontap_31_fg_qt04)
changed: [cluster1] => (item=ontap_31_fg_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
cluster1                   : ok=9    changed=9    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-31-05 - Mount & Write (FlexGroups)] ************************************************************************************************************************************************************************************************************************************

TASK [Ensure stale mounts are removed before proceding (in case a mount exists)] ***************************************************************************************************************************************************************************************************
ok: [centos1] => (item=ontap_31_fg_qt01)
ok: [centos1] => (item=ontap_31_fg_qt02)
ok: [centos1] => (item=ontap_31_fg_qt03)
ok: [centos1] => (item=ontap_31_fg_qt04)
ok: [centos1] => (item=ontap_31_fg_qt05)

TASK [Create mount directories] ****************************************************************************************************************************************************************************************************************************************************
changed: [centos1] => (item=ontap_31_fg_qt01)
changed: [centos1] => (item=ontap_31_fg_qt02)
changed: [centos1] => (item=ontap_31_fg_qt03)
changed: [centos1] => (item=ontap_31_fg_qt04)
changed: [centos1] => (item=ontap_31_fg_qt05)

TASK [Mount NFS export on Linux host] **********************************************************************************************************************************************************************************************************************************************
changed: [centos1] => (item=ontap_31_fg_qt01)
changed: [centos1] => (item=ontap_31_fg_qt02)
changed: [centos1] => (item=ontap_31_fg_qt03)
changed: [centos1] => (item=ontap_31_fg_qt04)
changed: [centos1] => (item=ontap_31_fg_qt05)

TASK [Create test file on each export] *********************************************************************************************************************************************************************************************************************************************
changed: [centos1] => (item=ontap_31_fg_qt01)
changed: [centos1] => (item=ontap_31_fg_qt02)
changed: [centos1] => (item=ontap_31_fg_qt03)
changed: [centos1] => (item=ontap_31_fg_qt04)
changed: [centos1] => (item=ontap_31_fg_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=8    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
cluster1                   : ok=9    changed=9    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-32-01 - Volumes & Qtrees] **********************************************************************************************************************************************************************************************************************************************

TASK [Create volume] ***************************************************************************************************************************************************************************************************************************************************************
changed: [cluster1]

TASK [Create qtrees] ***************************************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_32_vol_qt01)
changed: [cluster1] => (item=ontap_32_vol_qt02)
changed: [cluster1] => (item=ontap_32_vol_qt03)
changed: [cluster1] => (item=ontap_32_vol_qt04)
changed: [cluster1] => (item=ontap_32_vol_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=8    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
cluster1                   : ok=11   changed=11   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-32-02 - Shares & ACLs (Volume)] ****************************************************************************************************************************************************************************************************************************************

TASK [Create shares] ***************************************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_32_vol_qt01)
changed: [cluster1] => (item=ontap_32_vol_qt02)
changed: [cluster1] => (item=ontap_32_vol_qt03)
changed: [cluster1] => (item=ontap_32_vol_qt04)
changed: [cluster1] => (item=ontap_32_vol_qt05)

TASK [Remove "Full Control" for "Everyone"] ****************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_32_vol_qt01)
changed: [cluster1] => (item=ontap_32_vol_qt02)
changed: [cluster1] => (item=ontap_32_vol_qt03)
changed: [cluster1] => (item=ontap_32_vol_qt04)
changed: [cluster1] => (item=ontap_32_vol_qt05)

TASK [Create ACL on test share (admins - Full Control)] ****************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_32_vol_qt01)
changed: [cluster1] => (item=ontap_32_vol_qt02)
changed: [cluster1] => (item=ontap_32_vol_qt03)
changed: [cluster1] => (item=ontap_32_vol_qt04)
changed: [cluster1] => (item=ontap_32_vol_qt05)

TASK [Create ACL on test share (read-only users - Read)] ***************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_32_vol_qt01)
changed: [cluster1] => (item=ontap_32_vol_qt02)
changed: [cluster1] => (item=ontap_32_vol_qt03)
changed: [cluster1] => (item=ontap_32_vol_qt04)
changed: [cluster1] => (item=ontap_32_vol_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=8    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
cluster1                   : ok=15   changed=15   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-32-03 - Mount & Write (Volume)] ****************************************************************************************************************************************************************************************************************************************

TASK [Create mount directory] ******************************************************************************************************************************************************************************************************************************************************
changed: [jumphost]

TASK [Save network credentials] ****************************************************************************************************************************************************************************************************************************************************
changed: [jumphost]

TASK [Map shares] ******************************************************************************************************************************************************************************************************************************************************************
changed: [jumphost] => (item=ontap_32_vol_qt01)
changed: [jumphost] => (item=ontap_32_vol_qt02)
changed: [jumphost] => (item=ontap_32_vol_qt03)
changed: [jumphost] => (item=ontap_32_vol_qt04)
changed: [jumphost] => (item=ontap_32_vol_qt05)

TASK [Create test file on each share] **********************************************************************************************************************************************************************************************************************************************
changed: [jumphost] => (item=ontap_32_vol_qt01)
changed: [jumphost] => (item=ontap_32_vol_qt02)
changed: [jumphost] => (item=ontap_32_vol_qt03)
changed: [jumphost] => (item=ontap_32_vol_qt04)
changed: [jumphost] => (item=ontap_32_vol_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=8    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
cluster1                   : ok=15   changed=15   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
jumphost                   : ok=4    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-32-04 - FlexGroups & Qtrees] *******************************************************************************************************************************************************************************************************************************************

TASK [Create FlexGroup] ************************************************************************************************************************************************************************************************************************************************************
changed: [cluster1]

TASK [Create qtrees] ***************************************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_32_fg_qt01)
changed: [cluster1] => (item=ontap_32_fg_qt02)
changed: [cluster1] => (item=ontap_32_fg_qt03)
changed: [cluster1] => (item=ontap_32_fg_qt04)
changed: [cluster1] => (item=ontap_32_fg_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=8    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
cluster1                   : ok=17   changed=17   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
jumphost                   : ok=4    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-32-05 - Shares & ACLs (FlexGroup)] *************************************************************************************************************************************************************************************************************************************

TASK [Create shares] ***************************************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_32_fg_qt01)
changed: [cluster1] => (item=ontap_32_fg_qt02)
changed: [cluster1] => (item=ontap_32_fg_qt03)
changed: [cluster1] => (item=ontap_32_fg_qt04)
changed: [cluster1] => (item=ontap_32_fg_qt05)

TASK [Remove "Full Control" for "Everyone"] ****************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_32_fg_qt01)
changed: [cluster1] => (item=ontap_32_fg_qt02)
changed: [cluster1] => (item=ontap_32_fg_qt03)
changed: [cluster1] => (item=ontap_32_fg_qt04)
changed: [cluster1] => (item=ontap_32_fg_qt05)

TASK [Create ACL on test share (admins - Full Control)] ****************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_32_fg_qt01)
changed: [cluster1] => (item=ontap_32_fg_qt02)
changed: [cluster1] => (item=ontap_32_fg_qt03)
changed: [cluster1] => (item=ontap_32_fg_qt04)
changed: [cluster1] => (item=ontap_32_fg_qt05)

TASK [Create ACL on test share (read-only users - Read)] ***************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=ontap_32_fg_qt01)
changed: [cluster1] => (item=ontap_32_fg_qt02)
changed: [cluster1] => (item=ontap_32_fg_qt03)
changed: [cluster1] => (item=ontap_32_fg_qt04)
changed: [cluster1] => (item=ontap_32_fg_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=8    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
cluster1                   : ok=21   changed=21   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
jumphost                   : ok=4    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-32-06 - Mount & Write (FlexGroup)] *************************************************************************************************************************************************************************************************************************************

TASK [Create mount directory] ******************************************************************************************************************************************************************************************************************************************************
ok: [jumphost]

TASK [Save network credentials] ****************************************************************************************************************************************************************************************************************************************************
changed: [jumphost]

TASK [Map shares] ******************************************************************************************************************************************************************************************************************************************************************
changed: [jumphost] => (item=ontap_32_fg_qt01)
changed: [jumphost] => (item=ontap_32_fg_qt02)
changed: [jumphost] => (item=ontap_32_fg_qt03)
changed: [jumphost] => (item=ontap_32_fg_qt04)
changed: [jumphost] => (item=ontap_32_fg_qt05)

TASK [Create test file on each share] **********************************************************************************************************************************************************************************************************************************************
changed: [jumphost] => (item=ontap_32_fg_qt01)
changed: [jumphost] => (item=ontap_32_fg_qt02)
changed: [jumphost] => (item=ontap_32_fg_qt03)
changed: [jumphost] => (item=ontap_32_fg_qt04)
changed: [jumphost] => (item=ontap_32_fg_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=8    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
cluster1                   : ok=21   changed=21   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
jumphost                   : ok=8    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


real    3m28.605s
user    0m45.214s
sys     0m8.494s


--> Revert / Remove all configuration & Reset environment

PLAY [ONTAP-revert-00 - Return to Day0 - Linux] ************************************************************************************************************************************************************************************************************************************

TASK [Unmount exports] *************************************************************************************************************************************************************************************************************************************************************
changed: [centos1] => (item=ontap_31_vol_qt01)
changed: [centos1] => (item=ontap_31_vol_qt02)
changed: [centos1] => (item=ontap_31_vol_qt03)
changed: [centos1] => (item=ontap_31_vol_qt04)
changed: [centos1] => (item=ontap_31_vol_qt05)
changed: [centos1] => (item=ontap_31_fg_qt01)
changed: [centos1] => (item=ontap_31_fg_qt02)
changed: [centos1] => (item=ontap_31_fg_qt03)
changed: [centos1] => (item=ontap_31_fg_qt04)
changed: [centos1] => (item=ontap_31_fg_qt05)

TASK [Remove mount directories] ****************************************************************************************************************************************************************************************************************************************************
ok: [centos1] => (item=ontap_31_vol_qt01)
ok: [centos1] => (item=ontap_31_vol_qt02)
ok: [centos1] => (item=ontap_31_vol_qt03)
ok: [centos1] => (item=ontap_31_vol_qt04)
ok: [centos1] => (item=ontap_31_vol_qt05)
ok: [centos1] => (item=ontap_31_fg_qt01)
ok: [centos1] => (item=ontap_31_fg_qt02)
ok: [centos1] => (item=ontap_31_fg_qt03)
ok: [centos1] => (item=ontap_31_fg_qt04)
ok: [centos1] => (item=ontap_31_fg_qt05)

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


PLAY [ONTAP-revert-00 - Return to Day0 - Windows] **********************************************************************************************************************************************************************************************************************************

TASK [Remove mapped shares] ********************************************************************************************************************************************************************************************************************************************************
changed: [jumphost] => (item=ontap_32_vol_qt01)
changed: [jumphost] => (item=ontap_32_vol_qt02)
changed: [jumphost] => (item=ontap_32_vol_qt03)
changed: [jumphost] => (item=ontap_32_vol_qt04)
changed: [jumphost] => (item=ontap_32_vol_qt05)
changed: [jumphost] => (item=ontap_32_fg_qt01)
changed: [jumphost] => (item=ontap_32_fg_qt02)
changed: [jumphost] => (item=ontap_32_fg_qt03)
changed: [jumphost] => (item=ontap_32_fg_qt04)
changed: [jumphost] => (item=ontap_32_fg_qt05)

TASK [Remove network credentials] **************************************************************************************************************************************************************************************************************************************************
changed: [jumphost]

TASK [Remove mount directory] ******************************************************************************************************************************************************************************************************************************************************
changed: [jumphost]

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
jumphost                   : ok=3    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

[WARNING]: While constructing a mapping from /root/NetApp-ONTAP-Testplan/playbooks/ONTAP-revert-00.yml, line 136, column 7, found a duplicate dict key (hostname). Using last defined value only.
[WARNING]: While constructing a mapping from /root/NetApp-ONTAP-Testplan/playbooks/ONTAP-revert-00.yml, line 218, column 7, found a duplicate dict key (use_rest). Using last defined value only.

PLAY [ONTAP-revert-00 - Return to Day0 - ONTAP] ************************************************************************************************************************************************************************************************************************************

TASK [Get all non-root volumes from clusters] **************************************************************************************************************************************************************************************************************************************
ok: [cluster2]
ok: [cluster1]

TASK [Delete all volumes from clusters] ********************************************************************************************************************************************************************************************************************************************
skipping: [cluster2]
changed: [cluster1] => (item={'uuid': '06c34251-6de8-11ee-941c-00505685a7b2', 'name': 'ontap_31_nfs_fg01', 'is_svm_root': False, 'svm': {'name': 'ntap-svm01-nas', 'uuid': 'd2461e31-6de7-11ee-941c-00505685a7b2', '_links': {'self': {'href': '/api/svm/svms/d2461e31-6de7-11ee-941c-00505685a7b2'}}}, '_links': {'self': {'href': '/api/storage/volumes/06c34251-6de8-11ee-941c-00505685a7b2'}}})
changed: [cluster1] => (item={'uuid': '18d5b58b-6de8-11ee-941c-00505685a7b2', 'name': 'ontap_32_cifs_vol01', 'is_svm_root': False, 'svm': {'name': 'ntap-svm01-nas', 'uuid': 'd2461e31-6de7-11ee-941c-00505685a7b2', '_links': {'self': {'href': '/api/svm/svms/d2461e31-6de7-11ee-941c-00505685a7b2'}}}, '_links': {'self': {'href': '/api/storage/volumes/18d5b58b-6de8-11ee-941c-00505685a7b2'}}})
changed: [cluster1] => (item={'uuid': '3d47649c-6de8-11ee-941c-00505685a7b2', 'name': 'ontap_32_cifs_fg01', 'is_svm_root': False, 'svm': {'name': 'ntap-svm01-nas', 'uuid': 'd2461e31-6de7-11ee-941c-00505685a7b2', '_links': {'self': {'href': '/api/svm/svms/d2461e31-6de7-11ee-941c-00505685a7b2'}}}, '_links': {'self': {'href': '/api/storage/volumes/3d47649c-6de8-11ee-941c-00505685a7b2'}}})
changed: [cluster1] => (item={'uuid': 'ec765840-6de7-11ee-941c-00505685a7b2', 'name': 'ontap_31_nfs_vol01', 'is_svm_root': False, 'svm': {'name': 'ntap-svm01-nas', 'uuid': 'd2461e31-6de7-11ee-941c-00505685a7b2', '_links': {'self': {'href': '/api/svm/svms/d2461e31-6de7-11ee-941c-00505685a7b2'}}}, '_links': {'self': {'href': '/api/storage/volumes/ec765840-6de7-11ee-941c-00505685a7b2'}}})

TASK [Get all SVM CIFS servers] ****************************************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Delete all SVM CIFS servers] *************************************************************************************************************************************************************************************************************************************************
changed: [cluster2] => (item=cluster2_ad - CLUSTER2_AD)
changed: [cluster1] => (item=cluster1_ad - CLUSTER1_AD)
changed: [cluster1] => (item=ntap-svm01-nas - SVM01-NAS)
changed: [cluster1] => (item=ntap-svm02-san - SVM02-SAN)

TASK [Get all SVM interfaces from clusters] ****************************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Delete all SVM interfaces from clusters] *************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=cluster1_ad - cluster1_ad)
changed: [cluster2] => (item=cluster2_ad - cluster2_ad)
changed: [cluster1] => (item=ntap-svm01-nas - ntap-svm01-nas)
changed: [cluster1] => (item=ntap-svm02-san - ntap-svm02-san)

TASK [Get all intercluster interfaces from clusters] *******************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Delete intercluster interfaces from clusters] ********************************************************************************************************************************************************************************************************************************
skipping: [cluster1]
skipping: [cluster2]

TASK [Get all SVMs] ****************************************************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Delete all SVMs] *************************************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=cluster1_ad)
changed: [cluster2] => (item=cluster2_ad)
changed: [cluster1] => (item=ntap-svm01-nas)
changed: [cluster1] => (item=ntap-svm02-san)

TASK [Get all users] ***************************************************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Remove all additional users from cluster] ************************************************************************************************************************************************************************************************************************************
changed: [cluster2] => (item=DEMO\na_ad_admin_group)
changed: [cluster1] => (item=DEMO\na_ad_admin_group)
changed: [cluster2] => (item=DEMO\na_ad_ro_group)
skipping: [cluster2] => (item=admin) 
skipping: [cluster2] => (item=autosupport) 
changed: [cluster1] => (item=DEMO\na_ad_ro_group)
changed: [cluster2] => (item=na_local_admin)
skipping: [cluster1] => (item=admin) 
skipping: [cluster1] => (item=autosupport) 
changed: [cluster2] => (item=na_local_ro)
changed: [cluster1] => (item=na_local_admin)
changed: [cluster1] => (item=na_local_ro)

TASK [Get all non-root aggregates] *************************************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Remove all non-root aggregates from clusters] ********************************************************************************************************************************************************************************************************************************
changed: [cluster2] => (item={'uuid': '9a682344-6de7-11ee-a529-005056852224', 'name': 'cluster2_01_aggr01', '_links': {'self': {'href': '/api/storage/aggregates/9a682344-6de7-11ee-a529-005056852224'}}})
changed: [cluster1] => (item={'uuid': '9a67e47b-6de7-11ee-941c-00505685a7b2', 'name': 'cluster1_01_aggr01', '_links': {'self': {'href': '/api/storage/aggregates/9a67e47b-6de7-11ee-941c-00505685a7b2'}}})
changed: [cluster1] => (item={'uuid': '9b044f37-6de7-11ee-941c-00505685a7b2', 'name': 'cluster1_02_aggr01', '_links': {'self': {'href': '/api/storage/aggregates/9b044f37-6de7-11ee-941c-00505685a7b2'}}})
changed: [cluster2] => (item={'uuid': '9b3d22c9-6de7-11ee-a529-005056852224', 'name': 'cluster2_02_aggr01', '_links': {'self': {'href': '/api/storage/aggregates/9b3d22c9-6de7-11ee-a529-005056852224'}}})

TASK [Remove DNS config from cluster] **********************************************************************************************************************************************************************************************************************************************
[WARNING]: With version 22.0.0 ONTAPI (ZAPI) has been deprecated. The final ONTAP version to support ZAPI is ONTAP 9.13.1.  ZAPI calls in these modules will continue to work for ONTAP versions that supports ZAPI.  You can update your playbook to use REST by adding use_rest:
always to your playbook.  More information can be found at: https://github.com/ansible-collections/netapp.ontap
changed: [cluster1]
changed: [cluster2]

TASK [Get all NTP servers from cluster] ********************************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Remove NTP servers from cluster] *********************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item={'server': '0.us.pool.ntp.org', '_links': {'self': {'href': '/api/cluster/ntp/servers/0.us.pool.ntp.org'}}})
changed: [cluster2] => (item={'server': '0.us.pool.ntp.org', '_links': {'self': {'href': '/api/cluster/ntp/servers/0.us.pool.ntp.org'}}})
changed: [cluster1] => (item={'server': '1.us.pool.ntp.org', '_links': {'self': {'href': '/api/cluster/ntp/servers/1.us.pool.ntp.org'}}})
changed: [cluster2] => (item={'server': '1.us.pool.ntp.org', '_links': {'self': {'href': '/api/cluster/ntp/servers/1.us.pool.ntp.org'}}})

TASK [Reset timezone on storage cluster to Etc/UTC] ********************************************************************************************************************************************************************************************************************************
changed: [cluster1]
changed: [cluster2]

TASK [Remove onboard key manager configuration] ************************************************************************************************************************************************************************************************************************************
changed: [cluster1]
changed: [cluster2]

TASK [Get interface groups and VLANs from cluster] *********************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Remove VLANs from cluster] ***************************************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=cluster1-01:a0a) 
skipping: [cluster1] => (item=cluster1-02:a0a) 
skipping: [cluster1]
skipping: [cluster2] => (item=cluster2-01:a0a) 
skipping: [cluster2] => (item=cluster2-02:a0a) 
skipping: [cluster2]

TASK [Remove interface groups from cluster] ****************************************************************************************************************************************************************************************************************************************
changed: [cluster1] => (item=cluster1-01:a0a)
changed: [cluster2] => (item=cluster2-01:a0a)
changed: [cluster1] => (item=cluster1-02:a0a)
changed: [cluster2] => (item=cluster2-02:a0a)

TASK [Get broadcast domains from cluster] ******************************************************************************************************************************************************************************************************************************************
ok: [cluster1]
ok: [cluster2]

TASK [Remove broadcast domains from cluster] ***************************************************************************************************************************************************************************************************************************************
skipping: [cluster1] => (item=Cluster | IPspace: Cluster) 
skipping: [cluster1] => (item=Default | IPspace: Default) 
skipping: [cluster2] => (item=Cluster | IPspace: Cluster) 
skipping: [cluster2] => (item=Default | IPspace: Default) 
changed: [cluster1] => (item=bc_data | IPspace: Default)
changed: [cluster2] => (item=bc_data | IPspace: Default)

TASK [Reset banner and message of the day on cluster] ******************************************************************************************************************************************************************************************************************************
changed: [cluster2]
changed: [cluster1]

PLAY RECAP *************************************************************************************************************************************************************************************************************************************************************************
centos1                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
cluster1                   : ok=23   changed=13   unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
cluster2                   : ok=22   changed=12   unreachable=0    failed=0    skipped=3    rescued=0    ignored=0   
jumphost                   : ok=3    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


real    2m28.923s
user    0m40.785s
sys     0m7.453s


--> Finished!

```