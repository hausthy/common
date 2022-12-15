#!/bin/sh
#定时任务文件路径
mergedListFile="/scripts/docker/merged_list_file.sh"
procFile="/scripts/docker/proc_file.sh"
dustPath='/github/dust'
rainPath='/github/longzhuhzu'
mainPath='/github/jd_scripts'
aaronPath='/github/Aaron_lv'
allJdScripts='/github/all_scripts'
smiekPath='/github/smiek2221'
starPath='/github/star261'
ccbPath='/github/ccb'
fakerPath='/github/faker'
fakerPath3='/github/faker3'
wskeyPath='/github/wskey'
qlScriptPath='/github/qlScript'
omoPath='/github/omo'
downloadstatus=0
hh=$(date '+%H')
#@hausthy仓库脚本
function inittest() {
    # function inithausthy() {
    #     git clone https://gitee.com/hausthy/Loon.git /scripts/Loon/hausthy
    # }

    #  if [ ! -d "/scripts/Loon/hausthy" ]; then
    #     echo "未检查到hausthy仓库脚本，初始化下载相关脚本"
    #     inithausthy
    # else
    #     echo "更新hausthy脚本相关文件"
    #     git -C /scripts/Loon/hausthy reset --hard
    #     git -C /scripts/Loon/hausthy pull --rebase
    # fi

    # echo "npm install 安装最新ws依赖"
    # npm install --prefix /scripts ws
    return 0
}

