#include "interface/service_interface.h"
#include "{file_name}.pb.h"

struct ILog;
struct INet;
class {class_name} : public IService
{{
public:
    {class_name}(ILog *log, INet *net, uint32_t bufferSize);
    virtual ~{class_name}();

    virtual void onMessage(uint32_t peerId, void *data, uint32_t size);

public:
{on_func_region}
private:
{do_func_region}

public:
    bool sendMsg(uint32_t peerId, uint16_t msgType, uint16_t sn, const ::google::protobuf::Message *message);

private:
    void *m_tempBuffer;
    uint32_t m_bufferSize;
    ILog *m_log;
    INet *m_net;
}};

