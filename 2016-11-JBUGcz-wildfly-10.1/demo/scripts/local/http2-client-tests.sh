#!/bin/bash

function test() {
    clear
    echo "+ $1"
    read
    $1
    read
}

test "nghttp https://localhost:8443/checksecure-confidential/"
test "nghttp -v https://localhost:8443/checksecure-confidential/"
test "nghttp -v http://localhost:8080/checksecure-confidential/"

test "curl -L http://localhost:8080/checksecure-confidential/"
test "curl -L --insecure http://localhost:8080/checksecure-confidential/"
