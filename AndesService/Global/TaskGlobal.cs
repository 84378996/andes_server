using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MCSService.Global
{
    public class TaskGlobal
    {
        private static TaskGlobal uniqueInstance;

        public static TaskGlobal Instance
        {
            get
            {
                if (uniqueInstance == null)
                {
                    uniqueInstance = new TaskGlobal();
                }
                return uniqueInstance;
            }

        }

       public Dictionary<int, string> DicTaskLine { get; private set; } = new Dictionary<int, string>();


        public TaskGlobal()
        {
            InitTaskLine();
        }


        private void InitTaskLine()
        {
            DicTaskLine.Clear();

            DicTaskLine.Add(11, "任务#1-1");
            DicTaskLine.Add(12, "任务#1-2");
            DicTaskLine.Add(21, "任务#2-1");
            DicTaskLine.Add(22, "任务#2-2");

        }

        public string GetTaskLineName(int? taskLine)
        {
            if (taskLine == null)
                return "";

            if (DicTaskLine.ContainsKey(taskLine.Value))
                return DicTaskLine[taskLine.Value];

            return "";
        }


        public string GetTaskLineSimpleName(int? taskLine)
        {
            if (taskLine == null)
                return "";

            if (DicTaskLine.ContainsKey(taskLine.Value))
                return DicTaskLine[taskLine.Value].Remove(0,2);

            return "";
        }

        
        public bool TaskLineExist(int? taskLine)
        {
            if (taskLine == null)
                return false;

            return DicTaskLine.ContainsKey(taskLine.Value);

        }

    }



}
