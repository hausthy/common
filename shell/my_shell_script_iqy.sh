#!/bin/sh
#定时任务文件路径
mergedListFile="/scripts/docker/merged_list_file.sh"
procFile="/scripts/docker/proc_file.sh"
downloadstatus=0
hh=$(date '+%H')

#初始化python3环境
function initPythonEnv() {
    if [ ! -f "/root/python.lock" ]; then
        echo "开始安装运行需要的python环境及依赖..."
        sed -i 's#dl-cdn.alpinelinux.org#mirrors.aliyun.com#g' /etc/apk/repositories
        apk update
        apk upgrade
        apk add --update python3-dev py3-pip py3-cryptography py3-numpy py-pillow
        echo '' >/root/python.lock
    else
        echo "python已经更新到最新版，跳过..."
    fi
}

#主入口
function main() {

    if [ ! -f "/root/nodejs.lock" ]; then
        echo "开始更新nodejs..."
        sed -i 's#dl-cdn.alpinelinux.org#mirrors.aliyun.com#g' /etc/apk/repositories
        apk add nodejs-current

        if [ ! -f "/custom/scripts/package.json" ]; then
            cp -rf /scripts/package.json /custom/scripts/package.json
        fi
        echo "npm install 安装最新依赖"
        npm install --prefix /custom/scripts/

        echo '' >/root/nodejs.lock
    else
        echo "nodejs已经更新到最新版，跳过..."
    fi

    #开始安装运行需要的python环境
    # initPythonEnv

    mkdir -p /custom/

    echo -e "\n#自定义脚本Task" >>${mergedListFile}

    ## 下载爱奇艺
    wget https://git.itsapi.top/https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js -O /custom/scripts/iQIYI.js

    if [ $JD_USER_NAME == "hausthy" ]; then
        # initTelethon
        echo $hh
    fi

    if [ $JD_USER_NAME == "gd_hausthy" ]; then
        # 生成8:00-8:20的cron
        random_m=$(($RANDOM % 20))
        echo -e "\n#爱奇艺签到" >>${mergedListFile}
        echo -e "${random_m} 8 * * * node /custom/scripts/iQIYI.js >> /scripts/logs/iQIYI.log 2>&1" >>${mergedListFile}
    fi

    ##格式化日期输出格式
    sed -i 's#\(|ts\|| ts\) >>#|ts \"%Y-%m-%d %H:%M:%S\" >>#g' ${procFile}
    echo -e "sed -i 's#|ts >>#|ts \"%Y-%m-%d %H:%M:%S\" >>#g' ${mergedListFile}" >>${procFile}

    ##复制docker_entrypoint文件
    echo "开始替换docker_entrypoint文件"
    cp /scripts/docker/docker_entrypoint.sh /usr/local/bin/docker_entrypoint_a.sh && chmod +x /usr/local/bin/docker_entrypoint_a.sh
    cp /scripts/docker/docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh && chmod +x /usr/local/bin/docker_entrypoint.sh

    echo "替换docker_entrypoint文件执行完成"

    if [ $JD_USER_NAME == "hausthy" ]; then
        ##自定义定时任务
        echo -e "\n#默认脚本更新时间" >>${mergedListFile}
        echo "20,50 */1 * * * docker_entrypoint_a.sh >> /scripts/logs/default_task.log 2>&1" >>/scripts/docker/merged_list_file.sh
    fi

    if [ $JD_USER_NAME == "gd_hausthy" ]; then
        ##自定义定时任务
        echo -e "\n#默认脚本更新时间" >>${mergedListFile}
        echo "23,53 */1 * * * docker_entrypoint_a.sh >> /scripts/logs/default_task.log 2>&1" >>/scripts/docker/merged_list_file.sh
    fi
}

main
