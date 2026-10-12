---
name: blender-director
description: 用户要求用 Blender、Geometry Nodes 或 Blender Python 制作程序化模型、场景或动画时使用。
---
# Blender Director

先确认目标物、镜头、比例、输出分辨率与目标 Blender 版本。优先用 Geometry Nodes 处理重复/参数化结构，用 Blender Python 自动化重复操作；保持参数可调，避免把一次性结果写死。

实际检查 Blender 是否可用；不要假设 bpy 可在系统 Python 中导入。MCP 仅在当前环境已连接时使用，连接失败就说明并采用本地 Blender 路线。至少保存 .blend、渲染预览和复现命令；检查相机、材质、灯光、帧范围与输出路径。