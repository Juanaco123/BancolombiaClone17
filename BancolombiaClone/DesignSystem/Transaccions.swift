//
//  Transaccions.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 5/09/24.
//

import Foundation
import SwiftUI

enum Transaccions: String, CaseIterable, Identifiable {
    case balanceAndMovements = "Ver saldos y movimientos"
    case transferMoney = "Transferir dinero"
    case payCreaditCardAndCredits = "Pagar tarjetas de crédito y créditos"
    case payAndManageBills = "Pagar y administrar facturas"
    case seeAllTransactions = "Ver todas"
    
    var id: Transaccions { self }
    
    var icon: ImageResource {
        switch self {
        case .balanceAndMovements:
                .systemBalance
        case .transferMoney:
                .systemSend
        case .payCreaditCardAndCredits:
                .systemCredit
        case .payAndManageBills:
                .systemReceipt
        case .seeAllTransactions:
                .systemAllTransactions
        }
    }
}
