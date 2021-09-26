# pb-sample
oreore protocol buffers sample repository

## コンテナの起動方法

1. `docker build -t pb-sample:latest .`
2. `docker run --rm -it -v $PWD:/go/src/work pb-sample`

## 生成ファイルの作り方

```
protoc --go_out=. --go_opt=paths=source_relative \
    --go-grpc_out=. --go-grpc_opt=paths=source_relative \
    helloworld.proto
```
