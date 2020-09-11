readme
================
John Johnson
9/11/2020

[Rural-Urban Commuting Area
Codes](https://www.ers.usda.gov/data-products/rural-urban-commuting-area-codes/)
(RUCA) are created by the USDA to “classify U.S. census tracts using
measures of population density, urbanization, and daily commuting.” The
USDA also provides a zip code-based RUCA file. These are particularly
useful for public opinion researchers who know an interview respondent’s
zipcode but possibly little other geographic information.

The basic RUCA codes use a single code for [urbanized
areas](https://www.census.gov/programs-surveys/geography/about/faq/2010-urban-area-faq.html)–a
broad Census Bureau designation which includes basically all the
built-up parts of a Metropolitan Statistical Area. Public opinion
researchers typically want to distinguish between “urban” and “suburban”
communities, both of which are included in the Census definition of
“urbanized areas” and thus also RUCA code \#1.

To solve this problem, I create an additional code for “principal
cities.” Using the [Missouri Census Data Center’s Geographic
Correspondence
Engine](http://mcdc.missouri.edu/applications/geocorr2014.html), I
created a population-weighted crosswalk between ZCTAs (zip codes) and
the census-designated [principal cities of metropolitan statistical
areas](https://www.census.gov/geographies/reference-files/time-series/demo/metro-micro/delineation-files.html)
(as of 2020). I exclude the principal cities of *micro*politan
statistical areas.

A zip code which meets the following to conditions is classified as a
“principal city zip.” It must (1) be classified as RUCA code 1
(metropolitan core) ***and*** (2) a majority of its population must
reside in a principal city.

The resulting zipcode-to-modified-RUCA file is available to [download at
this
link](https://github.com/jdjohn215/modified-RUCA-codes/raw/master/Modified_RUCA_Zip_Codes_2010.csv).
The zipcode to principal cities crosswalk is available in the
`source-data` folder of this repository.

The modified RUCA file also includes additional suggested summary
classifications combining multiple existing codes.

Here is a table showing the codes along with the number of zipcodes and
total national population.

<!--html_preserve-->

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#xlalxjugyy .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#xlalxjugyy .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#xlalxjugyy .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#xlalxjugyy .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#xlalxjugyy .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xlalxjugyy .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#xlalxjugyy .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#xlalxjugyy .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#xlalxjugyy .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#xlalxjugyy .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#xlalxjugyy .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#xlalxjugyy .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#xlalxjugyy .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#xlalxjugyy .gt_from_md > :first-child {
  margin-top: 0;
}

#xlalxjugyy .gt_from_md > :last-child {
  margin-bottom: 0;
}

#xlalxjugyy .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#xlalxjugyy .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#xlalxjugyy .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xlalxjugyy .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#xlalxjugyy .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xlalxjugyy .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#xlalxjugyy .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#xlalxjugyy .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xlalxjugyy .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#xlalxjugyy .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#xlalxjugyy .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#xlalxjugyy .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#xlalxjugyy .gt_left {
  text-align: left;
}

#xlalxjugyy .gt_center {
  text-align: center;
}

#xlalxjugyy .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#xlalxjugyy .gt_font_normal {
  font-weight: normal;
}

#xlalxjugyy .gt_font_bold {
  font-weight: bold;
}

#xlalxjugyy .gt_font_italic {
  font-style: italic;
}

#xlalxjugyy .gt_super {
  font-size: 65%;
}

#xlalxjugyy .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>

<div id="xlalxjugyy" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">

<table class="gt_table">

<thead class="gt_col_headings">

<tr>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

ruca\_new

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

label\_new

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

ruca6

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

ruca5

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

zips

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

population

</th>

</tr>

</thead>

<tbody class="gt_table_body">

<tr>

<td class="gt_row gt_right">

0

</td>

<td class="gt_row gt_left">

Principal city

</td>

<td class="gt_row gt_left">

Principal city

</td>

<td class="gt_row gt_left">

Principal city

</td>

<td class="gt_row gt_center">

4,889

</td>

<td class="gt_row gt_right">

138,081,616

</td>

</tr>

<tr>

<td class="gt_row gt_right">

1

</td>

<td class="gt_row gt_left">

Suburban core

</td>

<td class="gt_row gt_left">

Suburban core

</td>

