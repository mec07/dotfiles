#!/usr/local/bin/python

from keyring import get_password
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-a", "--account", help="Account name in keychain")
parser.add_argument("-s", "--server", help="Server name in keychain")
args = parser.parse_args()

print(get_password(args.server, args.account))
