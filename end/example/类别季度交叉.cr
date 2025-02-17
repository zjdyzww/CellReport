﻿<report version="2" needCatchQuShuException="False">
<dataSets>
<dataSet name="类别名称" type="sql" dataSource="testsqlite" fields="[&quot;类别ID&quot;,&quot;类别名称&quot;]">select 类别ID,类别名称 from 类别</dataSet>
<dataSet name="数据集1" type="sql" dataSource="testsqlite" fields="[&quot;类别ID&quot;,&quot;产品名称&quot;,&quot;产品销售额&quot;,&quot;发货季度&quot;]">SELECT [类别].[类别ID], [产品].[产品名称], Sum(([订单明细].[单价]*[数量]*(1-[折扣])/100)*100) AS 产品销售额, 
cast( round(strftime(&#x27;%m&#x27;,发货日期)/3.0 + 0.495) as int) ||  &#x27;季度&#x27; AS 发货季度
FROM 类别 INNER JOIN (订单 INNER JOIN (产品 INNER JOIN 订单明细 ON [产品].[产品ID]=[订单明细].[产品ID]) ON [订单].[订单ID]=[订单明细].[订单ID]) ON [类别].[类别ID]=[产品].[类别ID]
WHERE ((([订单].[发货日期]) Between &#x27;$起始日期$&#x27; And &#x27;$end_date$&#x27;))
GROUP BY [类别].[类别ID], [产品].[产品名称], cast( round(strftime(&#x27;%m&#x27;,发货日期)/3.0 + 0.495) as int)|| &#x27;季度&#x27;;</dataSet>
</dataSets>
<params>
<param name="起始日期" data_type="string" prompt="开始日期" hide="False" allowNull="False" inner="False" allowSpace="False" allowMutil="False" canUsedValueFrom="" dataSetName_kyz="" valueField_kyz="" tagField_kyz="" defaultValueFrom="NoneQuery" dataSetName_default="" valueField_default="" default_value="1997-01-01" />
<param name="end_date" data_type="string" prompt="终止日期" hide="False" allowNull="False" inner="False" allowSpace="False" allowMutil="False" canUsedValueFrom="" dataSetName_kyz="" valueField_kyz="" tagField_kyz="" defaultValueFrom="NoneQuery" dataSetName_default="" valueField_default="" default_value="1997-1-2" />
</params>
<AllGrids>
<grid append="cellSpacing=0 cellPadding=0  style=&quot;TABLE-LAYOUT: fixed; MARGIN-TOP: 0px; FONT-SIZE: 11px; Z-INDEX: -5; MARGIN-LEFT: 0px;   BORDER-COLLAPSE: collapse;&quot;" optimize="True" name="main" fix_rows="-1" fix_cols="-1" title="main" CanShow_expr="" is_large="0">
<columns>
<column name="a" width="75" fixed="False" />
<column name="b" width="75" fixed="False" />
<column name="c" width="75" fixed="False" />
<column name="d" width="75" fixed="False" />
<column name="e" width="75" fixed="False" />
<column name="f" width="75" fixed="False" />
<column name="g" width="75" fixed="False" />
<column name="h" width="75" fixed="False" />
</columns>
<rows>
<row name="1" height="25" fixed="False" />
<row name="2" height="25" fixed="False" />
<row name="3" height="25" fixed="False" />
<row name="4" height="25" fixed="False" />
<row name="5" height="25" fixed="False" />
<row name="6" height="25" fixed="False" />
</rows>
<cells>
<cell displayValueExpr="=@value" name="A1:A2" valueExpr="发货季度" rowsOfPage="0" leftHead="" calcLevel="0" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" text-align="right" />
<cell displayValueExpr="=类别名称.select1(类别名称.类别名称,类别名称.类别id==@value)" extendDirection="column" name="B1:C1" valueExpr="=数据集1.group(数据集1.类别ID)" rowsOfPage="0" leftHead="" calcLevel="0" text-align="center" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" background-color="#ffd966" />
<cell displayValueExpr="=@value" name="D1:D2" valueExpr="合计" rowsOfPage="0" leftHead="" calcLevel="0" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" background-color="#f6b26b" text-align="right" />
<cell displayValueExpr="=@value" extendDirection="column" name="B2" valueExpr="=数据集1.group(数据集1.产品名称)" rowsOfPage="0" leftHead="" calcLevel="1" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" background-color="#ffe599" text-align="right" />
<cell displayValueExpr="=@value" name="C2" valueExpr="小计" rowsOfPage="0" leftHead="" calcLevel="1" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" background-color="#ffd966" text-align="right" />
<cell displayValueExpr="=@value" extendDirection="row" name="A3" valueExpr="=数据集1.group(数据集1.发货季度)" rowsOfPage="0" leftHead="" calcLevel="0" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" />
<cell displayValueExpr="=@value" name="B3" valueExpr="=数据集1.sum(数据集1.产品销售额)" rowsOfPage="0" leftHead="" calcLevel="2" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" background-color="#fff2cc" text-align="right" />
<cell displayValueExpr="=@value" name="C3" valueExpr="=sum(B3{})" rowsOfPage="0" leftHead="" calcLevel="3" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" background-color="#ffd966" text-align="right" />
<cell displayValueExpr="=@value" name="D3" valueExpr="=sum(C3{})" rowsOfPage="0" leftHead="" calcLevel="4" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" background-color="#f6b26b" text-align="right" />
<cell displayValueExpr="=@value" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" valueExpr=" " text-align="right" name="A4" />
<cell displayValueExpr="=@value" valueExpr="=sum(B3{})" text-align="right" name="B4" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" />
<cell displayValueExpr="=@value" valueExpr="=sum(B3{})" text-align="right" name="C4" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" />
<cell displayValueExpr="=@value" valueExpr="=sum(C3{})" text-align="right" name="D4" BORDER-LEFT="0.5pt solid #000;" BORDER-RIGHT="0.5pt solid #000;" BORDER-TOP="0.5pt solid #000;" BORDER-BOTTOM="0.5pt solid #000;" />
</cells>
<no_use_parent_css>0</no_use_parent_css>
</grid>
</AllGrids>
<reportName>example:/类别季度交叉.cr</reportName>
<layout>[
    {
        &quot;x&quot;: 0,
        &quot;y&quot;: 0,
        &quot;w&quot;: 24,
        &quot;h&quot;: 15,
        &quot;i&quot;: 0,
        &quot;element&quot;: {
            &quot;type&quot;: &quot;layout_div&quot;,
            &quot;label&quot;: &quot;div布局&quot;,
            &quot;span&quot;: 24,
            &quot;icon&quot;: &quot;icon-group&quot;,
            &quot;display&quot;: true,
            &quot;style&quot;: {
                &quot;height&quot;: &quot;100%&quot;
            },
            &quot;component&quot;: &quot;widget-form-group&quot;,
            &quot;prop&quot;: &quot;_random_&quot;,
            &quot;children&quot;: {
                &quot;column&quot;: [
                    {
                        &quot;type&quot;: &quot;luckySheetProxy&quot;,
                        &quot;label&quot;: &quot;main&quot;,
                        &quot;display&quot;: true,
                        &quot;style&quot;: {
                            &quot;height&quot;: &quot;100%&quot;
                        },
                        &quot;no_use_parent_css&quot;: true,
                        &quot;fit&quot;: true,
                        &quot;page_size&quot;: 20,
                        &quot;page_sizes&quot;: &quot;[20, 50, 100, 200]&quot;,
                        &quot;gridName&quot;: &quot;main&quot;,
                        &quot;span&quot;: 24,
                        &quot;component&quot;: &quot;luckySheetProxy&quot;,
                        &quot;prop&quot;: &quot;1638252361316_76102&quot;,
                        &quot;fresh_ds&quot;: [],
                        &quot;fresh_params&quot;: [],
                        &quot;conditionformat_save&quot;: &quot;[]&quot;,
                        &quot;alternateformat_save&quot;: &quot;[]&quot;
                    }
                ]
            }
        },
        &quot;moved&quot;: false
    }
]</layout>
<includeFiles />
<datasources>
<dataSource name="dfsd">Dsn=testDb</dataSource>
</datasources>
<macros />
<pageProperty Orientation="True" paperSize="A4" pageHeight="" pageWidth="" marginLeft="19" marginRight="19" marginTop="19" marginBottom="19" Landscape="True" header="" footer="" />
<notebook />
<template />
<conn_list>testsqlite</conn_list>
<range_level>
<level>0</level>
<gridName>main</gridName>
<s_row>0</s_row>
<e_row>3</e_row>
<s_col>1</s_col>
<e_col>2</e_col>
</range_level>
<range_level>
<level>1</level>
<gridName>main</gridName>
<s_row>1</s_row>
<e_row>3</e_row>
<s_col>1</s_col>
<e_col>1</e_col>
</range_level>
<range_level>
<level>2</level>
<gridName>main</gridName>
<s_row>2</s_row>
<e_row>2</e_row>
<s_col>0</s_col>
<e_col>3</e_col>
</range_level>
<defaultsetting>
<font>微软雅黑</font>
<font_size>11</font_size>
<color>black</color>
<border_style>gray 1px dotted</border_style>
</defaultsetting>
<functions />
<script />
<canExecuteExpr />
<cache time="10" />
<bi_dataSets />
<click_refresh_grids />
<parsererror style="display: block; white-space: pre; border: 2px solid #c77; padding: 0 1em 0 1em; margin: 1em; background-color: #fdd; color: black">
<h3>This page contains the following errors:</h3>
<h3>Below is a rendering of the page up to the first error.</h3>
<div style="font-family:monospace;font-size:12px">error on line 90 at column 20864: Char 0x0 out of allowed range</div>
</parsererror>
</report>