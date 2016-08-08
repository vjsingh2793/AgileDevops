echo "Preparing System"
echo "Installing Vagrant"
sudo dpkg -i vagrant_1.8.5_x86_64.deb
echo "Installing the  AWS-Plugin"
vagrant plugin install vagrant-aws
echo "Please provide AWS related detail"
echo -n "Enter the AWS Access key"
read AWS_ACCESS_KEY
echo -n "Enter the AWS secret key"
read AWS_SECRET_KEY
export AWS_ACCESS_KEY
export AWS_SECRET_KEY
