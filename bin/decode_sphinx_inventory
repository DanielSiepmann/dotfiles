#! /usr/bin/python
#! coding: utf-8
# decode_sphinx_inventory, mb, 2013, 2014-07-26, 2015-12-17
# ÄÖÜäöüß

# ==================================================
# The following __doc__ string is displayed on --info
# --------------------------------------------------

"""\
decode_sphinx_inventory - Decode an objects.inv and create some output.

Sphinx (http://sphinx-doc.org) offers symbolic linking to distant
documentation projects. This happens by means of an objects inventory
which is usually kept in a specially encoded file 'objects.inv'
in the root folder of the distant documentation project.
This module fetches an inventory and converts it into something readable.

Required parameter:
   uri
      Path to a Sphinx documentation project in the web like
      http://python.org/ The file 'objects.inv' is expected to
      exist there.

Optional parameters:
   -f, --format
      Output is utf-8 encoded.
      'html' (default): A nicely formatted html document is created.
      'csv': Comma separated values with \t als separator.
      'json': Json encoded data.
      'ref': Format of Sphinx ':ref:' textrole

   -O, --outfilename
      The file is created or overwritten and contains the output.

   --abbreviation
      A short name that is used in the Intersphinx mapping to
      reference the specific documentation project. Default is 'abbrev'
      or the typically used name for common TYPO3 projects.
      Use 'None' to show no abbreviation at all.

Examples:
   python decode_sphinx_inventory.py https://docs.typo3.org/typo3cms/TyposcriptReference/
   python decode_sphinx_inventory.py https://docs.typo3.org/typo3cms/TyposcriptReference/ -O result.html
   python decode_sphinx_inventory.py https://docs.typo3.org/typo3cms/TyposcriptReference/ -O result.html --abbreviation=tsref
   python decode_sphinx_inventory.py https://docs.typo3.org/typo3cms/TyposcriptReference/ -O result.csv  -f csv
   python decode_sphinx_inventory.py https://docs.typo3.org/typo3cms/TyposcriptReference/ -O result.json  -f json

"""

from __future__ import print_function
from sphinx.ext.intersphinx import read_inventory_v2
from posixpath import join
import codecs
import urllib
import sys
import json
try:
    from mako.template import Template
except ImportError:
    print(
        'This module uses Mako templating. See http://docs.makotemplates.org/\n'
        'To install Mako do something like:\n'
        '      $ pip install Mako\n'
        '  or  $ easy_install Mako\n'
        '  or  $ git clone https://github.com/zzzeek/mako\n'
        '      $ cd mako\n'
        '      $ sudo python setup.py install\n'
        '\n'
        'Run with "sudo" if required.'
    )
    sys.exit(1)

__version_info__ = (0, 2, 0)
__version__ = '.'.join(map(str, __version_info__))
__history__ = ""
__copyright__ = """\

Copyright (c) since 2014, Martin Bless  <martin@mbless.de>

All Rights Reserved.

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee or royalty is hereby
granted, provided that the above copyright notice appears in all copies
and that both that copyright notice and this permission notice appear
in supporting documentation or portions thereof, including
modifications, that you make.

THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO
THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS, IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL,
INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING
FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION
WITH THE USE OR PERFORMANCE OF THIS SOFTWARE!
"""

# map known projects to preferred abbreviation
uri2abbrev = {
    '://docs.typo3.org/typo3cms/CodingGuidelinesReference' : 't3cgl',
    '://docs.typo3.org/typo3cms/CoreApiReference' : 't3coreapi',
    '://docs.typo3.org/typo3cms/EditorsTutorial' : 't3editors',
    '://docs.typo3.org/typo3cms/ExtbaseFluidBook' : 't3extbasebook',
    '://docs.typo3.org/typo3cms/ExtbaseGuide' : 't3extbase',
    '://docs.typo3.org/typo3cms/FileAbstractionLayerReference' : 't3fal',
    '://docs.typo3.org/typo3cms/FrontendLocalizationGuide' : 't3l10n',
    '://docs.typo3.org/typo3cms/GettingStartedTutorial' : 't3start',
    '://docs.typo3.org/typo3cms/InsideTypo3Reference' : 't3inside',
    '://docs.typo3.org/typo3cms/InstallationGuide' : 't3install',
    '://docs.typo3.org/typo3cms/SecurityGuide' : 't3security',
    '://docs.typo3.org/typo3cms/SkinningReference' : 't3skinning',
    '://docs.typo3.org/typo3cms/TCAReference' : 't3tca',
    '://docs.typo3.org/typo3cms/TemplatingTutorial' : 't3templating',
    '://docs.typo3.org/typo3cms/TSconfigReference' : 't3tsconfig',
    '://docs.typo3.org/typo3cms/Typo3ServicesReference' : 't3services',
    '://docs.typo3.org/typo3cms/TyposcriptIn45MinutesTutorial' : 't3ts45',
    '://docs.typo3.org/typo3cms/TyposcriptReference' : 't3tsref',
    '://docs.typo3.org/typo3cms/TyposcriptSyntaxReference' : 't3tssyntax',

    # what abbreviations should we use instead of 'api' in the following cases?
    '://typo3.org/api/typo3cms'             : 't3api', # current stable
    '://api.typo3.org/typo3cms/master/html' : 't3api', # master
    '://api.typo3.org/typo3cms/67/html'     : 't3api76',
    '://api.typo3.org/typo3cms/62/html'     : 't3api62',
    '://api.typo3.org/typo3cms/61/html'     : 't3api61',
    '://api.typo3.org/typo3cms/60/html'     : 't3api60',
    '://api.typo3.org/typo3cms/47/html'     : 't3api47',
    '://api.typo3.org/typo3cms/45/html'     : 't3api45',

    # may exist in future as well
    '://typo3.org/api/flow'        : 'api',
    '://api.typo3.org/flow/11'     : 'api',
    '://api.typo3.org/flow/master' : 'api',
}

