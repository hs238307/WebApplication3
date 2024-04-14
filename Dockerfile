FROM mcr.microsoft.com/dotnet/sdk:7.0-alpine AS builder

COPY . .

WORKDIR /src

RUN dotnet restore

RUN dotnet publish WebApplication3/WebApplication3.csproj -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:7.0-alpine

COPY --from=builder /app .

ENTRYPOINT ["dotnet", "WebApplication3.dll"]
