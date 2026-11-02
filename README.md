# Qiaoyi Xu · Personal Homepage

Qiaoyi (Joyce) Xu 的个人主页，介绍教育背景、工作经历、技能与数据分析作品。

- 主页：https://joycexu2000-web.github.io/academic-homepage/
- 简历：https://joycexu2000-web.github.io/academic-homepage/myresume.html
- 简历 PDF：https://joycexu2000-web.github.io/academic-homepage/myresume.pdf

## 内容与源码

- `index.qmd`：个人主页内容，以 Quarto 生成网页及 PDF。
- `myresume.Rmd`：完整英文简历，与原站保持相同栏目及排版样式。
- `resume-template.html`：原站简历版式模板，包含原版 Flatly、导航和浮动目录所需样式与脚本。
- `portrait.jpeg`：个人照片。
- `render.R`：统一构建入口，生成 `docs` 中的网页、LaTeX 与 PDF。
- `resume-pdf.lua`：简历 PDF 中的日期对齐设置。

## 本地更新

安装 R、RStudio、Quarto 和 XeLaTeX（含 ctex/Fandol，例如 MacTeX 或完整 TeX Live）。R 包需要 knitr、base64enc。打开 RStudio 项目文件，在 Console 运行：

```r
source("render.R")
```

在 `index.qmd` 更新主页，在 `myresume.Rmd` 更新简历。重新构建后，将源码与生成的 `docs` 一起提交至 GitHub。

## 发布

GitHub Pages 使用 `main` 分支的 `/docs` 文件夹。Settings → Pages → Deploy from a branch → main → /docs。网页采用自包含 HTML，样式、照片与脚本已嵌入文件。

`docs/index.pdf` 和 `docs/myresume.pdf` 均通过 LaTeX 编译；相应 `.tex` 文件一并保留。

## 实现语言及可视化页面

主页使用 Quarto，简历使用 R Markdown，统一构建脚本为 R；不是 Python 网站。Python 仅曾用于开发过程中整理和检查文件，不是网站构建所需依赖。

`plotly.Rmd` 与 `dashboard.Rmd` 为原有 R 分析源码。`plotly-page.html` 与 `dashboard-page.html` 为迁移后保留交互数据的自包含页面，由 render.R 复制到 docs。此次迁移保留原有图表结果，未重新运行分析。所有导航指向新账号站点内的页面。
