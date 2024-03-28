#!/usr/bin/env python3
import sys
import argparse
#import terraform
sys.path.append('packages')
import env_manager

VALID_ACTIONS = ["create", "apply", "destroy", "cleanup"]

parser = argparse.ArgumentParser(description='Cloudstones platform manager')
parser.add_argument('action', help="Action %s"%VALID_ACTIONS)
parser.add_argument('-c','--clustername', help='unique name of the cluster')
parser.add_argument('-t','--template', help='name of the cluster template')
args = parser.parse_args()

action = args.action
clustername = args.clustername
template = args.template

def main_fun():
    if action == 'create':
        print("attempting to create %s" % (clustername))
        status = env_manager.create_env(clustername,template)
    elif action == 'apply': 
        print("attempting to create %s" % (clustername))
        status = env_manager.create_env(clustername,template)
        print("attempting to apply %s" % (clustername))
        status = env_manager.apply_env(clustername)
    elif action == 'destroy': 
        print("attempting to cleanup %s" % (clustername))
        status = env_manager.destroy_env(clustername)
    elif action == 'cleanup': 
        print("attempting to cleanup %s" % (clustername))
        status = env_manager.cleanup_env(clustername)
    else:
        print("canceling the operation")
        sys.exit(1)
    

if __name__ == "__main__":    
    main_fun()