# if module argparse is not available
class Namespace(object):
    """Simple object for storing attributes."""

    def __init__(self, **kwargs):
        for name in kwargs:
            setattr(self, name, kwargs[name])


# a mako template
htmlTemplate = u"""\
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>${pagetitle}</title>
    <style type="text/css">
        body { font-family: sans-serif; font-size: 12px; }
        .b { font-weight: bold }
        li { margin-bottom: 8px }
        .mono { font-family: monospace }
        .mono, pre { font-size: 12px }
    </style>
</head>

<body>
    <h3>Known link targets for ${uri|h}</h3>

    % if maxTargets > 1:
        % for page, pagedict in pages.items():


<div class="page">
<p class="b">${page|h}</p>
<ul>
                    % for label, v in pagedict.items():
                        ## <li><a href="${v[0]|h}" title="${v[1]|h}">:ref:`${abbrev|h}${label|h}`</a></li>
\t<li>:ref:`${abbrev|h}${label|h}`<br><a href="${v[0]|h}">${v[1]|h}</a></li>
                    % endfor
</ul>
</div>
        % endfor
    % else:
<ul>
            % for label, v in sorted(items.items()):
\t<li>:ref:`${abbrev|h}${label|h}`<br><a href="${v[2]|h}">${v[3]|h}</a></li>
            % endfor
 </ul>
    % endif

    % if abbrev:
        <h3>About '${abbrev|h}'</h3>
        <p>
           In this listing
           the abbreviation <span class="mono">${abbrev|h}</span> in the <span class="mono">:ref:`${abbrev|h}:...`</span>
           textrole<br>
           serves as a pointer to '${uri|h}'.<br>
           This requires the following setting in you Settings.yml file:<br>
        </p>
        <pre>
config.py:
   intersphinx_mapping:
      ${abbrev|h}:
      - ${uri|h}
      - null
        </pre>
        <p>
           You may as well choose any other unique abbreviation instead of <span class="mono">${abbrev|h}</span>.
        </p>
    % endif

    <p>End.</p>

</body>
</html>
"""


