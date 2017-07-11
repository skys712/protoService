                case {index}:
                    {{
                        {message_type} message = new {message_type}();
                        message.MergeFrom(stream);
                        {func_name}(sn, message);
                        break;
                    }}
