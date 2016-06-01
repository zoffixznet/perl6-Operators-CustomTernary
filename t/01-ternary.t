use lib 'lib';
use Test;
use Operator::CustomTernary <foo bar>, 'ʔ', <¿ ⫶>, ('«', '»');

is ( False foo 'blarg' bar 'blorg' ), 'blorg',
    'Pair with words for ops. False condition';
is ( True foo 'blarg' bar 'blorg' ), 'blarg',
    'Pair with words for ops. True condition';

is ( False ʔ 'blarg' ʔ 'blorg' ), 'blorg',
    'Str with ʔ for ops. False condition';
is ( True ʔ 'blarg' ʔ 'blorg' ), 'blarg',
    'Str with ʔ for ops. True condition';

is ( False ¿ 'blarg' ⫶ 'blorg' ), 'blorg',
    'Pair with ¿ ⫶ for ops. False condition';
is ( True ¿ 'blarg' ⫶ 'blorg' ), 'blarg',
    'Pair with ¿ ⫶ for ops. True condition';

is ( False « 'blarg' » 'blorg' ), 'blorg',
    'Pair with « » for ops. False condition';
is ( True « 'blarg' » 'blorg' ), 'blarg',
    'Pair with « » for ops. True condition';

is ( False « 'blarg' » False ¿ 'meow' ⫶ 'blorg' ), 'blorg', 'Double ternary #1';
is ( False « 'blarg' » True  ¿ 'meow' ⫶ 'blorg' ), 'meow',  'Double ternary #2';
is ( True  « 'blarg' » False ¿ 'meow' ⫶ 'blorg' ), 'blarg', 'Double ternary #3';
is ( True  « 'blarg' » True  ¿ 'meow' ⫶ 'blorg' ), 'blarg', 'Double ternary #4';

done-testing;
