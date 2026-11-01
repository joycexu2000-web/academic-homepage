# Run from the project folder: Rscript render.R
if (!file.exists("index.qmd")) stop("请先在项目目录中运行本脚本。")
if (dir.exists("/Library/TeX/texbin")) Sys.setenv(PATH = paste("/Library/TeX/texbin", Sys.getenv("PATH"), sep = .Platform$path.sep))
quarto <- Sys.which("quarto")
if (!nzchar(quarto)) {
  candidates <- c("/Applications/RStudio.app/Contents/Resources/app/quarto/bin/quarto",
                  file.path(Sys.getenv("ProgramFiles"), "RStudio/resources/app/bin/quarto/bin/quarto.exe"))
  found <- candidates[file.exists(candidates)]
  if (length(found)) quarto <- found[[1]]
}
if (!nzchar(quarto)) stop("请安装 Quarto，或将 quarto 加入 PATH：https://quarto.org/docs/get-started/")
status <- system2(quarto, c("render", "index.qmd", "--to", "all"))
if (status != 0) stop("渲染失败，请检查 Quarto 和 XeLaTeX 的输出。")
tex <- c("docs/index.tex", "index.tex")
tex <- tex[file.exists(tex)]
if (!length(tex)) stop("未找到 LaTeX 输出")
if (tex[[1]] != "docs/index.tex") file.copy(tex[[1]], "docs/index.tex", overwrite = TRUE)
file.create("docs/.nojekyll")
cat("完成：docs/index.html、docs/index.pdf、docs/index.tex\n")

# Render the original resume layout from a single R Markdown source.
if (!requireNamespace("knitr", quietly = TRUE) || !requireNamespace("base64enc", quietly = TRUE)) {
  stop("请安装 R 包 knitr 和 base64enc。")
}
resume_md <- tempfile(fileext = ".md")
resume_body <- tempfile(fileext = ".html")
knitr::knit("myresume.Rmd", output = resume_md, quiet = TRUE)
run_pandoc <- function(args) {
  status <- system2(quarto, c("pandoc", vapply(args, shQuote, character(1))))
  if (status != 0) stop("简历 Pandoc 转换失败。")
}
run_pandoc(c(resume_md, "--from=markdown", "--to=html", "--section-divs", "--output", resume_body))
fragment <- paste(readLines(resume_body, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
layout <- paste(readLines("resume-template.html", warn = FALSE, encoding = "UTF-8"), collapse = "\n")
photo <- paste0("data:image/jpeg;base64,", base64enc::base64encode("portrait.jpeg"))
web_fragment <- gsub('src="portrait.jpeg"', paste0('src="', photo, '"'), fragment, fixed = TRUE)
parts <- strsplit(layout, "<!-- RESUME_BODY -->", fixed = TRUE)[[1]]
if (length(parts) != 2L) stop("简历模板正文标记异常。")
writeLines(paste0(parts[[1]], web_fragment, parts[[2]]), "docs/myresume.html", useBytes = TRUE)
run_pandoc(c(resume_body, "--from=html", "--to=latex", "--standalone",
             "--lua-filter=resume-pdf.lua", "--variable=geometry:margin=22mm",
             "--variable=papersize:a4", "--variable=mainfont:texgyrepagella-regular.otf",
             "--variable=mainfontoptions:BoldFont=texgyrepagella-bold.otf,ItalicFont=texgyrepagella-italic.otf,BoldItalicFont=texgyrepagella-bolditalic.otf",
             "--variable=colorlinks:true", "--output=docs/myresume.tex"))
latex <- Sys.which("xelatex")
if (!nzchar(latex)) stop("请安装 XeLaTeX。")
for (i in seq_len(2)) {
  status <- system2(latex, c("-interaction=nonstopmode", "-halt-on-error", "-output-directory=docs", "docs/myresume.tex"),
                    stdout = file.path(tempdir(), "resume-xelatex.log"), stderr = "")
  if (status != 0) stop("简历 PDF 编译失败，日志：", file.path(tempdir(), "resume-xelatex.log"))
}
cat("Resume: docs/myresume.html, docs/myresume.pdf, docs/myresume.tex\n")
