// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Description of the contract requirements of a reservation.
public struct MonthlyContractDetails: Codable {
    private enum CodingKeys: String, CodingKey {
        case required
        case durationMonths = "duration_months"
        case terminationFee = "termination_fee"
        case cancellationRequirements = "cancellation_requirements"
    }
    
    /// Determines whether a contract is required for the monthly rental.
    public let required: Bool
    
    /// The total duration of the contract in months.
    public let durationMonths: Int
    
    /// The fee incurred when terminating the contract. If there is no fee, the value will be 0.
    public let terminationFee: Currency
    
    /// The cancellation requirements.
    public let cancellationRequirements: CancellationRequirements
}
