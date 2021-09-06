# rganju-repository
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/rohanganju/rganju-repository/blob/main/Diagrams/Complete-Network-Diagram.pdf

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

  - https://github.com/rohanganju/rganju-repository/blob/main/Ansible/filebeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.
- The load-balancer is a good defence against attacks on availability e.g. DDoS attacks, while installing the jumpbox segments the network in a way that gives us control over who has access, while also helping us to remotely manage machines in the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- Filebeat monitors log files/specified locations
- Metricbeat keeps track of metrics/statistics from the operating system and various services that run on the server.

The configuration details of each machine may be found below.


| Name        | Function       | IP Address     | Operating System |
|-------------|----------------|----------------|------------------|
| Jumpbox     | Gateway        | 10.1.0.4       | Linux            |
| VM1         | Web Server     | 10.1.0.5       | Linux            |
| VM2         | Web Server     | 10.1.0.6       | Linux            |
| Web-3       | Web Server     | 10.1.0.7       | Linux            |
| LB_2        | Load Balancer  | 20.36.34.188   | Linux            |
| ELK-HOST    | ELK Server     | 10.0.0.4       | Linux            | 
| Workstation | Access Control | 218.214.185.80 | Mac              |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Elk Server machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 218.214.185.80 through TCP 5601

Machines within the network can only be accessed by Workstation and Jump-Box.
- Jumpbox 10.1.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses  |
|----------|---------------------|-----------------------|
| Jumpbox  | No                  | 22.214.185.80/SSH22   | 
| VM1      | No                  | 10.1.0.4/SSH22        |
| VM2      | No                  | 10.1.0.4/SSH22        |              
| Web 3    | No                  | 10.1.0.4/SSH22        |
| ELK-HOST | No                  | 22.214.185.80/TCP5601 |
| LB-1     | No                  | 22.214.185.80/HTTP80  |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible? Manually configuring a system to run software can be tedious and time consuming, ansible greatly increases efficiency by automating these tasks. This is particularly useful when installing software that requires specific configurations.

The playbook implements the following tasks:
- Install Docker
- Install python3-pip
- Install Docker python module
- Set the vm.max_map_count to 262144
- Download and launch a docker elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/rohanganju/rganju-repository/blob/main/Images/docker-ps-output.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- VM1 10.1.0.5
- VM2 10.1.0.6
- Web-3 10.1.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- As mentioned earlier, filebeat monitors log files and specified locations, we would expect to see messages/changes to said log files/locations. Metricbeat records metrics/statistics, such has how much RAM was being used on the webservers in a given moment.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml and filebeat-playbook.yml file to /etc/ansible
- Update the install-elk.yml and filebeat-playbook.yml file to include the machine that is the target of the playbooks, do this by changing the 'hosts:' line. 
- Run the playbook, and navigate to http://13.75.186.145:5601/app/kibana to check that the installation worked as expected.


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
