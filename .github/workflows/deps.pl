#!/usr/bin/perl

use strict;
use warnings;
use JSON;

my $input = shift;

my @data = (
    "akadev-corp-eng-www|www-activation|akadev-corp-eng|components/terraform/property-activation|akadev-corp-eng-www-activation",
    "akadev-corp-eng-www-activation|devdatastream|components/terraform/datastream|akadev-corp-eng-devdatastream",
    "akadev-corp-eng-devdatastream|devdatastream-activation|components/terraform/datastream|akadev-corp-eng-devdatastream-activation",
);

my @output;
my $found = 0;

foreach my $row (@data) {
    my ($stack_name, $component, $component_path, $full_stack_name) = split(/\|/, $row);

    if ($stack_name eq $input) {
        $found = 1;
        my %hash = (
            "component" => $component,
            "stack" => $stack_name,
            "component_path" => $component_path,
            "full_stack_name" => $full_stack_name
        );

        push(@output, \%hash);
    }
}

 if ($found == 0) {
     print encode_json([]);
} else {
    print encode_json(\@output);
}