#!/usr/bin/env python3

import json
import subprocess
import socket
import os
from collections import deque

xdg_runtime_dir = os.environ.get("XDG_RUNTIME_DIR")
hyprland_instance_signature = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")

if xdg_runtime_dir and hyprland_instance_signature:
    SOCKET_PATH = f"{xdg_runtime_dir}/hypr/{hyprland_instance_signature}/.socket2.sock"
else:
    print("Error: Required Hyprland environment variables are not set.")
    exit(1)


def main():
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as socket_client:
        socket_client.connect(SOCKET_PATH)

        while True:
            monitor_str = subprocess.run(
                ["hyprctl", "monitors", "-j"], capture_output=True
            )
            monitor_json = json.loads(monitor_str.stdout)
            current_workspace = int(monitor_json[0]["activeWorkspace"]["id"])

            clients_str = subprocess.run(
                ["hyprctl", "clients", "-j"], capture_output=True
            ).stdout
            clients_json = json.loads(clients_str)

            workspaces = set()
            workspaces.add(current_workspace)

            for client in clients_json:
                workspace = int(client["workspace"]["id"])
                workspaces.add(workspace)

            payload = sorted(list(workspaces))

            print(json.dumps(payload), flush=True)

            line = socket_client.recv(1024).decode()


if __name__ == "__main__":
    main()
