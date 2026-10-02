import csv
import yaml

with open('temp/translations.csv', encoding="utf8") as translations:
    translations_reader = csv.reader(translations)
    languages = next(translations_reader)[1:]
    all_translations = {
        row[0].strip(): {
            language: row[i + 1].strip() for i, language in enumerate(languages)
        } for row in translations_reader
    }
    with open("temp/i18n.yaml", "w", encoding="utf8") as i18n:
        yaml.dump(all_translations, i18n, indent=2, allow_unicode=True)