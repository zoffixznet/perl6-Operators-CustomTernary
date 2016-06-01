sub EXPORT (
    **@args where {  not .grep: {$_ !~~ Str|List}  }
) {
    my Map $return;
    for @args {
        my ($t, $f) = $_ ~~ Str ?? ($_, $_) !! |$_;
        for $t, $f {
            my $name = /'<'/ && !/'«'/
                ?? "«$_»" !! "<{.subst: '<', '\\<', :g}>";
            $return{"&infix:$name"} = &tern-sub;
        }
    }
    $return;
}

class Operators::CustomTernary::True  { has $.value; }
class Operators::CustomTernary::False {              }

sub tern-sub ($lhs, $rhs) {
    given $lhs {
        when Operators::CustomTernary::False { $rhs;       }
        when Operators::CustomTernary::True  { $lhs.value; }
        default {
            $lhs ?? Operators::CustomTernary::True.new: :value($rhs)
                 !! Operators::CustomTernary::False.new;
        }
    }
}
