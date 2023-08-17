//
//  StatusView.swift
//  SwiftUISDKTest
//
//  Created by Mohammad Parvez on 26/07/23.
//

import SwiftUI

struct StatusView: View {
    
    @State var statusModel: StatusModel
    
    var body: some View {
        
        VStack (spacing : 25){
            
            Text("SwiftUISDKTest")
                .font(.title)
            
            HStack {
               
                Text("Transation ID")
                Spacer()
                Text(statusModel.uid)
                    .font(.title2)
            }
            
            HStack {
               
                Text("Payment Method")
                Spacer()
                Text(statusModel.method)
                    .font(.title2)
            }
            
            HStack {
               
                Text("Pan")
                Spacer()
                Text(statusModel.pan)
                    .font(.title2)
            }
        } .padding(10)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(statusModel: StatusModel(uid: "435343453", pan: "9876", method: "Card", orderID: "3434234", amount: "5.0"))
    }
}
