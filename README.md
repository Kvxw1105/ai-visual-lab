# AI Visual Lab

面向长期视觉创作的本地工作仓库：让 Codex 进入一套已有的视觉规则、工作流和可复用资产，而不是每次从空白开始。

## 先做什么

1. 阅读本文件与 AGENTS.md。
2. 运行 setup.sh 建立 Python 基础环境；不会安装 Blender、FFmpeg 或整个 Node 技术栈。
3. 从 projects/playground 或 experiments 开始一个最小可运行切片。
4. 通过实际渲染和截图做视觉检查，再沉淀成功方案。

## 技术路线

| 范围 | 默认选择 | 装配策略 |
|---|---|---|
| Python 视觉工具 | NumPy、OpenCV、Pillow、SciPy、Matplotlib | setup.sh 安装到仓库内的 .venv |
| Web 3D | Node.js 22+、Three.js；需要 React 时再选 React Three Fiber / Drei；GSAP 用于明确的时间轴动画 | 依项目创建 package.json，不在仓库根目录堆全栈依赖 |
| 程序化 CG | Blender 4.x、Geometry Nodes、Blender Python API | Blender 单独安装；bpy 使用 Blender 自带 Python 环境 |
| 视频 | Remotion 或 FFmpeg，按交付格式选择 | 在具体项目中安装；Remotion 以官方模板初始化 |
| Shader | GLSL / Three.js ShaderMaterial | 不预装通用 Shader 包 |
| Blender MCP | 作为可选的外部连接 | 本仓库不写入机器级 MCP 配置，也不声称已连接 |

只安装当前实验实际用到的工具。FFmpeg、Blender、MCP 与 Node 工具链不是 setup.sh 的隐式副作用。

## 仓库结构

- .agents/skills/：Codex 可发现的仓库级视觉 Skills。
- projects/：完整创作项目；playground/ 用于快速试验。
- experiments/：单一问题、短周期、可复现的小实验。
- engines/：Three.js、Blender、Remotion、Canvas、Shader 的技术入口。
- assets/：模型、贴图、HDRI、字体、音效及其来源记录。
- libraries/：camera、transitions、particles、terrain、typography、lighting 等复用模块。
- benchmarks/：棋子到山河、万人军阵、红旗展开三个目标基准。
- docs/：视觉语言、参考资料、教程和复盘。
- tools/：渲染、截图、视频和资产导入工具。

## 启动

在 Linux / macOS / Git Bash 中：

    bash ./setup.sh
    bash ./setup.sh --check  # 只检查，不安装

Windows PowerShell 可直接执行：

    py -3.11 -m venv .venv
    .\.venv\Scripts\python.exe -m pip install -r requirements.txt

Web 项目按需初始化：Three.js 参考 https://threejs.org/manual/#en/installation；Remotion 参考 https://www.remotion.dev/docs/。不要为了“预备”而在根目录安装所有引擎。

## 验收标准

每个完成的实验至少留下：可运行代码、关键参数、启动/渲染命令、实际输出截图或视频、可复用结论。报告清楚区分静态检查、真实运行、浏览器/渲染验证；未运行的内容标为未验证。