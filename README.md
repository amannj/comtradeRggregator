
<!-- README.md is generated from README.Rmd. Please edit that file -->

# comtradeRggregator <img src='man/figures/logo1.png' align="right" height="139" />

<!-- badges: start -->

[![Status\_Badge](https://img.shields.io/badge/comtradeRggregator-v0.0.1-blue)](https://github.com/amannj/comtradeRggregator)
[![codecov](https://codecov.io/gh/amannj/comtradeRggregator/branch/master/graph/badge.svg?token=03GW9TJP27)](https://codecov.io/gh/amannj/comtradeRggregator)
[![R-CMD-check](https://github.com/amannj/comtradeRggregator/workflows/R-CMD-check/badge.svg)](https://github.com/amannj/comtradeRggregator/actions)
<!-- badges: end -->

The goal of the `comtradeRggregator` package is to provide a simple tool
to download and reclassify large chunks of [Comtrade trade
data](https://comtrade.un.org).

The package offers functionality to download and aggregate [Comtrade
trade data](https://comtrade.un.org) using [Comtrade’s
API](https://comtrade.un.org/data/doc/api/) by building on the
[comtradr](https://github.com/ropensci/comtradr) package. Furthermore,
it offers tools for easy reclassification of trade data using official
concordance tables from the [United Nations Statistical Division
(UNSD)](https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp)
and the [World Integrated Trade Solution
(WITS)](https://wits.worldbank.org/product_concordance.html).

## Why this package?

### At a glance

`comtradeRggregator` attempts to bring together a set of convenient
features for bulk [Comtrade trade data](https://comtrade.un.org)
download and reclassification that are absent from either the
[Comtrade](https://comtrade.un.org) or
[WITS](https://wits.worldbank.org/) web interfaces:

| Feature                                                        | [Comtrade](https://comtrade.un.org)                   | [WITS](https://wits.worldbank.org/) | `comtradeRggregator`                                       |
|----------------------------------------------------------------|-------------------------------------------------------|-------------------------------------|------------------------------------------------------------|
| Incorporating recent data updates and revisions                | yes                                                   | with delay                          | yes (via Comtrade)                                         |
| Extraction of monthly trade data                               | yes                                                   | no                                  | yes                                                        |
| Advanced querying and bulk download without registration       | no                                                    | no                                  | yes, but slow                                              |
| Reclassification of trade data according to official standards | no                                                    | selectively                         | yes                                                        |
| API integration in R                                           | with [comtradr](https://github.com/ropensci/comtradr) | no                                  | extending [comtradr](https://github.com/ropensci/comtradr) |
| Designated option to download mirror trade data                | no                                                    | no                                  | yes                                                        |

### Features

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
    `comtradeRggregator` package are provided in table [Trade
    Classifications](https://github.com/amannj/comtradeRggregator#trade-classifications):

#### Trade Classifications

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
    official concordance tables from the [United Nations Statistical
    Division
    (UNSD)](https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp)
    and the [World Integrated Trade Solution
    (WITS)](https://wits.worldbank.org/product_concordance.html); see
    [Concordance
    Table](https://github.com/amannj/comtradeRggregator#concordance-table)
    below. To access respective concordance tables in R, type
    `<tradecode from>_<tradecode to>`. For example, the concordance
    table for reclassifying `H3` trade data according to the `H0`
    nomenclature is stored as object `H3_H0` and its R help file can be
    accessed by typing `?H3_H0`.

#### Concordance Table

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
U for UN-Stats.
</td>
</tr>
<tr>
<td style="padding: 0; " colspan="100%">
<span style="font-style: italic;">x</span> <sup>a</sup> : Example for
concordance across seemingly unrelated classifications: H5 &gt;&gt; H3
&gt;&gt; I3.
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

`<your local package location>/data/Comtrade_DataAvailability-<date stamp>.csv.gz`

The locally stored Comtrade Data Availability file is used in every
`download_Comtrade()` data query. In other words, if new data becomes
available and is documented in the [official Comtrade data availability
file](https://comtrade.un.org/data/da), `comtradeRggregator` will use
this information no later than 24 hours after its publication. The
Comtrade Data Availability file can be accessed internally (by typing
`Comtrade_DA`), and the help page can be accessed type `?Comtrade_DA`.

#### Extraction of monthly trade data

Monthly trade data is only reported as *HS Combined* (`HS`) which
combines all revisions of the Harmonised System nomenclature. As a
country reports its tariff scheduled for a given year in only one
revision, that is *HS1988/1992* (`H0`), *HS1996* (`H1`) or *HS2002*
(`H2`) etc., combining these different revisions enables users to choose
products without having to know in which nomenclature a particular
country reports in a particular year; see
[here](https://wits.worldbank.org/WITS/wits/WITSHELP/Content/Annex/Annex1.About_WITS_HS_Combined.htm)
for more information on the *HS Combined* nomenclature.

#### Reclassification of trade data to other standards

Reclassification of [Comtrade trade data](https://comtrade.un.org) is
possible using the information in the [Concordance
Table](https://github.com/amannj/comtradeRggregator#concordance-table)
by employing the function `convert_Comtrade()`. The function requires
trade data at most granular levels for the *Harmonised System (HS)*,
which is the aggregation level `AG6`, and for the *International
Standard Industrial Classification (ISIC)* standard (`AG4`); see [Trade
Classifications](https://github.com/amannj/comtradeRggregator#trade-classifications)
for more information. For the *Standard International Trade
Classification (SITC)* standard, `AG4` as well as `AG5` is required.

## Installation

To install the latest development version of `comtradeRggregator`
directly from [GitHub](https://github.com/amannj/comtradeRggregator),
use:

``` r
# Download `comtradeRggregator`; private repository, requires `auth_token`.
devtools::install_github("amannj/comtradeRggregator",
  ref = "master",
  auth_token = "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",
  force = TRUE
)
#> comtradr (NA -> d89167fed...) [GitHub]
#> 
#>          checking for file 'C:\Users\juerg\AppData\Local\Temp\RtmpcFx9WF\remotes4b98576c5728\amannj-comtradr-d89167f/DESCRIPTION' ...  v  checking for file 'C:\Users\juerg\AppData\Local\Temp\RtmpcFx9WF\remotes4b98576c5728\amannj-comtradr-d89167f/DESCRIPTION'
#>       -  preparing 'comtradr':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   v  checking DESCRIPTION meta-information
#>       -  checking for LF line-endings in source and make files and shell scripts
#>       -  checking for empty or unneeded directories
#>       -  building 'comtradr_0.2.2.09000.tar.gz'
#>      
#>          checking for file 'C:\Users\juerg\AppData\Local\Temp\RtmpcFx9WF\remotes4b9861104f9c\amannj-comtradeRggregator-36088aa3ba5e6631c8a2bf740b57b8204d5f8b17/DESCRIPTION' ...  v  checking for file 'C:\Users\juerg\AppData\Local\Temp\RtmpcFx9WF\remotes4b9861104f9c\amannj-comtradeRggregator-36088aa3ba5e6631c8a2bf740b57b8204d5f8b17/DESCRIPTION'
#>       -  preparing 'comtradeRggregator': (2.1s)
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   v  checking DESCRIPTION meta-information
#>       -  checking for LF line-endings in source and make files and shell scripts
#>       -  checking for empty or unneeded directories
#>       -  building 'comtradeRggregator_0.0.0.9000.tar.gz'
#>      
#> 
```

Note that you will need
[this](https://github.com/amannj/comtradr/tree/sitc-bug) bug fix from
the `comtradr` package which is listed as a dependency for this package.
Alternatively, it can be installed by running:

    # Download `comtradr` to use some minor bug fixes
    devtools::install_github("amannj/comtradr",
      ref = "sitc-bug",
      force = TRUE
    )

------------------------------------------------------------------------

## Get started

First, load the package.

``` r
library(comtradeRggregator)
```

### `download_Comtrade()`

Function `download_Comtrade()` downloads and aggregates
[Comtrade](https://comtrade.un.org) trade data using [Comtrade’s
API](https://comtrade.un.org/data/doc/api/) and builds on the
[comtradr](https://github.com/ropensci/comtradr) package.

To download `annual` global, i.e. `World`, `commodity` trade data in
`USD` following the `HS2007` nomenclature for `all` available trade
flows, i.e. imports, exports as well as as [re-imports and
re-exports](https://wits.worldbank.org/WITS/wits/WITSHELP/Content/Data_Retrieval/T/Intro/B2.Exports_Versus_Reexports.htm),
at `AG6` level reported by `Austria` in `2018`, run:

``` r
AT_World <- download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "World",
  tradecode = "HS2007",
  ag = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "all"
)
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
extract `commodity` `re-exports` reported by `Austria` at `AG6` level
following hte `HS2007` nomenclature for trade with `Germany` in `2018`,
run the command below. As you can see, this returns an empty data frame.
This means that there is no trade data recorded on
[Comtrade](https://comtrade.un.org) that meets the specific criteria.

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
#> # A tibble: 0 x 0
```

Sometimes trade data between countries does not “add up”: For example,
in 2020 country A reported USD *X* millions exports to country B while B
was reporting USD *Y* millions, where *X* ≠ *Y*. In such cases it makes
sense to use [mirrored trade
data](https://wits.worldbank.org/wits/wits/witshelp/Content/Data_Retrieval/T/Intro/B2.Imports_Exports_and_Mirror.htm).
The function `download_Comtrade()` offers an easy option to accomplish
this. The relation of the queries used for the extraction of trade data
and mirrored trade data is illustrated in the example below:

Reported imports by Germany from Austria and reported mirrored exports
by Austria to Germany are identical by definition.<sup>[1](#fn1)</sup>
Furthermore, in the query below note that we can use either `tradecode`
names or abbreviations as input arguments for `tradecode` as provided in
table [Trade
Classifications](https://github.com/amannj/comtradeRggregator#trade-classifications):

``` r
IM_DE_AT <- download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Germany",
  partners = "Austria",
  tradecode = "HS2007",
  ag = "ag6",
  select.stats = "trade_value_usd",
  direction = "imports",
  type = "commodities",
  is.mirrorData = FALSE
)
mirrX_AT_DE <- download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "Germany",
  tradecode = "H3",
  ag = "ag6",
  select.stats = "trade_value_usd",
  direction = "exports",
  type = "commodities",
  is.mirrorData = TRUE,
  rm.temporaryFiles = FALSE
)
IM_DE_AT %>%
  summarise(sum(trade_value_usd)) %>%
  pull() / mirrX_AT_DE %>%
    summarise(sum(trade_value_usd)) %>%
    pull()
#> [1] 1
```

#### Arguments

For the full documentation, see the [reference
section](https:amannj.github.io/resources/comtradeRggregator/docs/reference/download_Comtrade.html)
or type `?download_Comtrade` in R.

------------------------------------------------------------------------

### `is.available_Comtrade()`

Sometimes you might want to check if data for a particular trade
classification, frequency and/or country is available via
[Comtrade](https://comtrade.un.org) before running a query. For this you
can use function `is.available_Comtrade()`. Similar to
`download_Comtrade()` this function uses the [Comtrade Data Availability
file](https://comtrade.un.org/data/da) which it updates once a
day.<sup>[2](#fn2)</sup>

#### Examples

To get a list of all countries for which `annual`, `HS2007` trade data
is available for the year `2008`, run:

``` r
da1 <- is.available_Comtrade(
  frequency = "annual",
  tradecode = "H3",
  year = '2008'
)
head(da1)
#> [1] "Algeria"   "Andorra"   "Argentina" "Armenia"   "Australia" "Austria"
```

Similarly, you might want to know if a particular country (set of
countries) is available in a particular trade data set. To check if
either `Austria` or `Germany` have `annual` trade data reported
following the `HS200` nomenclature for the year `2012`, run:

``` r
da2 <- is.available_Comtrade(
  is.contained = c("Austria", "Germany"),
  frequency = "annual",
  tradecode = "H2",
  year = '2012'
)
da2
#> Austria Germany 
#>    TRUE    TRUE
```

The same can also be done for monthly data. As seen below, only for
`Germany`, `monthly` trade data for January 2020 following the `HS2007`
is available.

``` r
da3 <- is.available_Comtrade(
  is.contained = c("Austria", "Germany"),
  frequency = "monthly",
  month = "01",
  tradecode = "H3",
  year = '2020'
)
da3
#> Austria Germany 
#>   FALSE    TRUE
```

If `is.fuzzy = TRUE`, function `is.available_Comtrade()` supports fuzzy
country name look-ups. As you can see below, there are two countries
that contain a character sequence `ustr`, i.e. ‘Australia’ and ‘Austria’
for `annual` Comtrade data following the `H3`/`HS2017` nomenclature and
the year `2019`. Monthly data is, however, only available for
‘Australia’.

``` r
is.available_Comtrade(
  is.contained = "ustr",
  is.fuzzy = TRUE,
  frequency = "annual",
  tradecode = "HS2017",
  year = '2019'
)
#> [1] "Australia" "Austria"

is.available_Comtrade(
  is.contained = "ustr",
  is.fuzzy = TRUE,
  frequency = "monthly",
  tradecode = "HS2017",
  year = '2019',
  month = '05'
)
#> [1] "Australia"
```

#### Arguments

For the full documentation, see the [reference
section](https:amannj.github.io/resources/comtradeRggregator/docs/reference/is.available_Comtrade.html)
or type `?is.available_Comtrade` in R.

------------------------------------------------------------------------

### `convert_Comtrade()`

Sometimes you might want to reclassify trade data to a different
nomenclature. Function `convert_Comtrade()` offers a simple way for such
conversions by providing official concordance tables from [UN Statistics
Division
(UNSD)](https://unstats.un.org/unsd/classifications/Econ#corresp-hs) and
the [World Integrated Trade Solution
(WITS)](https://wits.worldbank.org/product_concordance.html).

#### Examples

Say, you want to convert the trade data you downloaded before using
`download_Comtrade()` from `H3` to the *Revision 3 standard* of the
*International Standard Industrial Classification (ISIC)* nomenclature,
i.e. `I3`, you can use the abbreviations and information from the
[Concordance
Table](https://github.com/amannj/comtradeRggregator#concordance-table)
to do so by running the command below. You can obtain more information
on the concordance between `H3` and `I3` by running `?H3_I3` in R.
Furthermore, please note that for any non-matched category, a warning
message is returned.

``` r
I3 <- AT_World %>%
  convert_Comtrade(
    classification.from = "HS2007",
    commodity.code = "commodity_code",
    classification.to = "I3"
  )
#> Warning in convert_Comtrade(., classification.from = "HS2007", commodity.code
#> = "commodity_code", : The following commodity codes of column 'commodity_code'
#> could not be matched: 999999.
I3 %>%
  select(classification, commodity_code, `ISIC Revision 3 Product Code`)
#> # A tibble: 9,432 x 3
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
#> # ... with 9,422 more rows
```

Note that the different building blocks of `comtradeRggregator` can be
chained together very conveniently using the pipe, `%>%`, operator. In
the example below we want to download `HS2017` trade data for the year
2018 and convert it to the ISIC Rev. 3, `I3`, standard. Such operations
are typically rather cumbersome with either
[Comtrade](https://comtrade.un.org) or
[WITS](https://wits.worldbank.org/) but can be achieved in a couple of
lines of code with `comtradeRggregator` as illustrated below.

As before, we exploit the information provided in the [Concordance
Table](https://github.com/amannj/comtradeRggregator#concordance-table)
to first download `HS2017` data, then convert it to `HS3`, and then
again from `HS3` to `I3`. Note that the input arguments for `tradecode`
and `classification.from` and `classification.to` accept both names and
abbreviations for the respective `tradecode` standards as provided in
table [Trade
Classification](https://github.com/amannj/comtradeRggregator#trade-classifications).

``` r
# Step 1: Extract data from Comtrade
download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "World",
  tradecode = "HS2017",
  ag = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "exports"
) %>%
  # Step 2: Convert from HS2012/H4 to HS2007/H3
  convert_Comtrade(
    classification.from = "H5",
    commodity.code = "commodity_code",
    classification.to = "HS2007"
  ) %>%
  # Step 3: Convert from HS2012/H4 to HS2007/H3
  convert_Comtrade(
    classification.from = "H3",
    commodity.code = "HS 2007 Product Code",
    classification.to = "I3"
  ) %>%
  select(
    `Original Comtrade Query` = classification,
    `HS 2017 Product Code` = commodity_code,
    `HS 2007 Product Code`, `ISIC Revision 3 Product Code`
  )
#> # A tibble: 4,876 x 4
#>    `Original Comtrade~ `HS 2017 Product ~ `HS 2007 Product~ `ISIC Revision 3 Pr~
#>    <chr>               <chr>              <chr>             <chr>               
#>  1 H5                  010121             010110            0121                
#>  2 H5                  010129             010190            0121                
#>  3 H5                  010221             010210            0121                
#>  4 H5                  010229             010290            0121                
#>  5 H5                  010310             010310            0122                
#>  6 H5                  010391             010391            0122                
#>  7 H5                  010392             010392            0122                
#>  8 H5                  010410             010410            0121                
#>  9 H5                  010420             010420            0121                
#> 10 H5                  010511             010511            0122                
#> # ... with 4,866 more rows
```

#### Arguments

For the full documentation, see the [reference
section](https:amannj.github.io/resources/comtradeRggregator/docs/reference/convert_Comtrade.html)
or type `?convert_Comtrade` in R.

------------------------------------------------------------------------

### `build_Comtrade()`

Sometimes you might want to rebuild a data set using the temporary data
files you downloaded from Comtrade. For example, you can use function
`build_Comtrade()` whenever you have a very large data query which you
would like to run over multiple days (and turn off your computer in the
meantime) before building the finale Comtrade data base. In such a case
you would set `rm.temporaryFiles = FALSE` when running
`download_Comtrade()` and then, after you have run all your queries, you
would then point `build_Comtrade()` to the location of all your
temporary data files. A more practical example is provided in the next
paragraph.

Recall that when downloading the data frame `mirrX_AT_DE` we triggered
the option `rm.temporaryFiles = FALSE` and R told us that the temporary
file will be stored in:

    system.file("data/tmp", package = "comtradeRggregator")

We now use function `build_Comtrade()` in such cases where argument
`directory` takes the location of a specific, temporary data folder as
input argument. The remaining arguments correspond to the arguments in
`download_Comtrade()` and have to be adjusted accordingly in case you
want to divert from the defaults. For example, in case you want to
delete the temporary files when using `build_Comtrade()`, set
`rm.temporaryFiles = TRUE`.

``` r
# Location of temporary data download
location_package <- system.file("data/tmp", package = "comtradeRggregator")
location_files <- list.files(location_package)

# Rebuilt mirrored exports from Austria to Germany in 2018
mirrX_AT_DE_rebuilt <- build_Comtrade(
  directory = paste(location_package, location_files, sep = "/")
)

# Confirm that identical
mirrX_AT_DE %>%
  summarise(sum(trade_value_usd)) %>%
  pull() / mirrX_AT_DE_rebuilt %>%
    summarise(sum(trade_value_usd)) %>%
    pull()
#> [1] 1
```

#### Arguments

For the full documentation, see the [reference
section](https:amannj.github.io/resources/comtradeRggregator/docs/reference/build_Comtrade.html)
or type `?build_Comtrade` in R.

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

For the full documentation, see the [reference
section](https:amannj.github.io/resources/comtradeRggregator/docs/reference/add_lzs.html)
or type `?add_lzs` in R.

------------------------------------------------------------------------

### `rm_temporaryFiles()`

Remove all temporary files and folders: If there exist temporary files
to be deleted, function `rm_temporaryFiles()` returns

``` r
rm_temporaryFiles(location.temporaryFiles = NULL)
#> Temporary files deleted.
```

and otherwise

``` r
rm_temporaryFiles(location.temporaryFiles = NULL)
#> Temporary directory already empty. Nothing to delete.
```

#### Arguments

For the full documentation, see the [reference
section](https:amannj.github.io/resources/comtradeRggregator/docs/reference/rm_temporaryFiles.html)
or type `?rm_temporaryFiles` in R.

------------------------------------------------------------------------

## Related projects and Credits

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

------------------------------------------------------------------------

**Footnotes**

<a name="fn1">1</a>: Note that we set `rm.temporaryFiles = FALSE` in the
second query to demonstrate (i) how to [rebuild trade data set using
temporary data files using
`build_Comtrade()`](https://github.com/amannj/comtradeRggregator#build_comtrade)
, and (ii) the [different return messages for
`rm_temporaryFiles()`](https://github.com/amannj/comtradeRggregator#rm_temporaryfiles).

<a name="fn2">2</a>: The same is true for `download_Comtrade()`. In
other words, both `download_Comtrade()` and `is.available_Comtrade()`
will check the time stamp of the internally stored Comtrade Data
Availability file and update it once a day using the official [Comtrade
Data Availability](https://comtrade.un.org/data/da) file. For further
reference, the locally stored Comtrade Data Availability file can be
accessed by typing `Comtrade_DA`, and the help page can be accessed by
typing `?Comtrade_DA`.
