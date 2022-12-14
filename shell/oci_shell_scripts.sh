#!/bin/sh

if [ ! -f "/root/oci.lock" ]; then
    echo "开始安装OCI依赖..."
    pip3 install requests
    echo '' >/root/oci.lock
    echo "安装OCI依赖完成"
else
    echo "OCI依赖已安装，跳过..."
fi

wget https://raw.githubusercontent.com/hausthy/common/master/python/ddNotify.py -O /scripts/custom/ddNotify.py

wget https://raw.githubusercontent.com/hausthy/common/master/python/oracle_cost_analysis.py -O /scripts/custom/oracle_cost_analysis.py

wget https://raw.githubusercontent.com/hausthy/common/master/python/cost-analysis.py -O /scripts/custom/cost-analysis.py
