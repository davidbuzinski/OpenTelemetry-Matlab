import matlab.unittest.TestRunner
import matlab.unittest.Verbosity
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoberturaFormat

suite = testsuite(fullfile('test/'));
runner = TestRunner.withTextOutput("OutputDetail",Verbosity.Detailed);

sourceFile = fullfile('install');

reportFile = fullfile("cobertura.xml");
reportFormat = CoberturaFormat(reportFile);
p = CodeCoveragePlugin.forFolder(sourceFile,'IncludingSubfolders',true,'Producing',reportFormat);
runner.addPlugin(p);
results = runner.run(suite);
nfailed = nnz([results.Failed]);
assert(nfailed == 0,[num2str(nfailed) ' test(s) failed.'])