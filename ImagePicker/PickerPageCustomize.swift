//
//  PickerPageCustomize.swift
//  ImagePicker
//
//  Created by Sercan KAYA on 7.02.2020.
//  Copyright © 2020 Sercan KAYA. All rights reserved.
//

import SwiftUI

struct PickerPageCustomize: View {
    @Binding var image : UIImage?
    @Binding var showPicker : Bool
    var body: some View {
        PickerPageView(image: $image, showPicker: $showPicker)
    }
}

struct PickerPageCustomize_Previews: PreviewProvider {
    static var previews: some View {
        PickerPageCustomize(image: .constant(UIImage()), showPicker: .constant(false))
    }
}
