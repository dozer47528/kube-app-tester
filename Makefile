config:
	kubectl delete configmap app-tester-src || true
	kubectl create configmap app-tester-src --from-file ./src

golang:
	helm upgrade -i app-tester ./app-tester --set

cleanup:
	helm delete app-tester
	kubectl delete configmap app-tester-src