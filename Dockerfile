FROM 192.168.140.224:5051/bigdata/ragflow:v0.16.0-slim
USER root
WORKDIR /ragflow
# install dependencies from uv.lock file
COPY pyproject.toml uv.lock ./

#RUN uv lock --index-url https://mirrors.aliyun.com/pypi/simple/
RUN --mount=type=cache,id=ragflow_uv,target=/root/.cache/uv,sharing=locked \
    uv sync --python 3.10 --extra full

RUN mv  rag/res res ; rm -rf agent api deepdoc graphrag rag tools conf web/* webchat/* statisticsModel mixed_pdf_parser VERSION
COPY web/dist web/dist
COPY VERSION VERSION
COPY mixed_pdf_parser mixed_pdf_parser
COPY webchat/dist webchat/dist
COPY api api
COPY conf conf
COPY statisticsModel statisticsModel
COPY deepdoc deepdoc
COPY tools tools
COPY rag rag
COPY agent agent
COPY graphrag graphrag
COPY mcp_server mcp_server
COPY docker/service_conf.yaml.template ./conf/service_conf.yaml.template
COPY docker/entrypoint.sh ./
RUN rm -rf rag/res;  mv res rag/ ; chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]