import sys
import boto3
sys.path.insert(0,'../packages')
#sys.path.append(".")
from cluster.abstract_cluster_manager import abstract_cluster_manager
#import abstract_cluster_manager
#c = "cloudstones"
#class instances_manager():
class instances_manager(abstract_cluster_manager):
    def __init__(self,clustername):
        self.clustername = clustername
    #    self._client = boto3.client('ec2')
        self._resource = boto3.resource('ec2')
    def delete(self):
        print("this is delete method")
        filters = [{'Name':'tag:Name', 'Values':[self.clustername]}]
        print(self.clustername)
        instances = list(self._resource.instances.filter(Filters=filters))
        print(self._resource)
        print(instances)
        for instance in instances:
            print(instance)
            print(instance.start())

#i = instances_manager(c)
#i.delete(c)
