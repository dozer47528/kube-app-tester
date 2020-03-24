config:
	kubectl delete configmap app-tester-dist || true
	tar -zcvf /tmp/dist.tar.gz ./dist
	kubectl create configmap app-tester-dist --from-file /tmp/dist.tar.gz

golang:
	helm upgrade -i app-tester ./app-tester --set image=golang

openjdk8:
	helm upgrade -i app-tester ./app-tester --set replicaCount=1 --set image=openjdk:8 --set resources.limits.memory=1Gi --set resources.limits.cpu=0.5

openjdk13:
	helm upgrade -i app-tester ./app-tester --set replicaCount=1 --set image=openjdk:13 --set resources.limits.memory=1Gi --set resources.limits.cpu=0.5

openjdk8-openj9:
	helm upgrade -i app-tester ./app-tester --set replicaCount=1 --set image=adoptopenjdk/openjdk8-openj9 --set resources.limits.memory=1Gi --set resources.limits.cpu=0.5

python2:
	helm upgrade -i app-tester ./app-tester --set image=python:2.7

python3:
	helm upgrade -i app-tester ./app-tester --set image=python:3.8

cleanup:
	helm delete app-tester
	kubectl delete configmap app-tester-dist