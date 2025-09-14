#!/usr/bin/env python3

import json
import subprocess
import socket
from collections import deque

SOCKET_PATH = "/run/user/1000/hypr/46174f78b374b6cea669c48880877a8bdcf7802f_1757834802_460050513/.socket2.sock"


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
