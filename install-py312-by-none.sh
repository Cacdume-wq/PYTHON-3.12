#!/bin/bash
# Kiểm tra kiến trúc hệ thống
ARCH=$(uname -m)
# Hàm xử lý lỗi
check_error() {
    if [ $? -ne 0 ]; then
        echo "❌ Có lỗi xảy ra. Vui lòng kiểm tra lại!"
        exit 1
    fi
}
echo "🔍 Đang kiểm tra kiến trúc hệ thống..."
echo "📌 Kiến trúc phát hiện: $ARCH"
# Kiểm tra 64-bit
if [ "$ARCH" = "x86_64" ] || [ "$ARCH" = "amd64" ] || [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    echo "✅ Phát hiện hệ thống 64-bit"
    echo "📥 Đang tải và cài đặt Python 3.12 cho 64-bit..."
    apt --fix-broken install -y
    check_error
    curl -L https://raw.githubusercontent.com/Cacdume-wq/PYTHON-3.12/refs/heads/main/py312-64bit.deb -o py312.deb
    check_error
    dpkg -i py312.deb
    check_error
# Kiểm tra 32-bit (x86 hoặc ARM)
elif [ "$ARCH" = "i386" ] || [ "$ARCH" = "i686" ] || [ "$ARCH" = "armv7l" ] || [ "$ARCH" = "armv8l" ]; then
    echo "✅ Phát hiện hệ thống 32-bit (ARM hoặc x86)"
    echo "📥 Đang tải và cài đặt Python 3.12 cho 32-bit..."
    apt --fix-broken install -y
    check_error
    curl -L https://raw.githubusercontent.com/Cacdume-wq/PYTHON-3.12/refs/heads/main/py312.deb -o py312.deb
    check_error
    dpkg -i py312.deb
    check_error
els
    echo "❌ Không xác định được kiến trúc hệ thống: $ARCH"
    echo "📝 Các kiến trúc hỗ trợ: x86_64, amd64, aarch64, arm64, i386, i686, armv7l, armv8l"
    exit 1
fi
echo "✅ Cài đặt Python 3.12 hoàn tất!"
python3 --version
