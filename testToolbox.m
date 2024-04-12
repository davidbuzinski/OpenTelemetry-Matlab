suite = testsuite(fullfile('test/'));
runner = testrunner("textoutput");
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoverageReport
import matlab.unittest.plugins.codecoverage.CoberturaFormat

sourceFile = fullfile('install','+opentelemetry');
reportFile = fullfile("cobertura.xml");
reportFormat = CoberturaFormat(reportFile);
p = CodeCoveragePlugin.forFolder(sourceFile,'IncludingSubfolders',true,'Producing',reportFormat);
runner.addPlugin(p);
result = runner.run(suite);

result.assertSuccess()