//
//  ContentView.swift
//  ImagePicker
//
//  Created by Sercan KAYA on 7.02.2020.
//  Copyright © 2020 Sercan KAYA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var image : UIImage? = nil
    @State var showPicker : Bool = false
    var body: some View {
        VStack{
            
           if self.image != nil {
                Image(uiImage: image!)
                .resizable()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
            }else {
                Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 300, height: 300)
            .clipShape(Circle())
            }
            
            /*Image(uiImage: image ?? UIImage())
                .resizable()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
 */
            Button(action: {
                self.showPicker.toggle()
            }) {
                Text("Resim Seç")
            }.sheet(isPresented: $showPicker) {
                PickerPageCustomize(image: self.$image, showPicker: self.$showPicker)
            }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
