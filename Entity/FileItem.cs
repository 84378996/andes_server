using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{   

    public enum FileItemType : int
    {
        //
        // 摘要:
        //     A file
        File = 0,
        //
        // 摘要:
        //     A directory
        Directory = 1,
        //
        // 摘要:
        //     A symbolic link
        Link = 2
    }

    public class FileItem : IComparable<FileItem>
    {
        /// <summary>
        /// 上次写入当前文件或目录的时间。
        /// </summary>
        public DateTime? LastWriteTime { get; set; }


        /// <summary>
        /// 上次访问当前文件或目录的时间
        /// </summary>
        public DateTime? LastAccessTime { get; set; }

        /// <summary>
        /// 当前文件或目录的创建时间。
        /// </summary>
        public DateTime? CreationTime { get; set; }

        /// <summary>
        /// 文件扩展名部分的字符串
        /// </summary>

        public string Extension { get; set; }


        /// <summary>
        /// 完整文件名/完整路径
        /// </summary>
        public string FullName { get; set; }

        /// <summary>
        /// 文件名/文件夹名
        /// </summary>
        public string Name { get; set; }


        public long Size { get; set; }


        /// <summary>
        /// File = 0,Directory = 1,Link = 2
        /// </summary>
        public int Type { get; set; }
     

       public List<FileItem> Children { get; set; }

        public int CompareTo(FileItem other)
        {
            if (Type == 1 && other.Type == 1)
            {
                //文件夹名
                return Name.CompareTo(other.Name);
            }
            if (Type == 1 || other.Type == 1)
            {
                if (Type == 1)
                    return -1;
                else
                    return 1;
            }
            else
            {
                if (Type == other.Type)
                {
                    //文件名
                    return Name.CompareTo(other.Name);
                }
                else
                    return Type.CompareTo(other.Type);
            }


        }
    }


    public class FileChunk : IComparable<FileChunk>
    {

        /// <summary>
        /// 当前块的次序，第一个块是 1，注意不是从 0 开始的
        /// </summary>
        public int ChunkNumber { get; set; }

        /// <summary>
        /// 分块大小，根据 totalSize 和这个值你就可以计算出总共的块数。
        /// 注意最后一块的大小可能会比这个要大。
        /// </summary>
        public int ChunkSize { get; set; }
        /// <summary>
        /// 当前块的大小，实际大小
        /// 注意最后一块的大小可能会比ChunkSize大
        /// </summary>
        public int CurrentChunkSize { get; set; }

        /// <summary>
        /// 文件总大小
        /// </summary>
        public int TotalSize { get; set; }
        /// <summary>
        /// 文件唯一标识
        /// </summary>
        public string Identifier { get; set; }
        /// <summary>
        /// 文件名
        /// </summary>
        public string FileName { get; set; }

        /// <summary>
        /// 块保存路径
        /// </summary>
        public string ChunkPath { get; set; }
        /// <summary>
        /// 相对路径
        /// </summary>
        public string RelativePath { get; set; }

        /// <summary>
        /// 总块数
        /// </summary>
        public int TotalChunks { get; set; }

        /// <summary>
        /// 操作员ID
        /// </summary>
        public long OperID { get; set; }

        /// <summary>
        /// 目录
        /// </summary>
        public string RootDir { get; set; }

        public string DispositionType { get; set; }

        public string InputName { get; set; }
        public int CompareTo(FileChunk other)
        {
            if (ChunkNumber == other.ChunkNumber)
                return 0;


            if (ChunkNumber > other.ChunkNumber)
                return 1;

            return -1;
        }
    }
}
