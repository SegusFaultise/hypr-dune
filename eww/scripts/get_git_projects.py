#!/usr/bin/env python

import os
import subprocess
import json


def get_git_projects(base_dir):
    """
    Finds all git repositories in a given directory and returns a list
    of dictionaries with project details.
    """
    projects = []

    for root, dirs, files in os.walk(base_dir):
        if ".git" in dirs:
            project_path = root
            project_name = os.path.basename(project_path)

            try:
                result = subprocess.run(
                    ["git", "rev-parse", "--abbrev-ref", "HEAD"],
                    cwd=project_path,
                    capture_output=True,
                    text=True,
                )
                branch = result.stdout.strip()
            except subprocess.CalledProcessError:
                branch = "unknown"

            projects.append(
                {"name": project_name, "path": project_path, "branch": branch}
            )

            dirs.remove(".git")

    return projects


if __name__ == "__main__":
    base_directory = os.path.expanduser("~")
    git_projects = get_git_projects(base_directory)

    print(json.dumps(git_projects, indent=2))
