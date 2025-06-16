from configparser import ConfigParser
import os

def config(filename=os.path.join(os.path.dirname(__file__), 'database.ini'), section='postgresql'):
    parser = ConfigParser()
    parser.read(filename)

    if not parser.has_section(section):
        raise Exception(f'Section {section} not found in {filename}')
    
    return {param[0]: param[1] for param in parser.items(section)}
