#!/bin/bash 
for dir in pv-* ; do 
    if [ -d "$dir" ]; then    
        echo "Checking for PipelineRun $dir"
        name = ${dir:3}  
        oc get pr "$name" 
        if  oc get pr "$name" 2>/dev/null >/dev/null; then
            echo PR "$dir exists, leave PVC" 
        else
            echo PR "$dir does not exist, rm  PVC" 
            rm -rf $dir
        fi 
    fi 
done
  
   