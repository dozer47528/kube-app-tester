config:
	kubectl delete configmap app-tester-dist || true
	kubectl create configmap app-tester-dist --from-file ./dist

golang:
	helm upgrade -i app-tester ./app-tester --set image=golang

java8:
	helm upgrade -i app-tester ./app-tester --set image=openjdk:8

python2:
	helm upgrade -i app-tester ./app-tester --set image=python:2.7

python3:
	helm upgrade -i app-tester ./app-tester --set image=python:3.8

cleanup:
	helm delete app-tester
	kubectl delete configmap app-tester-dist