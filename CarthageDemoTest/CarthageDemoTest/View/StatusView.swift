//
//  StatusView.swift
//  SwiftUISDKTest
//
//  Created by Mohammad Parvez on 26/07/23.
//

import SwiftUI

struct StatusView: View {
    
    @State var statusModel: StatusModel
    @State var isFailedStatus: Bool
    
    var body: some View {
        
        
        if isFailedStatus {
            
            VStack (spacing : 25){
                
                Text("SwiftUISDKTest")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("Transaction Failed")
                    .font(.title)
                    .foregroundColor(.red)
                
                Image(systemName: "checkmark.seal.fill")
                    .font(.largeTitle)
                    .foregroundColor(.red)
               
                HStack {
                   
//                    Text("Transation ID")
//                    Spacer()
//                    Text("")
//                        .font(.title2)
                }
                
                Spacer()
            } .padding(10)
        }
        else {
           
            VStack (spacing : 25){
                
                Text("SwiftUISDKTest")
                    .font(.largeTitle)
                
                Spacer()
                
                Text("Transaction Successful")
                    .font(.title)
                    .foregroundColor(.green)
                
                Image(systemName: "checkmark.seal.fill")
                    .font(.largeTitle)
                    .foregroundColor(.green)
               
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
                    Text(statusModel.pan!)
                        .font(.title2)
                }
                Spacer()
            } .padding(10)
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(statusModel: StatusModel(uid: "435343453", pan: "9876", method: "Card", orderID: "3434234", amount: "5.0"), isFailedStatus: true)
    }
}
