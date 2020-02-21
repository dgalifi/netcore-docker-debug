FROM mcr.microsoft.com/dotnet/core/sdk:3.1
EXPOSE 5000

RUN apt update && \
    apt install -y unzip && \
    curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /vsdbg

RUN mkdir /work/
WORKDIR /work/

COPY ./dotnet-app.csproj /work/
RUN dotnet restore

COPY . /work/

# RUN mkdir /out/
# RUN dotnet publish --output /out/ --configuration Release

ENTRYPOINT [ "dotnet", "run"]
