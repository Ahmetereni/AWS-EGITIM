# # STEP 1: Connect to your EC2 Ubuntu instance
# ssh -i /path/to/your-key.pem ubuntu@<your-ec2-public-ip>

# STEP 2: Update and install NGINX
sudo apt update
sudo apt install -y nginx

# STEP 3: Start and enable NGINX
sudo systemctl start nginx
sudo systemctl enable nginx

cd /var/www/html/
sudo git init
sudo git pull https://github.com/Ahmetereni/AWS-EGITIM.git
sudo rm index.nginx-debian.html
sudo systemctl restart nginx.service


sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --nginx

# # # STEP 4: Upload your HTML file from your local machine
# # # Run this on your local terminal (not inside EC2)
# # scp -i /path/to/your-key.pem index.html ubuntu@<your-ec2-public-ip>:/home/ubuntu/

# # STEP 5: Move the HTML file to NGINX's web directory
# sudo mv /home/ubuntu/index.html /var/www/html/index.html

# # STEP 6: (Optional) Upload additional assets (CSS, JS, images) and move them too
# # From local machine:
# scp -i /path/to/your-key.pem script.js style.css ubuntu@<your-ec2-public-ip>:/home/ubuntu/

# # On EC2:
# sudo mv /home/ubuntu/*.js /home/ubuntu/*.css /var/www/html/

# # STEP 7: Visit your site in browser
# # Open: http://<your-ec2-public-ip>

# # NGINX will serve your updated index.html page!
