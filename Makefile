TARGETS=main hello suites fixtures assertions

all: $(TARGETS)

test: $(TARGETS) $(addprefix run-,$(TARGETS))

%: %.cpp
	$(CXX) -o$@ $^ -lboost_unit_test_framework

run-%: %
	-./$^ --output_format=XML --log_level=test_suite > reports/$(^)-report-`date +%Y.%m.%d`.xml

clean:
	rm $(TARGETS)