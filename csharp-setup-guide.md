# C# Development Setup Guide

This guide will help you set up C# development with this Neovim configuration on Windows, macOS, and Linux.

## Prerequisites

1. **Install .NET SDK**:
   - Download and install from [dotnet.microsoft.com](https://dotnet.microsoft.com/download)
   - Verify installation with: `dotnet --version`

2. **Install C# Formatter and Tools**:
   ```bash
   dotnet tool install -g csharpier
   ```

## Platform-Specific Setup

### Windows

1. **Install netcoredbg for debugging**:
   - Download from [netcoredbg releases](https://github.com/Samsung/netcoredbg/releases)
   - Extract to a folder in your PATH or add the folder to PATH
   - Verify installation: `netcoredbg --version`

2. **Ensure OmniSharp can find .NET**:
   - Make sure your .NET SDK installation directory is in your PATH
   - Typical path: `C:\Program Files\dotnet\`

### macOS

1. **Install netcoredbg for debugging**:
   ```bash
   # Option 1: Using brew
   brew install netcoredbg
   
   # Option 2: Manual installation
   # Download from GitHub releases and place in /usr/local/bin
   chmod +x /usr/local/bin/netcoredbg
   ```

2. **Ensure dotnet is in PATH**:
   ```bash
   # Add to .zshrc or .bash_profile
   export PATH=$PATH:$HOME/.dotnet/tools
   ```

### Linux

1. **Install netcoredbg**:
   ```bash
   # Debian/Ubuntu
   wget https://github.com/Samsung/netcoredbg/releases/download/latest/netcoredbg-linux-amd64.tar.gz
   tar -xzf netcoredbg-linux-amd64.tar.gz
   sudo mv netcoredbg /usr/local/bin/
   ```

2. **Ensure dotnet tools are in PATH**:
   ```bash
   # Add to .bashrc or .zshrc
   export PATH=$PATH:$HOME/.dotnet/tools
   ```

## Verifying Setup

1. Open a C# project:
   ```bash
   cd your-csharp-project
   nvim Program.cs  # or any .cs file
   ```

2. Check that OmniSharp is running:
   ```
   :LspInfo
   ```
   You should see OmniSharp listed as an active language server.

3. Test debugging:
   - Place cursor on a line
   - Press `<Space>dt` to set a breakpoint
   - Press `<Space>dc` to start debugging

## Troubleshooting

1. **OmniSharp not found or not starting**:
   - Install manually with Mason: `:MasonInstall omnisharp`
   - Check that .NET SDK is installed and in PATH

2. **Debugging not working**:
   - Verify netcoredbg is installed and in PATH: `which netcoredbg`
   - Make sure your project has debug symbols: `dotnet build -c Debug`

3. **Formatting not working**:
   - Check CSharpier installation: `dotnet tool list -g`
   - Install if missing: `dotnet tool install -g csharpier`

## Key Features

1. **IntelliSense**: Full C# code completion
2. **Navigation**: Go to definition, find references
3. **Refactoring**: Code actions and quick fixes
4. **Debugging**: Set breakpoints, inspect variables
5. **Testing**: Run and debug unit tests 

## C# Commands

- `<Space>ct` - Debug C# test at cursor
- `<Space>cb` - Build C# project
- `<Space>cr` - Run C# project
