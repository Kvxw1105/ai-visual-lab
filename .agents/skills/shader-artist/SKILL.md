---
name: shader-artist
description: 编写或调试 GLSL、Three.js ShaderMaterial、程序化水火烟雾或屏幕后处理时使用。
---
# Shader Artist

先写清楚效果的空间、尺度、时间和颜色目标，再确定顶点/片元阶段与输入 uniform。优先构造一个最小 shader 并在目标场景实际编译；检查坐标空间、色彩空间、透明度、边缘和低端设备成本。

把可调参数集中暴露，给出安全默认值。若编译或渲染环境不可用，提供静态校验并明确说明没有得到真实画面；不要把 GLSL 文本存在当作视觉验证。