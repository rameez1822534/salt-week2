import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), 'src'))

from data.queries import connect
connect()
