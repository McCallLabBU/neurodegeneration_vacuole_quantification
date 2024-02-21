// This script takes in a folder with .nd2 files (or other common confocal microscopy formats) 
// and for each .nd2 file - splits and merges the color channels
// and saves an RGB stack and a 8-bit greyscale stack versions of the .nd2 file in the .tif format 
// For use with webknossos annotation. 
// output files are named after input files - e.g. input_filename_RGB.tif and input_filename_8bitGrey.tif

// Author : Shruthi Bandyadka (sbandya@bu.ed), McCall Lab, Boston University 

input = getDirectory("Choose an input directory");
output = getDirectory("Choose an output directory");


function makeTiff(filename, outdir) {
	open(input + filename);
	run("Split Channels");
	name=getTitle(); 
	print(name);
	run("Merge Channels...", "c1=C1-"+filename+"  c2=C2-"+filename+" create");
	run("Stack to RGB", "slices keep");
	saveAs("Tiff", output+filename+"_RGB.tif");
	run("8-bit");
	saveAs("Tiff", output+filename+"_8bitGrey.tif");
	close();
	close();
	
}

list = getFileList(input);
for (i = 0; i < list.length; i++){
        if(endsWith(list[i], ".nd2")){ //change .nd2 to file format of choice
        	print(list[i]);
        	makeTiff(list[i], output);

        	}
        
}


