# Test Simple Code in Kubernetes Cluster

## How to use

Write your code under `./dist`.

Add a file named `run` under `./dist`. Which will compile and run your source code.

Example:

```sh
#!/bin/bash
exec go run main.go
```

Run the code in Kubernetes:

```sh
make config golang # For golang application
make config java # For java application
make config python2 # For python 2.7 application
```

Cleanup:

```sh
make cleanup
```