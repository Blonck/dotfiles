function ssh_load --description "Load an SSH key into the agent (available to all shells)"
    if test (count $argv) -eq 0
        echo "Usage: ssh_load <key_path>"
        return 1
    end

    set -l key_path $argv[1]

    # Expand ~ if present
    set key_path (eval echo $key_path)

    if not test -f "$key_path"
        echo "Error: Key file not found: $key_path"
        return 1
    end

    # Start ssh-agent if not running
    if not test -S "$SSH_AUTH_SOCK"
        echo "Starting ssh-agent..."
        eval (ssh-agent -c) >/dev/null
        # Link to fixed socket location for other shells
        if test -S "$SSH_AUTH_SOCK"; and not test -L "$SSH_AUTH_SOCK"
            ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
        end
        set -gx SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
    end

    # Check if key is already loaded
    set -l key_fingerprint (ssh-keygen -lf "$key_path" 2>/dev/null | awk '{print $2}')
    if test -n "$key_fingerprint"
        if ssh-add -l 2>/dev/null | grep -q "$key_fingerprint"
            echo "Key already loaded: $key_path"
            return 0
        end
    end

    ssh-add "$key_path"
end
