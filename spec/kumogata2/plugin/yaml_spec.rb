require "spec_helper"
require "yaml"

describe Kumogata2::Plugin::YAML do
  before do
    @plugin = Kumogata2::Plugin::YAML.new({})

    @yaml = <<-EOS
---
AWSTemplateFormatVersion: '2010-09-09'
Description: |
  Kumogata Sample Template
  You can use Here document!
Parameters:
  InstanceType:
    Default: t2.micro
    Description: Instance Type
    Type: String
Resources:
  myEC2Instance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: ami-XXXXXXXX
      KeyName: your_key_name
      InstanceType:
        Ref: InstanceType
      UserData:
        Fn::Base64: |
          #!/bin/bash
          yum install -y httpd
          service httpd start
    EOS

    @hash = {
      "AWSTemplateFormatVersion"  =>  "2010-09-09",
      "Description"               => "Kumogata Sample Template\nYou can use Here document!\n",

      "Parameters" => {
        "InstanceType" => {
          "Default"     => "t2.micro",
          "Description" => "Instance Type",
          "Type"        => "String",
        },
      },

      "Resources" => {
        "myEC2Instance" => {
          "Type" => "AWS::EC2::Instance",

          "Properties" => {
            "ImageId" => "ami-XXXXXXXX",
            "KeyName" => "your_key_name",

            "InstanceType" => {
              "Ref" => "InstanceType",
            },

            "UserData" => {
              "Fn::Base64" => "#!/bin/bash\nyum install -y httpd\nservice httpd start\n",
            },
          }
        }
      }
    }
  end

  it "has a version number" do
    expect(Kumogata2::Plugin::YAML::VERSION).not_to be nil
  end

  it "can parse yaml template" do
    expect(@plugin.parse(@yaml)).to eq @hash
  end

  it "can dump hash as a yaml" do
    expect(@plugin.dump(@hash)).to eq @yaml
  end
end
