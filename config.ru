require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sequel'
require './application'

run Sinatra::Application
