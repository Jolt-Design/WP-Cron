variable "platforms" {
  default = ["linux/amd64", "linux/arm64"]
}

group "default" {
  targets = ["wp-cron"]
}

target "wp-cron" {
  context = "build"

  platforms = platforms
  tags = ["joltdesign/wp-cron:latest"]
}
