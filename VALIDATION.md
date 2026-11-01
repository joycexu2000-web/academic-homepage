# 本地验证记录

验证日期：2026-11-01。

- 使用 Rscript render.R 成功生成 HTML、PDF 与 LaTeX；Quarto 1.6.42，XeLaTeX / TeX Live 2025。
- PDF 为两页 A4，元数据 Producer 为 xdvipdfmx，Creator 为 LaTeX via pandoc。
- 已逐页渲染并检查中文、页边距和分页，无乱码或文字遮挡。
- 已另行编译交付的 docs/index.tex，确认能独立编译；无缺字或超宽警告。
- 已检查 HTML 中所有本地 src/href，图片、样式、脚本、PDF 链接的目标文件均存在。
- 已检查上线网页的桌面浏览器显示，照片、导航、下载入口正常；已验证数据作品栏目跳转。未进行手机尺寸检查。
- 新账号公开仓库：https://github.com/joycexu2000-web/academic-homepage
- GitHub Pages 来源：main 分支 /docs，HTTPS。
- 公开主页：https://joycexu2000-web.github.io/academic-homepage/
- PDF：https://joycexu2000-web.github.io/academic-homepage/index.pdf
- 使用未携带登录凭据的请求成功获取公开网页与 PDF；两者 SHA-256 均与本地交付文件一致。
- 自包含 HTML 已嵌入样式、脚本与照片；公开部署目录只需 HTML、PDF、tex、search.json 和 .nojekyll。