function initMain() {
    ## 克隆main仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$mainPath" ]; then
            echo "未检查到main仓库脚本，初始化下载相关脚本..."
            git clone -b main https://git.itsapi.top/https://github.com/JDHelloWorld/jd_scripts.git $mainPath
        else
            echo "更新main脚本相关文件..."
            git -C $mainPath remote set-url origin https://git.itsapi.top/https://github.com/JDHelloWorld/jd_scripts.git
            git -C $mainPath reset --hard
            git -C $mainPath pull origin main --rebase
        fi
    fi

    cp -rf $mainPath/* /scripts/
    cp -rf $mainPath/tools/jd_jxmcToken.js /scripts/jd_jxmcToken.js

    if [ $hh -eq 11 ] || [ $hh -eq 23 ] || [ ! -f "/root/nodehw.lock" ]; then
        npm install --prefix /scripts
        echo '' >/root/nodehw.lock
    else
        echo "本次不执行安装Main依赖，跳过..."
    fi

    if [ ! -f "/root/nodets.lock" ]; then
        echo "开始更新nodets..."
        npm i -g ts-node typescript @types/node date-fns axios
        echo '' >/root/nodets.lock
    else
        echo "nodets已经更新到最新版，跳过..."
    fi
}

function initAaronLv() {
    ## 克隆AaronLv仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$aaronPath" ]; then
            echo "未检查到main仓库脚本，初始化下载相关脚本..."
            git clone -b jd_scripts https://git.itsapi.top/https://github.com/Aaron-lv/sync.git $aaronPath
        else
            echo "更新main脚本相关文件..."
            git -C $aaronPath remote set-url origin https://git.itsapi.top/https://github.com/Aaron-lv/sync.git
            git -C $aaronPath reset --hard
            git -C $aaronPath pull origin jd_scripts --rebase
        fi
    fi
    mkdir -p /custom/aaron_scripts/
    cp -rf $aaronPath/* /custom/aaron_scripts/

    if [ $hh -eq 10 ] || [ $hh -eq 22 ] || [ ! -f "/root/nodelv.lock" ]; then
        npm install --prefix /custom/aaron_scripts
        echo '' >/root/nodelv.lock
    else
        echo "本次不执行安装aaron依赖，跳过..."
    fi
}

function initAllJdScripts() {
    ## 克隆allJdScripts仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$allJdScripts" ]; then
            echo "未检查到main仓库脚本，初始化下载相关脚本..."
            git clone -b master https://git.itsapi.top/https://github.com/hyzaw/AllJDScripts.git $allJdScripts
        else
            echo "更新main脚本相关文件..."
            git -C $allJdScripts remote set-url origin https://git.itsapi.top/https://github.com/hyzaw/AllJDScripts.git
            git -C $allJdScripts reset --hard
            git -C $allJdScripts pull origin master --rebase
        fi
    fi
    mkdir -p /custom/all_scripts/
    cp -rf $allJdScripts/* /custom/all_scripts/

    if [ $hh -eq 10 ] || [ $hh -eq 22 ] || [ ! -f "/root/nodeall.lock" ]; then
        npm install --prefix /custom/all_scripts
        echo '' >/root/nodeall.lock
    else
        echo "本次不执行安装all_scripts依赖，跳过..."
    fi
}

function initSmiek2121() {
    ## 克隆AaronLv仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$smiekPath" ]; then
            echo "未检查到main仓库脚本，初始化下载相关脚本..."
            git clone -b master https://git.itsapi.top/https://github.com/smiek2121/scripts.git $smiekPath
        else
            echo "更新main脚本相关文件..."
            git -C $smiekPath remote set-url origin https://git.itsapi.top/https://github.com/smiek2121/scripts.git
            git -C $smiekPath reset --hard
            git -C $smiekPath pull origin master --rebase
        fi
    fi
    mkdir -p /custom/smiek_scripts/
    cp -rf $smiekPath/* /custom/smiek_scripts/
    cp -f /$smiekPath/gua_carnivalcity.js /custom/scripts/gua_carnivalcity.js
    cp -rf $smiekPath/JDJRValidator_Pure.js /custom/scripts/JDJRValidator_Pure.js
    cp -rf $smiekPath/jd_sign_graphics.js /custom/scripts/jd_sign_graphics.js
    cp -rf $smiekPath/sign_graphics_validate.js /custom/scripts/sign_graphics_validate.js
    #npm install --prefix /custom/smiek_scripts
}

function initStar261() {
    ## 克隆Star261仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$starPath" ]; then
            echo "未检查到main仓库脚本，初始化下载相关脚本..."
            git clone -b main https://git.itsapi.top/https://github.com/star261/jd.git $starPath
        else
            echo "更新main脚本相关文件..."
            git -C $starPath remote set-url origin https://git.itsapi.top/https://github.com/star261/jd.git
            git -C $starPath reset --hard
            git -C $starPath pull origin main --rebase
        fi
    fi
    mkdir -p /custom/star261_scripts/
    cp -rf $starPath/* /custom/star261_scripts/
    cp -rf $starPath/scripts/jd_ddworld.js /custom/scripts/jd_ddworld.js
}

function initFaker() {
    ## 克隆FAKER仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$fakerPath" ]; then
            echo "未检查到main仓库脚本，初始化下载相关脚本..."
            git clone -b master https://git.itsapi.top/https://github.com/okyyds/yydspure.git $fakerPath
        else
            echo "更新main脚本相关文件..."
            git -C $fakerPath remote set-url origin https://git.itsapi.top/https://github.com/okyyds/yydspure.git
            git -C $fakerPath reset --hard
            git -C $fakerPath pull origin master --rebase
        fi
    fi
    mkdir -p /custom/faker_scripts/
    cp -rf $fakerPath/* /custom/faker_scripts/

    if [ $hh -eq 09 ] || [ $hh -eq 21 ] || [ ! -f "/root/nodefk.lock" ]; then
        npm install --prefix /custom/faker_scripts
        npm install dotenv --prefix /custom/faker_scripts/
        echo '' >/root/nodefk.lock
    else
        echo "本次不执行安装faker依赖，跳过..."
    fi
}

function initFaker3() {
    ## 克隆FAKER3仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$fakerPath3" ]; then
            echo "未检查到main仓库脚本，初始化下载相关脚本..."
            git clone -b main https://git.itsapi.top/https://github.com/shufflewzc/faker3.git $fakerPath3
        else
            echo "更新main脚本相关文件..."
            git -C $fakerPath3 remote set-url origin https://git.itsapi.top/https://github.com/shufflewzc/faker3.git
            git -C $fakerPath3 reset --hard
            git -C $fakerPath3 pull origin main --rebase
        fi
    fi
    mkdir -p /custom/faker3_scripts/
    cp -rf $fakerPath3/* /custom/faker3_scripts/

    if [ $hh -eq 09 ] || [ $hh -eq 21 ] || [ ! -f "/root/nodefk3.lock" ]; then
        npm install --prefix /custom/faker3_scripts
        npm install dotenv --prefix /custom/faker3_scripts/
        echo '' >/root/nodefk3.lock
    else
        echo "本次不执行安装faker3依赖，跳过..."
    fi
}

function initwskey() {
    ## 克隆wskey仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$wskeyPath" ]; then
            echo "未检查到wskey仓库脚本，初始化下载相关脚本..."
            git clone -b main https://git.itsapi.top/https://github.com/Zy143L/wskey.git $wskeyPath
        else
            echo "更新wskey脚本相关文件..."
            git -C $wskeyPath remote set-url origin https://git.itsapi.top/https://github.com/Zy143L/wskey.git
            git -C $wskeyPath reset --hard
            git -C $wskeyPath pull origin main --rebase
        fi
    fi
    mkdir -p /custom/wskey_scripts/
    cp -rf $wskeyPath/* /custom/wskey_scripts/
}

function initQlScript() {
    ## 克隆qlScript仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$qlScriptPath" ]; then
            echo "未检查到main仓库脚本，初始化下载相关脚本..."
            git clone -b main https://git.itsapi.top/https://github.com/ccwav/QLScript2.git $qlScriptPath
        else
            echo "更新main脚本相关文件..."
            git -C $qlScriptPath remote set-url origin https://git.itsapi.top/https://github.com/ccwav/QLScript2.git
            git -C $qlScriptPath reset --hard
            git -C $qlScriptPath pull origin main --rebase
        fi
    fi
    mkdir -p /custom/ql_scripts/
    mkdir -p /custom/scripts/utils/
    cp -rf $qlScriptPath/* /custom/ql_scripts/
    cp -rf $qlScriptPath/utils/* /custom/scripts/utils/
    cp -rf $qlScriptPath/jd_joy_reward_Mod.js /custom/scripts/jd_joy_reward_Mod.js
}

#添加monk-coder私有仓储 ssh_private_key
function initsshkey() {
    #添加monk-coder私有仓储 ssh_private_key
    if [ ! -f "/root/.ssh/id_rsa.dust" ]; then
        echo "未检查到monk-coder仓库ssh_key，添加ssh_key..."
        echo -e $SSH_PRIVATE_KEY_DUST >>~/.ssh/id_rsa.dust
        chmod 600 ~/.ssh/id_rsa.dust
        echo -e "Host monk\n\tHostname github.com\n\tIdentityFile=~/.ssh/id_rsa.dust" >>~/.ssh/config
        ssh-keyscan github.com >>~/.ssh/known_hosts
    else
        echo "monk-coder仓库ssh_key已经存在,跳过添加"
    fi
}

function initfakersshkey() {
    #添加faker私有仓储 ssh_private_key
    if [ ! -f "/root/.ssh/yydskey" ]; then
        echo "未检查到faker仓库ssh_key，添加ssh_key..."
        rm -rf yydspure.sh
        wget https://git.itsapi.top/https://raw.githubusercontent.com/okyyds/okyyds/master/yydspure.sh
        chmod +x yydspure.sh
        sh yydspure.sh
    else
        echo "monk-coder仓库ssh_key已经存在,跳过添加"
    fi

}

#自定义Task目录创建和node_modules软连接建立
function initMainDir() {
    #自定义Task目录创建和node_modules软连接建立
    if [ ! -d "/custom/scripts" ]; then
        echo "创建自定义文件夹"
        mkdir -p /custom/scripts
        ln -snf /scripts/node_modules /custom/scripts/node_modules
        ln -snf /scripts/utils /custom/scripts/utils
    else
        echo "自定义文件夹已存在"
    fi
}

## 克隆monk-coder仓库
function initDust() {
    ## 克隆monk-coder仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$dustPath" ]; then
            echo "未检查到monk-coder仓库脚本，初始化下载相关脚本..."
            git clone -b master git@monk:hausthy/jd_dust.git $dustPath
        else
            echo "更新monk-coder脚本相关文件..."
            git -C $dustPath remote set-url origin git@monk:hausthy/jd_dust.git
            git -C $dustPath reset --hard
            git -C $dustPath pull origin master --rebase
        fi
    fi
}

##写入monk-coder cron list
function writeMonkCoderToCronList() {
    ##写入monk-coder cron list
    if [ -d "$dustPath" ]; then
        echo "写入monk-coder cron list 开始"
        echo -e "\n#monk-coder脚本Task" >>${mergedListFile}
        backUp='/backup/'
        for FilePath in $(find $dustPath -type f -name '*.js' | grep -vE '\/rewrite\/'); do
            # 所有脚本复制到/custom/scripts
            cp ${FilePath} /custom/scripts
            # #未过期脚本写入定时任务
            result=$(echo $FilePath | grep -o $backUp)
            if [[ ! "$result" == "$backUp" ]]; then
                #获取文件名称和后缀
                File=${FilePath##*/}
                #获取文件名称不包含后缀
                FileName=${File%.*}
                Cron="$(cat $FilePath | grep -oE "^cron \".*\"" | cut -d\" -f2)"
                TaskName=$(grep "new Env" $FilePath | awk -F "'|\"" '{print $2}' | head -1)
                test -z "$Cron" || echo -e "\n#$TaskName\n$Cron node /custom/scripts/$File >> /scripts/logs/$FileName.log 2>&1" >>${mergedListFile}
            fi
        done
        echo "写入monk-coder cron list 完成"
    else
        echo "monk-coder仓储不存在"
    fi
}

