package VM::EC2::CloudWatch;

=head1 NAME

VM::EC2::CloudWatch -- Object describing several Amazon CloudWatch responses

=head1 SYNOPSIS

=head1 DESCRIPTION

This object represents several Amazon CloudWatch API responses.

=head1 METHODS

The following object methods are supported:
 
 for GetMetricStatistics response:
 label                     -- The name of the metric.
 datapoints                -- An array of L<VM::EC2::CloudWatch::Datapoint>
                              objects.

=head1 SEE ALSO

L<VM::EC2>
L<VM::EC2::Generic>
L<VM::EC2::CloudWatch::Datapoint>

=head1 AUTHOR

Makoto Miida E<lt>miidumb@gmail.comE<gt>.

Copyright (c) 2013 Makoto Miida

This package and its accompanying libraries is free software; you can
redistribute it and/or modify it under the terms of the GPL (either
version 1, or at your option, any later version) or the Artistic
License 2.0.  Refer to LICENSE for the full license text. In addition,
please see DISCLAIMER.txt for disclaimers of warranty.

=cut

use strict;
use base 'VM::EC2::Generic';
use VM::EC2::CloudWatch::Datapoint;

sub valid_fields {
    my $self = shift;
    return qw(
        # for GetMetricStatistics
        Label Datapoints
    );
}

sub datapoints {
    my $self = shift;
    my $datapoints = $self->SUPER::datapoints or return;
    return map { VM::EC2::CloudWatch::Datapoint->new($_,$self->aws) } @{$datapoints->{member}};
}

1;
