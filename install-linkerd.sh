# Install linkerd CLI on local machine
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install | sh
export PATH=$HOME/.linkerd2/bin:$PATH
linkerd version

#Validate k8s cluster
linkerd check --pre

#Install linkerd onto your cluster
linkerd install --crds | kubectl apply -f -
linkerd install | kubectl apply -f -
linkerd check

#Install linkerd dashboard onto your cluster
linkerd viz install | kubectl apply -f -
linkerd check
linkerd viz dashboard &
