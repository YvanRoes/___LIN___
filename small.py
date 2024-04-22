from mrjob.job import MRJob
from mrjob.step import MRStep

class ContractValidityMapper(MRJob):
    
    def mapper(self, _, line):
        fields = line.split(',')
        if len(fields) >= 24:
            contract_valid_until = fields[22].strip()
            if contract_valid_until.isdigit():
                yield contract_valid_until, 1

class ContractValidityReducer(MRJob):
    
    def reducer(self, key, values):
        yield key, sum(values)


