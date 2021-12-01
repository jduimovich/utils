#!/bin/bash 
for dir in pv-* ; do 
    if [ -d "$dir" ]; then    
        export prname=${dir:3}
        echo  
        echo "Checking for PipelineRun $prname"
        if  oc get pr "$prname" 2>/dev/null >/dev/null; then
            echo PR "$prname active, leave workdir $dir" 
        else
            echo PR "$prname does not exist, delete workdir $dir"  
            rm -rf $dir
        fi 
    fi 
done
  
   