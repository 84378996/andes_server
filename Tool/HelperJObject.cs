using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tool
{
    public class HelperJObject
    {
        public static bool IsNotNull(JObject obj, string name)
        {
            if (obj == null)
                return false;

            if (obj.ContainsKey(name) == false)
                return false;

            if (obj[name].Type == JTokenType.Null)
                return false;

            return true;
        }

        public static bool IsNotNull(JToken token, string name)
        {
            if (token == null)
                return true;

            JObject obj = (JObject)token;

            return IsNotNull(obj, name);
        }

        public static bool IsObject(JObject obj, string name)
        {
            if (obj == null)
                return false;

            if (obj.ContainsKey(name) == false)
                return false;

            if (obj[name].Type == JTokenType.Null)
                return false;

            if (obj[name].Type == JTokenType.Object)
                return true;

            return false;
        }

        public static bool IsObject(JToken token, string name)
        {
            if (token == null)
                return true;

            JObject obj = (JObject)token;

            return IsObject(obj, name);
        }

        public static bool IsArray(JObject obj, string name)
        {
            if (obj == null)
                return false;

            if (obj.ContainsKey(name) == false)
                return false;

            if (obj[name].Type == JTokenType.Null)
                return false;

            if (obj[name].Type == JTokenType.Array)
                return true;

            return false;
        }

        public static bool IsString(JObject obj, string name)
        {
            if (obj == null)
                return false;

            if (obj.ContainsKey(name) == false)
                return false;

            if (obj[name].Type == JTokenType.Null)
                return false;

            if (obj[name].Type != JTokenType.String)
                return false;

            return !string.IsNullOrWhiteSpace(obj[name].ToString());
        }

        public static bool IsString(JToken token, string name)
        {
            if (token == null)
                return false;
            JObject obj = (JObject)token;

            return IsString(obj, name);
        }

        public static bool IsDataTime(JObject obj, string name)
        {
            if (obj == null)
                return false;

            if (obj.ContainsKey(name) == false)
                return false;

            JTokenType type = obj[name].Type;
            string content = obj[name].ToString();
            if (type == JTokenType.Null)
                return false;
            if (type == JTokenType.String)
            {
                if (string.IsNullOrWhiteSpace(content))
                    return false;

                return DateTime.TryParse(content, out _);
            }

            if (type == JTokenType.Date)
                return DateTime.TryParse(content, out _);

            return false;

        }

        public static bool IsDataTime(JToken token, string name)
        {
            if (token == null)
                return false;
            JObject obj = (JObject)token;

            return IsDataTime(obj, name);
        }

        public static bool IsLong(JObject obj, string name)
        {
            if (obj == null)
                return false;

            if (obj.ContainsKey(name) == false)
                return false;

            JTokenType type = obj[name].Type;
            string content = obj[name].ToString();
            if (type == JTokenType.Null)
                return false;

            //兼容字符串
            if (type == JTokenType.String)
            {
                if (string.IsNullOrWhiteSpace(content))
                    return false;

                return long.TryParse(content, out _);
            }

            if (type == JTokenType.Integer)
                return long.TryParse(content, out _);

            return false;
        }

        public static bool IsPositiveLong(JObject obj, string name)
        {
            if (IsLong(obj, name) == false)
                return false;

            long value = long.Parse(obj[name].ToString());
            if (value > 0)
                return true;
            else
                return false;

        }
        public static bool IsLong(JToken token, string name)
        {
            if (token == null)
                return false;

            JObject obj = (JObject)token;

            return IsLong(obj, name);
        }



        public static bool IsBoolean(JObject obj, string name)
        {
            if (obj == null)
                return false;

            if (obj.ContainsKey(name) == false)
                return false;

            JTokenType type = obj[name].Type;
            string content = obj[name].ToString();

            if (type == JTokenType.Null)
                return false;
            if (type == JTokenType.String)
            {
                if (string.IsNullOrWhiteSpace(content))
                    return false;
                return bool.TryParse(content, out _);
            }

            if (type == JTokenType.Boolean)
                return bool.TryParse(content, out _);

            return false;
        }

        public static bool IsBoolean(JToken token, string name)
        {
            if (token == null)
                return false;

            JObject obj = (JObject)token;

            return IsBoolean(obj, name);
        }



        public static bool IsInt(JObject obj, string name)
        {
            if (obj == null)
                return false;

            if (obj.ContainsKey(name) == false)
                return false;

            JTokenType type = obj[name].Type;
            string content = obj[name].ToString();

            if (type == JTokenType.Null)
                return false;
            if (type == JTokenType.String)
            {
                if (string.IsNullOrWhiteSpace(content))
                    return false;
                return int.TryParse(content, out _);
            }

            if (type == JTokenType.Integer)
                return int.TryParse(content, out _);

            return false;
        }

        public static bool IsInt(JToken token, string name)
        {
            if (token == null)
                return false;

            JObject obj = (JObject)token;

            return IsInt(obj, name);
        }

        public static bool IsDouble(JObject obj, string name)
        {
            if (obj == null)
                return false;

            if (obj.ContainsKey(name) == false)
                return false;

            JTokenType type = obj[name].Type;
            string content = obj[name].ToString();

            if (type == JTokenType.Null)
                return false;

            if (type == JTokenType.String)
            {
                if (string.IsNullOrWhiteSpace(content))
                    return false;
                return double.TryParse(content, out _);
            }

            if (type == JTokenType.Float)
                return double.TryParse(content, out _);

            if (type == JTokenType.Integer)
                return double.TryParse(content, out _);

            return false;
        }

        public static bool IsDouble(JToken token, string name)
        {
            if (token == null)
                return false;

            JObject obj = (JObject)token;

            return IsDouble(obj, name);
        }

        public static void Set(JObject obj, string name, string value)
        {
            if (obj == null)
                return;

            if (obj.ContainsKey(name))
                obj[name] = value;
            else
                obj.Add(name, value);
        }

        public static void Set(JObject obj, string name, int value)
        {
            if (obj == null)
                return;

            if (obj.ContainsKey(name))
                obj[name] = value;
            else
                obj.Add(name, value);
        }

    }
}
