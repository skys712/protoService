using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Google.Protobuf;

namespace {namespace}
{{
    class {class_name} : ServiceInterface.IService
    {{
        protected ServiceInterface.ILog m_log;
        protected ServiceInterface.INet m_net;
        byte[] m_tempBuffer;

        public {class_name}(ServiceInterface.ILog log, ServiceInterface.INet net, uint bufferSize)
        {{
            m_log = log;
            m_net = net;
            m_tempBuffer = new byte[bufferSize];
        }}

        public void onMessage(byte[] data)
        {{
            var msgType = BitConverter.ToUInt16(data, 0);
            var sn = BitConverter.ToUInt16(data, 2);
            MemoryStream stream = new MemoryStream(data, 4, data.Length - 4);

            switch (msgType)
            {{
{message_dispatch_region}
            default:
                m_log.error("msgType invalid.");
                break;
            }}
        }}

{on_func_region}
{do_func_region}

        public bool sendMsg(ushort msgType, ushort sn, IMessage message)
        {{
            MemoryStream stream = new MemoryStream(m_tempBuffer);

            byte[] msgTypeData = BitConverter.GetBytes((ushort)msgType);
            stream.Write(msgTypeData, 0, msgTypeData.Length);
            byte[] snData = BitConverter.GetBytes(sn);
            stream.Write(snData, 0, snData.Length);

            uint msgSize = (uint)message.CalculateSize();
            uint packSize = msgSize + sizeof(ushort) * 2;
            if (packSize > m_tempBuffer.Length)
                return false;

            message.WriteTo(stream);

            return m_net.send(m_tempBuffer, packSize);
        }}
    }}
}}

