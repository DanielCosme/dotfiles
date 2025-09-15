function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

function t
    if test (uname) = Linux -a -f /etc/arch-release
        go-task $argv
    else
        task $argv
    end
end
