//
//  CurrencyField.swift
//  MyLibrary
//
//  Created by Tim Bryant on 5/13/24.
//
//  Bryan Oppong-Boateng
//  https://github.com/bryanboateng/budget/blob/main/Budget/Views/BalanceOperator/CurrencyField.swift

import SwiftUI

protocol UIKitCurrencyFieldDelegate: AnyObject {
    func didChangeAmount(amount: Decimal, currencyField: UIKitCurrencyField)
}

class UIKitCurrencyField: UILabel, UIKeyInput {
    weak var delegate: UIKitCurrencyFieldDelegate?
    
    var sign: FloatingPointSign? {
        didSet {
            updateText()
        }
    }
    
    var amount: Decimal = 0.0 {
        didSet(oldAmount) {
            let amountString = amount.formatted(.number.grouping(.never).scale(100))
            
            if self.amountString != amountString {
                self.amountString = amountString
            }
            
            if amount != oldAmount {
                delegate?.didChangeAmount(amount: amount, currencyField: self)
            }
        }
    }
    
    private var amountString = "" {
        didSet(oldAmountString) {
            if amountString.isEmpty {
                amountString = "0"
            }
            
            if let amount = Decimal(string: amountString) {
                self.amount = amount / 100
            } else {
                amountString = oldAmountString
            }
            updateText()
        }
    }
    
    var keyboardType: UIKeyboardType = .numberPad
    
    override var canBecomeFirstResponder: Bool {
        true
    }
    
    var hasText: Bool {
        amountString.isEmpty == false
    }
    
    func insertText(_ text: String) {
        amountString += text
    }
    
    func deleteBackward() {
        _ = amountString.popLast()
    }
    
    private func updateText() {
        text = {
            let prefix = switch sign {
            case .plus: "+"
            case .minus: "-"
            case .none: ""
            }
            return "\(prefix)\(amount.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD")))"
        }()
    }
}

struct CurrencyField: UIViewRepresentable {
    class Coordinator: NSObject, UIKitCurrencyFieldDelegate {
        private var parent: CurrencyField
        
        init(_ parent: CurrencyField) {
            self.parent = parent
        }
        
        func didChangeAmount(amount: Decimal, currencyField: UIKitCurrencyField) {
            parent.amount = amount
        }
        
        @MainActor @objc
        func handleTap(_ sender: UITapGestureRecognizer) {
            sender.view?.becomeFirstResponder()
        }
    }
    
    @Binding var amount: Decimal
    let fontSize: CGFloat
    let fontWeight: UIFont.Weight
    
    func makeCoordinator() -> Coordinator {
        .init(self)
    }
    
    func makeUIView(context: Context) -> UIKitCurrencyField {
        let currencyField = UIKitCurrencyField()
        currencyField.delegate = context.coordinator
        currencyField.textAlignment = .center
        
        currencyField.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        currencyField.adjustsFontSizeToFitWidth = true
        currencyField.minimumScaleFactor = 0.5
        currencyField.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(
            target: context.coordinator,
            action: #selector(context.coordinator.handleTap(_:))
        )
        currencyField.addGestureRecognizer(tapGesture)
        
        currencyField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        currencyField.setContentHuggingPriority(.required, for: .horizontal)
        
        return currencyField
    }
    
    func updateUIView(_ currencyField: UIKitCurrencyField, context: Context) {
        currencyField.amount = amount
    }
}

#Preview {
    @State var absoluteAmount: Decimal = 0.0
    return CurrencyField(amount: $absoluteAmount, fontSize: 36, fontWeight: .semibold)
}
