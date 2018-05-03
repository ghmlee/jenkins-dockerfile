# Jenkins

```
[Unit]
Description=jenkins.service
Requires=docker.service
After=docker.service
[Service]
TimeoutStartSec=0
Restart=always
ExecStartPre=-/usr/bin/rm -r /vol/jenkins/lost+found
ExecStartPre=/usr/bin/chmod 0777 /vol/jenkins
ExecStartPre=-/usr/bin/docker kill jenkins
ExecStartPre=-/usr/bin/docker rm jenkins
ExecStartPre=-/usr/bin/docker pull ghmlee/jenkins:latest
ExecStart=/usr/bin/docker run -p 8080:8080 -p 50000:50000 -v /vol/jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --rm --name jenkins ghmlee/jenkins:latest
[Install]
WantedBy=multi-user.target
```
