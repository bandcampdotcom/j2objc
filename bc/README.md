# Bandcamp Builds README

To create a new version of j2objc:

```
# Pull in latest changes from upstream (google/j2objc repository).
# This will push remotely to master as well.
$ ./bc/sync.sh

# Build to dist/ folder.
$ ./bc/build.sh

# Publish release to Github.
$ ./bc/release.sh
```

The end result is a new release [here](https://github.com/bandcampdotcom/j2objc/releases).
