#!/bin/bash
#


go fmt
go mod init main
go mod tidy

go run .
