// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Description of the contract requirements of a reservation.
public struct MonthlyContractDetails: Codable {
    private enum CodingKeys: String, CodingKey {
        case required
        case durationMonths = "duration_months"
        case transactionFee = "transaction_fee"
        case cancellationRequirements = "cancellation"
    }
    
    /// Determines whether a contract is required for the monthly rental.
    public let required: Bool
    
    /// The total duration of the contract in months.
    public let durationMonths: Int
    
    /// WIP: Needs Better Docs
    public let transactionFee: Currency
    
    /// The cancellation requirements.
    public let cancellationRequirements: CancellationRequirements
}
