devtools::install_github("asancpt/NonCompart")
devtools::install_github("asancpt/ncar")

rsconnect::deployApp(appDir = "~/asancpt/pk1c", appName = "pk1c", account = "asan")