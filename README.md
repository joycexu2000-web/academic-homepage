# 个人主页课程项目

采用 Quarto + R/RStudio + GitHub Pages。原始照片为根目录 portrait.jpeg。唯一的个人资料正文为 `index.qmd`，同一文件生成 HTML 和经 XeLaTeX 编译的 PDF，并保留 `.tex`。无需网页后台或数据库。

## 已交付与发布状态

- `docs/index.html`：已生成的网页，样式、照片和站点脚本已嵌入 HTML，可独立打开。
- `docs/index.pdf`：LaTeX 编译的 PDF。
- `docs/index.tex`：可编辑的 LaTeX 源文件，当前为纯文字个人资料，无外部图片依赖。
- `index.qmd`、`_quarto.yml`、`styles.css`、`render.R`、RStudio 项目文件：完整构建源码。
- `SOURCES.md`：资料来源与编辑边界。

新版部署到新 GitHub 账号 joycexu2000-web。原账号 qiaoyixu 的主页仅作为历史资料与作品来源；无需取回原账号即可维护本项目。公开访问状态请见 VALIDATION.md。

## 推荐部署：独立课程仓库

推荐仓库名 `academic-homepage`，上线后的预期网址为：
https://joycexu2000-web.github.io/academic-homepage/

1. 登录 GitHub 的 joycexu2000-web 账户，创建名为 `academic-homepage` 的公开仓库。
2. 将本文件所在文件夹中的全部项目内容上传至仓库根目录。保留 `docs` 内文件夹层级；无需上传外层压缩包。也可在 RStudio 中使用 Git 面板提交并推送。
3. 打开仓库 Settings → Pages。
4. Source 选择 **Deploy from a branch**；Branch 选择 **main**，Folder 选择 **/docs**，点击 Save。
5. 等待 Pages 部署工作完成，打开上述网址。若未出现，查看仓库 Actions 中的 Pages 构建记录。
6. 验证：主页能打开、导航可跳转、照片可见、PDF 按钮可下载且中文正常。使用无痕窗口确认公开访问。

GitHub Pages 配置依据：https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site

### 使用命令行上传（可选）

先创建空仓库，进入本项目目录再运行；认证由本机 Git/GitHub 完成，不要把令牌写入文件：

```bash
git init
git branch -M main
git add .
git commit -m "Add academic homepage with LaTeX PDF"
git remote add origin https://github.com/joycexu2000-web/academic-homepage.git
git push -u origin main
```

随后按前述步骤启用 main /docs。项目内使用相对路径，支持 GitHub Pages 子路径。

### 新旧账号说明

本项目部署在新账号下。旧主页及旧数据作品继续作为外部链接保留，资料来源链接仍指向原账号；无需修改或登录原仓库。

## RStudio 中修改及重新生成

1. 安装 R、RStudio、Quarto 和含 ctex/Fandol 字体的 TeX 发行版（推荐完整 MacTeX 或 TeX Live）。本机已验证 R、RStudio 自带 Quarto 1.6.42、TeX Live 2025。仅重新部署现成 docs 不需要安装它们。
2. 双击 `academic-homepage.Rproj`。只修改 `index.qmd` 的资料正文，即可同步维护网页与 PDF。
3. 在 RStudio Console 运行：

```r
source("render.R")
```

或者在项目目录运行 `Rscript render.R`。脚本优先使用 PATH 中的 Quarto；macOS 可使用 RStudio 自带 Quarto。其他系统找不到时请安装官方 Quarto 并加入 PATH。
4. 查看 `docs/index.html` 和 `docs/index.pdf`。将修改的源码与重新生成的整个 docs 一并提交、推送，Pages 将自动更新静态网站。

等价命令为 `quarto render index.qmd --to all`。PDF 配置使用 XeLaTeX、ctexart 和 `keep-tex: true`。若系统仅安装 TinyTeX，需将配置中 `latex-tinytex: false` 改为 `true` 或删除该行，并安装 ctex、Fandol 等所需包。

Quarto 文档：https://quarto.org/docs/output-formats/pdf-basics

### 单独编译 LaTeX

在 docs 目录运行两遍 `xelatex -interaction=nonstopmode -halt-on-error index.tex`。生成文件可独立编译；但长期维护应修改 index.qmd 并重新渲染，避免网页与 PDF 资料分叉。

## 尚未提供 rubric：可调整项

当前未获得课程作业要求文件，以下为待对照项，不代表教师明确要求：

- 姓名语言、课程名、学号、教师、作业日期：可按要求加入标题或独立提交封面。
- 页面数量：当前为单页、多章节；若要求多页，可拆分 education.qmd、projects.qmd 并加入导航。
- 必需栏目：可增加研究兴趣、课程列表、成果或有效邮箱；未经本人确认的信息不自动补写。
- R 代码或统计图要求：当前保留原站数据作品链接，没有在新版重新执行原分析。若要求代码块、本地数据、交互图或指定数据集，需加入对应文件和可复现计算。
- LaTeX 要求：当前 PDF 确实经过 LaTeX 编译，并交付 tex；若要求手写模板、指定 documentclass、页数、字体、封面或参考文献，应按 rubric 改配置/模板。
- 图片与个性化：当前网页采用原站个人照片，PDF 为简洁文字版；可按 rubric 加入照片及相关材料。
- 提交方式：确认是否需要仓库链接、公开网址、PDF、源代码压缩包和截图。
- 更新个人信息：确认目前身份、MPH 毕业情况、证书正式名称、有效联系方式和机构中文名称后，可替换历史记录提示。

## 验收清单

- [x] 同一份 QMD 支持 HTML 与 LaTeX/PDF。
- [x] 已构建网页、PDF 和 tex，交付配套静态资源。
- [x] 已读取原主页与原简历，无虚构毕业或论文成果。
- [ ] 上传公开仓库并启用 GitHub Pages。
- [ ] 在无痕窗口验证新网址及 PDF 下载。
- [ ] 获得课程 rubric 后逐项对照。