<td class="gt_row gt_left">

Suburban core

</td>

<td class="gt_row gt_center">

11,816

</td>

<td class="gt_row gt_right">

107,970,142

</td>

</tr>

<tr>

<td class="gt_row gt_right">

2

</td>

<td class="gt_row gt_left">

Metropolitan area high commuting: primary flow 30% or more to a UA

</td>

<td class="gt_row gt_left">

Exurbs

</td>

<td class="gt_row gt_left">

Exurbs

</td>

<td class="gt_row gt_center">

7,050

</td>

<td class="gt_row gt_right">

26,168,232

</td>

</tr>

<tr>

<td class="gt_row gt_right">

3

</td>

<td class="gt_row gt_left">

Metropolitan area low commuting: primary flow 10% to 30% to a UA

</td>

<td class="gt_row gt_left">

Exurbs

</td>

<td class="gt_row gt_left">

Exurbs

</td>

<td class="gt_row gt_center">

898

</td>

<td class="gt_row gt_right">

2,143,212

</td>

</tr>

<tr>

<td class="gt_row gt_right">

4

</td>

<td class="gt_row gt_left">

Micropolitan area core: primary flow within an Urban Cluster of 10,000
to 49,999 (large UC)

</td>

<td class="gt_row gt_left">

Large towns (10-50k)

</td>

<td class="gt_row gt_left">

Large towns (10-50k)

</td>

<td class="gt_row gt_center">

2,205

</td>

<td class="gt_row gt_right">

22,453,157

</td>

</tr>

<tr>

<td class="gt_row gt_right">

5

</td>

<td class="gt_row gt_left">

Micropolitan high commuting: primary flow 30% or more to a large UC

</td>

<td class="gt_row gt_left">

Large towns (10-50k)

</td>

<td class="gt_row gt_left">

Large towns (10-50k)

</td>

<td class="gt_row gt_center">

2,789

</td>

<td class="gt_row gt_right">

5,192,965

</td>

</tr>

<tr>

<td class="gt_row gt_right">

6

</td>

<td class="gt_row gt_left">

Micropolitan low commuting: primary flow 10% to 30% to a large UC

</td>

<td class="gt_row gt_left">

Large towns (10-50k)

</td>

<td class="gt_row gt_left">

Large towns (10-50k)

</td>

<td class="gt_row gt_center">

636

</td>

<td class="gt_row gt_right">

1,113,485

</td>

</tr>

<tr>

<td class="gt_row gt_right">

7

</td>

<td class="gt_row gt_left">

Small town core: primary flow within an Urban Cluster of 2,500 to 9,999
(small UC)

</td>

<td class="gt_row gt_left">

Small towns (2.5-10k)

</td>

<td class="gt_row gt_left">

Rural (less than 10k

</td>

<td class="gt_row gt_center">

2,042

</td>

<td class="gt_row gt_right">

11,252,065

</td>

</tr>

<tr>

<td class="gt_row gt_right">

8

</td>

<td class="gt_row gt_left">

Small town high commuting: primary flow 30% or more to a small UC

</td>

<td class="gt_row gt_left">

Small towns (2.5-10k)

</td>

<td class="gt_row gt_left">

Rural (less than 10k

</td>

<td class="gt_row gt_center">

1,378

</td>

<td class="gt_row gt_right">

1,933,200

</td>

</tr>

<tr>

<td class="gt_row gt_right">

9

</td>

<td class="gt_row gt_left">

Small town low commuting: primary flow 10% to 30% to a small UC

</td>

<td class="gt_row gt_left">

Small towns (2.5-10k)

</td>

<td class="gt_row gt_left">

Rural (less than 10k

</td>

<td class="gt_row gt_center">

538

</td>

<td class="gt_row gt_right">

816,103

</td>

</tr>

<tr>

<td class="gt_row gt_right">

10

</td>

<td class="gt_row gt_left">

Rural areas: primary flow to a tract outside a UA or UC

</td>

<td class="gt_row gt_left">

Isolated rural

</td>

<td class="gt_row gt_left">

Rural (less than 10k

</td>

<td class="gt_row gt_center">

6,903

</td>

<td class="gt_row gt_right">

9,127,889

</td>

</tr>

</tbody>

</table>

</div>

<!--/html_preserve-->
