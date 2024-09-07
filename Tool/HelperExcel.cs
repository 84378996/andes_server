using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tool
{
    public class HelperExcel
    {
            public static DataTable ExcelToDataTable(string fileName, string sheetName = null)
            {
                IWorkbook workbook = null;
                DataTable dt = new DataTable();

                FileStream fs = new FileStream(fileName, FileMode.Open, FileAccess.Read);
                if (fileName.IndexOf(".xlsx") > 0) // 2007版本
                    workbook = new XSSFWorkbook(fs);
                else if (fileName.IndexOf(".xls") > 0) // 2003版本
                    workbook = new HSSFWorkbook(fs);

                ISheet sheet;
                if (sheetName != null)
                    sheet = workbook.GetSheet(sheetName);
                else
                    sheet = workbook.GetSheetAt(0);

                if (sheet == null)
                    return dt;

                IRow firstRow = sheet.GetRow(0);
                //一行最后一个cell的编号 即总的列数
                int cellCount = firstRow.LastCellNum;

                for (int i = 0; i < cellCount; i++)
                {
                    DataColumn column = new DataColumn("column" + i.ToString());
                    dt.Columns.Add(column);
                }

                //最后一列的标号
                int rowCount = sheet.LastRowNum;
                for (int i = sheet.FirstRowNum; i <= rowCount; ++i)
                {
                    IRow row = sheet.GetRow(i);
                    if (row == null) continue; //没有数据的行默认是null　　　　　　　

                    DataRow dataRow = dt.NewRow();
                    for (int j = row.FirstCellNum; j < cellCount; ++j)
                    {
                        if (row.GetCell(j) != null) //同理，没有数据的单元格都默认是null
                            dataRow[j] = row.GetCell(j).ToString();
                    }
                    dt.Rows.Add(dataRow);
                }

                fs.Close();

                return dt;
            }


            public static void InitSheet(ISheet sheet)
            {
                sheet.PrintSetup.FitHeight = 0;
                sheet.PrintSetup.FitWidth = 1;
            }

            public static ICellStyle GetTitleStyle(HSSFWorkbook workbook)
            {
                IFont font;
                ICellStyle style = workbook.CreateCellStyle();
                style.Alignment = HorizontalAlignment.Center;
                style.VerticalAlignment = VerticalAlignment.Center;
                font = workbook.CreateFont();
                font.IsBold = true;
                font.FontHeightInPoints = 20;
                style.SetFont(font);

                return style;
            }

            public static ICellStyle GetRowTitleStyle(HSSFWorkbook workbook)
            {
                ICellStyle style = workbook.CreateCellStyle();
                style.Alignment = HorizontalAlignment.Left;
                style.VerticalAlignment = VerticalAlignment.Center;
                style.FillForegroundColor = NPOI.HSSF.Util.HSSFColor.Grey25Percent.Index;
                style.FillPattern = FillPattern.SolidForeground;
                style.BorderBottom = BorderStyle.Thin;
                style.BorderLeft = BorderStyle.Thin;
                style.BorderRight = BorderStyle.Thin;
                style.BorderTop = BorderStyle.Thin;
                IFont font = workbook.CreateFont();
                font.IsBold = false;
                font.FontHeightInPoints = 10;
                style.SetFont(font);

                return style;
            }


            public static ICellStyle GetRowStyle(HSSFWorkbook workbook)
            {
                ICellStyle style = workbook.CreateCellStyle();
                style = workbook.CreateCellStyle();
                style.Alignment = HorizontalAlignment.Left;
                style.VerticalAlignment = VerticalAlignment.Center;
                style.BorderBottom = BorderStyle.Thin;
                style.BorderLeft = BorderStyle.Thin;
                style.BorderRight = BorderStyle.Thin;
                style.BorderTop = BorderStyle.Thin;
                IFont font = workbook.CreateFont();
                font.IsBold = false;
                font.FontHeightInPoints = 10;
                style.SetFont(font);
                style.WrapText = true;//设置换行这个要先设置
                return style;
            }

            public static ICellStyle GetRowTotalStyle(HSSFWorkbook workbook)
            {
                ICellStyle style = workbook.CreateCellStyle();
                style.Alignment = HorizontalAlignment.Left;
                style.VerticalAlignment = VerticalAlignment.Center;
                style.FillForegroundColor = NPOI.HSSF.Util.HSSFColor.Grey25Percent.Index;
                style.FillPattern = FillPattern.SolidForeground;
                style.BorderBottom = BorderStyle.Thin;
                style.BorderLeft = BorderStyle.Thin;
                style.BorderRight = BorderStyle.Thin;
                style.BorderTop = BorderStyle.Thin;
                IFont font = workbook.CreateFont();
                font.IsBold = false;
                font.FontHeightInPoints = 10;
                style.SetFont(font);

                return style;
            }

            public static float GetTitleHeight()
            {
                return 30f;
            }

            public static float GetRowHeight()
            {
                return 20f;
            }

        
    }
}
