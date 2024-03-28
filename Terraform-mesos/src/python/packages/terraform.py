#!/usr/bin/env python3

import subprocess


cmds = ["terraform  init providers/aws/ && terraform validate -var-file=csp_config.json providers/aws && terraform apply -var-file=csp_config.json -auto-approve providers/aws"]
cmds_destroy = ["terraform  init providers/aws/ && terraform validate -var-file=csp_config.json providers/aws && terraform destroy -var-file=csp_config.json -auto-approve providers/aws"]

def terraform_apply(clustername):
    for cmd in cmds:
        print("command name", cmd)
        cmd_execution = subprocess.Popen(cmd, stdout = subprocess.PIPE, stderr = subprocess.STDOUT, shell = True)
        cmd_output, cmd_error = cmd_execution.communicate()
        print("output of the command", cmd_output)

def terraform_destroy(clustername):
    for cmd in cmds_destroy:
        print("command name", cmd)
        cmd_execution = subprocess.Popen(cmd, stdout = subprocess.PIPE, stderr = subprocess.STDOUT, shell = True)
        cmd_output, cmd_error = cmd_execution.communicate()
        print("output of the command", cmd_output)
