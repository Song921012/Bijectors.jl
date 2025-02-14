using Bijectors, DistributionsAD, LinearAlgebra, Test
using Bijectors: PDBijector

@testset "PDBijector" begin
    d = 5
    b = PDBijector()
    dist = Wishart(d, Matrix{Float64}(I, d, d))
    x = rand(dist)
    # NOTE: `PDBijector` technically isn't bijective, and so the default `getjacobian`
    # used in the ChangesOfVariables.jl tests will fail as the jacobian will have determinant 0.
    # Hence, we disable those tests.
    test_bijector(b, x; test_not_identity=true, changes_of_variables_test=false)
end
