# RagFlow依赖包添加：

## 方法1：

1. 修改pyproject.toml
2. 执行  uv lock --index-url https://mirrors.aliyun.com/pypi/simple/
3. uv sync --python 3.10 --extra full
4. uv.lock和pyproject.toml，推到gitlab

## 方法2：

1. 使用uv add 命令：uv add requests --index-url https://mirrors.aliyun.com/pypi/simple/

2. uv.lock和pyproject.toml，推到gitlab

