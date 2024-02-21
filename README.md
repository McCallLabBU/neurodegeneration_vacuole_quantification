# Neurodegeneration Vacuole Quantification
Scripts for vacuole quantification in 3D whole-mount 2-photon images of D. melanogaster brains

(Original publication: https://www.cell.com/iscience/fulltext/S2589-0042(23)02129-6)

Citation : Elguero, J. E., Liu, G., Tiemeyer, K., Bandyadka, S., Gandevia, H., Duro, L., Yan, Z., & McCall, K. (2023). Defective phagocytosis leads to neurodegeneration through systemic increased innate immune signaling. iScience, 0(0). https://doi.org/10.1016/j.isci.2023.108052

Protocol paper for annotating vacuoles and statistical analysis: 

Citation: 

# Aim

To identify whether there is a statistically significant difference in the **number, size,** and **spatial distribution** of neurodegeneration vacuoles in whole-mount 2-photon microscopy images of _D.melanogaster_ brains

# Data

Whole-mount 2-photon imaging

- Red : phalloidin (muscle)
- Green : Hoechst (nucleus)

# Methods

## 1. Convert raw confocal image files to RBG/8-bit greyscale TIFF format

Z-stacks acquired from confocal microscopes need to be converted to RGB stacks or 8bit greyscale stacks in the TIFF format for use with WEBKNOSSOS for annotation.
The FIJI macro provided - `code/maketiff.ijm` can be used to batch process raw images. 
The macro takes in `.nd2` files and performs the following operations for each `.nd2` file - 
	
- split channels
- merge channels 
- convert to RGB tiff 
- convert to 8bit greyscale tiff 

The macro can be modified to work with other common microscopy raw formats such as `.oif`
When the macro is run in FIJI, it will open a dialog box to select the input folder containing all the `.nd2` files. Once the input folder is selected, another dialog box to get the output destination folder will open up. Once the input and output folder are selected, all the `.nd2` files in the input folder will be converted to RGB stacks and 8-bit greyscale stacks and will be available in the selected destination folder for downstream analysis. 
Make sure to not include any other files other than the necessary `.nd2` files in the input folder selected. 
Input `.nd2` files must not contain any spaces or special characters other than underscores in the filename. An example of an ideal input filename is - `best_input_file_123.tif`


## 2. Webknossos workflow to identify vacuoles

### 2a. Upload confocal images to webknossos

- Use prairie reader plugin to import xml files into FIJI
- Convert stack to RGB
- Save merged RGB z-stacks in Tiff format
- Upload RGB TIFF z-stacks of individual brains to Webknossos

### 2b. Annotate vacuoles

- Create a new volume annotation 
- Identify each vacuole visually. For each vacuole
	- create a new segment id
	- Paint over vacuoles in some z-stack levels using the quick select automatic segmentation tool
	- Use the interpolation tool to automatically fill in the vacuole 
	- When the vacuole is fully annotated, create a 3d mesh for the segment
- Repeat the above steps to annotate the whole brain  
- Download the mesh for vacuoles and whole brain as stl files 


Example annotated data is deposited at Zenodo: 
## 3. Python script to quantify vacuoles

```bash
# Create a Python3 virtual environment and activate
python3 -m venv vacuolequant
source vacuolequant/bin/activate


# Install all packages at once 
pip3 install -r requirements.txt

# Alternatively install necessary packages individually 
pip3 install ipykernel 
pip3 install numpy-stl 
pip3 install matplotlib 
pip3 install seaborn
pip3 install numpy 
pip3 install pandas 
pip3 install jupyter
pip3 install scipy



# Create Jupyter notebook kernel
python3 -m ipykernel install --name=vacuolequant --user 
jupyter notebook 

# Run notebook for vacuole quantification, statistical analysis, and visualization
quantify_vacuoles_fromMesh_LiuBandyadka2024.ipynb # To quantify vacuoles from mesh files 
quantify_vacuoles_fromWebknossosexport_LiuBandyadka2024.ipynb # To quantify vacuoles from csv files 
```



# References

1. https://docs.webknossos.org/webknossos/volume_annotation.html  
2. [https://numpy-stl.readthedocs.io/](https://numpy-stl.readthedocs.io/en/latest/usage.html#plotting-using-matplotlib-is-equally-easy)
