#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["VisualAccess.API/VisualAccess.API.csproj", "VisualAccess.API/"]
COPY ["VisualAccess.DataAccess/VisualAccess.DataAccess.csproj", "VisualAccess.DataAccess/"]
COPY ["VisualAccess.Domain/VisualAccess.Domain.csproj", "VisualAccess.Domain/"]
COPY ["VisualAccess.Business/VisualAccess.Business.csproj", "VisualAccess.Business/"]
COPY ["VisualAccess.FaceRecognition/VisualAccess.FaceRecognition.csproj", "VisualAccess.FaceRecognition/"]
RUN dotnet restore "VisualAccess.API/VisualAccess.API.csproj"
COPY . .
WORKDIR "/src/VisualAccess.API"
RUN dotnet build "VisualAccess.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "VisualAccess.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "VisualAccess.API.dll"]
