FROM openapitools/openapi-generator-cli:latest as builder
WORKDIR /mock-seed
# ホストマシンのswagger.ymlをコピー
COPY ./scrum-app-api.yaml ./
WORKDIR /mock-server
# モックサーバーのファイルを作成
ENV JS_POST_PROCESS_FILE /usr/local/bin/js-beautify -r -f

RUN java -jar /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar \
generate -i /mock-seed/scrum-app-api.yaml -g nodejs-express-server -o ./

FROM node:14.2.0-alpine3.10 as executor
WORKDIR /mock-server
# 上記で作ったモックサーバーのファイル群をコピー
COPY --from=builder /mock-server ./
# パッケージ類のインストール
RUN npm install
# 8000ポートを受ける
EXPOSE 8000
# コンテナ起動でサーバーが起動するようにする
CMD ["npm", "start"]

