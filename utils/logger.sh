#!/bin/bash

# Log the given message at the given level. All logs are written to stderr with a timestamp.
function log() {
    local -r level="$1"
    local -r message="$2"
    local -r timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    local -r script_name="$(basename "$0")"
    if [ $level == "INFO" ]; then
        echo >&2 -e "\x1b[1;36m${timestamp} [${level}] [$script_name] ${message}\e[0m"
    elif [ $level == "WARN" ]; then
        echo >&2 -e "\x1b[0;33m${timestamp} [${level}] [$script_name] ${message}\e[0m"
    elif [ $level == "ERROR" ]; then
        echo >&2 -e "\x1b[0;31m${timestamp} [${level}] [$script_name] ${message}\e[0m"
    elif [ $level == "READ" ]; then
        echo >&2 -n -e "\x1b[1;32m${timestamp} [${level}] [$script_name] ${message}\e[0m"
    elif [ $level == "SUCCESS" ]; then
        echo >&2 -e "\x1b[0;32m${timestamp} [${level}] [$script_name] ${message}\e[0m"
    fi
}

# Log the given message at INFO level. All logs are written to stderr with a timestamp.
function log_info() {
    tput rc
    tput el
    local -r message="$1"
    log "INFO" "$message"
}

# Log the given message at WARN level. All logs are written to stderr with a timestamp.
function log_warn() {
    local -r message="$1"
    log "WARN" "$message"
}

# Log the given message at ERROR level. All logs are written to stderr with a timestamp.
function log_error() {
    tput rc
    tput el
    local -r message="$1"
    log "ERROR" "$message"
}
aqui="aaaa"

function log_read() {
    tput rc
    tput el
    local -r message="$1"
    log "READ" "$message"
}

function log_success() {
    local -r message="$1"
    log "SUCCESS" "$message"
}

function new_job() {
    tput sc
}
