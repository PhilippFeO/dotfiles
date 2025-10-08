import sys
import subprocess
from pathlib import Path
from render_diary_template import DateDir, render_diary_template


def find_firefox_profile():
    # ─── Öffne generierten Tagebucheintrag mit Firefox ──────────
    firefox_profiles = tuple((Path.home() / '.mozilla/firefox/').glob('*.Tagebuch'))
    assert len(firefox_profiles) == 1, (
        'Es gibt keins oder mehrere „Tagebuch“-Profile für Firefox.'
    )
    fp = firefox_profiles[0]
    assert fp.is_dir(), f'Firefoxprofil „{firefox_profiles}“ ist kein Verzeichnis.'
    return fp


def open_rendered_file(
    rendered_file: Path,
):
    """Schreibe erstelltes HTML in Datei, um sie per Firefox anzuzeigen."""
    fp = find_firefox_profile()
    subprocess.run(
        f'firefox --profile {fp} --new-window {rendered_file}'.split(),
    )


if __name__ == '__main__':
    selection = Path(sys.argv[1])
    today_dir = DateDir(selection.parent if selection.is_file() else selection)
    rendered_html: str = render_diary_template(
        today_dir,
    )
    (rendered_file := Path(f'/tmp/{today_dir.date}.rendered.html')).write_text(
        rendered_html
    )
    open_rendered_file(
        rendered_file,
    )