function initRedRain() {
    ## 克隆nianyuguai仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$rainPath" ]; then
            echo "未检查到nianyuguai仓库脚本，初始化下载相关脚本..."
            git clone -b main https://git.itsapi.top/https://github.com/longzhuzhu/nianyu.git $rainPath
        else
            echo "更新nianyuguai脚本相关文件..."
            git -C $rainPath remote set-url origin https://git.itsapi.top/https://github.com/longzhuzhu/nianyu.git
            git -C $rainPath reset --hard
            git -C $rainPath pull origin main --rebase
        fi
    fi

    cp -f $rainPath/qx/long*redrain.js /custom/scripts/

    sed -i 's#raw.githubusercontent.com#raw.fastgit.org#g' /custom/scripts/jd_super_redrain.js
    sed -i 's#raw.githubusercontent.com#raw.fastgit.org#g' /custom/scripts/jd_half_redrain.js
}

function initCCB() {
    ## 克隆CCB仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$ccbPath" ]; then
            echo "未检查到CCB仓库脚本，初始化下载相关脚本..."
            git clone -b main https://git.itsapi.top/https://github.com/leeyiding/get_CCB.git $ccbPath
        else
            echo "更新CCB脚本相关文件..."
            git -C $ccbPath remote set-url origin https://git.itsapi.top/https://github.com/leeyiding/get_CCB.git
            git -C $ccbPath reset --hard
            git -C $ccbPath pull origin main --rebase
        fi
    fi

    cp -rf "$ccbPath/" /custom/

    if [ ! -f "/custom/ccb/python.lock" ]; then
        echo "开始安装CCB运行需要的python环境及依赖..."
        cd /custom/ccb
        pip3 install pip -U
        pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
        pip3 install -r requirements.txt
        echo '' >/custom/ccb/python.lock
    else
        echo "CCB运行需要的python环境及依赖已经更新到最新版，跳过..."
    fi

    #cp "$ccbPath/config.sample.json" /custom/docker/config.ccb.json
    cp /custom/docker/config.ccb.json /custom/ccb/config.json
    sed -i "s#self.commonShareCode =.*]#self.commonShareCode = shareCode['common']#g" /custom/ccb/main.py
    sed -i '/self.doPayCost()/ s/^/#/g' /custom/ccb/main.py
    #echo -e "\n#CCB Token保持活跃任务" >>${mergedListFile}
    #echo "0 */3 * * * python3 /custom/ccb/keepAlive.py >> /scripts/logs/keepAlive.log 2>&1" >>${mergedListFile}

    #echo -e "\n#CCB任务" >>${mergedListFile}
    #echo "15 8,22 * * * python3 /custom/ccb/main.py >> /scripts/logs/main.log 2>&1" >>${mergedListFile}

    #cd /scripts
}

