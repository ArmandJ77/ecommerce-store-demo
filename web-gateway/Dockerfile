FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
ARG HOST
ARG APPCONFIGCONSTRING
WORKDIR /app

# Configure the environment variables
ENV ASPNETCORE_HOST $HOST
ENV AppConfigConnString $APPCONFIGCONSTRING

COPY ./WebGateway.sln ./
COPY ./NuGet.Config ./

COPY ./WebGateway/WebGateway.App.csproj ./WebGateway/

RUN dotnet restore 

# copy everything and build the project
COPY . ./
RUN dotnet build -c Release
# RUN dotnet test -c Release --no-build
RUN dotnet publish -c Release -o published --no-restore --no-build ./WebGateway

# RUNTIME IMAGE
FROM mcr.microsoft.com/dotnet/aspnet:6.0 as runtime
WORKDIR /app
EXPOSE 80
EXPOSE 443

COPY --from=build /app/published .
ENTRYPOINT ["dotnet", "WebGateway.App.dll"]