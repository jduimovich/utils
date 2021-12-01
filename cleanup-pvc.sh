#!/bin/bash 
for dir in * ; do 
    if [ -d "$dir" ]; then    
        echo "Checking for PipelineRun $dir"
        echo "getall "
        oc get pr  
        echo "one "
        oc get pr "$dir" 
        if  oc get pr "$dir" 2>/dev/null >/dev/null; then
            echo PR "$dir exists, leave PVC" 
        else
            echo PR "$dir does not exist, rm  PVC" 
            rm -rf $dir
        fi 
    fi 
done
  
   