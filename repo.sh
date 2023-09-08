git config --global user.name "<Your Name>"
git config --global user.email "<Your Email>"
echo "Enter reponame"
read reponame
mkdir ${reponame}
cd "$(echo $reponame)"
x=`echo "$reponame" | tr -s ' '`
final=`echo "$x" | tr " " -`
echo "Enter (true) for public or (false) for private"
read scope
public_token="<Your_public_token>"
username="<Your_Github_Username>"
curl -i -H "Authorization: token $public_token" -d '{"name": "'$final'","public": "'$scope'"}' https://api.github.com/user/repos
git init
git checkout -b main
echo "Enter commit message for README.md"
read msg
touch README.md
echo "Starter Message" >> README.md
git add README.md
git commit -m "$(echo $msg)"
git remote add origin https://github.com/$username/$final.git
echo -n "$public_token" | xclip -selection clipboard
echo -e  "\nYour username is :  $username"
echo -e  "\nFor password press ctrl+V and then enter\n"
git push origin main
wslview "https://github.com/$(echo $username)/$(echo $final)"