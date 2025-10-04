#!/usr/bin/env python3

import subprocess
import sys
from jinja2 import Environment, FileSystemLoader, select_autoescape
from pathlib import Path

if __name__ == '__main__':
    today_dir = Path(sys.argv[1])
    diary_templates = tuple(today_dir.glob('*.html.jinja'))
    assert len(diary_templates) == 1, (
        f'Es gibt mehrere oder kein Jinja-Template in {today_dir=}'
    )

    diary_template = diary_templates[0]
    env = Environment(
        loader=FileSystemLoader(
            [
                diary_template.parent,
                # Hier liegt das Basistemplate
                Path.home() / '.tagebuch/tagebuch/templates',
            ]
        ),
        autoescape=select_autoescape(),
        trim_blocks=True,
    )
    template = env.get_template(diary_template.name)
    (today_file := (today_dir / f'{today_dir.name}.rendered.html')).write_text(
        template.render()
    )
    subprocess.run(
        f'firefox --new-window {today_file}'.split(),
    )
