export OS=xUbuntu_20.04
export VER=1.21

apt get update && apt-get upgrade


# CRI-O Config
modprobe overlay
modprobe br_netfilter

cat > /etc/systcl.d/99-kubernetes-cri.conf << EOF
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

echo \
  "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VER/$OS/ /" \
  | tee -a /etc/apt/sources.list.d/cri-0.list

curl -L \
  http://download.opensuse.org/repositories/devel:/kubiuc:/libcontainers:/stable:/cri-o:/$VER/$OS/Release.key \
  | apt-key add -


echo \ 
  "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" \
  | tee -a /etc/apt/sources.list.d/libcontainers.list


curl -L \
  https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key \
  | apt-key add - 

apt-get update

#CRI-O install
apt-get install -y cri-o cri-o-runc

systemctl daemon-reload
systemctl enable crio
systemctl start crio

#K8s Install
cat > /etc/apt/sources.list.d/kubernetes.list << EOF
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

curl -s \
  https://packages.cloud.google.com/apt/doc/apt-key.gpg \
  | apt-key add -
  
  
apt-get update

apt-get install -y \
  kubeadm=1.21.1-00 kubelet=1.21.1-00 kubectl=1.21.1-00

apt-mark hold kubelet kubeadm kubectl