---
title       : Quick and dirty rates analysis
subtitle    : Mobile Compliance 2
author      : Phil Allen
job         : Kainos
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft, selfcontained}
knit        : slidify::knit2slides
---







```
## Warning in file(file, "rt"): cannot open file '../data/encounters.csv': No
## such file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```

## Quick look at times of day

![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4-1.png)

- Concentrate on hours 10 and 11
- Treat both as if same distribution



---

## Look at distribution

![plot of chunk unnamed-chunk-6](assets/fig/unnamed-chunk-6-1.png)

- Bimodal, so simple Poisson process not a good fit

---

## Try kernel density fit

![plot of chunk unnamed-chunk-7](assets/fig/unnamed-chunk-7-1.png)

- Find fitted quantiles and quickly check robustness against data

<!-- html table generated in R 3.2.3 by xtable 1.8-0 package -->
<!-- Fri Apr 01 19:42:45 2016 -->
<table border=1>
<tr> <th>  </th> <th> est_quantiles </th> <th> observed_probs </th>  </tr>
  <tr> <td align="right"> 90% </td> <td align="right"> 317 </td> <td align="right"> 0.9036 </td> </tr>
  <tr> <td align="right"> 99% </td> <td align="right"> 437 </td> <td align="right"> 0.9905 </td> </tr>
  <tr> <td align="right"> 99.9% </td> <td align="right"> 543 </td> <td align="right"> 0.9993 </td> </tr>
  <tr> <td align="right"> 99.99% </td> <td align="right"> 630 </td> <td align="right"> 0.9999 </td> </tr>
   </table>

- So take 630 as 99.99% worst hour

