#!/bin/bash 
for dir in "pv-*/" ; do
    buildDir=${dir%/}
    echo "Dir is $dir"
    echo "Checking for PipelineRun $buildDir"
    if  oc get pr "$buildDir" 2>/dev/null >/dev/null; then
        echo PR "$buildDir exists, leave PVC" 
    else
        echo PR "$buildDir does not exist, rm  PVC" 
        rm -rf $buildDir
    fi 
done
  
   