
<!-- README.md is generated from README.Rmd. Please edit that file -->

# comtradeRggregator <img src="logo2.png" align="right" height="139"/>

<!-- badges: start -->

[![Status\_Badge](https://img.shields.io/badge/comtradeRggregator-v.0.01-informational)](https://github.com/amannj/comtradeRggregator)
<!-- badges: end -->

The goal of the `comtradeRggregator` package is to provide a simple tool
to download and reclassify large chunks of trade data. It offers
functionality to download and aggregate
[Comtrade](https://comtrade.un.org) trade data using [Comtrade’s
API](https://comtrade.un.org/data/doc/api/) by building on the
[comtradr](https://github.com/ropensci/comtradr) package. Furthermore,
it provides a function for easy reclassification of trade data using
official concordance tables from the [United Nations Statistical
Division
(UNSD)](https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp)
and the [World Integrated Trade Solution
(WITS)](https://wits.worldbank.org/product_concordance.html).

## Why this package?

### At a glance

`comtradeRggregator` attempts to bring together a set of convenient
features for bulk data download and trade data reclassification that are
absent from either the [Comtrade](https://comtrade.un.org) or
[WITS](https://wits.worldbank.org/) web interfaces.

| Feature                                                                      | [Comtrade](https://comtrade.un.org)                   | [WITS](https://wits.worldbank.org/) | `comtradeRggregator`                                  |
|------------------------------------------------------------------------------|-------------------------------------------------------|-------------------------------------|-------------------------------------------------------|
| Incorporating recent data updates and revisions                              | yes                                                   | with delay                          | yes (via Comtrade)                                    |
| Extraction of monthly trade data                                             | yes                                                   | no                                  | yes                                                   |
| Advanced querying and bulk download without registration                     | no                                                    | no                                  | yes, but slow                                         |
| Reclassification of trade data according to official standards (e.g to ISIC) | no                                                    | yes                                 | yes                                                   |
| API integration in R                                                         | with [comtradr](https://github.com/ropensci/comtradr) | no                                  | with [comtradr](https://github.com/ropensci/comtradr) |
| Designated option to download mirror trade data                              | no                                                    | no                                  | yes                                                   |

### Features

-   Downloads and aggregates [Comtrade
    data](https://comtrade.un.org/data) using [Comtrade’s
    API](https://comtrade.un.org/data/doc/api/) building on the
    [comtradr](https://github.com/ropensci/comtradr) package by offering
    more functionality for bulk and mirror data downloads of trade data.

-   Supports extraction of trade data for individual countries (*‘from
    country A to country B’*) as well as bulk downloads of multiple
    countries (*‘from group of countries C to a group of countries D’*)
    as well as aggregated global trade data.

-   Supports all key features of
    [comtradr](https://github.com/ropensci/comtradr) such as the option
    to download trade data following the different trade classifications
    offered by [Comtrade](https://comtrade.un.org/data); see [Comtrade
    API Data Availability
    Request](https://comtrade.un.org/data/doc/api/#DataAvailabilityRequests)
    for more information. The full list of possible trade
    classifications and their corresponding input arguments used in the
    `comtradeRggregator` package are provided in *Table Supported Trade
    Classification*:

*Table Supported Trade Classification*

| Description (common abbreviation)                                    | Trade code (input argument `tradecode`) | Level of (dis-)aggregation for input argument `ag` |
|----------------------------------------------------------------------|-----------------------------------------|----------------------------------------------------|
| HS combined,as reported (HS)                                         | `HS`                                    | `AG2`, `AG4`, `AG6`                                |
| HS 1988/1992 (H0)                                                    | `HS1992`                                | `AG2`, `AG4`, `AG6`                                |
| HS 1996 (H1)                                                         | `HS1996`                                | `AG2`, `AG4`, `AG6`                                |
| HS 2002 (H2)                                                         | `HS2002`                                | `AG2`, `AG4`, `AG6`                                |
| HS 2007 (H3)                                                         | `HS2007`                                | `AG2`, `AG4`, `AG6`                                |
| HS 2012 (H4)                                                         | `HS2012`                                | `AG2`, `AG4`, `AG6`                                |
| HS 2017 (H5)                                                         | `HS2017`                                | `AG2`, `AG4`, `AG6`                                |
| Standard International Trade Classification (SITC), as reported (ST) | `SITC`                                  | `AG1`, `AG3`, `AG3`, `AG4`, `AG5`                  |
| SITC Revision 1 (S1)                                                 | `SITCrev1`                              | `AG1`, `AG3`, `AG3`, `AG4`, `AG5`                  |
| SITC Revision 2 (S2)                                                 | `SITCrev2`                              | `AG1`, `AG3`, `AG3`, `AG4`, `AG5`                  |
| SITC Revision 3 (S3)                                                 | `SITCrev3`                              | `AG1`, `AG3`, `AG3`, `AG4`, `AG5`                  |
| SITC Revision 4 (S4)                                                 | `SITCrev4`                              | `AG1`, `AG3`, `AG3`, `AG4`, `AG5`                  |
| Broad Economic Categories (BEC)                                      | `BEC`                                   | `AG1`, `AG3`, `AG3`                                |
| ~~Extended Balance of Payments Services Classification (EB02)~~      | ~~`EB02`~~                              |                                                    |

-   Supports extraction of `annual` as well as `monthly`
    [Comtrade](https://comtrade.un.org) trade data.

-   Provides function for easy reclassification of trade data using
    official concordance tables from the [United Nations Statistical
    Division
    (UNSD)](https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp)
    and the [World Integrated Trade Solution
    (WITS)](https://wits.worldbank.org/product_concordance.html).; see
    *Table Concordance*:

*Table Concordance*

<table class="table" style="font-size: 11.5px; margin-left: auto; margin-right: auto;border-bottom: 0;">
<thead>
<tr>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="1">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

From…

</div>

</th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="17">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

…to

</div>

</th>
</tr>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
BEC
</th>
<th style="text-align:left;">
CCCN
</th>
<th style="text-align:left;">
CPC
</th>
<th style="text-align:left;">
GTAP
</th>
<th style="text-align:left;">
H0
</th>
<th style="text-align:left;">
H1
</th>
<th style="text-align:left;">
H2
</th>
<th style="text-align:left;">
H3
</th>
<th style="text-align:left;">
H4
</th>
<th style="text-align:left;">
I2
</th>
<th style="text-align:left;">
I3
</th>
<th style="text-align:left;">
SIC
</th>
<th style="text-align:left;">
MTN
</th>
<th style="text-align:left;">
S1
</th>
<th style="text-align:left;">
S2
</th>
<th style="text-align:left;">
S3
</th>
<th style="text-align:left;">
S4
</th>
</tr>
</thead>
<tbody>
<tr grouplength="7">
<td colspan="18" style="border-bottom: 1px solid;">
<strong>Harmonised System (HS)</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
HS
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
H0
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
H1
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
H2
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
H3
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
W/U
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
H4
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
x<sup>a</sup>
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
H5
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
x<sup>b</sup>
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
</tr>
<tr grouplength="4">
<td colspan="18" style="border-bottom: 1px solid;">
<strong>Standard International Trade Classification (SITC)</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
S1
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
S2
</td>
<td style="text-align:left;">
W/U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
x<sup>c</sup>
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
S3
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
x<sup>d</sup>
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
U
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
S4
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
x<sup>e</sup>
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
.
</td>
</tr>
<tr grouplength="2">
<td colspan="18" style="border-bottom: 1px solid;">
<strong>International Standard Industrial Classification (ISIC)</strong>
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
I2
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
I3
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
<td style="text-align:left;">
.
</td>
</tr>
</tbody>
<tfoot>
<tr>
<td style="padding: 0; " colspan="100%">
<span style="font-style: italic;">Abbreviations: </span> <sup></sup> W:
WITS, U: UN-Stats, x: reconstruction using mappings below.
</td>
</tr>
<tr>
<td style="padding: 0; " colspan="100%">
<span style="font-style: italic;">Mapping: </span> <sup>a</sup> H4
&gt;&gt; H3 &gt;&gt; I3. <sup>b</sup> H5 &gt;&gt; H3 &gt;&gt; I3.
<sup>c</sup> S2 &gt;&gt; I2 &gt;&gt; I3 <sup>d</sup> S3 &gt;&gt; S2
&gt;&gt; I2 &gt;&gt; I3 <sup>e</sup> S4 &gt;&gt; S3 &gt;&gt; S2 &gt;&gt;
I2 &gt;&gt; I3
</td>
</tr>
</tfoot>
</table>

-   Supports extraction of [mirrored Comtrade trade
    data](https://wits.worldbank.org/wits/wits/witshelp/Content/Data_Retrieval/T/Intro/B2.Imports_Exports_and_Mirror.htm).
    This is useful as sometimes trade data between countries does not
    add up. For example, say, in 2020 country A reported USD *X*
    millions exports to country B while B was reporting USD *Y*
    millions, where *X* ≠ *Y*. In such cases it makes sense to use
    [mirrored Comtrade trade
    data](https://wits.worldbank.org/wits/wits/witshelp/Content/Data_Retrieval/T/Intro/B2.Imports_Exports_and_Mirror.htm).

### Further notes

#### Using up-to-date trade information

Data availability varies by country and classification, and new trade
data is released/revised very frequently on
[Comtrade](https://comtrade.un.org/). `comtradeRggregator` uses trade
information corresponding to [official Comtrade data
availability](https://comtrade.un.org/data/da) which it updates once a
day and stores locally on your machine:

`<your local package location>/data/Comtrade_DataAvailability/Comtrade_DataAvailability-<date stamp>.csv.gz`

The locally stored Comtrade Data Availability file is used in every
`download_Comtrade()` data query. In other words, if new data becomes
available and is documented in the [official Comtrade data availability
file](https://comtrade.un.org/data/da), `comtradeRggregator` will use
this information no later than 24 hours after its publication.

#### Extraction of monthly trade data

Monthly trade data is only reported as ‘HS Combined’ (`HS`) which
combines all revisions of the Harmonised System nomenclature. As a
country reports its tariff scheduled for a given year in only one
revision, that is HS1988/1992 (`H0`), HS1996 (`H1`) or HS2002 (`H2`)
etc., combining these different revisions enables users to choose
products without having to know in which nomenclature a particular
country reports in a particular year; [see
here](https://wits.worldbank.org/WITS/wits/WITSHELP/Content/Annex/Annex1.About_WITS_HS_Combined.htm)
for more information on the ‘HS Combined’ nomenclature.

------------------------------------------------------------------------

## Installation

To install the latest development version of `comtradeRggregator`
directly from [GitHub](https://github.com/amannj/comtradeRggregator),
use:

``` r
library(devtools)

devtools::install_github("amannj/comtradeRggregator",
  ref = "master",
  auth_token = "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"
)
#> vctrs  (0.3.6 -> 0.3.7) [CRAN]
#> utf8   (1.1.4 -> 1.2.1) [CRAN]
#> tibble (3.0.6 -> 3.1.1) [CRAN]
#> package 'vctrs' successfully unpacked and MD5 sums checked
#> package 'utf8' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\juerg\AppData\Local\Temp\RtmpOW9B7h\downloaded_packages
#>          checking for file 'C:\Users\juerg\AppData\Local\Temp\RtmpOW9B7h\remotes2d74293751cd\amannj-comtradeRggregator-260cc32559414f5df35358c8e2f2d5c425a72542/DESCRIPTION' ...  v  checking for file 'C:\Users\juerg\AppData\Local\Temp\RtmpOW9B7h\remotes2d74293751cd\amannj-comtradeRggregator-260cc32559414f5df35358c8e2f2d5c425a72542/DESCRIPTION'
#>       -  preparing 'comtradeRggregator': (1s)
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   v  checking DESCRIPTION meta-information
#>       -  checking for LF line-endings in source and make files and shell scripts
#>       -  checking for empty or unneeded directories
#>       -  building 'comtradeRggregator_0.0.0.9000.tar.gz'
#>   Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :     Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :
#>      storing paths of more than 100 bytes is not portable:
#>      'comtradeRggregator/data/Concordance_Tables/raw/HS 2012 to HS 1992 Correlation and conversion tables.xls'
#>   Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :     Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :
#>      storing paths of more than 100 bytes is not portable:
#>      'comtradeRggregator/data/Concordance_Tables/raw/HS 2012 to HS 1996 Correlation and conversion tables.xls'
#>   Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :     Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :
#>      storing paths of more than 100 bytes is not portable:
#>      'comtradeRggregator/data/Concordance_Tables/raw/HS 2012 to HS 2002 Correlation and conversion tables.xls'
#>   Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :     Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :
#>      storing paths of more than 100 bytes is not portable:
#>      'comtradeRggregator/data/Concordance_Tables/raw/HS 2012 to HS 2007 Correlation and conversion tables.xls'
#>   Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :     Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :
#>      storing paths of more than 100 bytes is not portable:
#>      'comtradeRggregator/data/Concordance_Tables/raw/HS 2012 to SITC Rev.4 Correlation and conversion tables.xls'
#>   Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :     Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :
#>      storing paths of more than 100 bytes is not portable:
#>      'comtradeRggregator/data/Concordance_Tables/raw/HS 2012 to SITC1 Correlation and conversion tables.xls'
#>   Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :     Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :
#>      storing paths of more than 100 bytes is not portable:
#>      'comtradeRggregator/data/Concordance_Tables/raw/HS 2012 to SITC2 Correlation and conversion tables.xls'
#>   Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :     Warning in utils::tar(filepath, pkgname, compression = compression, compression_level = 9L,  :
#>      storing paths of more than 100 bytes is not portable:
#>      'comtradeRggregator/data/Concordance_Tables/raw/HS 2012 to SITC3 Correlation and conversion tables.xls'
#>      
#> 
```

------------------------------------------------------------------------

## Functions

### `download_Comtrade()`

Function `download_Comtrade()` downloads and aggregates
[Comtrade](https://comtrade.un.org) trade data using [Comtrade’s
API](https://comtrade.un.org/data/doc/api/) by building on the
[comtradr](https://github.com/ropensci/comtradr) package.

#### Examples

First, load the package.

``` r
library(comtradeRggregator)

## create folders...?
```

To download global (`World`) `HS2007` `commodity` trade data in `USD`
for `all` trade flows (i.e. imports, exports as well as re-imports and
re-exports) at `AG6` reported by `Austria` in `2018`, run:

``` r
download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "World",
  tradecode = "HS2007",
  ag = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all"
) -> AT_World
#> 
#>  No Comtrade token specified; download restricted to 100 queries per hour.
#> 
#> New folder created in: 'data/tmp/2021-04-25_11.16AM'. Temporary files will be stored there.
#> 
#> Comtrade Data Availability file 'Comtrade_DataAvailability-2021-04-25'
#>    in folder 'data/Comtrade_DataAvailability'
#>    already exists and will be used for look-up.
#> 
#> 
#> Regular data download.
#>    Austria; year 2018 direction 'all' done.
#>     Going to sleep for 20 sec.
#> 1/1 for AG6 and year 1 completed.
#> 
AT_World
#> # A tibble: 9,432 x 8
#>    classification period trade_flow reporter partner commodity_code commodity   
#>    <chr>           <int> <chr>      <chr>    <chr>   <chr>          <chr>       
#>  1 H3               2018 Export     Austria  World   010110         Live horses~
#>  2 H3               2018 Import     Austria  World   010190         Live horses~
#>  3 H3               2018 Export     Austria  World   010190         Live horses~
#>  4 H3               2018 Import     Austria  World   010210         Live bovine~
#>  5 H3               2018 Export     Austria  World   010210         Live bovine~
#>  6 H3               2018 Import     Austria  World   010290         Live bovine~
#>  7 H3               2018 Export     Austria  World   010290         Live bovine~
#>  8 H3               2018 Import     Austria  World   010310         Live swine:~
#>  9 H3               2018 Export     Austria  World   010310         Live swine:~
#> 10 H3               2018 Import     Austria  World   010391         Live swine ~
#> # ... with 9,422 more rows, and 1 more variable: trade_value_usd <dbl>
```

Sometimes you might want to extract very specific information on
particular trade flows between two countries. For example, in order to
extract `re-exports` reported by `Austria` at `AG6` for `HS2007`
`commodity` for trade with `Germany` in `2018`, run the command below.
As you can see, this returns an empty data frame which means that there
is no trade data recorded on [Comtrade](https://comtrade.un.org) that
meets the specific characterisation.

``` r
download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "Germany",
  tradecode = "HS2007",
  ag = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "re_exports"
)
#> 
#>  No Comtrade token specified; download restricted to 99 queries per hour.
#> 
#> New folder created in: 'data/tmp/2021-04-25_11.18AM'. Temporary files will be stored there.
#> 
#> Comtrade Data Availability file 'Comtrade_DataAvailability-2021-04-25'
#>    in folder 'data/Comtrade_DataAvailability'
#>    already exists and will be used for look-up.
#> 
#> 
#> Regular data download.
#>    Austria; year 2018 direction 're_exports' done.
#>     Going to sleep for 20 sec.
#> 1/1 for AG6 and year 1 completed.
#> 
#> # A tibble: 0 x 0
```

Sometimes trade data between countries does not add up. For example,
say, in 2020 country A reported USD *X* millions exports to country B
while B was reporting USD *Y* millions, where *X* ≠ *Y*. In such cases
it makes sense to use [mirrored Comtrade trade
data](https://wits.worldbank.org/wits/wits/witshelp/Content/Data_Retrieval/T/Intro/B2.Imports_Exports_and_Mirror.htm).
The function `download_Comtrade()` offers an easy option to accomplish
this. For example, if we want to download all `HS2007` commodity data
(trade in USD only) at `AG6` *reported by all countries that traded with
Austria* in 2018, run:

    download_Comtrade(
       year          = "2018",
       frequency     = "annual", 
       countries     = "Austria",
       partners      = "World",
       is.mirrorData = TRUE,
       tradecode     = "HS2007",
       ag            = "AG6",
       type          = "commodities", 
       select.stats  = "trade_value_usd",
       direction     = "all"
    ) -> AT_World_mirrored

Mirrored trade data accounts for roughly 349*B* ÷ 361*B* ≈ 97% of total
trade volume measured in USD reported by Austria in HS2017 in the year
2018.

     AT_World_mirrored %>%
      summarise(sum(trade_value_usd)) %>% pull() / AT_World %>%
       summarise(sum(trade_value_usd)) %>% pull() 
    #    0.97

#### Arguments

-   `year` - Year for which to extract data.

-   `frequency` - Frequency of data extract; either `annual` or
    `monthly`; default is `annual`.

-   `month` - Optional parameter for `monthly` extract; ignored for
    `annual` extracts; default is all 12 month if
    `frequency = 'monthly'`.

-   `countries` - Select list of countries to be extracted; default is
    `all`.

-   `partners` - Specify partner country/countries or `World` (as
    provided by Comtrade) for global, aggregated trade; default is
    `World`.

    -   If `is.mirrorData = FALSE` and `partners = 'World`,
        `download_Comtrade()` will download aggregated ‘World’ trade as
        provided by [Comtrade](https://comtrade.un.org).
    -   If `is.mirrorData = TRUE` and `partners = 'World`, no ‘World’
        aggregate is available via [Comtrade](https://comtrade.un.org).
        In this case `download_Comtrade()` will download mirror trade
        data for [all available
        countries](https://comtrade.un.org/data/da) and creates and
        returns an artificial ‘World’ aggregate by summing up over all
        countries.

-   `is.mirrorData` - Extract mirror trade data? default is `FALSE`; Set
    to `TRUE` to extract mirror trade data from country/countries
    specified in argument `partners`. For example, if
    `is.mirrorData = TRUE` export data from countries specified in
    argument `countries` to countries specified in argument `partners`
    is measured as import data from countries specified in argument
    `countries` to countries specified in argument `partners` as
    reported by countries specified in argument `partners`.

-   `tradecode` - Select trade database and classification to be
    extracted; default is `HS2007`; monthly trade data only available
    following `HS` classification; the full list of possible trade
    classifications and their corresponding input arguments used in the
    `comtradeRggregator` package are provided in *Table Supported Trade
    Classification*.

-   `ag` - Level of aggregation of trade data; varies by trade data set.

-   `type` - Type of trade data to be extracted (either `services` or
    `commodities`); currently only `type = commodities` implemented.

-   `direction` - Direction of trade flow reported; either `imports`,
    `exports`, `re_-_imports`, `re_-_exports` or `all`; default is
    `all`.

-   `select.stats` - Trade statistics to be reported; either
    `trade_value_usd`, `qty_unit_code`, `qty_unit`, `alt_qty_unit_code`,
    `alt_qty_unit`, `qty, alt_qty`, `netweight_kg`, `gross_weight_kg` or
    `all`; default is `all`.

-   `token` - Set Comtrade token to increase hourly queries from
    [Comtrade API](https://comtrade.un.org/Data/Doc/API); increases the
    speed of large data extraction as it increases the number of queries
    that can be run per hour.

-   `ext_cnt` - Number of countries extracted with each query; default
    is 5 which is also the maximum in
    [comtradr](https://github.com/ropensci/comtradr)

-   `rm.temporaryFiles` - Remove temporary download files stored at
    location provided in argument `location.temporaryFiles`; default is
    `TRUE`.

-   `location.temporaryFiles` - Location of temporary file downloads;
    default is
    `<your package directory>\data\tmp\<date-and-time-stamp>`; if you
    decide to use a different location, an alternative temporary folder
    needs to be created first.

-   `sleep` - Number of seconds to wait before the next Comtrade API
    query is started; default is 20.

------------------------------------------------------------------------

### `is.available_Comtrade()`

To check if data of a particular trade data set, frequency or country
available according to the [Comtrade Data Availability
file](https://comtrade.un.org/data/da) before running a query, use
function `is.available_Comtrade()`. The function uses the locally stored
Comtrade Data Availability file which is updated on a daily basis.

#### Examples

To get a list of all countries for which `annual`, `HS2007` trade data
is available for the year `2008`, run:

``` r
da1 <- is.available_Comtrade(
  frequency = "annual",
  tradecode = "H3",
  year = 2008
)
#> 
#> Comtrade Data Availability file 'Comtrade_DataAvailability-2021-04-25'
#>    in folder 'data/Comtrade_DataAvailability'
#>    already exists and will be used for look-up.
#> 

da1
#>   [1] "China, Hong Kong SAR"             "Hungary"                         
#>   [3] "Iceland"                          "Ireland"                         
#>   [5] "Israel"                           "Italy"                           
#>   [7] "Côte d'Ivoire"                    "Jamaica"                         
#>   [9] "Japan"                            "Jordan"                          
#>  [11] "Kenya"                            "Rep. of Korea"                   
#>  [13] "Kyrgyzstan"                       "Lebanon"                         
#>  [15] "Latvia"                           "Lithuania"                       
#>  [17] "Luxembourg"                       "China, Macao SAR"                
#>  [19] "Madagascar"                       "Malawi"                          
#>  [21] "Maldives"                         "Mali"                            
#>  [23] "Chile"                            "China"                           
#>  [25] "Colombia"                         "Mayotte"                         
#>  [27] "Cook Isds"                        "Costa Rica"                      
#>  [29] "Croatia"                          "Cyprus"                          
#>  [31] "Czechia"                          "Denmark"                         
#>  [33] "Dominican Rep."                   "Ecuador"                         
#>  [35] "El Salvador"                      "Ethiopia"                        
#>  [37] "Estonia"                          "Faeroe Isds"                     
#>  [39] "Fiji"                             "Finland"                         
#>  [41] "France"                           "State of Palestine"              
#>  [43] "Germany"                          "Greece"                          
#>  [45] "Greenland"                        "Guatemala"                       
#>  [47] "Guyana"                           "Malta"                           
#>  [49] "Mauritius"                        "Mexico"                          
#>  [51] "Montenegro"                       "Namibia"                         
#>  [53] "Netherlands"                      "New Caledonia"                   
#>  [55] "New Zealand"                      "Nicaragua"                       
#>  [57] "Norway"                           "Pakistan"                        
#>  [59] "Panama"                           "Paraguay"                        
#>  [61] "Peru"                             "Poland"                          
#>  [63] "Portugal"                         "Romania"                         
#>  [65] "Russian Federation"               "United Arab Emirates"            
#>  [67] "Tunisia"                          "Turkey"                          
#>  [69] "Uganda"                           "North Macedonia"                 
#>  [71] "Egypt"                            "United Kingdom"                  
#>  [73] "United Rep. of Tanzania"          "USA"                             
#>  [75] "Uruguay"                          "Zambia"                          
#>  [77] "Saudi Arabia"                     "Senegal"                         
#>  [79] "Serbia"                           "Singapore"                       
#>  [81] "Slovakia"                         "Viet Nam"                        
#>  [83] "Slovenia"                         "South Africa"                    
#>  [85] "Zimbabwe"                         "Spain"                           
#>  [87] "Fmr Sudan"                        "Eswatini"                        
#>  [89] "Sweden"                           "Switzerland"                     
#>  [91] "Syria"                            "Thailand"                        
#>  [93] "Togo"                             "Tonga"                           
#>  [95] "Trinidad and Tobago"              "Algeria"                         
#>  [97] "Andorra"                          "Azerbaijan"                      
#>  [99] "Argentina"                        "Australia"                       
#> [101] "Austria"                          "Bangladesh"                      
#> [103] "Armenia"                          "Belgium"                         
#> [105] "Bhutan"                           "Bolivia (Plurinational State of)"
#> [107] "Bosnia Herzegovina"               "Brazil"                          
#> [109] "EU-28"                            "Bulgaria"                        
#> [111] "Belarus"                          "Cambodia"                        
#> [113] "Canada"                           "Cabo Verde"                      
#> [115] "Sri Lanka"
```

Similarly, you might want to know if a particular (set of)
country/countries is available in a particular trade data set. To check
if either `Austria` or `Germany` have `annual` trade data reported in
`HS2007` for the year `2012`, run:

``` r
da2 <- is.available_Comtrade(
  is.contained = c("Austria", "Germany"),
  frequency = "annual",
  tradecode = "H2",
  year = 2012
)
#> 
#> Comtrade Data Availability file 'Comtrade_DataAvailability-2021-04-25'
#>    in folder 'data/Comtrade_DataAvailability'
#>    already exists and will be used for look-up.
#> 

da2
#> [1] TRUE TRUE
```

The same can also be done for monthly data. As seen below, only
`Germany` has `monthly` `HS2007` trade date for the first month of
`2020` available in Comtrade.

``` r
da3 <- is.available_Comtrade(
  is.contained = c("Austria", "Germany"),
  frequency = "monthly",
  month = "01",
  tradecode = "H3",
  year = 2020
)
#> 
#> Comtrade Data Availability file 'Comtrade_DataAvailability-2021-04-25'
#>    in folder 'data/Comtrade_DataAvailability'
#>    already exists and will be used for look-up.
#> 

da3
#> [1] FALSE  TRUE
```

#### Arguments

-   `is.contained` - Check if a particular (set of) country/countries is
    available for a particular data set; default is `NULL` which returns
    list of all countries available for a given data set.

-   `type` - Type of trade data to be extracted; either `services` or
    `commodities`; currently only `commodities` implemented.

-   `frequency` - Frequency of data extract; either `annual` or
    `monthly`; default is `annual`.

-   `month` - Optional parameter for `monthly` extract; ignored for
    `annual` extracts; only takes one entry as monthly trade data
    availability varies by month.

-   `tradecode` - Select trade database and classification to be
    extracted; default is `HS2007`; monthly trade data only available
    following `HS` classification; the full list of possible trade
    classifications and their corresponding input arguments used in the
    `comtradeRggregator` package are provided in *Table Supported Trade
    Classification*.

-   `year` - Year for which to extract data.

`folder` - Location of directory; default is
`"data/Comtrade_DataAvailability"`.

`directory` - Location of Comtrade Data Availability file; default is
`Comtrade_DataAvailability-<time and date stamp>.csv.gz`.

------------------------------------------------------------------------

### `convert_Comtrade()`

> **Note: Work in progress.**

Sometimes you might wish to reclassify trade data from one
classification to a different one. Function `convert_Comtrade()` offers
a simple way for such conversions by providing official concordance
tables from the [UN Statistics Division
(UNSD)](https://unstats.un.org/unsd/classifications/Econ#corresp-hs) and
the [World Integrated Trade Solution
(WITS)](https://wits.worldbank.org/product_concordance.html).

#### Examples

Using the abbreviations and information from the concordance table
above, if you want to convert your Comtrade data set from `H3` to `I3`
(ISIC Rev. 3), run:

``` r
AT_World %>%
  convert_Comtrade(
    classification = "classification",
    commodity.code = "commodity_code",
    convert.to = "I3"
  ) %>%
  select(classification, commodity_code, `ISIC Revision 3 Product Code`)
#> # A tibble: 9,612 x 3
#>    classification commodity_code `ISIC Revision 3 Product Code`
#>    <chr>          <chr>          <chr>                         
#>  1 H3             010110         0121                          
#>  2 H3             010190         0121                          
#>  3 H3             010190         0121                          
#>  4 H3             010210         0121                          
#>  5 H3             010210         0121                          
#>  6 H3             010290         0121                          
#>  7 H3             010290         0121                          
#>  8 H3             010310         0122                          
#>  9 H3             010310         0122                          
#> 10 H3             010391         0122                          
#> # ... with 9,602 more rows
```

#### Arguments

-   `classification` - Name of variable containing the trade
    classification (e.g. `H3`); default is ‘classification’.

-   `commodity.code` - Name of variable containing the commodity codes
    corresponding to trade classification; default is ‘commodity\_code’.

-   `convert.to` - Abbreviation of target classification based on
    *Concordance table* provided above.

------------------------------------------------------------------------

### `add_lzs()`

Adds leading zeros to variable `var` of data frame such that
`nchar(var) = length`.

``` r
df <- tibble(var = c("1", "11", "111"))

df %>% add_lzs(variable = "var", variable.length = 3)
#> # A tibble: 3 x 1
#>   var  
#>   <chr>
#> 1 001  
#> 2 011  
#> 3 111
```

#### Arguments

-   `variable` - A variable name.
-   `length.variable` - The desired length of variable `variable`;
    i.e. `nchar(length.variable)`.

------------------------------------------------------------------------

### `rm_temporaryFiles()`

Remove all temporary files and folders:

-   If there exist temporary files to be deleted, function
    `rm_temporaryFiles()` returns

``` r
rm_temporaryFiles(location.temporaryFiles = NULL)
#> Temporary files delete.
```

-   otherwise:

``` r
rm_temporaryFiles(location.temporaryFiles = NULL)
#> Temporary file directory already empty. Nothing to delete.
```

#### Arguments

-   `location.temporaryFiles` - Location of temporary file downloads;
    default is
    `<your package directory>\data\tmp\<date-and-time-stamp>`;
    alternatively specify the temporary download directory you wish to
    remove.

------------------------------------------------------------------------

## Related projects

-   R package [concordance](https://github.com/insongkim/concordance)
    provides a set of utilities for matching products in different
    classification codes used in international trade research.

------------------------------------------------------------------------

## Credits

-   The hex sticker is generated by myself using the
    [hexSticker](https://github.com/GuangchuangYu/hexSticker) package.
-   R package [comtradr](https://github.com/ropensci/comtradr).
-   [WITS concordance
    tables](https://wits.worldbank.org/product_concordance.html).
-   [Comtrade](https://comtrade.un.org) and its
    [API](https://comtrade.un.org/data/doc/api/).
