#!/usr/bin/python
#
# Copyright (c) 2016-2018 Rolf Neugebauer
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

import re, subprocess

def get_pass(account=None):
    command = "pass %s" % account
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    return output.strip()

##
## Gmail Name matching
##
GmailUSL2R = {
    'archive': '[Google Mail]/All Mail',
    'chats': '[Google Mail]/Chats',
    'drafts': '[Google Mail]/Drafts',
    'flagged': '[Google Mail]/Starred',
    'important': '[Google Mail]/Important',
    'sent': '[Google Mail]/Sent Mail',
    'trash': '[Google Mail]/Trash',
    'bin': '[Google Mail]/Bin',
    'spam': '[Google Mail]/Spam',
}
GmailUSR2L = { r: l for (l, r) in GmailUSL2R.items() }

def gmail_us_to_remote(folder):
    return GmailUSL2R.get(folder, folder)
def gmail_us_to_local(folder):
    return GmailUSR2L.get(folder, folder)

GmailEUL2R = {
    'AllMail': '[Gmail]/All Mail',
    'Chats': '[Gmail]/Chats',
    'Drafts': '[Gmail]/Drafts',
    'Flagged': '[Gmail]/Starred',
    'Important': '[Gmail]/Important',
    'Sent': '[Gmail]/Sent Mail',
    'Trash': '[Gmail]/Trash',
    'Bin': '[Gmail]/Bin',
    'Spam': '[Gmail]/Spam',
}
GmailEUR2L = { r: l for (l, r) in GmailEUL2R.items() }

def gmail_eu_to_remote(folder):
    return GmailEUL2R.get(folder, folder)
def gmail_eu_to_local(folder):
    return GmailEUR2L.get(folder, folder)
