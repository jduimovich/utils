#!/bin/bash 
for dir in pv-* ; do 
    if [ -d "$dir" ]; then    
        export prname=${dir:3}  
        echo "Checking for PipelineRun $dir for PR $prname"
        if  oc get pr "$prname" 2>/dev/null >/dev/null; then
            echo PR "$prname exists, leave PVC" 
        else
            echo PR "$prname does not exist, rm  PVC" 
            rm -rf $dir
        fi 
    fi 
done
  
   