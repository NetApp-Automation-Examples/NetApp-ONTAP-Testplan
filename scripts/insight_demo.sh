#!/usr/bin/env bash

################################################################################
#
# Title:        insight_demo.sh
# Author:       Ken Hillier
# Initial Date: 2023-10-05
# Description:  Prepare linux host "centos1" in LoD lab LD00821
#               --> "Early Adopter Lab for ONTAP 9.13.1"
#
# URLs:         https://labondemand.netapp.com/node/497
#               https://github.com/AdrianBronder/NetApp-ONTAP-Testplan
#               https://docs.netapp.com/us-en/ontap/index.html
#               https://galaxy.ansible.com/netapp/ontap
#
################################################################################

echo ""
echo ""
echo "--> Running Ansible Playbooks to demo ONTAP automated configuration:"
echo "--> 1. Cluster Configuration"
echo "--> 2. Data Storage Virtual Machine(SVM) Configuration"
echo "--> 3. NAS Provisioning - Standard NFS Exports & SMB Shares"
echo "--> 4. Revert / Remove all configuration & Reset environment" 

echo ""
echo ""
echo "--> Cluster Configuration"
cd ~/NetApp-ONTAP-Testplan
time ansible-playbook -i inventories/labondemand playbooks/ONTAP-1*

echo ""
echo ""
echo "--> Data Storage Virtual Machine(SVM) Configuration"
cd ~/NetApp-ONTAP-Testplan
time ansible-playbook -i inventories/labondemand playbooks/ONTAP-2*

echo ""
echo ""
echo "--> NAS Provisioning - Standard NFS Exports & SMB Shares"
cd ~/NetApp-ONTAP-Testplan
time ansible-playbook -i inventories/labondemand playbooks/ONTAP-3*

echo ""
echo ""
echo "--> Revert / Remove all configuration & Reset environment"
cd ~/NetApp-ONTAP-Testplan
time ansible-playbook -i inventories/labondemand playbooks/ONTAP-revert-00*

echo ""
echo ""
echo "--> Finished!"