git config --global user.name "Your name"
git config --global user.email "Your email"
echo "Enter reponame"
read reponame
mkdir ${reponame}
cd "$(echo $reponame)"
x=`echo "$reponame" | tr -s ' '`
final=`echo "$x" | tr " " -`
curl -i -H "Authorization: token your-access-token" -d '{"name": "'$final'","private": false}' https://api.github.com/user/repos
git init
git checkout -b main
echo "Enter commit message for README.md"
read msg
touch README.md
git add README.md
git commit -m "$(echo $msg)"
git remote add origin https://github.com/username/$final.git
echo "paste access token as password:- your-access-token"
git push origin main
