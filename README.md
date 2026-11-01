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
