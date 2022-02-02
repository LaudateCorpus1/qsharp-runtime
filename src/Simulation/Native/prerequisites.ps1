# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

if (($IsMacOS) -or ((Test-Path Env:AGENT_OS) -and ($Env:AGENT_OS.StartsWith("Darwin")))) {
    # Skip explicit install for testing purposes
    # brew install libomp
} elseif (($IsWindows) -or ((Test-Path Env:/AGENT_OS) -and ($Env:AGENT_OS.StartsWith("Win")))) {
    if (!(Get-Command clang        -ErrorAction SilentlyContinue) -or `
        (Test-Path Env:/AGENT_OS)) {
        choco install llvm --version=13.0.0 --allow-downgrade
        Write-Host "##vso[task.setvariable variable=PATH;]$($env:SystemDrive)\Program Files\LLVM\bin;$Env:PATH"
    }
    if (!(Get-Command ninja -ErrorAction SilentlyContinue)) {
        choco install ninja
    }
    if (!(Get-Command cmake -ErrorAction SilentlyContinue)) {
        choco install cmake
    }
    refreshenv
}
else {
    if (Get-Command sudo -ErrorAction SilentlyContinue) {
        sudo add-apt-repository "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main"
        sudo apt update
        sudo apt-get install -y clang-13
    } else {
        add-apt-repository "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main"
        apt update
        apt-get install -y clang-13
    }
}



