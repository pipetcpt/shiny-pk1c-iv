devtools::install_github("asancpt/NonCompart")
devtools::install_github("asancpt/ncar")

rsconnect::setAccountInfo(
  name='mang',
  token='65F256F8E4D2458F00C479B0FBCEA680',
  secret='m2EYypi2U4SAS067YbwdF+DHwdEekL381b1TkLlP'
)

rsconnect::setAccountInfo(name='asan', token='12696AD7B41ABFC67799183BF75ED7CF', secret='G+dZqQWocJu2ZFeFoWV6wQgYopp5YXdXh8+IbFYo')
rsconnect::deployApp(appName = "pk1ctemp", account = "mang")


