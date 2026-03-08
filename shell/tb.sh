#!/bin/bash

BASE_DIR="$HOME/Desktop/TeamBenSDK/tb-dev-shell"

COMMAND=$1

show_help() {
    echo ""
    echo "TB Dev Shell CLI"
    echo "=============================="
    echo ""
    echo "Usage:"
    echo "  tb <command>"
    echo ""
    echo "Commands:"
    echo ""
    echo "Development"
    echo "  fresh          Run laravel migrate:fresh --seed"
    echo "  migrate        Run laravel migrate"
    echo "  serve         Start laravel server"
    echo "  tinker        Open laravel tinker"
    echo "  cache-clear   Clear laravel cache"
    echo ""
    echo "Node"
    echo "  dev           Run npm run dev"
    echo "  build         Run npm run build"
    echo "  install      Run npm install"
    echo ""
    echo "Git"
    echo "  gs            git status"
    echo "  gp            git push"
    echo "  gl            git pull"
    echo "  gc <msg>      git commit -m <message>"
    echo "  gco <branch>  git checkout <branch>"
    echo ""
    echo "System"
    echo "  update        Update TB Dev Shell"
    echo "  help          Show this help catalog"
    echo ""
    echo "=============================="
    echo ""
}

case $COMMAND in

fresh)
    php artisan migrate:fresh --seed
;;

migrate)
    php artisan migrate
;;

serve)
    php artisan serve
;;

tinker)
    php artisan tinker
;;

cache-clear)
    php artisan optimize:clear
;;

dev)
    npm run dev
;;

build)
    npm run build
;;

install)
    npm install
;;

gs)
    git status
;;

gp)
    git push
;;

gl)
    git pull
;;

gc)
    git commit -m "$2"
;;

gco)
    git checkout "$2"
;;

update)
    cd "$BASE_DIR" && git pull --quiet
;;

help|*)
    show_help
;;

esac