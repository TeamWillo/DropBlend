#!/bin/sh

#This script tests if there is any '.blend' files in the Dropbox folder renders
#them while keeping only one 'Blender' instance active at a time.
job_test = '~/Dropbox/blend_folder/*.blend'
blender_test = '~/Dropbox/blend_folder/blender_running.txt'
#check if there is are '.blend' files to render. Terminate if false.
if [-f $job_test]
#check if there is an instance of 'Blender' already running. Terminate if true.
  if [-f $blender_test]
  then
    echo "A previous instance of Blender is still running."
    exit 0
# If there is no previous instance then proceed to render process.
  else
#Create the control file for 'Blender' test.
    echo "Blender is running" >  ~/Dropbox/blend_folder/blender_running.txt
#Loop through all '.blend' files within 'blend_folder' and run Blender CLI on
#each file name, creating a folder derived from it's filename to store the
#(JPEG) output (F)ormat using 'CYCLES' render (E)ngine from (s)tarts at frame
#(1) and (e)nds on frame (60).
    for i in `ls ~/Dropbox/blend_folder/*.blend`
    do
      j = ${i##*/}
      blender -b $i -o ~/Dropbox/3D-Rotation-${j%%.*}/jpg/#.jpg -E CYCLES -F JPEG -s 1 -e 60 -a
    done
#After all files are finished rendering. They will all be moved to the
#completed_folder. The control file 'blender_running.txt', is removed from the
#folder once blender quits.
    dir_test = '~/Dropbox/complete_folder'
    mkdir -p $dir_test
    `mv ~/Dropbox/blend_folder/*.blend ~/Dropbox/complete_folder`
    `rm Dropbox/blend_folder/blender_running.txt`
  fi
fi
echo "No blender files to render"
exit 0
