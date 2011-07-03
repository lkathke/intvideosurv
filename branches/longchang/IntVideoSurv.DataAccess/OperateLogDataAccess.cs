﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using IntVideoSurv.Entity;

namespace IntVideoSurv.DataAccess
{
    public class OperateLogDataAccess
    {
        public static int GetMaxSystemLogId(Database db)
        {
            string cmdText = "select max(Id) from IVS_OperateLog";
            try
            {
                return int.Parse(db.ExecuteScalar(CommandType.Text, cmdText).ToString());

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static int Insert(Database db, OperateLog operateLog)
        {

            StringBuilder sbField = new StringBuilder();
            StringBuilder sbValue = new StringBuilder();
            sbField.Append("INSERT INTO  IVS_OperateLog(");
            sbValue.Append("values(");
            sbField.Append("GroupID");
            sbValue.AppendFormat("{0}", operateLog.GroupId);
            sbField.Append(",DeviceID");
            sbValue.AppendFormat(",{0}", operateLog.DeviceId);
            sbField.Append(",CameraId");
            sbValue.AppendFormat(",{0}", operateLog.CameraId);
            sbField.Append(",Happentime");

            if (DataBaseParas.DBType == MyDBType.SqlServer)
            {
                sbValue.AppendFormat(",'{0}'", operateLog.HappenTime);
            }
            else if (DataBaseParas.DBType == MyDBType.Oracle)
            {
                sbValue.AppendFormat(",to_date('{0}','YYYY/MM/DD HH24:MI:SS')", operateLog.HappenTime);
            }
            sbField.Append(",operatetypeid");
            sbValue.AppendFormat(",{0}", operateLog.OperateTypeId);
            sbField.Append(",operatetypename");
            sbValue.AppendFormat(",'{0}'", operateLog.OperateTypeName);
            sbField.Append(",content");
            sbValue.AppendFormat(",'{0}'", operateLog.Content);
            sbField.Append(",operateusername");
            sbValue.AppendFormat(",'{0}'", operateLog.OperateUserName);
            sbField.Append(",clientusername");
            sbValue.AppendFormat(",'{0}'", operateLog.ClientUserName);
            sbField.Append(",clientuserid)");
            sbValue.AppendFormat(",{0})", operateLog.ClientUserId);

            string cmdText = sbField.ToString() + " " + sbValue.ToString();

            try
            {
                cmdText = cmdText.Replace("\r\n", "");
                return db.ExecuteNonQuery(CommandType.Text, cmdText);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public static int Delete(Database db, int operateLogId)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("delete from IVS_OperateLog ");
            sb.AppendFormat(" where Id={0}", operateLogId);
            string cmdText = sb.ToString();
            try
            {
                return db.ExecuteNonQuery(CommandType.Text, cmdText);

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public static DataSet GetAllOperateLogs(Database db)
        {
            string cmdText = string.Format("select * from IVS_OperateLog order by Id");
            try
            {
                return db.ExecuteDataSet(CommandType.Text, cmdText);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static DataSet GetOperateLogs(Database db, string filter)
        {
            string cmdText = string.Format("select  ID as 索引号,IVS_GroupInfo.name as 组名,IVS_DeviceInfo.name as 设备名称, IVS_CameraInfo.Name as 摄像头名, "+
                "happentime as 发生时间,clientusername as 用户名, operatetypename as 操作类型, "+
                "content as 内容  from ((( IVS_OperateLog left join IVS_DeviceInfo on IVS_OperateLog.DeviceID = IVS_DeviceInfo.deviceid) " +
                "left join IVS_CameraInfo on IVS_CameraInfo.CameraId=IVS_OperateLog.CameraId) left join IVS_GroupInfo on IVS_GroupInfo.GroupId=IVS_OperateLog.GroupId) " +
                "{0} order by IVS_OperateLog.Id", filter);
            try
            {
                return db.ExecuteDataSet(CommandType.Text, cmdText);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static DataSet GetOperateLogTypes(Database db)
        {
            string cmdText = string.Format("select distinct operatetypename from IVS_OperateLog");
            try
            {
                return db.ExecuteDataSet(CommandType.Text, cmdText);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}

