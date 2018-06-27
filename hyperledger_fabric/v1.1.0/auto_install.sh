#!/bin/bash

make setup
make gen_config
make start

make test_channel_create 
make test_channel_join
make test_cc_install
make test_cc_instantiate
make test_cc_invoke_query

make test_lscc
make test_qscc

make test_fetch_blocks

yum install jq -y
make test_configtxlator

# make stop
# make clean
