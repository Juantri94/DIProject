//
//  CommonButton.swift
//  UIComponents
//
//  Created by Juantri Jimenez on 20/7/22.
//

import SwiftUI

public struct CommonButton: View {
    
    private let action: () -> Void
    private let text: String

    public init(
        action: @escaping () -> Void,
        text: String
    ) {
        self.action = action
        self.text = text
    }

    public var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }

    }
}

#if DEBUG
struct CommonButton_Previews: PreviewProvider {
    static var previews: some View {
        CommonButton(action: {}, text: "Button")
    }
}
#endif
