#!/usr/bin/env bash
ssh -o "StrictHostKeyChecking=no" -i "/tmp/private_code/.ssh/aluxa_id_rsa" $1 $2
