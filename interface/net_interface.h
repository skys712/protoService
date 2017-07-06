#pragma once

struct INet
{
    virtual bool send(uint32_t peerId, void *data, uint32_t size) = 0;
};
