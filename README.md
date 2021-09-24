
<!-- README.md is generated from README.Rmd. Please edit that file -->

# comtradeRggregator <img src='man/figures/logo1.png' align="right" height="139" />

<!-- badges: start -->

[![Status\_Badge](https://img.shields.io/badge/comtradeRggregator-v0.0.1-blue)](https://github.com/amannj/comtradeRggregator)
[![codecov](https://codecov.io/gh/amannj/comtradeRggregator/branch/master/graph/badge.svg?token=03GW9TJP27)](https://codecov.io/gh/amannj/comtradeRggregator)
[![R-CMD-check](https://github.com/amannj/comtradeRggregator/workflows/R-CMD-check/badge.svg)](https://github.com/amannj/comtradeRggregator/actions)
<!-- badges: end -->

The “comtradeRggregator” package provides a simple tool to download and
reclassify large chunks of [Comtrade trade
data](https://comtrade.un.org).

The package offers functionality to download and aggregate [Comtrade
trade data](https://comtrade.un.org) using [Comtrade’s
API](https://comtrade.un.org/data/doc/api/) by building on the
[comtradr](https://github.com/ropensci/comtradr) package. Furthermore,
it provides tools for easy reclassification of trade data using official
concordance tables from the [United Nations Statistical Division
(UNSD)](https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp)
and the [World Integrated Trade Solution
(WITS)](https://wits.worldbank.org/product_concordance.html).

------------------------------------------------------------------------

# Why this package?

## At a glance

`comtradeRggregator` brings together a set of convenient features for
[Comtrade trade data](https://comtrade.un.org) download and
reclassification that are absent from either the
[Comtrade](https://comtrade.un.org) or
[WITS](https://wits.worldbank.org/) web interfaces:

| Feature                                                        | [Comtrade](https://comtrade.un.org)                 | [WITS](https://wits.worldbank.org/)                         | `comtradeRggregator`                                                                                                                                |
|----------------------------------------------------------------|-----------------------------------------------------|-------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| Incorporating recent data updates and revisions                | yes                                                 | with delay                                                  | yes (via Comtrade)                                                                                                                                  |
| Extraction of monthly trade data                               | yes                                                 | no                                                          | yes                                                                                                                                                 |
| User limits without registration                               | [yes](https://comtrade.un.org/data/doc/api/#APIKey) | [yes](https://shop.un.org/comtrade)                         | no                                                                                                                                                  |
| API integration in R                                           | [comtradr](https://github.com/ropensci/comtradr)    | no                                                          | [comtradr](https://github.com/ropensci/comtradr)                                                                                                    |
| Designated option to download mirror trade data                | no                                                  | no                                                          | yes                                                                                                                                                 |
| Reclassification of trade data according to official standards | no                                                  | [WITS](https://wits.worldbank.org/product_concordance.html) | [WITS](https://wits.worldbank.org/product_concordance.html) and [UNSD](https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp) |

## Package features in detail

-   Downloads and aggregates [Comtrade
    data](https://comtrade.un.org/data) using [Comtrade’s
    API](https://comtrade.un.org/data/doc/api/) building on the
    [comtradr](https://github.com/ropensci/comtradr) package by offering
    more functionality for bulk and mirror data downloads.

-   Supports extraction of trade data for individual countries (*‘from
    country A to country B’*) as well as bulk downloads of multiple
    countries (*‘from group of countries C to group of countries D’*) as
    well as aggregated global trade data (*‘from country (a group of
    countries) E to the World’*).

-   Supports many key features of
    [comtradr](https://github.com/ropensci/comtradr) such as the option
    to download trade data following different trade classifications
    offered by [Comtrade](https://comtrade.un.org/data); see [Comtrade
    API Data Availability
    Request](https://comtrade.un.org/data/doc/api/#DataAvailabilityRequests)
    for more information. The full list of possible trade
    classifications and their corresponding input arguments used in the
    `comtradeRggregator` package are provided in the [Trade
    Classifications](https://amannj.github.io/resources/comtradeRggregator/#trade-classifications)
    table:

### Trade Classifications

| Description                                                   | Trade code; use either version as input for argument | Level of (dis-)aggregation for input argument `ag` |
|---------------------------------------------------------------|------------------------------------------------------|----------------------------------------------------|
| HS combined, as reported                                      | `HS`                                                 | `TOTAL`,`AG2`, `AG4`, `AG6`                        |
| HS 1988/1992                                                  | `HS1992`, `H0`                                       | `TOTAL`,`AG2`, `AG4`, `AG6`                        |
| HS 1996                                                       | `HS1996`, `H1`                                       | `TOTAL`,`AG2`, `AG4`, `AG6`                        |
| HS 2002                                                       | `HS2002`, `H2`                                       | `TOTAL`,`AG2`, `AG4`, `AG6`                        |
| HS 2007                                                       | `HS2007`, `H3`                                       | `TOTAL`,`AG2`, `AG4`, `AG6`                        |
| HS 2012                                                       | `HS2012`, `H4`                                       | `TOTAL`,`AG2`, `AG4`, `AG6`                        |
| HS 2017                                                       | `HS2017`, `H5`                                       | `TOTAL`,`AG2`, `AG4`, `AG6`                        |
| SITC Standard International Trade Classification, as reported | `SITC`, `ST`                                         | `TOTAL`,`AG1`, `AG2`, `AG3`, `AG4`, `AG5`          |
| SITC Revision 1                                               | `SITCrev1`, `S1`                                     | `TOTAL`,`AG1`, `AG2`, `AG3`, `AG4`, `AG5`          |
| SITC Revision 2                                               | `SITCrev2`, `S2`                                     | `TOTAL`,`AG1`, `AG2`, `AG3`, `AG4`, `AG5`          |
| SITC Revision 3                                               | `SITCrev3`, `S3`                                     | `TOTAL`,`AG1`, `AG2`, `AG3`, `AG4`, `AG5`          |
| SITC Revision 4                                               | `SITCrev4`, `S4`                                     | `TOTAL`,`AG1`, `AG2`, `AG3`, `AG4`, `AG5`          |
| Broad Economic Categories Rev. 4                              | `BEC`, `BEC4`                                        | `TOTAL`,`AG1`, `AG2`, `AG3`                        |
| ~~Extended Balance of Payments Services Classification~~      | ~~`EB02`~~                                           | ~~`TOTAL`, `ALL`~~                                 |

-   Supports extraction of `annual` as well as `monthly`
    [Comtrade](https://comtrade.un.org) trade data.

-   Provides function for easy reclassification of trade data using
    official concordance tables from the \[United Nations Statistical
    Division (UNSD) - see
    [here](https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp)
    and
    [here](https://unstats.un.org/unsd/trade/classifications/bec.asp),
    and the [World Integrated Trade Solution
    (WITS)](https://wits.worldbank.org/product_concordance.html). For a
    complete summary of available [Concordance
    Tables](https://amannj.github.io/resources/comtradeRggregator/#concordance-table),
    please see below. To access any of the respective concordance tables
    in R, type `<tradecode from>_<tradecode to>`. For example, the
    concordance table for reclassifying `H3` trade data according to the
    `H0` nomenclature is stored as object `H3_H0` and its R help file
    can be accessed by typing `?H3_H0`. The R help files provide further
    information on the nature and individual features of the respective
    concordance matrices.

### Concordance Table

<table class="table" style="font-size: 8px; margin-left: auto; margin-right: auto;border-bottom: 0;">
<thead>
<tr>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="1">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

From…

</div>

</th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="20">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

…to

</div>

</th>
</tr>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1">
</th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

BEC

</div>

</th>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="3">
</th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="5">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

Harmonised System

</div>

</th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="4">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

ISIC

</div>

</th>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="2">
</th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="4">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

SITC

</div>

</th>
</tr>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
BEC4
</th>
<th style="text-align:left;">
BEC5
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
I31
</th>
<th style="text-align:left;">
I4
</th>
<th style="text-align:left;">
MTN
</th>
<th style="text-align:left;">
SIC
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
<td colspan="21" style="border-bottom: 1px solid;">
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
</tr>
<tr>
<td style="text-align:left;padding-left: 2em;" indentlevel="1">
H1
</td>
<td style="text-align:left;">
W
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
x<sup>a</sup>
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
<td colspan="21" style="border-bottom: 1px solid;">
<strong>Standard International Trade Classification (SITC)†</strong>
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
.
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
<tr grouplength="3">
<td colspan="21" style="border-bottom: 1px solid;">
<strong>International Standard Industrial Classification
(ISIC)††</strong>
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
.
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
I3.1
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
U
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
</tbody>
<tfoot>
<tr>
<td style="padding: 0; " colspan="100%">
<span style="font-style: italic;">Note: </span> <sup></sup> W for WITS;
U for UNSD.<br> <sup></sup> †: For the Standard International Trade
Classification (SITC) standard, AG4 as well as AG5 data is required.<br>
<sup></sup> ††: ISIC nomenclature not available as Comtrade download
option; concordance tables provided to facilitate re-classification
across different standards.
</td>
</tr>
<tr>
<td style="padding: 0; " colspan="100%">
<span style="font-style: italic;">x</span> <sup>a</sup> : Example for
concordance across seemingly unrelated classifications: H5 &gt;&gt; H3
&gt;&gt; I3.<br>
</td>
</tr>
</tfoot>
</table>

-   Supports extraction of [mirrored Comtrade trade
    data](https://wits.worldbank.org/wits/wits/witshelp/Content/Data_Retrieval/T/Intro/B2.Imports_Exports_and_Mirror.htm).
    This is useful as sometimes trade data between countries does not
    add up. For example, say, in 2020 country A reported USD *X*
    millions exports to country B while B was reporting USD *Y*
    millions, where *X* ≠ *Y*.

<br>

------------------------------------------------------------------------

# Further notes

## Using up-to-date trade information

Data availability varies by country and classification, and new trade
data is released/revised very frequently on
[Comtrade](https://comtrade.un.org/). `comtradeRggregator` uses trade
information corresponding to [official Comtrade data
availability](https://comtrade.un.org/data/da) which it updates once a
day and stores locally on your machine:

`<your local package location>/data/Comtrade_DataAvailability-<date stamp>.rds`

The locally stored Comtrade Data Availability file is used in every
`download_Comtrade()` data query. In other words, if new data becomes
available and is documented in the [official Comtrade data availability
file](https://comtrade.un.org/data/da), `comtradeRggregator` will use
this information no later than 24 hours after its publication. The
Comtrade Data Availability file can be accessed in R by typing
`Comtrade_DA`, and the corresponding help page can be accessed by typing
`?Comtrade_DA`.

## Extraction of monthly trade data

Monthly trade data is only reported as `HS Combined` (`HS`) which
combines all revisions of the *Harmonised System* nomenclature. As a
country reports its tariff scheduled for a given year in only one
revision, that is `HS1992` (`H0`), `HS1996` (`H1`) or `HS2002` (`H2`)
etc., combining these different revisions enables users to choose
products without having to know in which nomenclature a particular
country reports in a particular year; see
[here](https://wits.worldbank.org/WITS/wits/WITSHELP/Content/Annex/Annex1.About_WITS_HS_Combined.htm)
for more information on the *HS Combined* nomenclature.

## Reclassification of trade data to other standards

Reclassification of [Comtrade trade data](https://comtrade.un.org) is
possible using the information in the [Concordance
Table](https://amannj.github.io/resources/comtradeRggregator/index.html#concordance-table)
by employing the function `convert_Comtrade()`. The function requires
trade data at the most granular levels for the *Harmonised System (HS)*
nomenclature, i.e., `AG6`. For the *Standard International Trade
Classification (SITC)* standard, `AG4` as well as `AG5` data is
required.

------------------------------------------------------------------------

# Installation

To install the latest development version of `comtradeRggregator`
directly from [GitHub](https://github.com/amannj/comtradeRggregator),
use:

``` r
# Download `comtradeRggregator`; private repository, requires `auth_token`.
devtools::install_github("amannj/comtradeRggregator",
  ref = "master",
  auth_token = auth_token,
  force = TRUE
)
#> cpp11 (0.3.1 -> 0.4.0) [CRAN]
#> 
#>   There is a binary version available but the source version is later:
#>       binary source needs_compilation
#> cpp11  0.3.1  0.4.0             FALSE
#> 
#>          checking for file 'C:\Users\amann\AppData\Local\Temp\Rtmpg7oHoE\remotes2fe0cf87676\amannj-comtradeRggregator-93cd4ff7912232581c5c59bec30a97f7f9a2d51b/DESCRIPTION' ...  v  checking for file 'C:\Users\amann\AppData\Local\Temp\Rtmpg7oHoE\remotes2fe0cf87676\amannj-comtradeRggregator-93cd4ff7912232581c5c59bec30a97f7f9a2d51b/DESCRIPTION'
#>       -  preparing 'comtradeRggregator': (1.8s)
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   v  checking DESCRIPTION meta-information
#>       -  checking for LF line-endings in source and make files and shell scripts
#>       -  checking for empty or unneeded directories
#>       -  building 'comtradeRggregator_0.0.0.9000.tar.gz'
#>      
#> 
```

For more information as well as practical examples, please see the [Get
Started](https://amannj.github.io/resources/comtradeRggregator/articles/comtradeRggregator.html)
section of the package web page.

------------------------------------------------------------------------

# Credits and related projects

-   The hex sticker was generated by myself using the
    [hexSticker](https://github.com/GuangchuangYu/hexSticker) package.
-   `comtradeRggregator` uses the R package
    [comtradr](https://github.com/ropensci/comtradr) to download
    [Comtrade trade data](https://comtrade.un.org) using [Comtrade’s
    API](https://comtrade.un.org/data/doc/api/).
-   Integrated concordance tables taken from the [United Nations
    Statistical Division
    (UNSD)](https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp)
    and the [World Integrated Trade Solution
    (WITS)](https://wits.worldbank.org/product_concordance.html).
