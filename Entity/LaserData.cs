using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class LaserData
    {
        /// <summary>
        /// 设备状态
        /// </summary>
        public string DevStatus { get; set; }
        /// <summary>
        /// 设备模式
        /// </summary>
        public int DevMode { get; set; }
        /// <summary>
        /// 切割文件
        /// </summary>
        public string CutProg { get; set; }
        /// <summary>
        /// 材料
        /// </summary>
        public string Material { get; set; }
        /// <summary>
        /// 板厚
        /// </summary>
        public double Thick { get; set; }
        /// <summary>
        /// 长
        /// </summary>
        public double Length { get; set; }
        /// <summary>
        /// 宽
        /// </summary>
        public double Width { get; set; }
        /// <summary>
        /// 切割长度
        /// </summary>
        public double CutLength { get; set; }
        /// <summary>
        /// 切割时间
        /// </summary>
        public string CutTime { get; set; }
        /// <summary>
        /// 已切割钢板数
        /// </summary>
        public int DoneNum { get; set; }
        /// <summary>
        /// X坐标值
        /// </summary>
        public double MachineX { get; set; }
        /// <summary>
        /// Y坐标值
        /// </summary>
        public double MachineY { get; set; }

        public List<AlarmData> Errors { get; set; }

        public LaserData()
        {
            Errors = new List<AlarmData>();
        }

    }



    public class LaserProd
    {
        public long? ID { get; set; }

        public string TaskNo { get; set; }

        /// <summary>
        /// 设备
        /// </summary>
        public long? DevID { get; set; }
        /// <summary>
        /// 设备名称
        /// </summary>
        public string DevName { get; set; }

        /// <summary>
        /// 文件名
        /// </summary>
        public string FileName { get; set; }

        /// <summary>
        /// 套料文件名
        /// </summary>
        public string NestName { get; set; }

        /// <summary>
        /// 材料
        /// </summary>
        public string Material { get; set; }

        /// <summary>
        /// 长
        /// </summary>
        public string PlateLength { get; set; }

        /// <summary>
        /// 宽
        /// </summary>
        public string PlateWidth { get; set; }

        /// <summary>
        /// 厚
        /// </summary>
        public string PlateThick { get; set; }

        /// <summary>
        /// 起始时间
        /// </summary>
        public DateTime? StartTime { get; set; }

        /// <summary>
        /// 结束时间
        /// </summary>
        public DateTime? EndTime { get; set; }

        public DateTime? AddTime { get; set; }

        public string PlanCutTime { get; set; }

        /// <summary>
        /// 切割时间
        /// </summary>
        public string CutTime { get; set; }
    }








}