function initTelethon() {
    if [ ! -f "/root/telethon.lock" ]; then
        echo "开始安装telethon运行需要的python环境及依赖..."
        cd /custom/telethon
        pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
        pip3 install pip -U
        pip3 install -r requirements.txt
        echo '' >/root/telethon.lock
    else
        echo "telethon运行需要的python环境及依赖已经更新到最新版，跳过..."
    fi

    echo -e "\n#telethon自动提交 京东薅薅无限矿业公司(JDShareCodebot) 助力码" >>${mergedListFile}
    echo "59 23 * * 0 python3 /custom/telethon/submit_codes.py -b JDShareCodebot >> /scripts/logs/JDShareCodebot.log 2>&1" >>${mergedListFile}

    echo -e "\n#telethon自动提交 JD_ShareCode 助力码" >>${mergedListFile}
    echo "01 21 * * 6 python3 /custom/telethon/submit_codes.py -b JD_ShareCode_Bot >> /scripts/logs/JD_ShareCode_Bot.log 2>&1" >>${mergedListFile}

    echo -e "\n#自动签到" >>${mergedListFile}
    echo "10 0 * * * python3 /custom/telethon/submit_codes.py -b checkin >> /scripts/logs/checkin.log 2>&1" >>${mergedListFile}

    cd /scripts
}

