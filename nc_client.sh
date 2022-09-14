#!/bin/bash

touch "some data" > file_to_send
nc 172.18.0.2 8080 < file_to_send
