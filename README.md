# Exploring The Quick, Draw! Dataset With R: The Mona Lisa

In this experiment I explore the Google Quick Draw dataset. In its [Github website](https://github.com/googlecreativelab/quickdraw-dataset) you can see a detailed description of the data. Briefly, it contains  around 50 million of drawings of people around the world in `.ndjson` format. In this experiment, I used the simplified version of drawings where:

+ strokes are simplified and resampled with a 1 pixel spacing
+ drawings are also aligned to top-left corner and scaled to have a maximum value of 255

<img src="https://fronkonstin.com/wp-content/uploads/2018/06/mona_mosaic2.png" height="450" width="450" align="middle">

## Getting Started

### Prerequisites

You will need to install the following packages (if you don't have them already):

```
install.packages("LaF")
install.packages("dplyr")
install.packages("rjson")
install.packages("ggplot2")
install.packages("gganimate")
```

## Instructions

1. After forking the repo, download `The Mona Lisa.ndjson` dataset from [here](https://storage.googleapis.com/quickdraw_dataset/full/simplified/The%20Mona%20Lisa.ndjson) and place it on the same folder where `mona_lisa.R` file is.
1. Download also the portable version of `ImageMagick` as explained here and point to its  folder with `Sys.setenv` (you can see an example of that in the forst line of `mona_lisa.R`)

## More info

A complete explanation of the experiment can be found [at fronkonstin](https://fronkonstin.com/2018/07/01/exploring-the-quick-draw-dataset-with-r-the-mona-lisa/)

## Authors

* **Antonio Sánchez Chinchón** - [@aschinchon](https://twitter.com/aschinchon)

