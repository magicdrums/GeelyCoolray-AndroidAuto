#!/system/bin/sh
# GeelyCoolray-AndroidAuto — script de instalación automática de APKs
# Copyright (C) 2023 Victor Pereira Barahona
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

export PATH=/sbin:/system/sbin:/system/xbin:/system/bin
#Mount /system to overwrite
mount -o remount,rw /system /system

#Install apks
pm install -rtdg /mnt/udisk2/headunitrevived300.apk
pm install -rtdg /mnt/udisk2/WifiManager.apk
pm install -rtdg /mnt/udisk2/AutoKit.apk
pm install -rtdg /mnt/udisk2/BackButton.apk
pm install -rtdg /mnt/udisk2/homebutton.apk
pm install -rtdg /mnt/udisk2/droidinfo.apk

#End with reboot
sync
#sleep 10
reboot
