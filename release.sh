rm -f Dockerfile Makefile && rm -rf src design
mv ./test/* ./ && rm -rf test
echo "fix TAG at Makefile and delete release.sh"
