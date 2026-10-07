import json
import yaml
import functools
import operator

with open("temp/NEUAE2313_hkezc_report_new.json") as input_json:
    input_json_parsed = json.load(input_json)
    a = set(functools.reduce(operator.iconcat, [
        [str(bacteria["name"]["en_HK"])
         for bacteria in input_json_parsed[bacteria_group]]
        for bacteria_group in ["core_bacteria", "harmful_bacteria", "probiotics", "parasites"]
    ]))
    with open("temp/i18n.yaml") as i18n_yaml:
        i18n_yaml_parsed = yaml.safe_load(i18n_yaml)
        b = set([
            str(key) for key in i18n_yaml_parsed
        ])
        print(a.difference(b))
        print(b.difference(a))