class Main:

    def __init__(self, args):
        self.args = args
        self.uri = self.args.uri.strip('/') + '/'
        if self.uri.startswith('https:'):
            k = self.uri[5:]
        elif self.uri.startswith('http:'):
            k = self.uri[4:]
        else:
            k = self.uri
        self.abbrev = self.args.abbrev
        if self.abbrev == 'None':
            self.abbrev = ''
        elif self.abbrev == 'abbrev':
            self.abbrev = uri2abbrev.get(k.rstrip('/'), 'abbrev')
        self.inventory_uri = self.uri + 'objects.inv'
        self.lenuri = len(self.uri)
        self.inventory = {}
        self.inventory_items = {}
        self.pages = {}
        # to find out if there are pages with more than one target:
        self.maxTargets = 0

    def getInventory(self):
        f = urllib.urlopen(self.inventory_uri)
        f.readline() # burn a line
        self.inventory = read_inventory_v2(f, self.uri, join)
        f.close()
        self.inventory_items = self.inventory.get('std:label', {})

    def organiseByPages(self):
        self.maxTargets = 0
        for label, v in self.inventory_items.items():
            page = v[2][self.lenuri:]
            p = page.find('#')
            if p > -1:
                page = page[0:p]
            pagelinks = self.pages.get(page, {})
            target = v[2]
            linktext = v[3]
            pagelinks[label] = (target, linktext)
            self.pages[page] = pagelinks
            self.maxTargets = max(self.maxTargets, len(pagelinks))

    def renderHtml(self):
        kwds = {}
        kwds['pages'] = self.pages
        kwds['items'] = self.inventory_items
        kwds['uri'] = self.uri
        if self.abbrev:
            kwds['abbrev'] = self.abbrev + ':'
        else:
            kwds['abbrev'] = ''
        kwds['pagetitle'] = 'Link targets'
        kwds['maxTargets'] = self.maxTargets
        self.renderResult = Template(htmlTemplate).render(**kwds)

    def renderJson(self):
        if self.args.outfilename:
            f2 = codecs.open(self.args.outfilename, 'w', 'utf-8')
            json.dump(self.inventory, f2, sort_keys=True, indent=4, ensure_ascii=False)
            f2.close()

    def renderCsv(self):
        if self.args.outfilename:
            f2 = codecs.open(self.args.outfilename, 'w', 'utf-8')
            f2.write('label\tlinktext\turl\n')
            for k in sorted(self.inventory_items):
                v = self.inventory_items[k]
                f2.write(u'%s\t%s\t%s\n' % (k.replace('\t','\\t'), v[3].replace('\t','\\t'), v[2].replace('\t','\\t')))
            f2.close()

    def renderRef(self):
        if self.abbrev:
            abbrev = self.abbrev + ':'
        else:
            abbrev = ''
        if self.args.outfilename:
            f2 = codecs.open(self.args.outfilename, 'w', 'utf-8')
            for k in sorted(self.inventory_items):
                v = self.inventory_items[k]
                p = v[3].lower().find(k)
                if p > -1:
                    k = v[3][p:p+len(k)]
                f2.write(u':ref:`%s%s`\n' % (abbrev, k.replace('\\','\\\\'),))
            f2.close()

    def work(self):
        try:
            self.getInventory()
        except:
            return 2, "Could not open '%s'" % self.inventory_uri

        if self.args.outfilename:
            if self.args.format == 'csv':
                self.renderCsv()

            if self.args.format == 'json':
                self.renderJson()

            if self.args.format == 'html':
                self.organiseByPages()
                self.renderHtml()
                f2path = self.args.outfilename
                f2 = codecs.open(f2path, 'w', 'utf-8')
                f2.write(self.renderResult)
                f2.close()

            if self.args.format == 'ref':
                self.renderRef()

        else:
            print(len(self.inventory_items), 'targets found. Specify outfile for details.')

        retCode = 0
        msg = ''
        return retCode, msg

def get_argparse_args():
    """Get commandline args using module 'argparse'. Python >= 2.7 required."""

    class License(argparse.Action):
        def __call__(self, parser, namespace, values, option_string=None):
            print(__copyright__)
            parser.exit()

    class History(argparse.Action):
        def __call__(self, parser, namespace, values, option_string=None):
            print(__history__)
            parser.exit()

    class Info(argparse.Action):
        def __call__(self, parser, namespace, values, option_string=None):
            print()
            print(__doc__)
            parser.exit()

    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0], add_help=False)
    parser.add_argument('--help', '-h', action='help', default=argparse.SUPPRESS, help='show this help message and exit')
    parser.add_argument('--version', action='version', version=__version__, help='show version and exit')
    parser.add_argument('--license', help='show license and exit', nargs=0, action=License)
    # parser.add_argument('--history', help='show history and exit', nargs=0, action=History)
    parser.add_argument('--info',    help='show more information about this module', nargs=0, action=Info)
    parser.add_argument('-O', '--outfile-name', help="write utf-8 output to this file", dest='outfilename', default=None)
    parser.add_argument('--abbreviation', help="abbreviation for the Intersphinx mapping. Default: abbrev", dest='abbrev', default='abbrev')
    parser.add_argument('-f', '--format', help="format of the produced output. Always utf-8. Default: html)", dest='format', choices=['html', 'json', 'csv', 'ref'], default='html')
    # parser.add_argument('--logdir', help="Existing directory where logs will be written. Defaults to tempdir/t3pdb/logs which will be created.", dest='logdir', default=None)
    parser.add_argument('uri', help='path to \'objects.inv\' of a Sphinx documentation project.')
    return parser.parse_args()


if __name__=="__main__":

    argparse_available = False
    try:
        import argparse
        argparse_available = True
    except ImportError:
        pass
    if not argparse_available:
        try:
            import local_argparse as argparse
            argparse_available = True
        except ImportError:
            pass
    if argparse_available:
        args = get_argparse_args()
    else:
        args = Namespace()

        # you may hardcode parameters here:
        if 'hardcode parameters here':
            args.uri = ''

        if not args.infile:
            msg = ("\nNote:\n"
                   "   '%(prog)s'\n"
                   "   needs module 'argparse' (Python >= 2.7) to handle commandline\n"
                   "   parameters. It seems that 'argparse' is not available. Provide\n"
                   "   module 'argparse' or hardcode parameters in the code instead.\n" % {'prog': sys.argv[0]} )
            print(msg)
            sys.exit(2)

    M = Main(args)
    retCode, msg = M.work()

    if retCode:
        print(msg, '(exitcode: %s)' % retCode)

