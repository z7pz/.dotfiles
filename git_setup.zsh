printf "Fullname: "
read full_name

printf "Email: "
read email

git config --global user.email "$email"
git config --global user.name "$full_name"

echo "Name and email had been set!"