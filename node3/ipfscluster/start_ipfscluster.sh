#!/bin/sh
#
#存放PID的文件,多个自启动文件名不能重复
PIDFILE=/var/run/autoipfscluster.pid
 
case "$1" in
    start)
        if [ -f $PIDFILE ]
        then
                echo "$PIDFILE exists, process is already running or crashed"
        else
                echo "Starting server..."
                #这里输入要执行的后台命令
                nohup /usr/bin/ipfs-cluster-service daemon --bootstrap /ip4/192.168.122.87/tcp/9096/ipfs/QmT2xbkDZQx56sv5vjg995XdCeCkykV1bQdUX5zK9puDvQ > /dev/null 2>&1 & echo $! > $PIDFILE
        fi
        ;;
    stop)
        if [ ! -f $PIDFILE ]
        then
                echo "$PIDFILE does not exist, process is not running"
        else
                PID=$(cat $PIDFILE)
                echo "Server Stopping ..."
                kill -9 ${PID}
                rm $PIDFILE
                echo "Server stopped"
        fi
        ;;
    *)
        echo "Please use start or stop as first argument"
        ;;
esac
