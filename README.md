
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
    official concordance tables from the [United Nations Statistical
    Division
    (UNSD)](https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp)
    and the [World Integrated Trade Solution
    (WITS)](https://wits.worldbank.org/product_concordance.html); see
    [Concordance
    Table](https://amannj.github.io/resources/comtradeRggregator/#concordance-table)
    below. To access respective concordance tables in R, type
    `<tradecode from>_<tradecode to>`. For example, the concordance
    table for reclassifying `H3` trade data according to the `H0`
    nomenclature is stored as object `H3_H0` and its R help file can be
    accessed by typing `?H3_H0`.

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
Table](https://github.com/amannj/comtradeRggregator#concordance-table)
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
```

Note that you will need
[this](https://github.com/amannj/comtradr/tree/sitc-bug) bug fix from
the `comtradr` package which is listed as a dependency for this package.
Alternatively, it can be installed by running:

``` r
# Download `comtradr` to use some minor bug fixes
devtools::install_github("amannj/comtradr",
  ref = "sitc-bug",
  force = TRUE
)
```

------------------------------------------------------------------------

# Get started

First, load the package.

``` r
library(comtradeRggregator)
```

The main functions of the `comtradeRggregator` package are described
below.

## `download_Comtrade()`

Function `download_Comtrade()` downloads and aggregates
[Comtrade](https://comtrade.un.org) trade data using [Comtrade’s
API](https://comtrade.un.org/data/doc/api/) and builds on the
[comtradr](https://github.com/ropensci/comtradr) package. For the full
documentation, type `?download_Comtrade` in R or visit the reference
section of `download_Comtrade()`.

#### Example 1

To download `annual` global, i.e. `World`, `commodity` trade data in
`USD` following the `HS2007` nomenclature for `all` available trade
flows, i.e. imports, exports as well as [re-imports and
re-exports](https://wits.worldbank.org/WITS/wits/WITSHELP/Content/Data_Retrieval/T/Intro/B2.Exports_Versus_Reexports.htm),
at `AG6` level reported by `Austria` in `2018`, run:

``` r
AT_World <- download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "World",
  nomenclature = "HS2007",
  commodity = "AG6",
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

### Example 2

Sometimes you might want to extract very specific information on
particular trade flows between two countries.

For example, in order to extract `commodity` `re-exports` reported by
`Austria` at `AG6` level following the `HS2007` nomenclature for trade
with `Germany` in `2018`, run the command below. As you can see, this
returns an empty data frame. This means that there is no trade data
recorded on [Comtrade](https://comtrade.un.org) that meets the specific
criteria.

``` r
download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "Germany",
  nomenclature = "HS2007",
  commodity = "AG6",
  type = "commodities",
  select.stats = "trade_value_usd",
  direction = "re_exports"
)
#> # A tibble: 0 x 0
```

### Example 3

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
Note that in the query below we can use either `tradecode` names or
abbreviations as input arguments for `tradecode` as provided in table
[Trade Classifications](#trade-classifications).

``` r
IM_DE_AT <- download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Germany",
  partners = "Austria",
  nomenclature = "HS2007",
  commodity = "ag6",
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
  nomenclature = "H3",
  commodity = "ag6",
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

### Example 4

Note that in *Example 3* above, we have instructed `download_Comtrade()`
to keep the temporary download files (by invoking
`rm.temporaryFiles = FALSE`) for query `mirrX_AT_DE` while also using
this temporary data to build the completed Comtrade data from the query
and load it into R. The second step happens automatically as the
argument controlling this behaviour, `build.Comtrade` is set to `TRUE`
by default. However, there might be cases where you only want
`download_Comtrade()` to download the temporary trade data files from
Comtrade, and build the trade data in R at a later stage using
`build_comtrade()`; more on `build_comtrade()` [below](#build_comtrade).

Below, we instruct `download_Comtrade()` to run the same query as for
`mirrX_AT_DE` in *Example 3*; however, by setting
`build.Comtrade = FALSE` and `rm.temporaryFiles = FALSE` we ensure that
the trade data downloaded from Comtrade will only be stored locally but
not build and loaded into R.

``` r
mirrX_AT_DE_v2 <- download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "Germany",
  nomenclature = "H3",
  commodity = "ag6",
  select.stats = "trade_value_usd",
  direction = "exports",
  type = "commodities",
  is.mirrorData = TRUE,
  rm.temporaryFiles = FALSE,
  build.Comtrade = FALSE
)
#> Data download complete. Please see location specified in argument
#> `location.temporaryFiles` for location of temporary files.
mirrX_AT_DE_v2
#> NULL
```

### Example 5

There might be cases where you want to download a very specific group of
traded commodities that may potentially also be part of a different
level of aggregation. In the example below, we extract Austrian exports
to Germany for the commodity groups `65 - Headgear and parts thereof`
(`AG2`) as well as the corresponding sub-aggregates `6501` and `650100`,
respectively.<sup>[3](#fn3)</sup> Also see
[here](https://amannj.github.io/resources/comtradeRggregator/articles/extracting-aggregates.html)
for a more detailed discussion and some best practice advise on how to
use `comtradeRggregator` in such a scenario.

``` r
download_Comtrade(year = "2018",
                  frequency = "annual",
                  countries = "Austria",
                  partners = "Germany",
                  nomenclature = "HS2007",
                  commodity = c("65", "6501", "650100"),
                  type = "commodities",
                  select.stats = "trade_value_usd",
                  direction = "exports")
```

With `download_Comtrade()` you can not only download specific commodity
codes in this way, but also complete aggregates. For example, in case
you want to download all traded commodities at the 2- and 4-digit level,
i.e., `AG2` and `AG4`, you can do so by changing the input argument for
`commodity` of the above query to `commodity = c("AG2", "AG4")`.

------------------------------------------------------------------------

## `is.available_Comtrade()`

Sometimes you might want to check if data for a particular trade
classification, frequency and/or country is available via
[Comtrade](https://comtrade.un.org) before running a query. For this you
can use function `is.available_Comtrade()`. Similar to
`download_Comtrade()` this function uses the [Comtrade Data Availability
file](https://comtrade.un.org/data/da) which it updates once a
day.<sup>[2](#fn2)</sup> For the full documentation, type
`?is.available_Comtrade` in R or visit the reference section of
`is.available_Comtrade()`.

### Example 1

To get a tibble listing all countries for which `annual`, `HS2007` trade
data is available for the year `2008`, run:

``` r
da1 <- is.available_Comtrade(
  frequency = "annual",
  nomenclature = "H3",
  year = '2008'
)
head(da1)
#> # A tibble: 6 x 2
#>   country               year
#>   <chr>                <dbl>
#> 1 China, Hong Kong SAR  2008
#> 2 Hungary               2008
#> 3 Iceland               2008
#> 4 Ireland               2008
#> 5 Israel                2008
#> 6 Italy                 2008
```

### Example 2

Similarly, you might want to know if a particular country (set of
countries) is available in a particular trade data set. To check if
either `Austria` or `Germany` have `annual` trade data reported
following the `HS2002` nomenclature for the year `2012`, run:

``` r
da2 <- is.available_Comtrade(
  is.contained = c("Austria", "Germany"),
  frequency = "annual",
  nomenclature = "H2",
  year = '2012'
)
da2
#> # A tibble: 2 x 2
#>   country  year
#>   <chr>   <dbl>
#> 1 Germany  2012
#> 2 Austria  2012
```

The same can also be done for monthly data. As seen below, only for
`Germany`, `monthly` trade data for January 2020 following the `HS2007`
is available.

``` r
da3 <- is.available_Comtrade(
  is.contained = c("Austria", "Germany"),
  frequency = "monthly",
  month = "01",
  nomenclature = "H3",
  year = '2020'
)
da3
#> # A tibble: 1 x 2
#>   country year   
#>   <chr>   <chr>  
#> 1 Germany 2020-01
```

### Example 3

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
  nomenclature = "HS2017",
  year = '2019'
)
#> # A tibble: 2 x 2
#>   country    year
#>   <chr>     <dbl>
#> 1 Australia  2019
#> 2 Austria    2019

is.available_Comtrade(
  is.contained = "ustr",
  is.fuzzy = TRUE,
  frequency = "monthly",
  nomenclature = "HS2017",
  year = '2019',
  month = '05'
)
#> # A tibble: 1 x 2
#>   country   year   
#>   <chr>     <chr>  
#> 1 Australia 2019-05
```

------------------------------------------------------------------------

## `convert_Comtrade()`

Sometimes you might want to reclassify trade data to a different
nomenclature. Function `convert_Comtrade()` offers a simple way for such
conversions by providing official concordance tables from [UN Statistics
Division
(UNSD)](https://unstats.un.org/unsd/classifications/Econ#corresp-hs) and
the [World Integrated Trade Solution
(WITS)](https://wits.worldbank.org/product_concordance.html). For the
full documentation, type `?convert_Comtrade` in R or visit the reference
section of `convert_Comtrade()`.

### Example 1

Say, you want to convert the trade data you downloaded before using
`download_Comtrade()` from `H3` to the *Revision 3 standard* of the
*International Standard Industrial Classification (ISIC)* nomenclature,
i.e. `I3`, you can use the abbreviations and information from the
[Concordance Table](#concordance-table) to do so by running the command
below. You can obtain more information on the concordance between `H3`
and `I3` by running `?H3_I3` in R. Furthermore, please note that for any
non-matched category, a warning message is returned.

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

### Example 2

Note that the different building blocks of `comtradeRggregator` can be
chained together very conveniently using the pipe, `%>%`, operator. In
the example below we want to download `HS2017` trade data for the year
2018 and convert it to the ISIC Rev. 3, `I3`, standard. Such operations
are typically rather cumbersome with either
[Comtrade](https://comtrade.un.org) or
[WITS](https://wits.worldbank.org/) but can be achieved in a couple of
lines of code with `comtradeRggregator` as illustrated below.

As before, we exploit the information provided in the [Concordance
Table](#concordance-table) to first download `HS2017` data, then convert
it to `HS3`, and then again from `HS3` to `I3`. Note that the input
arguments for `tradecode` and `classification.from` and
`classification.to` accept both names and abbreviations for the
respective `tradecode` standards as provided in table [Trade
Classification](#trade-classifications).

``` r
# Step 1: Extract data from Comtrade
download_Comtrade(
  year = "2018",
  frequency = "annual",
  countries = "Austria",
  partners = "World",
  nomenclature = "HS2017",
  commodity = "AG6",
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

Please note that the chaining of concordance tables may be very
intriguing; however, it’s not free of any downsides as is discussed in
the article on [chaining concordance
tables](https://amannj.github.io/resources/comtradeRggregator/articles/chaining-concordance-tables.html).

------------------------------------------------------------------------

## `build_Comtrade()`

Sometimes you might want to rebuild a data set using the temporary data
files you downloaded from Comtrade. For example, you can use function
`build_Comtrade()` whenever you have a very large data query which you
would like to run over multiple days (and turn off your computer in the
meantime) before building the finale Comtrade database. In such a case
you would set `rm.temporaryFiles = FALSE` when running
`download_Comtrade()` and then, after you have run all your queries, you
would then point `build_Comtrade()` to the location of all your
temporary data files. A more practical example is provided in the next
paragraph. For the full documentation, type `?build_Comtrade` in R or
visit the reference section of `build_Comtrade()`.

### Example 1

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

------------------------------------------------------------------------

## Axiliary functions

The `comtradeRggregator` package comes with a set of auxiliary functions
that are run in the process of executing the main functions. Typically,
you would not have to execute any of them by themselves; however, some
of them might come in handy at some point, which is why this short
section is dedicated to them.

------------------------------------------------------------------------

### `add_lzs()`

Adds leading zeros to variable `var` of data frame such that
`nchar(var) = length`. For the full documentation, type `?add_lzs` in R
or visit the reference section of `add_lzs()`.

#### Example 1

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

------------------------------------------------------------------------

### `check_token()`

`comtradeRggregator` is written in a way to minimise the cases where you
run into usage limits imposed by the Comtrade API with an unregistered
guest account. With that said, having a registered account can speed up
the download process considerably as the limits for unauthenticated,
i.e. guest accounts, are restricted to 100 requests per hour (per IP
address or authenticated user). Consequently, it is advisable that you
obtain an authentication code (token) for large bulk downloads. You can
then feed this token into the `download_Comtrade()` function using the
`token` argument. Please see
[this](https://amannj.github.io/resources/comtradeRggregator/articles/handling-errors.html#error-code-409-1)
help article for a more extensive discussion on this topic. The function
`check_token()` checks validity of a supplied Comtrade token as
described in Comtrade’s [API
documentation](https://comtrade.un.org/data/doc/api/#APIKey), and builds
on the validation provided via the official [Access Rights
Information](https://comtrade.un.org/ws/CheckRights.aspx) mask as well
as the official Comtrade API service; [see
here](https://comtrade.un.org/api/swagger/ui/index#!/Auth/Auth_Authorize).

`check_token()` is executed every time you run `download_Comtrade()`;
however, you can also run it as a separate function if you want to check
the validity of a particular token and without running a Comtrade query.

#### Example 1

In this example we evaluate the `check_token()` function when providing:

1.  no token (the default);
2.  a ‘bad’, i.e., unregistered token;
3.  a ‘good’, i.e., registered token.

``` r
check_token() # no token; default
#> No Comtrade token specified; download restricted to 100 queries per hour.
```

``` r
check_token(token = bad_token)
#> Comtrade token incorrect; download restricted to 100 queries per hour.
#> [1] FALSE
```

``` r
check_token(token = good_token)
#> Comtrade token added; download limit set to 10,000 queries per hour.
#> [1] TRUE
```

------------------------------------------------------------------------

### `rm_temporaryFiles()`

Remove all temporary files and folders For the full documentation, type
`?rm_temporaryFiles` in R or visit the reference section of
`rm_temporaryFiles()`.

#### Example 1

If there exist temporary files to be deleted, function
`rm_temporaryFiles()` returns:

``` r
rm_temporaryFiles(location.temporaryFiles = NULL)
#> Temporary files deleted.
```

#### Example 2

If there are no temporary files to be deleted, function
`rm_temporaryFiles()` returns:

``` r
rm_temporaryFiles(location.temporaryFiles = NULL)
#> Temporary directory already empty. Nothing to delete.
```

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

------------------------------------------------------------------------

# Footnotes

<a name="fn1">1</a>: Note that we set `rm.temporaryFiles = FALSE` in the
second query to demonstrate (i) how to [rebuild trade data set using
temporary data files using
`build_Comtrade()`](https://github.com/amannj/comtradeRggregator#build_comtrade),
and (ii) the [different return messages for
`rm_temporaryFiles()`](https://github.com/amannj/comtradeRggregator#rm_temporaryfiles).

<a name="fn2">2</a>: The same is true for `download_Comtrade()`. In
other words, both `download_Comtrade()` and `is.available_Comtrade()`
will check the time stamp of the internally stored Comtrade Data
Availability file and update it once a day using the official [Comtrade
Data Availability](https://comtrade.un.org/data/da) file. For further
reference, the locally stored Comtrade Data Availability file can be
accessed by typing `Comtrade_DA`, and the help page can be accessed by
typing `?Comtrade_DA`.

<a name="fn3">3</a>: In case you are looking for a particular commodity,
e.g., ‘sheep’, but do not know the corresponding commodity code, you can
use [comtradr](https://github.com/ropensci/comtradr)’s
[ct\_commodity\_lookup()](https://docs.ropensci.org/comtradr/reference/ct_commodity_lookup.html)
function.
