namespace DecompositionTests {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;

    @Test("QuantumSimulator")
    operation RunTests() : Unit {
        AssertOperationEqualReferenced(1, (qs => X(qs[0])), (qs => Adjoint X(qs[0])));
    }

}
