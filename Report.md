𝑫𝒆𝒗𝑶𝒑𝒔 𝑷𝒊𝒑𝒆𝒍𝒊𝒏𝒆 𝑹𝒆𝒑𝒐𝒓𝒕

1. 𝑨𝒓𝒄𝒉𝒊𝒕𝒆𝒄𝒕𝒖𝒓𝒆 𝑫𝒊𝒂𝒈𝒓𝒂𝒎
   <img width="1308" height="677" alt="image" src="https://github.com/user-attachments/assets/1f068804-5331-4854-a2b9-a5312caed103" />

2. 𝑩𝒓𝒂𝒏𝒄𝒉𝒊𝒏𝒈 𝑺𝒕𝒓𝒂𝒕𝒆𝒈𝒚
   
      - main – Production-ready code; protected branch
      - develop – Integration branch for features and fixes
      - PRs are required for merging changes from develop → main
       <img width="1887" height="900" alt="image" src="https://github.com/user-attachments/assets/33fb7666-6f91-4427-8bdf-14911f55dfb9" />
       
3. 𝑻𝒆𝒓𝒓𝒂𝒇𝒐𝒓𝒎 𝑹𝒆𝒔𝒐𝒖𝒓𝒄𝒆 𝑺𝒖𝒎𝒎𝒂𝒓𝒚
   
      Resources provisioned using Terraform:
      - VPC – Custom VPC with public subnet
      - Subnet – Single public subnet
      - EC2 Instance – t2.micro instance with Elastic IP
      - Security Groups – Allow SSH (22) and HTTP (80)
      - Internet Gateway – For public access
      <img width="1080" height="568" alt="image" src="https://github.com/user-attachments/assets/1adcde99-2a8a-402a-972b-cdde68f30649" />
      <img width="434" height="890" alt="image" src="https://github.com/user-attachments/assets/266b8569-815b-4ac2-ae64-86b85c8e8de7" />

4. 𝑱𝒆𝒏𝒌𝒊𝒏𝒔 𝑷𝒊𝒑𝒆𝒍𝒊𝒏𝒆 𝑺𝒕𝒂𝒈𝒆𝒔

  Jenkins executes the following stages defined in Jenkinsfile:
  <img width="1577" height="303" alt="image" src="https://github.com/user-attachments/assets/204008d0-81dc-4d49-a3e3-60966e3932f6" />
  <img width="1434" height="843" alt="image" src="https://github.com/user-attachments/assets/57724e09-2338-4e3c-b7e4-16be58879dd9" />
  <img width="1399" height="810" alt="image" src="https://github.com/user-attachments/assets/b6882002-8ec1-42cf-b553-58e35e63a3d5" />
  
5.𝑶𝒖𝒕𝒄𝒐𝒎𝒆

  Successfully deployed a containerized Node.js app using an automated DevOps pipeline.
  <img width="1076" height="518" alt="image" src="https://github.com/user-attachments/assets/fb3ca91a-2dff-4630-9ef0-640600f77124" />

