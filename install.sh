#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "======================================"
echo "     FreeVPS Launcher - Termux"
echo "======================================"

pkg update -y
pkg install -y git curl jq openssh

read -p "GitHub username: " GH_USER
read -p "Tên repository: " GH_REPO

echo
echo "Nhập GitHub Personal Access Token."
echo "Token cần quyền Actions/Contents phù hợp với repository."
read -s -p "GitHub Token: " GH_TOKEN
echo
echo

mkdir -p "$HOME/freevps"
cd "$HOME/freevps"

git init

cat > config.sh <<EOF
#!/data/data/com.termux/files/usr/bin/bash

export GH_USER="$GH_USER"
export GH_REPO="$GH_REPO"
export GH_TOKEN="$GH_TOKEN"
EOF

chmod 600 config.sh

echo
echo "Đã tạo cấu hình tại:"
echo "$HOME/freevps/config.sh"
echo
echo "Bây giờ chạy:"
echo "./vps"
