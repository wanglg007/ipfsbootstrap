#1概述
---
 工程分为三个节点。节点1为主环境，其他节点为从环境；其具体的部署步骤如下所示:
---

##1.1 在三个节点的创建ipfs、ipfscluster目录,并将其下的脚本拷贝进去
 mkdir /usr/ipfsclusterd
 mkdir /usr/ipfs
##1.2 将ipfsd.service、ipfsclusterd.service拷贝到目录/usr/lib/systemd/system
 cp ipfsd.service ipfsclusterd.service /usr/lib/systemd/system
##1.3 将ipfs、ipfscluster进行生效
 systemctl daemon-reload
###1.3.1启动ipfs节点
 systemctl enable ipfs.service
 systemctl start ipfs.service
 ps -ef | grep ipfs
###1.3.2启动ipfscluster节点
 systemctl enable ipfsclusterd.service
 systemctl start ipfsclusterd.service
 ps -ef | grep ipfs