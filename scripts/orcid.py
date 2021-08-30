import bibtexparser
import argparse
import re


def clean_text(text):
    text = re.sub(r"{|}", "", text)
    text = " ".join(text.split())
    return text


def is_me(string):
    """
    Given a string, return True if it matches the name of the author of the
    script.
    """
    for word in string.lower().split():
        if word not in [
            "mitchell",
            "m",
            "m.",
            "robert",
            "r",
            "r.",
            "vollger",
            "mr",
            "m.r.",
        ]:
            return False
    return True


def make_author_string(entry, args):
    """
    Given a bibtexparser entry, return a string of the form "Firstname Lastname"
    """
    authors = [
        author.strip()
        for author in clean_text(entry["author"]).split(" and")
        if len(author.strip()) > 0
    ]
    max_n = args.authors
    rtn = ""
    for idx, author in enumerate(authors):
        me = is_me(author)
        if me:
            author = "Mitchell R. Vollger"
            if args.md:
                author = "*" + author + "*"
            if args.html:
                author = "<b>" + author + "</b>"

        if idx < max_n and idx < len(authors):
            rtn += author + ", "
        elif me:
            if idx == max_n:
                rtn += author + ", "
            else:
                rtn += "... " + author + "..."

    rtn = rtn.strip().strip(",")
    if max_n < len(authors):
        if args.md:
            rtn += ", ~et al~."
        elif args.html:
            rtn += ", <i>et al</i>."
        else:
            rtn += ", et al."

    return rtn


def get_title(entry):
    return clean_text(entry["title"])


def get_html_altmetrics(entry):
    return f"""<td style="text-align:left;"> <div data-badge-popover='right' data-badge-type='donut' data-doi='{entry["doi"]}' data-hide-no-mentions='true' class='altmetric-embed'></div> </td>"""


def get_journal(entry):
    if "journal" in entry:
        return entry["journal"]
    else:
        return "preprint"


def get_html_pub(entry, args):
    html = (
        f"""<td style="text-align:left;">"""
        + f"""<a class='anchor' id='{get_title(entry)}'></a>"""
        + f"""<span class='pub-title'><a href='https://doi.org/{entry["doi"]}'>{get_title(entry)}</a></span>"""
        + f"""<br>{make_author_string(entry, args)} """
        + f"""<i>{get_journal(entry)}</i>. """
        + f"""<span class='publication-extra'><a href='https://doi.org/{entry["doi"]}'>Paper link.</a></span>"""
        + f"""</td>"""
    )
    return html


def make_html_table_header(entry, end=False):
    end_header = "</tbody></table>\n"
    table_header = (
        """<table class="publication-table">"""
        + f"""<caption>{entry["year"]}</caption>"""
        + """<thead><tr>"""
        + """<th style="text-align:left;"> altmetric_badge </th>"""
        + """<th style="text-align:left;"> citation </th>"""
        + """</tr></thead><tbody>\n"""
    )
    if end:
        return end_header
    return table_header


def make_pub_html(bibtex_database, args):
    entries = sorted(
        bibtex_database.entries, key=lambda entry: entry["year"], reverse=True
    )
    html = ""
    year = None
    for entry in entries:
        if entry["year"] != year:
            if year is not None:
                html += make_html_table_header(entry, end=True)
            html += make_html_table_header(entry)
        year = entry["year"]
        html += (
            f"<tr>\n{get_html_altmetrics(entry)}\n{get_html_pub(entry, args)}\n</tr>\n"
        )
    html += make_html_table_header(entry, end=True)
    return html


parser = argparse.ArgumentParser()
parser.add_argument("--md", action="store_true")
parser.add_argument("--html", action="store_true")
parser.add_argument("--authors", help="number of authors to print", type=int, default=5)
args = parser.parse_args()

with open("scripts/works.bib") as bibtex_file:
    bibtex_database = bibtexparser.load(bibtex_file)
    if args.html:
        print(make_pub_html(bibtex_database, args))
