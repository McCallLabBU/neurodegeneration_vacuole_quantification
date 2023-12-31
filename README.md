# Neurodegeneration Vacuole Quantification
Scripts for vacuole quantification in 3D 2-photon images of D. melanogaster brain 

(Original publication: https://www.cell.com/iscience/fulltext/S2589-0042(23)02129-6)

Citation : Elguero, J. E., Liu, G., Tiemeyer, K., Bandyadka, S., Gandevia, H., Duro, L., Yan, Z., & McCall, K. (2023). Defective phagocytosis leads to neurodegeneration through systemic increased innate immune signaling. iScience, 0(0). https://doi.org/10.1016/j.isci.2023.108052

# Aim

To identify whether there is a statistically significant difference in the **number, size,** and **spatial distribution** of neurodegeneration vacuoles in whole-mount 2-photon microscopy images of _D.melanogaster_ brains

# Data

Whole-mount 2-photon imaging

- Red : phalloidin (muscle)
- Green : Hoechst (nucleus)

# Methods

## 1. Webknossos workflow to identify vacuoles

### 1a. Upload confocal images to webknossos

- Use prairie reader plugin to import xml files into FIJI
- Convert stack to RGB
- Save merged RGB z-stacks in Tiff format
- Upload RGB TIFF z-stacks of individual brains to Webknossos

### 1b. Annotate vacuoles

- Create a new volume annotation 
- Identify each vacuole visually. For each vacuole
	- create a new segment id
	- Paint over vacuoles in some z-stack levels using the quick select automatic segmentation tool
	- Use the interpolation tool to automatically fill in the vacuole 
	- When the vacuole is fully annotated, create a 3d mesh for the segment
- Repeat the above steps to annotate the whole brain  
- Download the mesh for vacuoles and whole brain as stl files 


## 2. Python script to quantify vacuoles

```bash
# Create a Python3 virtual environment and activate
python3 -m venv vacuolequant
source vacuolequant/bin/activate

# Install necessary packages
pip3 install ipykernel 
pip3 install numpy-stl 
pip3 install matplotlib 
pip3 install seaborn
pip3 install numpy 
pip3 install pandas 

# Create Jupyter notebook kernel
python3 -m ipykernel install --name=vacuolequant
jupyter notebook 

# Run notebook for vacuole quantification, statistical analysis, and visualization
quantify_vacuoles.ipynb

```



# References

1. https://docs.webknossos.org/webknossos/volume_annotation.html  
2. [https://numpy-stl.readthedocs.io/](https://numpy-stl.readthedocs.io/en/latest/usage.html#plotting-using-matplotlib-is-equally-easy)
