#################
# Quorum Things #
#################

alias quorumrc="nvim ~/dotfiles/zsh/quorum_rc.zsh"

start_quorum() {
    cd ~/Code/Quorum
    source bin/activate
    cd quorum-site
    lolcat ~/dotfiles/misc/quorum.txt
    npm-exec
}
alias qtmux="tmuxinator start quorum"
alias qq="start_quorum"

# function to start a branch off master
qhotfix() {
    git pull origin master
    git checkout -b hotfix/$1 master
}

sp() {
    python manage.py shell_plus --run_local
}
p_sp() {
    python manage.py shell_plus --use_prod_db --run_local
}
serve() {
    while true; do
        echo "Oops - Restarting django server" | cowsay | lolcat
        python manage.py runserver --run_local $1
        sleep 1
    done
}
p_serve() {
    while true; do
        echo "Oops - Restarting Production django server" | cowsay | lolcat
        python manage.py runserver --run_local --use_prod_db $1
        sleep 1
    done
}

# parser
parse(){
    find . -name "*pyc" -delete;
    python manage.py parse $1 --run_local;
}
pdb_parse(){
    find . -name "*pyc" -delete;
    red "#######################################";
    red "# WARNING - Using Production Database #";
    red "#######################################";
    python manage.py parse $1 --use_prod_db --run_local;
}

# making migrations
makemigrations () {
    python manage.py makemigrations $1 --run_local;
}
migrate(){
    python manage.py migrate $1 --run_local;
}
migrate_fake(){
    python manage.py migrate $1 --fake;
}
initial_migrations() {
    green "* Making Fake Migrations *";
    makemigrations $1;
    migrate_fake $1;
    green "* Finshed Making Fake Migrations *";
}
full_migrate() {
    red "* Making Real Migrations *";
    makemigrations $1;
    migrate $1;
    green "* Finshed Making Real Migrations *";
}
sql_migrate() {
    python manage.py sqlmigrate $1 $2 --run_local;
}
full_sql_migrate() {
    makemigrations $1;
    sql_migrate $1 $2;
}

clear_migrations(){
    red "* Deleting migrations *";
    find . -name "*pyc" -delete;
    find . -name "migrations" -type d -exec rm -rf "{}" \;
    green "* Making API migrations *";
    initial_migrations api;
    green "* Initial Migrations Finished *";
}

# for deleteing defunct / zombies
kill_zombies() {
    green "### You are now killing python zombies";
    for pid in $(ps -ef | awk '/defunct/ { print $3 }'); do
        kill "$pid";
    done;
    red "### Success: Zombies vanquished";
}

# wipe out swap files
ls_swp() {
    find . -name *swp
}

rm_swp() {
    find . -name *swp -delete;
}

