FROM ubuntu:18.04 as builder

RUN apt-get update && apt-get install -y build-essential bison

WORKDIR /app
COPY . .

RUN vendor/rubyc-0.5.0+extra5-linux-amd64 -o ruby2exe -d /tmp/build --make-args="-j$((`nproc`+1))" ruby2exe

# -----------
FROM ubuntu:18.04
COPY --from=builder /app/ruby2exe /usr/local/bin
ENTRYPOINT [ "/usr/local/bin/ruby2exe" ]
