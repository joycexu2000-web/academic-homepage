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
