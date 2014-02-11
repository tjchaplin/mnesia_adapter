-include_lib("eunit/include/eunit.hrl").

-define(It(Text,Func), {Text, Func}).
-define(It(Text,Setup,Cleanup,Func), {Text, setup,Setup,Cleanup,Func}).
-define(Describe(Text,Tests),{Text, Tests}).
-define(Describe(Text,Setup,Tests),{Text, setup, Setup, Tests}).
-define(Describe(Text,Setup,Cleanup,Tests),{Text, setup, Setup, Cleanup,Tests}).