#!/bin/bash

touch keep-alive
scp -P 19999 -i ./id-rsa ./keep-alive localhost:
