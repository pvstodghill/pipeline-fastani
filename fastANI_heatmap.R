#! /usr/bin/env Rscript

### Modified from https://github.com/spencer411/FastANI_heatmap/

### install.packages('reshape2')
suppressPackageStartupMessages(library("reshape2"))
### BiocManager::install("ComplexHeatmap")
suppressPackageStartupMessages(library("ComplexHeatmap"))
### install.packages('gplots')
suppressPackageStartupMessages(library("gplots"))

args <- commandArgs(TRUE)
if ( length(args) != 2 ) {
    print("Usage: fastANI_heatmap.R fastani.txt output.pdf")
    q(save="no",status=1)
}

input_filename <- args[1]
output_filename <- args[2]

### get data, convert to matrix
x <- read.table(input_filename)
matrix <- acast(x, V1~V2, value.var="V3")
matrix[is.na(matrix)] <- 70

### Use PyANI color scheme
breaks = seq(min(matrix), max(100), length.out=100)
gradient1 = colorpanel( sum( 70<=breaks[-1] & breaks[-1]<90), "gray", "blue" )
gradient2 = colorpanel( sum( 90<=breaks[-1] & breaks[-1]<95), "blue", "white" )
gradient3 = colorpanel( sum( 95<=breaks[-1] & breaks[-1]<100.1), "white", "red" )

hm.colors = c(gradient1, gradient2, gradient3)

pdf(output_filename)
heatmap.2(matrix, scale = "none", trace = "none", col = hm.colors, cexRow=.30, cexCol=.30)
dev.off()

q(save='no',status=0)
