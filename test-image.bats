#!/usr/bin/env bats

@test "Test for node and version" {
  run docker run --rm -it node:"$full_tag" node -e "process.stdout.write(process.versions.node)"
  [ "$status" -eq 0 ]
  [ "$output" == "${full_version}" ]
}

@test "Test for npm" {
  run docker run --rm -it node:"$full_tag" npm --version
  [ "$status" -eq 0 ]
}

@test "Test for yarn" {
  run docker run --rm -it node:"$full_tag" yarn --version
  [ "$status" -eq 0 ]
}
