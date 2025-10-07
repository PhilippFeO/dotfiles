import sys
import subprocess
from pathlib import Path
from tagebuch.render_diary_template import DateDir, render_diary_template


def open_diary_entry(
    rendered_html: str,
    date_dir: DateDir,
):
    """Schreibe erstelltes HTML in Datei, um sie per Firefox anzuzeigen."""
    (today_file := (date_dir.path / f'{date_dir.path.name}.rendered.html')).write_text(
        rendered_html
    )

    # ─── Öffne generierten Tagebucheintrag mit Firefox ──────────
    firefox_profiles = tuple((Path.home() / '.mozilla/firefox/').glob('*.Tagebuch'))
    assert len(firefox_profiles) == 1, (
        'Es gibt keins oder mehrere „Tagebuch“-Profile für Firefox.'
    )
    fp = firefox_profiles[0]
    assert fp.is_dir(), f'Firefoxprofil „{firefox_profiles}“ ist kein Verzeichnis.'
    subprocess.run(
        f'firefox --profile {fp} --new-window {today_file}'.split(),
    )


if __name__ == '__main__':
    today_dir = Path(sys.argv[1])
    open_diary_entry(
        render_diary_template(
            td := DateDir(today_dir),
        ),
        td,
    )
