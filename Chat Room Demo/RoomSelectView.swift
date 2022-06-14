//
//  RoomSelectView.swift
//  Chat Room Demo
//
//  Created by USER on 2022/01/03.
//

import SwiftUI
import Amplify

struct RoomSelectView: View {
    let user:AuthUser
    @EnvironmentObject var session : SessionManager
    @EnvironmentObject var graphQL : GraphQLManager
    @State var roomToAdd : String = ""
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(user.username)
                
                Spacer()
                
                Button("Log out",action: {
                    graphQL.logout()
                    session.logout()
                })
            }
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    if (graphQL.availableRoom == nil){
                        Spacer()
                        
                        Text("Loading...")
                        
                        Spacer()
                    }else{
                        if ((graphQL.availableRoom!.count/3)>0){
                            ForEach(0...((graphQL.availableRoom!.count/3)-1),id: \.self){ i in
                                HStack {
                                    ForEach (0...2,id: \.self){ j in
                                        
                                        Button((graphQL.availableRoom![i*3+j])!,action: {
                                            graphQL.enterRoom(room: graphQL.availableRoom![i*3+j]!)
                                        }).frame(width: UIScreen.main.bounds.width/3-5, height: 40)
                                            .background(Color.blue)
                                            .foregroundColor(Color.white)
                                            .font(Font.system(size: 14))
                                    }
                                }
                            }
                        }
                        if ((graphQL.availableRoom!.count%3)>0){
                            HStack {
                                ForEach ((graphQL.availableRoom!.count/3)*3...graphQL.availableRoom!.count-1,id: \.self){ j in
                                    
                                    Button((graphQL.availableRoom![j])!,action: {
                                        graphQL.enterRoom(room: graphQL.availableRoom![j]!)
                                    }).frame(width: UIScreen.main.bounds.width/3-5, height: 40)
                                        .background(Color.blue)
                                        .foregroundColor(Color.white)
                                        .font(Font.system(size: 14))
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            HStack{
                TextField("room name", text: $roomToAdd)
                Button("Add room",action: {
                    graphQL.createRoom(roomName: roomToAdd)
                    roomToAdd = ""
                }).foregroundColor(Color.white)
                    .background(Color.blue)
            }
        }
        .padding(5)
        .onAppear{
            if (graphQL.availableRoom ==  nil){
                graphQL.getRooms(user: user)
            }
        }
    }
}

struct RoomSelectView_Previews: PreviewProvider {
    private struct user:AuthUser{
        let userId:String = ""
        let username:String = ""
    }
    static var previews: some View {
        RoomSelectView(user: user())
    }
}
