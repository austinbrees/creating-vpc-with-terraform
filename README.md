# creating-vpc-with-terraform: a learning journey

Hey there! Welcome to my project on creating a VPC on Google Cloud using Terraform. This isn't your usual step-by-step guide. It's more like an adventure into Infrastructure as Code (IaC) and cloud automation. So buckle up, and let's go!

## Why? 

For class we had to recreate the below diagram from the Multiple VPC Networks Cloud skills boost lab. After finishing a Terraform lab, we were curious - could we apply the same principles to our class assignment?

![Alt Text](https://cdn.qwiklabs.com/OBtRY37ZCmWiHi%2FHsG8XCSGDBfsuKk3IMJVgQscsg2E%3D)


## What's the Deal Here?

Using Terraform, we're going to:

- Whip up a VPC network on Google Cloud.
- Make three subnets in three different regions within that VPC.
- Set a firewall rule that allows ICMP, SSH, and RDP protocols within our VPC.

## Before We Start

Here's what you need to join in on the fun:

- A Google Cloud Platform account and a project with billing enabled.
- Terraform now comes 

## Lessons and Upgrades

### Things I Picked Up

1. **Terraform Rocks!**: I've discovered that Terraform is like a magic wand for deploying a bunch of resources in Google Cloud. It's cool how you can create and manage an entire VPC environment with just a few lines of code!

2. **Cloud Foundation Toolkit is Handy**: The [Cloud Foundation Toolkit](https://cloud.google.com/docs/terraform/blueprints/terraform-blueprints) was a lifesaver for this project. It's filled with Terraform templates that are great starters for many Google Cloud deployments.

### Stuff to Remember

1. **Don't Forget to Save in Cloud Editor**: One hard lesson was that you have to remember you are not using your personal editor in the cloud, this means all your features like auto-save are turned off. I learned this the hard way and can lead to a real bummer when you lose all your work if you forget to save and google deletes the temorary session. So remember to hit that save button!

2. **Hardcoded Values**: Now, this project's current code has a bunch of hardcoded values. It was a quick fix because of some issues with the variables.tf and output.tf files. But I know it's not the way to go. The goal is to have values parameterized to make the code reusable and flexible.

3. **There's Room for More**: This project was my first deep dive into Terraform, but I know there's so much more to learn and improve. As I get better with Terraform, I'm definitely coming back to this code to refine it and make it shine with best Terraform practices.

## Let's Roll!

1. Clone this repository to your cloud shell using `git clone https://github.com/austinbrees/automatic-vpc-with-terraform`.

2. Navigate into the main directory of the cloned repository.

3. Update the `variables.tf` file with your Google Cloud Project ID and your chosen region and zone. In the current state you will have to update all your project variables throught the project but hopefully in version 2 that will be fixed.

4. Initialize your Terraform workspace, which will download the provider and initialize it with the values provided in the `variables.tf` file by running `terraform init`.

5. Create a plan and apply it to your workspace. Run `terraform apply` and say 'yes' when asked if you want to create the proposed infrastructure.

6. Terraform will now do its magic and create your infrastructure. Once it's done, you'll see a message confirming that your resources are up and ready!

7. When you're done exploring, you can take down the created infrastructure using `terraform destroy`.

## Wrapping Up

Through this project, we've witnessed the power of Terraform in automating the creation of a VPC on Google Cloud. We've also hit some bumps on the road and learned how to navigate around them. 




