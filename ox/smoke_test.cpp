#include <array>
#include <cstdint>
#include <iostream>

#include "bridge.h"
#include "fix/fix.h"

struct MulCase
{
    fix a;
    fix b;
};

struct DivCase
{
    fix a;
    fix b;
};

int main(int argc, char** argv)
{
    if (cd_ox_init_runtime(argv[0]) != 0)
    {
        std::cerr << "failed to initialize OxCaml runtime/callbacks" << std::endl;
        return 2;
    }

    bool ok = true;

    const std::array<MulCase, 8> mul_cases = {{
        {f1_0, f1_0},
        {f2_0, f0_5},
        {-f1_0, f1_0},
        {f0_1, f10_0},
        {12345, 67890},
        {-12345, 67890},
        {0x7fff0000, 2},
        {-0x40000000, 3},
    }};

    for (const auto& t : mul_cases)
    {
        const fix c_val = fixmul(t.a, t.b);
        const fix ox_val = cd_ox_fixmul(t.a, t.b);
        if (c_val != ox_val)
        {
            ok = false;
            std::cerr << "fixmul mismatch a=" << t.a << " b=" << t.b
                      << " c=" << c_val << " ox=" << ox_val << std::endl;
        }
    }

    const std::array<DivCase, 8> div_cases = {{
        {f1_0, f1_0},
        {f2_0, f0_5},
        {-f1_0, f1_0},
        {f10_0, f0_1},
        {12345678, 321},
        {-12345678, 321},
        {0x70000000, 0x1000},
        {f1_0, 0},
    }};

    for (const auto& t : div_cases)
    {
        const fix c_val = fixdiv(t.a, t.b);
        const fix ox_val = cd_ox_fixdiv(t.a, t.b);
        if (c_val != ox_val)
        {
            ok = false;
            std::cerr << "fixdiv mismatch a=" << t.a << " b=" << t.b
                      << " c=" << c_val << " ox=" << ox_val << std::endl;
        }
    }

    if (!ok)
    {
        return 1;
    }

    std::cout << "Ox bridge smoke test passed: fixmul/fixdiv match C" << std::endl;
    return 0;
}
