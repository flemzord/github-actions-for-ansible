workflow "get code" {
  on = "push"
  resolves = ["Docker push"]
}

action "Docker build image" {
  uses = "actions/docker/cli@76ff57a"
  args = "build -t flemzord/github-actions-for-ansible ."
}

action "Docker Login" {
  uses = "actions/docker/login@76ff57a"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  needs = ["Docker build image"]
}

action "Docker push" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Login"]
  args = "push flemzord/github-actions-for-ansible"
}