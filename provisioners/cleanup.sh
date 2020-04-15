# 仮想ハードディスクをゼロで埋める
dd if=/dev/zero of=/EMPTY bs=1M
# ゼロで埋まったファイルを削除(フラグメンテーションの問題を解決)
rm -f /EMPTY
# ファイル削除の前に、Packerが処理を終了しないようにさせる
sync
