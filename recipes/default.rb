#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe "jenkins::basic"
include_recipe "jenkins::java"
include_recipe "jenkins::jenkins"
