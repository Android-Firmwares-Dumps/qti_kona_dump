#! /system/bin/sh

option="$1"

function copyDcsOlog() {
    timeStamp=`date "+%Y_%m_%d_%H_%M_%S"`
    fieldNum=`cat /proc/sys/kernel/random/uuid`
    otaVersion=`getprop ro.build.version.ota`
    dcsZipName="/data/persist_log/DCS/de/olog/olog@"${fieldNum:0-12:12}@${otaVersion}@${timeStamp}".zip"
    cp -f /data/olog/dcs_temp ${dcsZipName}
    chmod 0777 ${dcsZipName}
    chown system:system ${dcsZipName}
}

case "$option" in
    "copyDcsOlog")
        copyDcsOlog
        ;;
    *)
        ;;
esac
