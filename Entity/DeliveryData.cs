using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public partial class DeliveryData : IAlarmList
    {

        public int DeviceOnline { get; set; }
        /// <summary>
        /// 设备状态：0：空闲中；1：运行中；2：故障中；3：暂停中
        /// </summary>
        public int DeviceStatus { get; set; }
        /// <summary>
        /// 任务执行状态：0：未执行；1：执行中；任务状态由1-0的过程为执行完成
        /// </summary>
        public int TaskStatus { get; set; }
        /// <summary>
        /// 联机模式/单机模式：单机是指脱离于中控的模式，联机模式是指需要中控来调度
        /// </summary>
        public int DeviceMode { get; set; }
        /// <summary>
        /// 设备在1号台车取料（禁止料库台车1运动）
        /// </summary>
        public int DeviceGetWorkZone1 { get; set; }
        /// <summary>
        /// 设备在1号机上料中（禁止激光工作台交换）
        /// </summary>
        public int DeviceLoading1 { get; set; }
        /// <summary>
        /// 设备在1号机下料中（禁止激光工作台交换）
        /// </summary>
        public int DeviceUnLoading1 { get; set; }
        /// <summary>
        /// 设备在1号区卸料中（禁止成品台车运动）
        /// </summary>
        public int DevicePutWork1 { get; set; }
        /// <summary>
        /// 设备在2号台车取料（禁止料库台车2运动）
        /// </summary>
        public int DeviceGetWorkZone2 { get; set; }
        /// <summary>
        /// 设备在2号机上料中（禁止激光工作台交换）
        /// </summary>
        public int DeviceLoading2 { get; set; }
        /// <summary>
        /// 设备在2号机下料中（禁止激光工作台交换）
        /// </summary>
        public int DeviceUnLoading2 { get; set; }
        /// <summary>
        /// 设备在2号区卸料中（禁止成品台车运动）
        /// </summary>
        public int DevicePutWork2 { get; set; }
        public List<AlarmData> Errors { get; set; }
        //public List<int> DeviceErrorCode { get; set; }
        //public List<string> DeviceErrorDesc { get; set; }

        public DateTime? CreateTime { get;set; }


        public DeliveryData()
        {
            Errors = new List<AlarmData>();
        }
    }
    public partial class DeliveryData
    { 
        /// <summary>
        /// 无动作-0，上料-1，下料-2
        /// </summary>
        public int MoveMode = 0;
    }
}
