import os
import boto3
import sys
import shutil
from cluster.instances_manager import instances_manager

def delete_cluster(clustername):
    instances_manager(clustername).delete()
    #instances_manager(clustername)
