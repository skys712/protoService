#pragma once

struct ILog
{
    virtual void error(const char *fmt, ...) = 0;
    virtual void warn(const char *fmt, ...) = 0;
};
