# ================== 第1步：选择基础镜像 ==================
# 使用 Python 3.13.11 的官方镜像（slim 版本最小化，只包含必要的依赖）
FROM python:3.13.11-slim

# ================== 第2步：复制依赖管理工具 ==================
# 从 uv 官方镜像复制 uv 工具到容器的 /bin 目录
# uv 是一个超快的 Python 包管理工具（比 pip 快 10+ 倍）
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/

# ================== 第3步：设置容器工作目录 ==================
# 后续所有命令都会在 /code 目录下执行
WORKDIR /code

# ================== 第4步：配置环境变量 ==================
# 告诉容器：虚拟环境（.venv）里的可执行文件优先级最高
# 这样运行 python 时会优先用虚拟环境里的版本，而不是系统 python
ENV PATH="/code/.venv/bin:$PATH"

# ================== 第5步：复制依赖文件 ==================
# 将以下3个文件复制到容器里（这些文件定义了项目的依赖和配置）
# - pyproject.toml: 项目配置和依赖列表
# - .python-version: 指定 Python 版本
# - uv.lock: 锁定文件（保证依赖版本一致）
COPY pyproject.toml .python-version uv.lock ./

# ================== 第6步：安装依赖 ==================
# 使用 uv sync 命令创建虚拟环境 (.venv) 并安装所有依赖
# --locked 参数说明：严格按照 uv.lock 文件的版本安装（不升级版本）
RUN uv sync --locked

# ================== 第7步：复制应用代码 ==================
# 将数据导入脚本复制到容器
COPY ingest_data.py ./

# ================== 第8步：设置容器启动命令 ==================
# 当容器运行时，自动执行这个命令
# 等价于：uv run python ingest_data.py
# （当你运行 `docker run` 时不加参数就会执行这个）
ENTRYPOINT ["uv", "run", "python", "ingest_data.py"]