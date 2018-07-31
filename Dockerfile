FROM rocker/tidyverse

RUN apt-get update -y \
	&& install2.r --error \
		--deps TRUE \
		-r "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"	\
		cli \
		plumber 

COPY . /app

WORKDIR /app
