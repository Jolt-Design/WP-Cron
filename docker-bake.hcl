variable "platforms" {
  default = ["linux/amd64", "linux/arm64"]
}

variable "commitSha" {
  // Default to latest so we don't break anything if the SHA is unspecified
  default = "latest"
}

group "default" {
  targets = ["wp-cron"]
}

target "wp-cron" {
  context = "build"

  platforms = platforms
  tags = ["joltdesign/wp-cron:latest", "joltdesign/wp-cron:${commitSha}"]
}
