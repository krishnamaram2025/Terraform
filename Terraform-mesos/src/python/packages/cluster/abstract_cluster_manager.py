#!/usr/bin/env python
import boto3
class abstract_cluster_manager( object ):
    def __inti__(self):
        pass
    def delete(self):
        raise NotImplementedError("ERROR: Cleanup")
