#pragma once

struct IService
{
    virtual void onMessage(uint32_t peerId, void *data, uint32_t size) = 0;
};

