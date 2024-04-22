from mrjob.job import MRJob
from mrjob.step import MRStep

class PlayerValueMapper(MRJob):
    
    def mapper(self, _, line):
        fields = line.split(',')
        if len(fields) >= 24:
            nationality = fields[4].strip()
            value = fields[11].strip()
            if value.isdigit():
                yield nationality, int(value)

class PlayerValueReducer(MRJob):
    
    def reducer(self, key, values):
        yield key, sum(values)