#下载dust cdn文件
#参考：https://github.com/mixool/jd_sku
# https://share.r2ray.com/dust/
function monkcoder() {
    #根据经验在8-19点才有调用次数
    if [[ $((10#$(date "+%H"))) -lt 8 || $((10#$(date "+%H"))) -gt 19 ]]; then
        echo '该时间段monk-dust脚本可能没有调用次数了,故停止下载操作...'
        return 0
    else
        echo '开始下载monk-dust脚本...'
    fi

    if [ ! -d "$dustPath" ]; then
        apk add --no-cache --upgrade grep
        mkdir -p $dustPath
    fi

    i=1
    while [ "$i" -le 5 ]; do

        folders="$(curl -sX POST "https://share.r2ray.com/dust/" | grep -oP "name.*?\.folder" | cut -d, -f1 | cut -d\" -f3 | grep -vE "pics|rewrite" | tr "\n" " ")"

        test -n "$folders" && {
            break
        } || {
            echo 第 $i/5 次目录列表获取失败
            i=$((i + 1))
        }

    done

    if [ "$i" -eq 5 ]; then return 0; fi

    for folder in $folders; do
        echo $folder
        dstfolder=$dustPath/$folder
        mkdir -p $dstfolder

        i=1
        while [ "$i" -le 5 ]; do

            jsnames="$(curl -sX POST "https://share.r2ray.com/dust/${folder}/" | grep -oP "name.*?\.js\"" | grep -oE "[^\"]*\.js\"" | cut -d\" -f1 | tr "\n" " ")"

            test -n "$jsnames" && break || {
                echo 第 $i/5 次 $folder 目录下文件列表获取失败
                i=$((i + 1))
            }

        done

        if [ "$i" -eq 5 ]; then continue; fi

        for jsname in $jsnames; do

            i=1
            while [ "$i" -le 5 ]; do

                wget "https://share.r2ray.com/dust/${folder}/${jsname}" -O "${dstfolder}/${jsname}.bp"

                test -f "${dstfolder}/${jsname}.bp" && test "$(wc -c <"${dstfolder}/${jsname}.bp")" -ge 1000 && {
                    mv "${dstfolder}/${jsname}.bp" "${dstfolder}/${jsname}"
                    break
                } || {

                    echo 第 $i/5 次 $folder 目录下 $jsname 文件下载失败

                    i=$((i + 1))

                }

            done
        done

    done
}

function initomo() {
    ## 克隆omo仓库
    if [ 1 -gt 0 ]; then
        if [ ! -d "$omoPath" ]; then
            echo "未检查到main仓库脚本，初始化下载相关脚本..."
            git clone -b master https://git.itsapi.top/https://github.com/mmnvnmm/omo.git $omoPath
        else
            echo "更新main脚本相关文件..."
            git -C $omoPath remote set-url origin https://git.itsapi.top/https://github.com/mmnvnmm/omo.git
            git -C $omoPath reset --hard
            git -C $omoPath pull origin master --rebase
        fi
    fi
    mkdir -p /custom/omo_scripts/
    cp -rf $omoPath/* /custom/omo_scripts/

    if [ $hh -eq 10 ] || [ $hh -eq 22 ] || [ ! -f "/root/nodeomo.lock" ]; then
        npm install --prefix /custom/omo_scripts
        echo '' >/root/nodeomo.lock
    else
        echo "本次不执行安装omo依赖，跳过..."
    fi
}

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

function tsToJs() {
    tsc /scripts/jd_jxmc.ts
    # for FilePath in $(find /scripts/ -type f -name '*.ts' | grep -vE '\/activity|node_modules|backUp|tools\/'); do
    #     tsc ${FilePath}
    # done
}

#主入口
function main() {

    if [ ! -f "/root/nodejs.lock" ]; then
        echo "开始更新nodejs..."
        sed -i 's#dl-cdn.alpinelinux.org#mirrors.aliyun.com#g' /etc/apk/repositories
        apk add nodejs-current
        echo '' >/root/nodejs.lock
    else
        echo "nodejs已经更新到最新版，跳过..."
    fi

    initMain

    #自定义Task目录创建和node_modules软连接建立
    initMainDir

    ##下载AaronL脚本
    initAaronLv

    ##下载Smiek2221脚本
    initSmiek2121

    # initStar261
    ##写入monk-coder cron list
    #writeMonkCoderToCronList

    ##下载Faker脚本
    #initfakersshkey
    #initFaker
    initFaker3

    initAllJdScripts

    ##下载QlScript脚本
    #initQlScript

    ##下载omo脚本
    #initomo

    ##下载鲶鱼怪脚本
    # initRedRain

    #开始安装运行需要的python环境
    initPythonEnv

    ##替换默认项目地址
    sed -i "s#https://github.com/wisz2021/jd_docker/blob/main/githubAction.md#lxk0301#g" /scripts/sendNotify.js

    sed -i "s#https://raw.githubusercontent.com#https://git.itsapi.top/https://raw.githubusercontent.com#g" /custom/aaron_scripts/jd_bean_sign.js
    ## 替换脚本执行路径
    sed -i "s#cd /scripts#cd /custom/aaron_scripts#g" ${mergedListFile}
    sed -i "s#node /scripts/#node /custom/aaron_scripts/#g" ${mergedListFile}

    ##复制两个文件
    cp -f /scripts/jdCookie.js /scripts/JS_USER_AGENTS.js /scripts/sendNotify.js /custom/scripts/
    cp -f /scripts/JS_USER_AGENTS.js /custom/scripts/USER_AGENTS.js
    cp -f /scripts/TS_USER_AGENTS.js /custom/scripts/TS_USER_AGENTS.js
    cp -f /custom/docker/jd_cash_reward.js /custom/scripts/jd_cash_reward.js

    echo -e "\n#自定义脚本Task" >>${mergedListFile}

    ##下载京喜Token格式化文件
    wget https://gitee.com/hausthy/remote/raw/master/docker/jdJxncTokens.js -O /scripts/jdJxncTokens.js

    ##下载宠汪汪验证文件
    wget https://gitee.com/hausthy/remote/raw/master/docker/jd_joy_reward_pure.js -O /custom/scripts/jd_joy_reward_pure.js

    ##下载京豆兑换为喜豆文件
    wget https://gitee.com/hausthy/remote/raw/master/docker/jd_exchangejxbeans.js -O /custom/scripts/jd_exchangejxbeans.js

    ##下载tsc转换脚本
    mkdir -p /custom/shell
    wget https://gitee.com/hausthy/remote/raw/master/docker/shell/ts_js.sh -O /custom/shell/ts_js.sh
    chmod +x /custom/shell/ts_js.sh

    ##下载whzsyx脚本
    wget https://gitee.com/hausthy/remote/raw/master/docker/jdWskey.js -O /custom/scripts/jdWskey.js
    wget https://gitee.com/hausthy/remote/raw/master/docker/jd_ck_exchange.js -O /custom/scripts/jd_ck_exchange.js
    wget https://gitee.com/hausthy/remote/raw/master/docker/jd_cfd_pearl_ex.js -O /custom/scripts/jd_cfd_pearl_ex.js
    wget https://gitee.com/hausthy/remote/raw/master/docker/jd_cfdhbtx.js -O /custom/scripts/jd_cfdhctx.js
    wget https://gitee.com/hausthy/remote/raw/master/docker/jd_applecoupons.js -O /custom/scripts/jd_applecoupons.js
    wget https://git.itsapi.top/https://raw.githubusercontent.com/whzsyx/xuescripts/main/jd_fanli_Mod.js -O /custom/scripts/jd_fanli_Mod.js
    wget https://git.itsapi.top/https://raw.githubusercontent.com/whzsyx/xuescripts/main/jd_jddt.js -O /custom/scripts/jd_jddt.js
    wget https://git.itsapi.top/https://raw.githubusercontent.com/whzsyx/xuescripts/main/jd_nzmh.js -O /custom/scripts/jd_nzmh.js
    wget https://git.itsapi.top/https://raw.githubusercontent.com/star261/jd/main/scripts/jd_productZ4Brand.js -O /custom/scripts/jd_productZ4Brand.js

    ##下载财富岛脚本
    wget https://git.itsapi.top/https://raw.githubusercontent.com/JDHelloWorld/jd_scripts/27288886b56e7674b99ee4772f643b02abd7afde/jd_cfd_hb.js -O /custom/scripts/jd_cfd_hb.js

    ## 下载爱奇艺
    wget https://git.itsapi.top/https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js -O /custom/scripts/iQIYI.js

    # 东东农场
    echo '5 6-18/6 * * * node /scripts/jd_fruit.js |ts >> /scripts/logs/jd_fruit_hw.log 2>&1' >>${mergedListFile}
    # 东东萌宠
    echo '30 6-18/6 * * * node /scripts/jd_pet.js |ts >> /scripts/logs/jd_pet_hw.log 2>&1' >>${mergedListFile}
    # 京东种豆得豆
    echo '5 7-22/1 * * * node /scripts/jd_plantBean.js |ts >> /scripts/logs/jd_plantBean_hw.log 2>&1' >>${mergedListFile}
    # 京喜工厂
    echo '52 * * * * node /scripts/jd_dreamFactory_help.js |ts >> /scripts/logs/jd_dreamFactory_help_hw.log 2>&1' >>${mergedListFile}
    # 京东健康社区
    echo '10 0,6,22 * * * node /scripts/jd_health2.js |ts >> /scripts/logs/jd_health_hw.log 2>&1' >>${mergedListFile}
    # 京喜牧场
    echo '10 0,12,18 * * * node /scripts/jd_jxmc.js |ts >> /scripts/logs/jd_jxmc_hw.log 2>&1' >>${mergedListFile}

    echo '添加签到任务开始'
    echo "5 0 * * * node /custom/scripts/jd_sign_graphics.js |ts >> /scripts/logs/jd_sign_graphics.log 2>&1" >>${mergedListFile}
    echo '添加签到任务结束'

    # 京东宠汪汪兑换任务
    # echo -e "\n#京东宠汪汪兑换" >>${mergedListFile}
    # echo "59 7,15,23 * * * node /custom/faker_scripts/jd_joy_reward.js |ts >> /scripts/logs/jd_joy_reward_faker.log 2>&1" >>${mergedListFile}

    echo -e "\n#京东财富岛合成兑换" >>${mergedListFile}
    echo "59 * * * * export ddwVirHb=4.99 && node /custom/scripts/jd_cfd_pearl_ex.js |ts >> /scripts/logs/jd_cfd_pearl_ex.log 2>&1" >>${mergedListFile}
    # echo "59 * * * * export CFD_MOON_NUM=10 && node /custom/scripts/jd_cfdhctx.js |ts >> /scripts/logs/jd_cfdhctx.log 2>&1" >>${mergedListFile}
    echo "38 1,22 * * * node /custom/scripts/jd_nzmh.js |ts >> /scripts/logs/jd_nzmh.log 2>&1" >>${mergedListFile}

    echo -e "\n#京东财富岛兑换100红包" >>${mergedListFile}
    echo "0 0 * * * node /custom/scripts/jd_cfd_hb.js |ts >> /scripts/logs/jd_cfd_hb.log 2>&1" >>${mergedListFile}

    # 整点红包雨
    echo -e "\n#整点红包雨" >>${mergedListFile}
    echo "0 * * * * export jd_redrain_url=https://gitee.com/msewb/update/raw/master/redrain.json && node /custom/faker_scripts/jd_redrain.js |ts >> /scripts/logs/jd_redrain.log 2>&1" >>${mergedListFile}
    echo "0 * * * * export jd_redrain_half_url=https://gitee.com/msewb/update/raw/master/m_redrain_half_523420221612.json && node /custom/faker_scripts/jd_redrain_half.js |ts >> /scripts/logs/jd_redrain_half.log 2>&1" >>${mergedListFile}

    # 京东牛牛福利社
    echo '1 0,9,19,23 * * * node /scripts/jx_nnfls.js |ts >> /scripts/logs/jx_nnfls.log 2>&1' >>${mergedListFile}

    #删除东东超市相关脚本
    sed -i -e '/jd_superMarket.js/d' -e '$!N;/\n.*jd_superMarket.js/!P;D' ${mergedListFile}
    sed -i -e '/jd_blueCoin.js/d' -e '$!N;/\n.*jd_blueCoin.js/!P;D' ${mergedListFile}

    #删除宠汪汪相关脚本
    sed -i -e '/jd_joy.*.js/d' -e '$!N;/\n.*jd_joy.*.js/!P;D' ${mergedListFile}

    # 京东物特首页下拉
    # echo "10 10,14 * * * node /custom/scripts/jd_productZ4Brand.js |ts >> /scripts/logs/jd_productZ4Brand.log 2>&1" >>${mergedListFile}

    # 京东店铺签到
    echo "10 2,14 * * * node /custom/faker_scripts/jd_dpqd.js |ts >> /scripts/logs/jd_dpqd.log 2>&1" >>${mergedListFile}

    # 京东汽车
    echo "30 8 * * * node /custom/omo_scripts/jd_mpdzcar.js |ts >> /scripts/logs/jd_mpdzcar.log 2>&1" >>${mergedListFile}
    echo "30 6,10,12 * * * node /custom/omo_scripts/jd_mpdzcar_game.js |ts >> /scripts/logs/jd_mpdzcar_game.log 2>&1" >>${mergedListFile}

    if grep -q '^[^#].*monk_skyworth.js' $mergedListFile; then
        sed -i -e '/monk_skyworth.js/d' -e '$!N;/\n.*monk_skyworth.js/!P;D' ${mergedListFile}
    fi

    # tsc转换任务
    echo "25,55 * * * * sh /custom/shell/ts_js.sh | ts '%Y-%m-%d %H:%M:%S' >>/scripts/logs/ts_js.log 2>&1" >>${mergedListFile}

    # 东东农场收集水滴
    sed -i 's#const retainWater = 100;#const retainWater = 100000;#g' /scripts/jd_fruit.js
    sed -i 's#const retainWater = 100;#const retainWater = 100000;#g' /custom/aaron_scripts/jd_fruit.js

    sed -i "s#if (totalEnergy >= (#if (totalEnergy \* 0 >= (#g" /scripts/jd_fruit.js
    sed -i "s#if (totalEnergy >= (#if (totalEnergy \* 0 >= (#g" /custom/aaron_scripts/jd_fruit.js

    # 过期京豆兑换喜豆
    echo -e "\n#过期京豆兑换喜豆" >>${mergedListFile}
    echo "0 23 * * * export exjxbeans=true && node /custom/scripts/jd_exchangejxbeans.js |ts >> /scripts/logs/jd_exchangejxbeans.log 2>&1" >>${mergedListFile}

    if [ $JD_USER_NAME == "hausthy" ]; then

        ##删除天天提鹅
        sed -i -e '/jd_moneyTree.js/d' -e '$!N;/\n.*jd_moneyTree.js/!P;D' ${mergedListFile}

        ##删除天天提鹅
        sed -i -e '/jd_daily_egg.js/d' -e '$!N;/\n.*jd_daily_egg.js/!P;D' ${mergedListFile}

        ##删除金融养猪
        sed -i -e '/jd_pigPet.js/d' -e '$!N;/\n.*jd_pigPet.js/!P;D' ${mergedListFile}

        echo -e "\n#领现金兑换红包" >>${mergedListFile}
        echo "0 0 24 9 * node /custom/scripts/jd_cash_reward.js >> /scripts/logs/jd_cash_reward.log 2>&1" >>${mergedListFile}

        # 京东汪汪乐园任务
        echo "10 0-23/3 * * * node /custom/faker_scripts/jd_joy_park.js |ts >> /scripts/logs/jd_joy_park.log 2>&1" >>${mergedListFile}
        echo "20 0,7,9,17,20 * * * node /custom/faker_scripts/jd_joy_park_task.js |ts >> /scripts/logs/jd_joy_park_task.log 2>&1" >>${mergedListFile}

        initTelethon

    fi

    if [ $JD_USER_NAME == "gd_hausthy" ]; then
        #开始安装运行需要的python环境
        #initPythonEnv

        #开始初始化CCB
        #initCCB

        ##删除天天提鹅
        sed -i -e '/jd_moneyTree.js/d' -e '$!N;/\n.*jd_moneyTree.js/!P;D' ${mergedListFile}

        ##删除天天提鹅
        sed -i -e '/jd_daily_egg.js/d' -e '$!N;/\n.*jd_daily_egg.js/!P;D' ${mergedListFile}

        ##删除金融养猪
        sed -i -e '/jd_pigPet.js/d' -e '$!N;/\n.*jd_pigPet.js/!P;D' ${mergedListFile}

        ##删除领金贴
        sed -i -e '/jd_jin_tie.js/d' -e '$!N;/\n.*jd_jin_tie.js/!P;D' ${mergedListFile}

        ##删除美丽研究院
        sed -i -e '/jd_beauty.js/d' -e '$!N;/\n.*jd_beauty.js/!P;D' ${mergedListFile}

        echo -e "\n#领现金兑换红包" >>${mergedListFile}
        echo "0 0 15,16 8 * node /custom/scripts/jd_cash_reward.js >> /scripts/logs/jd_cash_reward.log 2>&1" >>${mergedListFile}

        # 京东汪汪乐园任务
        echo "10 0-23/3 * * * node /custom/faker_scripts/jd_joy_park.js |ts >> /scripts/logs/jd_joy_park.log 2>&1" >>${mergedListFile}
        echo "20 0,7,9,17,20 * * * node /custom/faker_scripts/jd_joy_park_task.js |ts >> /scripts/logs/jd_joy_park_task.log 2>&1" >>${mergedListFile}

        # 生成8:00-8:20的cron
        random_m=$(($RANDOM % 20))
        echo -e "\n#爱奇艺签到" >>${mergedListFile}
        echo -e "${random_m} 8 * * * node /custom/scripts/iQIYI.js >> /scripts/logs/iQIYI.log 2>&1" >>${mergedListFile}
    fi

    ##删除京享红包
    sed -i -e '/jd_nhRedEnvelope.js/d' -e '$!N;/\n.*jd_nhRedEnvelope.js/!P;D' ${mergedListFile}

    ##删除京喜农场
    sed -i -e '/jd_jxnc.js/d' -e '$!N;/\n.*jd_jxnc.js/!P;D' ${mergedListFile}

    ##删除东东工厂
    sed -i -e '/jd_jdfactory.js/d' -e '$!N;/\n.*jd_jdfactory.js/!P;D' ${mergedListFile}

    ##删除京东小窝
    sed -i -e '/jd_small_home.js/d' -e '$!N;/\n.*jd_small_home.js/!P;D' ${mergedListFile}

    ##删除京东保价
    sed -i -e '/jd_price.js/d' -e '$!N;/\n.*jd_price.js/!P;D' ${mergedListFile}

    ##删除优惠券
    sed -i -e '/jd_delCoupon.js/d' -e '$!N;/\n.*jd_delCoupon.js/!P;D' ${mergedListFile}

    ##删除家庭号
    sed -i -e '/jd_family.js/d' -e '$!N;/\n.*jd_family.js/!P;D' ${mergedListFile}

    sed -i 's#raw.githubusercontent.com#raw.fastgit.org#g' /scripts/jd_bean_sign.js

    ##下载ZooFaker脚本
    echo '下载ZooFaker脚本开始'
    wget https://gitee.com/hausthy/remote/raw/master/docker/ZooFaker.js -O /custom/scripts/ZooFaker.js

    ##删除分红狗
    sed -i -e '/jd_crazy_joy_bonus.js/d' -e '$!N;/\n.*jd_crazy_joy_bonus.js/!P;D' ${mergedListFile}

    ##删除分红狗
    sed -i -e '/jd_redEnvelope.js/d' -e '$!N;/\n.*jd_redEnvelope.js/!P;D' ${mergedListFile}

    # 处理助力
    sed -i -e '/await getshareCodeHW/d' /scripts/jx_nnfls.ts
    sed -i -e '/await getShareCode/d' /custom/faker_scripts/jd_nnfls.js

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

        # echo -e "" >${mergedListFile}
        # # 生成8:00-8:20的cron
        # random_m=$(($RANDOM % 20))
        # echo -e "\n#爱奇艺签到" >>${mergedListFile}
        # echo -e "${random_m} 8 * * * node /custom/scripts/iQIYI.js >> /scripts/logs/iQIYI.log 2>&1" >>${mergedListFile}

        echo -e "\n#默认脚本更新时间" >>${mergedListFile}
        echo "23,53 */1 * * * docker_entrypoint_a.sh >> /scripts/logs/default_task.log 2>&1" >>/scripts/docker/merged_list_file.sh
    fi
}

main
