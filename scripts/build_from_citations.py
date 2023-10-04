import bibtexparser
import argparse
import re
from crossref.restful import Works
import logging
from datetime import date

today_str = date.today().strftime("%Y-%m-%d")

logging.basicConfig()
works = Works()
args = None


def clean_text(text):
    text = re.sub(r"{|}", "", text)
    return text

def clean_author(text):
    show=False
    if "," in text:
        logging.warning(f"Found comma in author {text}")
        show = True
        
    words = text.split()
    # last, first case
    if words[0].endswith(","):
        words = words[1:] + [words[0].strip(",")]
    text = " ".join(words).strip()
    if show: logging.warning(f"Fixed author {text}")
    return text

def is_me(string):
    """
    Given a string, return True if it matches the name of the author of the
    script.
    """
    allowed_words = args.me.lower().split()
    allowed_words += [x.strip(".") for x in allowed_words]
    for word in string.lower().split():
        if word not in allowed_words:
            return False
    return True


def get_citation_count(entry):
    cross_ref = works.doi(entry["doi"])
    return cross_ref["is-referenced-by-count"]
    # return (
    #    f"""http://id.crossref.org/prefix/{cross_ref["prefix"]}"""
    #    + f"""{cross_ref["is-referenced-by-count"]}"""
    # )


def make_author_string(entry, args):
    """
    Given a bibtexparser entry, return a string of the form "Firstname Lastname"
    """
    authors = [
        clean_author(author)
        for author in clean_text(entry["author"]).split(" and")
        if len(author.strip()) > 0
    ]
    max_n = args.authors
    rtn = ""
    is_last = False
    for idx, author in enumerate(authors):
        me = is_me(author)
        is_last = (idx == len(authors) - 1) and me
        if me:
            author = args.me
            if args.md:
                author = "*" + author + "*"
            if args.html:
                author = "<b>" + author + "</b>"
            if args.tex:
                author = "\\textbf{" + author + "}"

        if idx < max_n and idx < len(authors):
            rtn += author + ", "
        elif me:
            if idx == max_n:
                rtn += author + ", "
            else:
                if is_last:
                    rtn += "... " + author
                else:
                    rtn += "... " + author + "..."

    rtn = rtn.strip().strip(",")
    if max_n < len(authors) and not is_last:
        if args.md:
            rtn += ", ~et al~."
        elif args.html:
            rtn += ", <i>et al</i>."
        else:
            rtn += ", et al."
    else:
        rtn += "."

    return rtn


def get_title(entry):
    return clean_text(entry["title"])


def get_year(entry):
    if args.me in make_author_string(entry, args).split(",")[0]:
        logging.warning(f'First author {entry["title"]}')
        return "First author"
    if args.me in make_author_string(entry, args).split(",")[-1]:
        logging.warning(f'Last author {entry["title"]}')
        return "Corresponding author"
    return entry["year"]


def get_html_altmetrics(entry):
    return f"""<td style="text-align:left;"> <div data-badge-popover='right' data-badge-type='donut' data-doi='{entry["doi"]}' data-hide-no-mentions='true' class='altmetric-embed'></div> </td>"""


def get_journal(entry):
    if "journal" in entry:
        return clean_text(entry["journal"])
    else:
        return "bioRxiv"  # "Preprint"


def get_html_pub(entry, args):
    html = (
        f"""<td style="text-align:left;">"""
        + f"""<a class='anchor' id='{get_title(entry)}'></a>"""
        + f"""<span class='pub-title'><a href='https://doi.org/{entry["doi"]}'>{get_title(entry)}</a></span>"""
        + f"""<br>{make_author_string(entry, args)} """
        + f"""<i class="journal"><b>{get_journal(entry)}</b></i>. {entry["year"]}."""
        + f"""<p class="cite">Cited in Crossref {get_citation_count(entry)} times</p>"""
        + f"""</td>"""
    )
    return html


def make_html_table_header(entry, end=False):
    end_header = "</tbody></table>\n"
    table_header = (
        """<table class="publication-table">"""
        + f"""<h1 id="{get_year(entry)}"><caption>{get_year(entry)}</caption></h1>"""
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
        bibtex_database.entries, key=lambda entry: get_year(entry), reverse=True
    )
    html = ""
    year = None
    for entry in entries:
        if get_year(entry) != year:
            if year is not None:
                html += make_html_table_header(entry, end=True)
            html += make_html_table_header(entry)
        year = get_year(entry)
        html += (
            f"<tr>\n{get_html_altmetrics(entry)}\n{get_html_pub(entry, args)}\n</tr>\n"
        )
    html += make_html_table_header(entry, end=True)
    html += '<p class="cite">Citation counts were collected using the Crossref API.</p>'
    html += f"""<p class="cite">This page was last updated on {today_str}.</p>"""
    return html


# \cvitem{\textbf{---}}{ Logsdon GA, \textbf{Vollger MR}, Hsieh P, Mao Y, Liskovykh MA, Koren S, Nurk S, Mercuri L, Dishuck PC, Rhie A, et al. 2021. The structure, function and evolution of a complete human chromosome 8. Nature 593: 101–107. https://www.nature.com/articles/s41586-021-03420-7 (Accessed May 11, 2021).}
def make_pub_tex(bibtex_database, args):
    entries = sorted(
        bibtex_database.entries, key=lambda entry: get_year(entry), reverse=True
    )
    tex = "\subsection{\\textbf{First author}}\n\n\n"
    see_not_first = False
    for entry in entries:
        if get_year(entry) != "First author publications" and not see_not_first:
            see_not_first = True
            tex += "\n\subsection{\\textbf{Collaborative author}}\n\n\n"

        tex += "\cvitem{\\textbf{---}}{"
        tex += make_author_string(entry, args) + " "
        tex += get_title(entry) + ". "
        tex += "\emph{" + get_journal(entry) + "}. "
        tex += entry["year"] + ". "
        tex += (
            "\\textcolor{blue}{\href{"
            + f"https://doi.org/{entry['doi']}"
            + "}{"
            + entry["doi"]
            + "}}"
        )
        # tex += (
        #    " \\textcolor{gray}{"
        #    + f"Cited in Crossref {get_citation_count(entry)} times"
        #    + "}"
        # )
        tex += "}\n\n"
    return tex


parser = argparse.ArgumentParser()
parser.add_argument("--md", action="store_true")
parser.add_argument("--html", action="store_true")
parser.add_argument("--tex", action="store_true")
parser.add_argument("--authors", help="number of authors to print", type=int, default=6)
parser.add_argument("--me", default="Mitchell R. Vollger")
parser.add_argument("bib", default="bibTex file to draw from")
args = parser.parse_args()

with open(args.bib) as bibtex_file:
    bibtex_database = bibtexparser.load(bibtex_file)
    if args.html:
        print(make_pub_html(bibtex_database, args))
    if args.tex:
        print(make_pub_tex(bibtex_database, args))
