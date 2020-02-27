config:
	kubectl delete configmap app-tester-src || true
	kubectl create configmap app-tester-src --from-file ./src

golang:
	helm upgrade -i app-tester ./app-tester --set image=golang

java:
	helm upgrade -i app-tester ./app-tester --set image=maven

python2:
	helm upgrade -i app-tester ./app-tester --set image=python:2.7

python3:
	helm upgrade -i app-tester ./app-tester --set image=python:3.8

cleanup:
	helm delete app-tester
	kubectl delete configmap app-tester-src