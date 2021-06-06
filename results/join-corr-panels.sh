#!/bin/sh -eux
# vi: set ft=bash.sh tw=0 :

WIDTH=1000
HEIGHT=1200
HCROP=120
VCROP=167

for method in spearman; do
    for type in adjusted unadjusted; do
        # Individual
        for group in cases control; do
            convert corr-${method}-${type}-${group}.png corr-color-scale-vertical.png -gravity South +append corr-${method}-${type}-${group}-legend.png
        done

        # Vertical panel
        #convert corr-control-${method}-${type}.png -gravity South -crop "${WIDTH}x$(($HEIGHT - $VCROP))+0+0" tmp1.png
        #convert corr-cases-${method}-${type}.png tmp1.png -append tmp2.png
        #convert tmp2.png corr-color-scale-vertical.png -gravity East +append corr-panel-${type}-${method}.png

        # Horizontal panel
        #convert corr-control-${method}-${type}.png -gravity East -crop "$(($WIDTH - $HCROP))x${HEIGHT}+0+0" tmp1.png
        #convert corr-cases-${method}-${type}.png tmp1.png +append tmp2.png
        #convert tmp2.png corr-color-scale-horizontal.png -gravity South -append corr-panel-hor-${type}-${method}.png
    done

    # 2x2 panel
    #convert corr-panel-adjusted-${method}.png -gravity South -crop "$((2*$WIDTH - $HCROP))x$(($HEIGHT - $VCROP))+0+0" tmp1.png
    #convert corr-panel-unadjusted-${method}.png tmp1.png -append corr-panel-${method}.png
done

#rm tmp[1-9].png
