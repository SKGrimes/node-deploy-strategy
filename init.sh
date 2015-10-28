#!/bin/sh

# ################################################################################### #
#                                                                                     #
#  Provision out an Ubuntu Box                                                        #
#                                                                                     #
# ################################################################################### #
#
# one dot to include, one for relative path
#
# . ./utilities/consoleLog.sh   # simple hello world
# . ./utilities/detect.sh       # detect package manager with pacapt
#
# Init
# $ wget -qO- https://raw.github.com/appleboy/Shell-Script/master/init.sh | sh
# =================================================================================== #
#          Define system specific details in this section                             #
# =================================================================================== #


# return pacapt


# Build Profile
# --------------------------------------------------
#   * Update and Upgrade
#


apt-get update && apt-get dist-upgrade

 ln -s /usr/bin/nodejs /usr/bin/node




