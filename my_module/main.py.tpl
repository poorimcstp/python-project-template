#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Program entry point"""

from __future__ import print_function

import argparse
import sys

from $package import metadata


def main(argv):
    """Program entry point.

    :param argv: command-line arguments
    :type argv: :class:`list`
    """
    author_strings = []
    for name, email in zip(metadata.authors, metadata.emails):
        author_strings.append('Author: {0} <{1}>'.format(name, email))

    epilog = '''
{project} {version}

{authors}
URL: <{url}>
'''.format(
        project=metadata.project,
        version=metadata.version,
        authors='\n'.join(author_strings),
        url=metadata.url)

    arg_parser = argparse.ArgumentParser(
        prog=argv[0],
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description=metadata.description,
        epilog=epilog)
    arg_parser.add_argument(
        '-V', '--version',
        action='version',
        version='{0} {1}'.format(metadata.project, metadata.version))

    arg_parser.parse_args(args=argv[1:])

    print(epilog)

    return 0


def entry_point():
    """Zero-argument entry point for use with setuptools/distribute."""
    raise SystemExit(main(sys.argv))


if __name__ == '__main__':
    entry_point()
    
def send_simple_message():
    return requests.post(
        "https://api.mailgun.net/v3/sandboxe684f8cb7f724476ab6bada89016c684.mailgun.org/messages",
        auth=("api", "key-ba814f3b76b7b575a24c8d69f1918851"),
        data={"from": "Excited User <mailgun@sandboxe684f8cb7f724476ab6bada89016c684.mailgun.org>",
              "to": ["poorimcstp@gmail.com"],
              "subject": "Hello",
              "text": "Testing some Mailgun awesomness!"})

startsending = send_simple_message();
