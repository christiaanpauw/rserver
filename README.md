# Docker for Shiny Server with Authentication

This is a Dockerfile for Shiny Server on Debian "testing". It is based on the `shiny` image.

The image contains OpenCV 3, its build dependencies, and few other R libraries pre-installed

- `ggplot`
- `png`
- `gridExtra`

It has CRAN-like repository called `ysz` on disk. You can install your work in progress packages using `install.packages` from there.

[How to Set Up a Custom CRAN-like Repository](https://rstudio.github.io/packrat/custom-repos.html)

## Authentication to Shiny Server

~~- `dot-htpasswd`~~

Set Nginx password at image build-time

    ./build secret

[Add Authentication to Shiny Server with Nginx](http://www.r-bloggers.com/add-authentication-to-shiny-server-with-nginx/)