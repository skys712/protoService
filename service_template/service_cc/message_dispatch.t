    case {index}:
    {{
    {message_type} message;
    message.ParseFromArray((void*)messageData, size - sizeof(uint16_t) * 2);
    {func_name}(peerId, sn, message);
    break;
    }}
