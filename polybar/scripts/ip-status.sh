#!/bin/sh

printf "" && (ip route get 1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')
