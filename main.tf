provider "docker" {
  
}

resource "docker_container" "jenkins-master" {
    name  = "jenkins-master"
    image = "jenkinsci/blueocean"
    logs  = true
    user  = "root"

    mounts = {
        target = "/var/jenkins_home"
        source = "jenkins-data"
        type   = "volume"
    }

    volumes = {
        host_path      = "/var/run/docker.sock"
        container_path = "/var/run/docker.sock"
    }

    ports = {
        internal = 5000
        external = 5000
    }
    ports = {
        internal = 8080
        external = 8080
    }
}
