#!/bin/bash

# List of items to compress/decompress
items=("bilder" "videos" "myfilezero" "randomfile" "test" "test.asm" "text.txt")

# Compression methods
methods=("zip" "rar" "gzip" "7z" "xz" "bzip2")

# Function to get human readable file size
human_readable() {
    local size=$1
    if [ $size -ge 1073741824 ]; then
        echo "$(echo "scale=2; $size/1073741824" | bc) GB"
    elif [ $size -ge 1048576 ]; then
        echo "$(echo "scale=2; $size/1048576" | bc) MB"
    elif [ $size -ge 1024 ]; then
        echo "$(echo "scale=2; $size/1024" | bc) KB"
    else
        echo "$size bytes"
    fi
}

# Function to get size of file/directory
get_size() {
    if [ -d "$1" ]; then
        du -sb "$1" | cut -f1
    else
        stat -c%s "$1"
    fi
}

# Function to decompress files
decompress_file() {
    local method=$1
    local compressed_file=$2
    local output_name=$3
    
    case $method in
        "zip")
            unzip -q "$compressed_file"
            ;;
        "rar")
            unrar x -inul "$compressed_file"
            ;;
        "gzip")
            if [[ "$compressed_file" == *.tar.gz ]]; then
                tar -xzf "$compressed_file"
            else
                gunzip -k "$compressed_file"
            fi
            ;;
        "7z")
            7z x -bd "$compressed_file" >/dev/null
            ;;
        "xz")
            if [[ "$compressed_file" == *.tar.xz ]]; then
                tar -xJf "$compressed_file"
            else
                unxz -k "$compressed_file"
            fi
            ;;
        "bzip2")
            if [[ "$compressed_file" == *.tar.bz2 ]]; then
                tar -xjf "$compressed_file"
            else
                bunzip2 -k "$compressed_file"
            fi
            ;;
    esac
}

# Main compression/decompression function
compress_decompress_and_report() {
    local method=$1
    local item=$2
    local original_size=$(get_size "$item")
    local compressed_file="${item}.${method}"
    
    # Handle tar extensions for directory compression
    if [ -d "$item" ]; then
        case $method in
            "gzip") compressed_file="${item}.tar.gz" ;;
            "xz") compressed_file="${item}.tar.xz" ;;
            "bzip2") compressed_file="${item}.tar.bz2" ;;
        esac
    fi
    
    echo -e "\n${method^^}:"
    echo "${item} original: $(human_readable $original_size)"
    
    # Compression
    start_compress=$(date +%s.%N)
    
    case $method in
        "zip")
            if [ -d "$item" ]; then
                zip -rq "${item}.zip" "$item"
            else
                zip -q "${item}.zip" "$item"
            fi
            ;;
        "rar")
            rar a -inul "${item}.rar" "$item" >/dev/null
            ;;
        "gzip")
            if [ -d "$item" ]; then
                tar -czf "${item}.tar.gz" "$item"
            else
                gzip -k -c "$item" > "${item}.gz"
            fi
            ;;
        "7z")
            7z a -bd "${item}.7z" "$item" >/dev/null
            ;;
        "xz")
            if [ -d "$item" ]; then
                tar -cJf "${item}.tar.xz" "$item"
            else
                xz -k -c "$item" > "${item}.xz"
            fi
            ;;
        "bzip2")
            if [ -d "$item" ]; then
                tar -cjf "${item}.tar.bz2" "$item"
            else
                bzip2 -k -c "$item" > "${item}.bz2"
            fi
            ;;
    esac
    
    end_compress=$(date +%s.%N)
    compress_time=$(echo "$end_compress - $start_compress" | bc)
    
    compressed_size=$(get_size "$compressed_file")
    echo "${item} compressed: $(human_readable $compressed_size) (took ${compress_time}s)"
    
    # Calculate compression ratio
    ratio=$(echo "scale=2; ($original_size - $compressed_size) * 100 / $original_size" | bc)
    echo "Compression ratio: ${ratio}%"
    
    # Decompression
    start_decompress=$(date +%s.%N)
    decompress_file "$method" "$compressed_file" "$item"
    end_decompress=$(date +%s.%N)
    decompress_time=$(echo "$end_decompress - $start_decompress" | bc)
    echo "Decompression time: ${decompress_time}s"
    
    # Verify decompressed file/directory
    if [ -e "$item" ]; then
        decompressed_size=$(get_size "$item")
        if [ "$decompressed_size" -eq "$original_size" ]; then
            echo "Decompression verified: sizes match"
        else
            echo "WARNING: Decompressed size differs from original!"
        fi
    else
        echo "ERROR: Decompression failed - output not found"
    fi
    
    # Clean up
    rm -f "$compressed_file"
}

# Process each compression method
for method in "${methods[@]}"; do
    # Check if compression tool is available
    if ! command -v $method &> /dev/null; then
        echo -e "\n${method^^}: Skipping - $method not installed"
        continue
    fi
    
    # Check if decompression tool is available
    case $method in
        "zip") if ! command -v unzip &> /dev/null; then continue; fi ;;
        "rar") if ! command -v unrar &> /dev/null; then continue; fi ;;
        "gzip") if ! command -v gunzip &> /dev/null; then continue; fi ;;
        "7z") if ! command -v 7z &> /dev/null; then continue; fi ;;
        "xz") if ! command -v unxz &> /dev/null; then continue; fi ;;
        "bzip2") if ! command -v bunzip2 &> /dev/null; then continue; fi ;;
    esac
    
    # Process each item
    for item in "${items[@]}"; do
        if [ -e "$item" ]; then
            compress_decompress_and_report "$method" "$item"
        else
            echo -e "\n${method^^}:"
            echo "Skipping $item - does not exist"
        fi
    done
done